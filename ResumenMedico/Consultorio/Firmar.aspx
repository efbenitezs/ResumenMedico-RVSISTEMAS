<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Firmar.aspx.cs" Inherits="ResumenMedico.Consultorio.Firmar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
	<title>Firma Paciente para consentimiento</title>
	<link href="../Content/Site.css" rel="Stylesheet" type="text/css" />
	<telerik:RadStyleSheetManager ID="rssmAdmin" runat="server" EnableStyleSheetCombine="true">
	</telerik:RadStyleSheetManager>
	<script src="/Scripts/AppScripts.js" type="text/javascript"></script>
	<script src="/Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
	<script src="/Scripts/jquery-1.4.1.js" type="text/javascript"></script>
	<script src="/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
	<script src="/Scripts/SigWeb/SigWebTablet.js" type="text/javascript"></script>
	<link href="/Styles/bootstrap.css?1" rel="stylesheet" type="text/css" />
	<link href="/Styles/global.css?1" rel="stylesheet" type="text/css" />
	<script type="text/javascript">

		function startTablet(tip)
		{
			try
			{
				var retmod = 0;
				var retser = 0;

				tipCarga.value = tip;

				SetTabletState(1);
				retmod = TabletModelNumber();
				retser = TabletSerialNumber();
				SetTabletState(0);
				if (retmod == 8 || (retmod == 58 && (retser == 553 || retser == 557)))
				{
					var ctx = document.getElementById('SigImg').getContext('2d');
					eventTmr = setInterval(SigWebEvent, 20);
					tmr = SetTabletState(1, ctx, 50) || tmr;

					SetJustifyMode(4);
					KeyPadClearHotSpotList();
					ClearSigWindow(1);
					SetDisplayXSize(300);
					SetDisplayYSize(115);
					SetImageXSize(300);
					SetImageYSize(115);

					ClearTablet();

					SetLCDCaptureMode(2);
					LCDSetWindow(0, 0, 1, 1); //Permits inking on only this section of the LCD
					SetSigWindow(1, 0, 0, 1, 1); //Permits inking in only this section of the SigWeb object
					LcdRefresh(0, 0, 0, 240, 128);


					ClearTablet();
					KeyPadClearHotSpotList(); //borra cualquier hotspot que haya en la actual ejecucion

					//Confgura los dos Hotspots
					KeyPadAddHotSpot(0, 1, 21, 108, 72, 24); //4 PREVIOUS
					KeyPadAddHotSpot(1, 1, 134, 108, 79, 24); //5 CLEAR
					LCDSendGraphicUrl(0, 2, 0, 0, "http://vmpwebpicu/Resources/PaneldeFirma.bmp");
					//LCDSendGraphicUrl(0, 2, 0, 0, "http://localhost:8573/Resources/PaneldeFirma.bmp");
					LCDSetWindow(8, 53, 220, 51); //Establece el area de dibujo en la tableta
					SetSigWindow(1, 8, 53, 220, 51); //Permits inking in only this section of the SigWeb object
					SetLCDCaptureMode(2);

					onSigPenUp = function ()
					{
						processPenUp();
					};

					SetLCDCaptureMode(2);

				}
				else
				{
					alert("No se ha detectado ninguna tableta de firma apropiada para esta aplicación\n\nAsegurese que su modelo corresponde a la siguiente referencia\n\nTOPAZ Sistems Modelo T-LBK750-BHSB-R");
				}
			}
			catch (e)
			{
				alert("Error, no se ha encontrado el componente de control para la tableta digitalizadora\n\nA continuacion se descargara el archivo ejecutable para el manejo de la tableta\n\nAl terminar la descarga por favor instalelo y vuelva a cargar la pagina, debe tener permisos de administrador sobre la maquina para la instalación");
				window.location = "../Resources/Files/sigweb_20180307.exe";
			}
		}

		function processPenUp()
		{

			if (KeyPadQueryHotSpot(0) > 0) //CORREGIR FIRMA
			{
				ClearSigWindow(1);
				ClearTablet();
				LcdRefresh(1, 23, 108, 72, 15);
				LcdRefresh(2, 8, 53, 221, 51);
				LcdRefresh(1, 23, 108, 72, 15);

			}

			if (KeyPadQueryHotSpot(1) > 0) //DONE
			{
				ClearSigWindow(1);
				LcdRefresh(1, 136, 108, 79, 15);
				LcdRefresh(1, 136, 108, 79, 15);
				onDone();
				LcdRefresh(0, 0, 0, 240, 128);

				//strSig = GetSigString(); //strSig now holds signature string

				LCDSendGraphicUrl(0, 2, 0, 0, "http://vmpwebpicu/Resources/agradecimiento.bmp");
				//LCDSendGraphicUrl(0, 2, 0, 0, "http://localhost:8573/Resources/agradecimiento.bmp");

				SetTabletState(0, tmr);
				SetJustifyMode(5);
				ClearTablet();
				clearInterval(eventTmr);

				//  Se actualiza la firma
				//btnLoadSign.click();
			}

			ClearSigWindow(1);
		}

		function onClear()
		{
			ClearTablet();
		}

		function onDone()
		{
			if (NumberOfTabletPoints() == 0)
			{
				alert("Hay que firmar antes de hacer click en \"Confirmar Firma\"");
				ClearSigWindow(1);
				startTablet(2);

			}
			else
			{
				var ssdCnt = "sigStringData";
				var simCnt = "sigImageData"
				var imgCnt = "imgResultado";
				var sidCnt = "sigImgData";
				var bsdCnt = "bioSigData";

				if (tipCarga.value == 2)
				{
					ssdCnt += "Wit";
					simCnt += "Wit"
					imgCnt += "Wit";
					sidCnt += "Wit";
					bsdCnt += "Wit";
				}

				//RETURN TOPAZ-FORMAT SIGSTRING 
				SetSigCompressionMode(1);


				var sigStringData = document.getElementById(ssdCnt);
				var bioSigData = document.getElementById(bsdCnt);
				bioSigData.value = GetSigString();
				sigStringData.value += GetSigString();


				//RETURN BMP BYTE ARRAY CONVERTED TO BASE64 STRING
				SetImageXSize(500);
				SetImageYSize(100);
				SetImagePenWidth(5);
				GetSigImageB64(SigImageCallback);

				var img = document.getElementById(imgCnt);
				var sid64 = document.getElementById(sidCnt)

				img.src = "data:image/png;base64," + window.atob(sid64.value);
			}
		}


		function CheckBeforeSend(sender, e)
		{
			var errorMessage = "";
			var signPacient = document.getElementById("sigImageDataPac");
			var signWitness = document.getElementById("sigImageDataWit");


			if (signPacient.value == "")
			{
				errorMessage += "No se ha encontrado la firma del paciente \n";
			}

			/*
			if (sender._uniqueID == "rbtnDeclCan") 
			{
			if (signWitness.value == "") 
			{
			errorMessage += "No se ha encontrado la firma del testigo \n";
			}
			}
			*/

			if (errorMessage.length > 0)
			{
				alert(errorMessage);
				e._cancel = true;
			}
			else
			{
				bs64Pac.value = signPacient.value;
				bs64Wit.value = signWitness.value;
			}
		}
	</script>
