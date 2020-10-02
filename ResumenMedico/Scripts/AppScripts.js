var appRoot;

function htmlEscape(str)
{
	return str
		.replace(/&/g, '&amp;')
		.replace(/"/g, '&quot;')
		.replace(/'/g, '&#39;')
		.replace(/</g, '&lt;')
		.replace(/>/g, '&gt;');
}

function showhide(obj)
{
	var state = obj.checked;

	var rowsP = document.getElementsByClassName("rowPassword");

	var i;


	if (state == true)
	{
		for (i = 0; i < rowsP.length; i++)
		{
			rowsP[i].style.display = "table-row";
			rowsP[i].style.borderCollapse = "initial";
		}
	}
	else
	{
		var p1 = document.getElementById("tbxPassword12");
		var p2 = document.getElementById("tbxPassword22");

		p1.value = "";
		p2.value = "";

		for (i = 0; i < rowsP.length; i++)
		{
			rowsP[i].style.display = "none";
			rowsP[i].style.borderCollapse = "collapse";
		}
	}
}

function check_init(obj, texto)
{
	var state = obj.value;

	var i = 0;
	if (state == "Crear" || state == "Editar")
	{
		var addButton = document.getElementById("AddNewRecordButton");
		var enlaces = document.getElementsByTagName("a");
		var rowsC = document.getElementById("chkRow");
		var rowsP = document.getElementsByClassName("rowPassword");

		addButton.style.visibility = "hidden";
		for (i = 0; i < enlaces.length; i++)
		{
			enlaces[i].style.visibility = "hidden";
		}

		if (state == "Crear")
		{
			rowsC.style.display = "none";
			rowsC.style.borderCollapse = "collapse";
			for (i = 0; i < rowsP.length; i++)
			{
				rowsP[i].style.display = "table-row";
				rowsP[i].style.borderCollapse = "initial";
			}
		}

		else
		{

			rowsC.style.display = "table-row";
			rowsC.style.borderCollapse = "initial";
			for (i = 0; i < rowsP.length; i++)
			{
				rowsP[i].style.display = "none";
				rowsP[i].style.borderCollapse = "collapse";
			}

		}

	}
	//Aca es cuando sale de la edicion
	if (state == "finEditar")
	{
		var enlaces = document.getElementsByTagName("a");
		for (i = 0; i < enlaces.length; i++)
		{
			enlaces[i].style.visibility = "visible";
		}
	}
	else
	{
		//por aca entra cuando no crea o actualiza
	}
}

function isBlank(str)
{
	return (!str || /^\s*$/.test(str));
}

function mostrar(obj)
{
	alert(obj.value);
}

function errorCheck(obj)
{
	var error = {
		errorType: "",
		statement: "",
		foreignKeyConstraint: "",
		database: "",
		table: "",
		duplicate_key: "",
		index: "",
		mensaje: ""

	};
	var splitted;

	if (obj.value.search("FOREIGN KEY") != (-1))
	{
		error.errorType = "REFERENTIAL_INTEGRITY";
	}

	if (obj.value.search("unique index") != (-1))
	{
		error.errorType = "DUPLICATE_KEY";
	}

	switch (error.errorType)
	{
		case "REFERENTIAL_INTEGRITY":

			splitted = obj.value.split("\"");
			error.statement = "INSERCION";
			error.foreignKeyConstraint = splitted[1];
			error.database = splitted[3];
			error.table = splitted[5];

			if (error.table == "dbo.USUARIO")
			{
				error.mensaje = "La operacion de " + error.statement + " que intenta realizar falla por que el usuario con el que pretende ingresar hacer la operacion no existe o no tiene los privilegios suficientes";
			}
			else
			{
				error.mensaje = "La operacion de " + error.statement + " que intenta realizar falla por que los datos que pretende insertar no estan previamente registrados en " + error.table;
			}
			break;
		case "DUPLICATE_KEY":

			splitted = obj.value.split("\'");
			error.statement = "INSERCION";
			error.index = splitted[3];
			error.table = splitted[1];
			var openP = splitted[4].indexOf("(");
			var closeP = splitted[4].indexOf(")");

			error.duplicate_key = splitted[4].substring(openP, (closeP + 1));

			error.mensaje = "La operacion de " + error.statement + " que intenta realizar falla por que el valor " + error.duplicate_key + " ya se encuentra en la base de datos y este no admite repeticiones de acuerdo al indice " + error.index;

			break;


		default:
			error.mensaje = "excepcion no controlada";
			break;

	}

	alert(error.mensaje)
}

function abrir(obj)
{

	var arreglo = obj.id.split("_");
	var id = arreglo[(arreglo.length) - 1];
	var nomArchivo = arreglo[(arreglo.length) - 2];
	//alert("Identificador " + obj.id + " " + arreglo.length + " id " + id + " nom " + nomArchivo);
	var qString = "../Controls/VerArchivos.aspx?idHistoria=" + id + "&nomArchivo=" + nomArchivo;
	window.open(qString);
	//location.reload(true);

}

function DisplaySticker()
{
	var modal = document.getElementById('modal');
	var altura = document.body.clientWidth + "px";




	modal.style.height = altura;

	$('#modal').toggle('slow');
	window.scrollTo(0, 0);

}

//deploy Form with exame abstract
function ViewExamsAbstract()
{
	var examsAbstractHeader = document.createElement('div');
	examsAbstractHeader.id = "printControler";

	var listadoExamenes = divSelExamenes();
	listadoExamenes.id = "examenesListado";
	listadoExamenes.className = "listExamenes"
	examsAbstractHeader.appendChild(listadoExamenes);

	var btnContainner = document.createElement("div");
	btnContainner.className = "btnStrip";

	var btnVistaPrevia = document.createElement('div');
	btnVistaPrevia.innerHTML = "Vista Previa";
	btnVistaPrevia.id = "btnVP";
	btnVistaPrevia.className = "botonesVPE";
	btnVistaPrevia.addEventListener("click", updateLayout);
	btnContainner.appendChild(btnVistaPrevia);

	$(btnContainner).append('<div class="switch-container"><span class="span-language">Español </span><label class="switch"><input id="checkLang" type="checkbox"><span class="slider round"></span></label><span class="span-language"> Ingles</span></div>')
	$("#checkLang").on("click", ToogleView);

	var commCerrar = document.createElement('div');
	commCerrar.innerHTML = "Cerrar Vista previa";
	commCerrar.id = "btnCerrarVP";
	commCerrar.className = "botonesVPE btnCerrarVP";
	commCerrar.addEventListener("click", cerrarVP);

	btnContainner.appendChild(commCerrar);

	examsAbstractHeader.appendChild(btnContainner);

	var modal = document.getElementById('modal');

	modal.appendChild(examsAbstractHeader);
	var altura = document.body.clientWidth + "px";

	modal.style.height = altura;

	$('#modal').toggle('slow');
	window.scrollTo(0, 0);
}

function ToogleView(evt)
{
	if (evt.target.checked)
	{
		//alert("English selected");
		$("#printableEng").addClass("in");
		$("#printable").removeClass("in");

	}
	else
	{
		//alert("Seleccionado español")
		$("#printableEng").removeClass("in")
		$("#printable").addClass("in")

	}
}

function cerrarVP()
{

	// Get the <ul> element with id="myList"
	var list = document.getElementById("modal");

	// As long as <ul> has a child node, remove it
	while (list.hasChildNodes())
	{
		list.removeChild(list.firstChild);
	}
	$('#modal').toggle('slow');
}

function divSelExamenesObj(obj)
{

	var divExamenesListado = document.createElement('div');
	divExamenesListado.id = "examenesListado";

	var tituloExamenesListado = document.createElement('div');
	tituloExamenesListado.className = "titulo";
	tituloExamenesListado.appendChild(document.createTextNode("Seleccione examenes para generar reporte impreso"));

	divExamenesListado.appendChild(tituloExamenesListado);

	if (obj.chkUrologia == true)
	{
		var labelCheck = document.createElement('label');
		labelCheck.className = "chkBxPv";

		var checkBx = document.createElement('input');
		checkBx.type = "checkbox";
		checkBx.id = "checkBxUro";
		checkBx.onchange = function () { removeChildren("impresion"); removeChildren("impresionEng"); };

		labelCheck.appendChild(checkBx);

		labelCheck.appendChild(document.createTextNode("Uroanalisis		"));

		divExamenesListado.appendChild(labelCheck)
	}

	if (obj.chkVIH == true)
	{
		var labelCheck = document.createElement('label');
		labelCheck.className = "chkBxPv";

		var checkBx = document.createElement('input');
		checkBx.type = "checkbox";
		checkBx.id = "checkBxVIH";
		checkBx.onchange = function () { removeChildren("impresion"); removeChildren("impresionEng"); };

		labelCheck.appendChild(checkBx);
		labelCheck.appendChild(document.createTextNode("VIH		"));

		divExamenesListado.appendChild(labelCheck)
	}

	if (obj.chkSerologia == true)
	{
		var labelCheck = document.createElement('label');
		labelCheck.className = "chkBxPv";

		var checkBx = document.createElement('input');
		checkBx.type = "checkbox";
		checkBx.id = "checkBxSero";
		checkBx.onchange = function () { removeChildren("impresion"); removeChildren("impresionEng"); };

		labelCheck.appendChild(checkBx);
		labelCheck.appendChild(document.createTextNode("Serología		"));

		divExamenesListado.appendChild(labelCheck)
	}

	if (obj.chkHepatitisB == true)
	{
		var labelCheck = document.createElement('label');
		labelCheck.className = "chkBxPv";

		var checkBx = document.createElement('input');
		checkBx.type = "checkbox";
		checkBx.id = "checkBxHepB";
		checkBx.onchange = function () { removeChildren("impresion"); removeChildren("impresionEng"); };

		labelCheck.appendChild(checkBx);
		labelCheck.appendChild(document.createTextNode("Hepatitis B		"));

		divExamenesListado.appendChild(labelCheck)
	}

	if (obj.chkHepatitisC == true)
	{
		var labelCheck = document.createElement('label');
		labelCheck.className = "chkBxPv";

		var checkBx = document.createElement('input');
		checkBx.type = "checkbox";
		checkBx.id = "checkBxHepC";
		checkBx.onchange = function () { removeChildren("impresion"); removeChildren("impresionEng"); };

		labelCheck.appendChild(checkBx);
		labelCheck.appendChild(document.createTextNode("Hepatitis C		"));

		divExamenesListado.appendChild(labelCheck)
	}

	if (obj.chkCuadroHematico == true)
	{
		var labelCheck = document.createElement('label');
		labelCheck.className = "chkBxPv";

		var checkBx = document.createElement('input');
		checkBx.type = "checkbox";
		checkBx.id = "checkBxCH";
		checkBx.onchange = function () { removeChildren("impresion"); removeChildren("impresionEng"); };

		labelCheck.appendChild(checkBx);
		labelCheck.appendChild(document.createTextNode("Cuadro hemático		"));

		divExamenesListado.appendChild(labelCheck)
	}

	if (obj.chkOtrosExamenes == true)
	{
		var labelCheck = document.createElement('label');
		labelCheck.className = "chkBxPv";

		var checkBx = document.createElement('input');
		checkBx.type = "checkbox";
		checkBx.id = "checkBxOEx";
		checkBx.onchange = function () { removeChildren("impresion"); removeChildren("impresionEng"); };

		labelCheck.appendChild(checkBx);
		labelCheck.appendChild(document.createTextNode("Otros examenes "));

		divExamenesListado.appendChild(labelCheck)
	}

	if (obj.chkCreatinina == true)
	{
		var labelCheck = document.createElement('label');
		labelCheck.className = "chkBxPv";

		var checkBx = document.createElement('input');
		checkBx.type = "checkbox";
		checkBx.id = "checkBxCre";
		checkBx.onchange = function () { removeChildren("impresion"); removeChildren("impresionEng"); };

		labelCheck.appendChild(checkBx);
		labelCheck.appendChild(document.createTextNode("Creatinina		"));

		divExamenesListado.appendChild(labelCheck)
	}

	if (obj.chkHemGlicosilada == true)
	{
		var labelCheck = document.createElement('label');
		labelCheck.className = "chkBxPv";

		var checkBx = document.createElement('input');
		checkBx.type = "checkbox";
		checkBx.id = "checkBxHmGl";
		checkBx.onchange = function () { removeChildren("impresion"); removeChildren("impresionEng"); };

		labelCheck.appendChild(checkBx);
		labelCheck.appendChild(document.createTextNode("Hemoglobina glicosilada		"));

		divExamenesListado.appendChild(labelCheck)
	}

	return divExamenesListado;

}

function checksPreview()
{

	var checks = {
		chkUrologia: false,
		chkVIH: false,
		chkSerologia: false,
		chkHepatitisB: false,
		chkHepatitisC: false,
		chkCuadroHematico: false,
		chkCreatinina: false,
		chkHemGlicosilada: false,
		chkOtrosExamenes: false
	}

	if (document.getElementById("checkBxUro") != undefined) { checks.chkUrologia = document.getElementById("checkBxUro").checked }
	if (document.getElementById("checkBxVIH") != undefined) { checks.chkVIH = document.getElementById("checkBxVIH").checked }
	if (document.getElementById("checkBxSero") != undefined) { checks.chkSerologia = document.getElementById("checkBxSero").checked }
	if (document.getElementById("checkBxHepB") != undefined) { checks.chkHepatitisB = document.getElementById("checkBxHepB").checked }
	if (document.getElementById("checkBxHepC") != undefined) { checks.chkHepatitisC = document.getElementById("checkBxHepC").checked }
	if (document.getElementById("checkBxCH") != undefined) { checks.chkCuadroHematico = document.getElementById("checkBxCH").checked }
	if (document.getElementById("checkBxCre") != undefined) { checks.chkCreatinina = document.getElementById("checkBxCre").checked }
	if (document.getElementById("checkBxHmGl") != undefined) { checks.chkHemGlicosilada = document.getElementById("checkBxHmGl").checked }
	if (document.getElementById("checkBxOEx") != undefined) { checks.chkOtrosExamenes = document.getElementById("checkBxOEx").checked }

	return checks;
}

function removeChildren(className)
{

	var verificacion = document.getElementsByClassName(className);

	if (verificacion != undefined)
	{
		var list = document.getElementsByClassName(className);
		var l = list.length;
		for (var i = 0; i < l; i++)
		{
			var lista = list[0];
			var padreLista = lista.parentNode;
			padreLista.removeChild(lista);
		}
	}
}

function returnppty(idControl, propty)
{
	var pptyreturn;

	if (document.getElementById(idControl) != undefined)
	{
		switch (propty)
		{
			case "checked":
				pptyreturn = document.getElementById(idControl).checked;
				break;

			case "value":

				pptyreturn = document.getElementById(idControl).value;
				break;

			default:
				pptyreturn = null;
		}

	}
	else
	{
		pptyreturn = null;
	}
	return pptyreturn
}

function calcularEdad(stringFecha)
{
	var arrFecha = stringFecha.split('-');
	var fechaHoy = new Date();

	var edad = fechaHoy.getFullYear() - arrFecha[0] - 1;

	if ((fechaHoy.getMonth() + 1) > arrFecha[1])
	{
		edad = edad + 1;
	}
	else if ((fechaHoy.getMonth() + 1) >= arrFecha[1] && fechaHoy.getDate() >= arrFecha[2])
	{
		edad = edad + 1;
	}

	return edad;
}

function imprSelec()
{
	var host = location.hostname;

	var ficha;

	if (!$("#checkLang")[0].checked)
	{
		ficha = document.getElementById("printable").cloneNode(true);
		$(ficha).removeClass("collapse");
		nombre = ficha.getElementsByTagName("span")["spNombre"].innerHTML;
	}
	else
	{
		ficha = document.getElementById("printableEng").cloneNode(true);
		$(ficha).removeClass("collapse");
		nombre = ficha.getElementsByTagName("span")["spNombreEng"].innerHTML;
	}

	var jquery = document.createElement('script');
	var pageload = document.createElement('script');
	var bootstrap = document.createElement("LINK");
	var site = document.createElement("LINK");
	var head = document.createElement("HEAD");
	var body = document.createElement("BODY");
	var title = document.createElement("title");

	title.innerHTML = nombre;

	jquery.type = 'text/javascript';
	jquery.src = "http://" + host + appRoot + "Scripts/jquery-3.5.1.min.js";

	pageload.type = 'text/javascript';
	pageload.innerText = "$(document).ready(function(){window.print()});"; /**/

	bootstrap.rel = 'stylesheet';
	bootstrap.type = 'text/css';
	bootstrap.href = "http://" + host + appRoot + "Content/bootstrap.css";

	site.rel = 'stylesheet';
	site.type = 'text/css';
	site.href = "http://" + host + appRoot + "Content/site.css";


	head.appendChild(title);
	head.appendChild(bootstrap);
	head.appendChild(site);

	body.appendChild(ficha);
	body.appendChild(jquery);
	body.appendChild(pageload);
	var entireText = head.outerHTML + body.outerHTML;

	var doc = window.open('', 'Ventana de impresión');
	doc.document.write(entireText);
	doc.document.close();
	doc.focus();

}

function UpdateInfoLab(obj)
{
	//Español
	document.getElementById("spNomLaboratorio").innerHTML = obj.nomLab;
	document.getElementById("spNomBacteriologo1").innerHTML = obj.nomBact;
	document.getElementById("spUniversidad1").innerHTML = obj.univ;
	document.getElementById("spDireccionLaboratorio").innerHTML = obj.dirLab;
	document.getElementById("spCiudad").innerHTML = obj.ciudad;
	document.getElementById("spTelefonoLaboratorio").innerHTML = obj.telLab;
	document.getElementById("spFaxLaboratorio").innerHTML = obj.faxLab;
	document.getElementById("spCorreoElectBacteriologo").innerHTML = obj.corrElBact;
	document.getElementById("spNomBacteriologo2").innerHTML = obj.nomBact;
	document.getElementById("spUniversidad1").innerHTML = obj.univ;
	document.getElementById("spRegistroProfesional").innerHTML = obj.regPro;
	document.getElementById("imgFirmaBacteriologo").src = obj.firmaBase64;

	//English
	document.getElementById("spNomLaboratorioEng").innerHTML = obj.nomLab;
	document.getElementById("spNomBacteriologo1Eng").innerHTML = obj.nomBact;
	document.getElementById("spUniversidad1Eng").innerHTML = obj.univ;
	document.getElementById("spDireccionLaboratorioEng").innerHTML = obj.dirLab;
	document.getElementById("spCiudadEng").innerHTML = obj.ciudad;
	document.getElementById("spTelefonoLaboratorioEng").innerHTML = obj.telLab;
	document.getElementById("spFaxLaboratorioEng").innerHTML = obj.faxLab;
	document.getElementById("spCorreoElectBacteriologoEng").innerHTML = obj.corrElBact;
	document.getElementById("spNomBacteriologo2Eng").innerHTML = obj.nomBact;
	document.getElementById("spUniversidad1Eng").innerHTML = obj.univ;
	document.getElementById("spRegistroProfesionalEng").innerHTML = obj.regPro;
	document.getElementById("imgFirmaBacteriologoEng").src = obj.firmaBase64;

}

function RemoveChildById(IdObj)
{
	var objSup = document.getElementById(IdObj);
	var objSupParent = objSup.parentNode;

	objSupParent.removeChild(objSup);
}

/*Gestion de la tableta de firma*/
var tmr;
var eventTmr;
var strSig;
var pagina

function startTablet(tipocaptura) 
{
	pagina = tipocaptura
	try 
	{
		var retmod = 0;
		var retser = 0;
		SetTabletState(1);
		retmod = TabletModelNumber();
		retser = TabletSerialNumber();
		SetTabletState(0);
		if (retmod == 8 || (retmod == 58 && (retser == 553 || retser == 557))) 
		{
			var ctx = document.getElementById('cnv').getContext('2d');
			eventTmr = setInterval(SigWebEvent, 20);
			tmr = SetTabletState(1, ctx, 50) || tmr;

			SetJustifyMode(5); //try wit 5
			KeyPadClearHotSpotList();
			ClearSigWindow(1);
			SetDisplayXSize(448);//X size of the canvas object
			SetDisplayYSize(106);//Y size of the canvas object
			SetImageXSize(448);// X size of the signature image
			SetImageYSize(106);// Y size of the signature image

			ClearTablet();

			SetLCDCaptureMode(2);
			LCDSetWindow(8, 42, 223, 48); //Permits inking on only this section of the LCD
			SetSigWindow(1, 8, 42, 223, 48); //Permits inking in only this section of the SigWeb object
			LcdRefresh(0, 0, 0, 240, 128);

			KeyPadAddHotSpot(0, 1, 5, 97, 115, 25);
			KeyPadAddHotSpot(1, 1, 125, 97, 115, 25);

			//Loaded into the background
			LCDSendGraphicUrl(0, 2, 0, 0, "http://localhost/ResumenMedico/Resources/TabletImages/CapturaFirma.bmp");

			SetLCDCaptureMode(2);

			onSigPenUp = function () 
			{
				processPenUp();
			};

			SetLCDCaptureMode(2);

		}
		else 
		{
			alert("no se ha detectado ninguna tableta de firma apropiada para esta aplicación\n\nAsegurese que su modelo corresponde a la siguiente referencia\n\nTOPAZ Sistems Modelo T-LBK750-BHSB-R");
		}
	}
	catch (e) 
	{
		alert("Error, no se ha encontrado el componente de control para la tableta digitalizadora\n\nA continuacion se descargara el archivo ejecutable para el manejo de la tableta\n\nAl terminar la descarga por favor instalelo y vuelva a cargar la pagina, debe tener permisos de administrador sobre la maquina para la instalación");
		window.location = "../Resources/Files/sigweb.exe";
	}
}

function processPenUp() 
{
	if (KeyPadQueryHotSpot(0) > 0) 
	{
		if (NumberOfTabletPoints() > 0)
		{

			onDone();

			LcdRefresh(0, 0, 0, 240, 128);

			strSig = GetSigString(); //strSig now holds signature string

			LCDWriteString(0, 2, 4, 40, "10pt Arial", 20, "Muchas gracias por su tiempo!");
			LCDSendGraphicUrl(0, 2, 58, 90, "http://www.topazsystems.com/SigWeb/topazlogo43.bmp");
			SetTabletState(0, tmr);
			SetJustifyMode(5);
			ClearTablet();
			clearInterval(eventTmr);
		}
	}

	if (KeyPadQueryHotSpot(1) > 0) 
	{
		ClearSigWindow(1);
		ClearTablet();
		LcdRefresh(0, 8, 42, 224, 49);
	}

	ClearSigWindow(1);
}

function endDemo() 
{
	LcdRefresh(0, 0, 0, 240, 128);
	KeyPadClearHotSpotList();
	SetLCDCaptureMode(1);
	SetTabletState(0, tmr);
}

window.onunload = function () 
{
	endDemo();
};

function onClear() 
{
	ClearTablet();
}

function onDone() 
{
	if (NumberOfTabletPoints() == 0) 
	{
		alert("Please sign before continuing");
	}
	else 
	{
		//SetTabletState(0, tmr);
		//RETURN TOPAZ-FORMAT SIGSTRING
		SetSigCompressionMode(1);

		//RETURN BMP BYTE ARRAY CONVERTED TO BASE64 STRING
		SetImageXSize(448);
		SetImageYSize(106);
		SetImagePenWidth(5);
		GetSigImageB64(SigImageCallback);
	}
	endDemo();
}

function SigImageCallback(str)
{
	$("input[id$='hidBase64ImageData']")[0].value = "data:image/png;base64," + str;
}


/*Fin de la gestion de la tableta de firma*/