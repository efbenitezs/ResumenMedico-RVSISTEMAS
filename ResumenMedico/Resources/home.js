(function (lib, img, cjs) {

var p; // shortcut to reference prototypes

// library properties:
lib.properties = {
	width: 550,
	height: 550,
	fps: 24,
	color: "#FFFFFF",
	manifest: [
		{src:"images/circulo.png", id:"circulo"},
		{src:"images/estetoscopio.png", id:"estetoscopio"},
		{src:"images/examen.png", id:"examen"},
		{src:"images/in_paciente.png", id:"in_paciente"},
		{src:"images/lab.png", id:"lab"},
		{src:"images/Mapadebits1.png", id:"Mapadebits1"},
		{src:"images/pacientes.png", id:"pacientes"},
		{src:"images/rayos.png", id:"rayos"}
	]
};



// symbols:



(lib.circulo = function() {
	this.initialize(img.circulo);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,1361,1361);


(lib.estetoscopio = function() {
	this.initialize(img.estetoscopio);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,1048,1048);


(lib.examen = function() {
	this.initialize(img.examen);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,591,169);


(lib.in_paciente = function() {
	this.initialize(img.in_paciente);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,685,169);


(lib.lab = function() {
	this.initialize(img.lab);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,492,169);


(lib.Mapadebits1 = function() {
	this.initialize(img.Mapadebits1);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,338,338);


(lib.pacientes = function() {
	this.initialize(img.pacientes);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,760,169);


(lib.rayos = function() {
	this.initialize(img.rayos);
}).prototype = p = new cjs.Bitmap();
p.nominalBounds = new cjs.Rectangle(0,0,492,169);


(lib.Símbolo2 = function() {
	this.initialize();

	// Capa 1
	this.instance = new lib.estetoscopio();
	this.instance.setTransform(0,0,0.239,0.239);

	this.addChild(this.instance);
}).prototype = p = new cjs.Container();
p.nominalBounds = new cjs.Rectangle(0,0,250,250);


(lib.Símbolo1 = function() {
	this.initialize();

	// Capa 1
	this.instance = new lib.circulo();
	this.instance.setTransform(0,0,0.22,0.22);

	this.addChild(this.instance);
}).prototype = p = new cjs.Container();
p.nominalBounds = new cjs.Rectangle(0,0,300,300);


(lib.ingreso = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// Capa 1
	this.instance = new lib.in_paciente();
	this.instance.setTransform(0,0,0.292,0.292);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1).to({y:-2.2},0).wait(1).to({y:0},0).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(0,0,200,49.3);


(lib.Símbolo3 = function() {
	this.initialize();

	// Capa 1
	this.instance = new lib.Símbolo2();
	this.instance.setTransform(125,125,1,1,0,0,0,125,125);

	this.addChild(this.instance);
}).prototype = p = new cjs.Container();
p.nominalBounds = new cjs.Rectangle(0,0,250,250);


// stage content:
(lib.home = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// laboratorio
	this.instance = new lib.lab();
	this.instance.setTransform(386.8,91.7,0.309,0.309);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(80));

	// rayos
	this.instance_1 = new lib.rayos();
	this.instance_1.setTransform(0,260.6,0.303,0.303);

	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(80));

	// examen
	this.instance_2 = new lib.examen();
	this.instance_2.setTransform(360.9,370.8,0.32,0.32);

	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(80));

	// paciente
	this.instance_3 = new lib.pacientes();
	this.instance_3.setTransform(74.4,433.3,0.324,0.324);

	this.timeline.addTween(cjs.Tween.get(this.instance_3).wait(80));

	// ingreso
	this.instance_4 = new lib.ingreso();
	this.instance_4.setTransform(158.2,89.6,1,1,0,0,0,100,24.7);
	new cjs.ButtonHelper(this.instance_4, 0, 1, 2);

	this.timeline.addTween(cjs.Tween.get(this.instance_4).wait(80));

	// Capa 2
	this.instance_5 = new lib.Símbolo3();
	this.instance_5.setTransform(290,269,0.858,0.858,0,0,0,125,125);

	this.timeline.addTween(cjs.Tween.get(this.instance_5).wait(1).to({scaleX:0.86,scaleY:0.86,x:289.9,y:268.9},0).wait(1).to({scaleX:0.86,scaleY:0.86,x:290,y:269},0).wait(1).to({scaleX:0.86,scaleY:0.86,x:289.9,y:268.9},0).wait(1).to({scaleX:0.87,scaleY:0.87,x:290,y:269},0).wait(1).to({scaleX:0.87,scaleY:0.87,x:289.9,y:268.9},0).wait(1).to({scaleX:0.87,scaleY:0.87,x:290,y:269},0).wait(1).to({scaleX:0.87,scaleY:0.87,x:289.9,y:268.9},0).wait(1).to({scaleX:0.87,scaleY:0.87,x:290,y:269},0).wait(1).to({scaleX:0.87,scaleY:0.87,x:289.9,y:268.9},0).wait(1).to({scaleX:0.88,scaleY:0.88,x:290,y:269},0).wait(1).to({scaleX:0.88,scaleY:0.88,x:289.9,y:268.9},0).wait(1).to({scaleX:0.88,scaleY:0.88,x:290,y:269},0).wait(1).to({scaleX:0.88,scaleY:0.88,x:289.9,y:268.9},0).wait(1).to({scaleX:0.88,scaleY:0.88,x:290,y:269},0).wait(1).to({scaleX:0.89,scaleY:0.89,x:289.9,y:268.9},0).wait(1).to({scaleX:0.89,scaleY:0.89,x:290,y:269},0).wait(1).to({scaleX:0.89,scaleY:0.89,x:289.9,y:268.9},0).wait(1).to({scaleX:0.89,scaleY:0.89,x:290,y:269},0).wait(1).to({scaleX:0.89,scaleY:0.89,x:289.9,y:268.9},0).wait(1).to({scaleX:0.89,scaleY:0.89,x:290,y:269},0).wait(1).to({scaleX:0.9,scaleY:0.9,x:289.9,y:268.9},0).wait(1).to({scaleX:0.9,scaleY:0.9,x:290,y:269},0).wait(1).to({scaleX:0.9,scaleY:0.9,x:289.9,y:268.9},0).wait(1).to({scaleX:0.9,scaleY:0.9,x:290,y:269},0).wait(1).to({scaleX:0.9,scaleY:0.9,x:289.9,y:268.9},0).wait(1).to({scaleX:0.91,scaleY:0.91,x:290,y:269},0).wait(1).to({scaleX:0.91,scaleY:0.91,x:289.9,y:268.9},0).wait(1).to({scaleX:0.91,scaleY:0.91,x:290,y:269},0).wait(1).to({scaleX:0.91,scaleY:0.91,x:289.9,y:268.9},0).wait(1).to({scaleX:0.91,scaleY:0.91,x:290,y:269},0).wait(1).to({scaleX:0.91,scaleY:0.91,x:289.9,y:268.9},0).wait(1).to({scaleX:0.92,scaleY:0.92,x:290,y:269},0).wait(1).to({scaleX:0.92,scaleY:0.92,x:289.9,y:268.9},0).wait(1).to({scaleX:0.92,scaleY:0.92,x:290,y:269},0).wait(1).to({scaleX:0.92,scaleY:0.92,x:289.9,y:268.9},0).wait(1).to({scaleX:0.92,scaleY:0.92,x:290,y:269},0).wait(1).to({scaleX:0.93,scaleY:0.93,x:289.9,y:268.9},0).wait(1).to({scaleX:0.93,scaleY:0.93,x:290,y:269},0).wait(1).to({scaleX:0.93,scaleY:0.93,x:289.9,y:268.9},0).wait(1).to({scaleX:0.93,scaleY:0.93,x:290,y:269},0).wait(1).to({scaleX:0.93,scaleY:0.93,x:289.9,y:268.9},0).wait(1).to({scaleX:0.93,scaleY:0.93,x:290,y:269},0).wait(1).to({scaleX:0.94,scaleY:0.94,x:289.9,y:268.9},0).wait(1).to({scaleX:0.94,scaleY:0.94,x:290,y:269},0).wait(1).to({scaleX:0.94,scaleY:0.94,x:289.9,y:268.9},0).wait(1).to({scaleX:0.94,scaleY:0.94,x:290,y:269},0).wait(1).to({scaleX:0.94,scaleY:0.94,x:289.9,y:268.9},0).wait(1).to({scaleX:0.94,scaleY:0.94,x:290,y:269},0).wait(1).to({scaleX:0.95,scaleY:0.95,x:289.9,y:268.9},0).wait(1).to({scaleX:0.95,scaleY:0.95,x:290,y:269},0).wait(1).to({scaleX:0.95,scaleY:0.95,x:289.9,y:268.9},0).wait(1).to({scaleX:0.95,scaleY:0.95,x:290,y:269},0).wait(1).to({scaleX:0.95,scaleY:0.95,x:289.9,y:268.9},0).wait(1).to({scaleX:0.96,scaleY:0.96,x:290,y:269},0).wait(1).to({scaleX:0.96,scaleY:0.96,x:289.9,y:268.9},0).wait(1).to({scaleX:0.96,scaleY:0.96,x:290,y:269},0).wait(1).to({scaleX:0.96,scaleY:0.96,x:289.9,y:268.9},0).wait(1).to({scaleX:0.96,scaleY:0.96,x:290,y:269},0).wait(1).to({scaleX:0.96,scaleY:0.96,x:289.9,y:268.9},0).wait(1).to({scaleX:0.97,scaleY:0.97,x:290,y:269},0).wait(1).to({scaleX:0.97,scaleY:0.97,x:289.9,y:268.9},0).wait(1).to({scaleX:0.97,scaleY:0.97,x:290,y:269},0).wait(1).to({scaleX:0.97,scaleY:0.97,x:289.9,y:268.9},0).wait(1).to({scaleX:0.97,scaleY:0.97,x:290,y:269},0).wait(1).to({scaleX:0.98,scaleY:0.98,x:289.9,y:268.9},0).wait(1).to({scaleX:0.98,scaleY:0.98,x:290,y:269},0).wait(1).to({scaleX:0.98,scaleY:0.98,x:289.9,y:268.9},0).wait(1).to({scaleX:0.98,scaleY:0.98,x:290,y:269},0).wait(1).to({scaleX:0.98,scaleY:0.98,x:289.9,y:268.9},0).wait(1).to({scaleX:0.98,scaleY:0.98,x:290,y:269},0).wait(1).to({scaleX:0.99,scaleY:0.99,x:289.9,y:268.9},0).wait(1).to({scaleX:0.99,scaleY:0.99,x:290,y:269},0).wait(1).to({scaleX:0.99,scaleY:0.99,x:289.9,y:268.9},0).wait(1).to({scaleX:0.99,scaleY:0.99,x:290,y:269},0).wait(1).to({scaleX:0.99,scaleY:0.99,x:289.9,y:268.9},0).wait(1).to({scaleX:1,scaleY:1},0).wait(1).to({scaleX:1,scaleY:1},0).wait(1).to({scaleX:1,scaleY:1},0).wait(1).to({scaleX:1,scaleY:1,x:290,y:269},0).wait(1));

	// Capa 1
	this.instance_6 = new lib.Símbolo1();
	this.instance_6.setTransform(284,265,1,1,0,0,0,150,150);

	this.timeline.addTween(cjs.Tween.get(this.instance_6).wait(1).to({rotation:1.1,x:283.9},0).wait(1).to({rotation:2.2,x:284},0).wait(1).to({rotation:3.2,x:283.9},0).wait(1).to({rotation:4.3},0).wait(1).to({rotation:5.4,x:284},0).wait(1).to({rotation:6.5},0).wait(1).to({rotation:7.6},0).wait(1).to({rotation:8.7},0).wait(1).to({rotation:9.7},0).wait(1).to({rotation:10.8},0).wait(1).to({rotation:11.9},0).wait(1).to({rotation:13,x:283.9},0).wait(1).to({rotation:14.1},0).wait(1).to({rotation:15.1,x:284},0).wait(1).to({rotation:16.2,x:283.9},0).wait(1).to({rotation:17.3},0).wait(1).to({rotation:18.4},0).wait(1).to({rotation:19.5},0).wait(1).to({rotation:20.6,x:284},0).wait(1).to({rotation:21.6},0).wait(1).to({rotation:22.7,x:283.9},0).wait(1).to({rotation:23.8},0).wait(1).to({rotation:24.9},0).wait(1).to({rotation:26,x:284},0).wait(1).to({rotation:27},0).wait(1).to({rotation:28.1},0).wait(1).to({rotation:29.2,x:283.9},0).wait(1).to({rotation:30.3},0).wait(1).to({rotation:31.4},0).wait(1).to({rotation:32.5},0).wait(1).to({rotation:33.5,x:284},0).wait(1).to({rotation:34.6},0).wait(1).to({rotation:35.7,x:283.9},0).wait(1).to({rotation:36.8,x:284},0).wait(1).to({rotation:37.9},0).wait(1).to({rotation:38.9,x:283.9},0).wait(1).to({rotation:40,x:284},0).wait(1).to({rotation:41.1,x:283.9},0).wait(1).to({rotation:42.2,x:284},0).wait(1).to({rotation:43.3},0).wait(1).to({rotation:44.4},0).wait(1).to({rotation:45.4},0).wait(1).to({rotation:46.5,x:283.9},0).wait(1).to({rotation:47.6,x:284},0).wait(1).to({rotation:48.7},0).wait(1).to({rotation:49.8},0).wait(1).to({rotation:50.8},0).wait(1).to({rotation:51.9,x:283.9},0).wait(1).to({rotation:53,x:284},0).wait(1).to({rotation:54.1,x:283.9},0).wait(1).to({rotation:55.2},0).wait(1).to({rotation:56.3},0).wait(1).to({rotation:57.3},0).wait(1).to({rotation:58.4},0).wait(1).to({rotation:59.5},0).wait(1).to({rotation:60.6},0).wait(1).to({rotation:61.7},0).wait(1).to({rotation:62.7,x:284},0).wait(1).to({rotation:63.8},0).wait(1).to({rotation:64.9,x:283.9},0).wait(1).to({rotation:66,y:264.9},0).wait(1).to({rotation:67.1,x:284,y:265},0).wait(1).to({rotation:68.2,x:283.9},0).wait(1).to({rotation:69.2},0).wait(1).to({rotation:70.3},0).wait(1).to({rotation:71.4,x:284},0).wait(1).to({rotation:72.5},0).wait(1).to({rotation:73.6},0).wait(1).to({rotation:74.6,x:283.9},0).wait(1).to({rotation:75.7},0).wait(1).to({rotation:76.8},0).wait(1).to({rotation:77.9,x:284},0).wait(1).to({rotation:79,x:283.9},0).wait(1).to({rotation:80.1},0).wait(1).to({rotation:81.1,x:284},0).wait(1).to({rotation:82.2},0).wait(1).to({rotation:83.3},0).wait(1).to({rotation:84.4},0).wait(1).to({rotation:85.5,x:283.9},0).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(275,337.6,550,425.4);

})(lib = lib||{}, images = images||{}, createjs = createjs||{});
var lib, images, createjs;