</head>
<body style="width: 500px">
	<form id="form1" runat="server" class="container-fluid">
	<telerik:RadScriptManager ID="rsm" runat="server">
	</telerik:RadScriptManager>
	<telerik:RadFormDecorator ID="rfd" runat="server" DecoratedControls="All" />
	<telerik:RadAjaxManager ID="ram" runat="server" UpdatePanelsRenderMode="Block">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="rbtnDeclCan">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rtbRspAjax" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rbtnDeclNZ">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rtbRspAjax" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rbtnDeclAus">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rtbRspAjax" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rbtnDecVih">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rtbRspAjax" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rbtnDecVenPun">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rtbRspAjax" />
				</UpdatedControls>
			</telerik:AjaxSetting>
		</AjaxSettings>
	</telerik:RadAjaxManager>
	<asp:HiddenField ID="hfIdHist" runat="server" />
	<div>
		<div class="col-lg-12 col-xs-12" style="border: 5px double black; height: 118px;">
			<div style="width: 444px; height: 104px; margin: 3px auto;">
				<canvas name="SigImg" id="SigImg" style="width: 442px; height: 102px; border: 1px solid white"></canvas>
			</div>
		</div>
		<div class="col-lg-12 col-xs-12" style="padding: 10px 0px;">
			<div class="col-lg-4 col-xs-4">
				<telerik:RadButton runat="server" AutoPostBack="false" ID="SignBtn" Text="Habilitar Firma"
					OnClientClicked="function(){startTablet(1);}" CssClass="leftSideButton" />
			</div>
			<div class="col-lg-4 col-xs-4">
				<telerik:RadButton runat="server" AutoPostBack="false" ID="SignBtnWit" Text="Habilitar Firma Testigo"
					OnClientClicked="function(){startTablet(2)}" CausesValidation="false" CssClass="centeredButton" />
			</div>
			<div class="col-lg-4 col-xs-4">
				<telerik:RadButton runat="server" AutoPostBack="false" ID="SignClr" Text="Limpiar firma"
					OnClientClicked="function(){onClear();}" CssClass="rightSideButton" />
			</div>
		</div>
		<div style="margin: 10px">
			<div class="col-lg-12 col-xs-12 centerContent">
				<telerik:RadButton ID="rbtnDeclCan" runat="server" Text="Generar Consentimiento Canada"
					OnClientClicking="CheckBeforeSend" OnClick="rbtnDeclCan_Click" />
				<telerik:RadButton ID="rbtnDeclNZ" runat="server" Text="Generar Consentimiento Nueva Zelanda"
					OnClientClicking="CheckBeforeSend" OnClick="rbtnDeclNZ_Click" />
				<telerik:RadButton ID="rbtnDeclAus" runat="server" Text="Generar Consentimiento Australia"
					OnClientClicking="CheckBeforeSend" OnClick="rbtnDeclAus_Click" />
			</div>
			<div>
				<telerik:RadButton ID="rbtnDecVih" runat="server" Style="margin: 10px 0px" Text="Generar Consentimiento VIH"
					OnClientClicking="CheckBeforeSend" OnClick="rbtnDecVih_Click">
				</telerik:RadButton>
				<telerik:RadButton ID="rbtnDecVenPun" runat="server" Style="margin: 10px 0px; float: right"
					Text="Generar Consentimiento Venopuncion" OnClientClicking="CheckBeforeSend"
					OnClick="rbtnDecVenPun_Click">
				</telerik:RadButton>
			</div>
		</div>
		<div style="display: none;">
			<asp:Button ID="rbtnLoad" runat="server" Text="Cargar imagen" OnClick="rbtnLoad_Click" />
		</div>
	</div>
	<div style="display: none;">
		<telerik:RadTextBox ID="rtbRspAjax" runat="server" />
		<div class="col-lg-6 col-md-6">
			Firma del paciente
			<textarea id="sigStringData" name="sigStringData" rows="10" cols="50"></textarea>
			<textarea id="sigImageDataPac" name="sigImageDataPac" runat="server" clientidmode="Static"
				rows="10" cols="50">Base64 String: </textarea>
			<img id="imgResultado" src="" alt="firma del paciente" height="100" width="500" style="border: 2 solid #AABBCC;"
				runat="server" clientidmode="Static" />
			<input type="hidden" name="bioSigData" id="bioSigData" />
			<input type="hidden" name="sigImgData" id="sigImgData" />
			<asp:TextBox ID="hfBase64Pac" runat="server" Value="" />
		</div>
		<div class="col-lg-6 col-md-6">
			Firma del testigo
			<textarea id="sigStringDataWit" name="sigStringDataWit" rows="10" cols="50"></textarea>
			<textarea id="sigImageDataWit" name="sigImageDataWit" runat="server" clientidmode="Static"
				rows="10" cols="50">Base64 String: </textarea>
			<img id="imgResultadoWit" src="" alt="firma del Testigo" height="100" width="500"
				style="border: 2 solid #AABBCC;" runat="server" clientidmode="Static" />
			<input type="hidden" name="bioSigDataWit" id="bioSigDataWit" />
			<input type="hidden" name="sigImgDataWit" id="sigImgDataWit" />
			<asp:TextBox ID="hfBase64Wit" runat="server" Value="" />
		</div>
		<asp:HiddenField ID="hfTipoCarga" runat="server" />
	</div>
	</form>
	<script id="manejoLoad" type="text/javascript">

		function actualizarPadre()
		{
			var idHist = document.getElementById("<%=this.hfIdHist.ClientID%>");
			var id = idHist.value;
			window.opener.location = "/Recepcion.aspx?IdHist=" + id;
		}

		function SigImageCallback(str)
		{
			var id = document.getElementById('sigImageDataPac').id;

			if (tipCarga.value == 2)
			{
				id = document.getElementById('sigImageDataWit').id;
			}

			document.getElementById(id).value = str;
		}
		var tipCarga = document.getElementById("<%=hfTipoCarga.ClientID%>");
		var btnLoadSign = document.getElementById("<%=rbtnLoad.ClientID%>");
		var bs64Pac = document.getElementById("<%=hfBase64Pac.ClientID%>");
		var bs64Wit = document.getElementById("<%=hfBase64Wit.ClientID%>");
	</script>
</body>
</html>
