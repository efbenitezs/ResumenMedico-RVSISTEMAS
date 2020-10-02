import getSupportedPropertyName from '../utils/getSupportedPropertyName';
import find from '../utils/find';
import getOffsetParent from '../utils/getOffsetParent';
import getBoundingClientRect from '../utils/getBoundingClientRect';
import getRoundedOffsets from '../utils/getRoundedOffsets';
import isBrowser from '../utils/isBrowser';

const isFirefox = isBrowser && /Firefox/i.test(navigator.userAgent);

/**
 * @function
 * @memberof Modifiers
 * @argument {Object} data - The data object generated by `update` method
 * @argument {Object} options - Modifiers configuration and options
 * @returns {Object} The data object, properly modified
 */
export default function computeStyle(data, options)
{
	const { x, y } = options;
	const { popper } = data.offsets;

	// Remove this legacy support in Popper.js v2
	const legacyGpuAccelerationOption = find(
		data.instance.modifiers,
		modifier => modifier.name === 'applyStyle'
	).gpuAcceleration;
	if (legacyGpuAccelerationOption !== undefined)
	{
		console.warn(
			'WARNING: `gpuAcceleration` option moved to `computeStyle` modifier and will not be supported in future versions of Popper.js!'
		);
	}
	const gpuAcceleration =
		legacyGpuAccelerationOption !== undefined
			? legacyGpuAccelerationOption
			: options.gpuAcceleration;

	const offsetParent = getOffsetParent(data.instance.popper);
	const offsetParentRect = getBoundingClientRect(offsetParent);

	// Styles
	const styles = {
		position: popper.position,
	};

	const offsets = getRoundedOffsets(
		data,
		window.devicePixelRatio < 2 || !isFirefox
	);

	const sideA = x === 'bottom' ? 'top' : 'bottom';
	const sideB = y === 'right' ? 'left' : 'right';

	// if gpuAcceleration is set to `true` and transform is supported,
	//  we use `translate3d` to apply the position to the popper we
	// automatically use the supported prefixed version if needed
	const prefixedProperty = getSupportedPropertyName('transform');

	// now, let's make a step back and look at this code closely (wtf?)
	// If the content of the popper grows once it's been positioned, it
	// may happen that the popper gets misplaced because of the new content
	// overflowing its reference element
	// To avoid this problem, we provide two options (x and y), which allow
	// the consumer to define the offset origin.
	// If we position a popper on top of a reference element, we can set
	// `x` to `top` to make the popper grow towards its top instead of
	// its bottom.
	let left, top;
	if (sideA === 'bottom')
	{
		// when offsetParent is <html> the positioning is relative to the bottom of the screen (excluding the scrollbar)
		// and not the bottom of the html element
		if (offsetParent.nodeName === 'HTML')
		{
			top = -offsetParent.clientHeight + offsets.bottom;
		} else
		{
			top = -offsetParentRect.height + offsets.bottom;
		}
	} else
	{
		top = offsets.top;
	}
	if (sideB === 'right')
	{
		if (offsetParent.nodeName === 'HTML')
		{
			left = -offsetParent.clientWidth + offsets.right;
		} else
		{
			left = -offsetParentRect.width + offsets.right;
		}
	} else
	{
		left = offsets.left;
	}
	if (gpuAcceleration && prefixedProperty)
	{
		styles[prefixedProperty] = `translate3d(${left}px, ${top}px, 0)`;
		styles[sideA] = 0;
		styles[sideB] = 0;
		styles.willChange = 'transform';
	} else
	{
		// othwerise, we use the standard `top`, `left`, `bottom` and `right` properties
		const invertTop = sideA === 'bottom' ? -1 : 1;
		const invertLeft = sideB === 'right' ? -1 : 1;
		styles[sideA] = top * invertTop;
		styles[sideB] = left * invertLeft;
		styles.willChange = `${sideA}, ${sideB}`;
	}

	// Attributes
	const attributes = {
		'x-placement': data.placement,
	};

	// Update `data` attributes, styles and arrowStyles
	data.attributes = { ...attributes, ...data.attributes };
	data.styles = { ...styles, ...data.styles };
	data.arrowStyles = { ...data.offsets.arrow, ...data.arrowStyles };

	return data;
}