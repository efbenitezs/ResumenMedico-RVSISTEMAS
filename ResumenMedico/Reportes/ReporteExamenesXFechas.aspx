<%@ Page Title="" Language="C#" MasterPageFile="~/Reportes/Reportes.master" AutoEventWireup="true"
	CodeBehind="ReporteExamenesXFechas.aspx.cs" Inherits="ResumenMedico.Reportes.ReporteExamenesXFechas" %>

<%@ Register Assembly="Telerik.ReportViewer.WebForms, Version=9.1.15.624, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
	Namespace="Telerik.ReportViewer.WebForms" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHeadMaster" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBodyMaster" runat="server">
	<telerik:radajaxmanager id="ram" runat="server" updatepanelsrendermode="Block">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="btnConsultar">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="examenesXFechasXTipo" LoadingPanelID="ralpImage" />
				</UpdatedControls>
			</telerik:AjaxSetting>
		</AjaxSettings>
	</telerik:radajaxmanager>
	<div class="titulo">
		Generar reporte de examenes
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
					Fecha inicial del reporte:
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
					<telerik:raddatepicker id="FechaInicial" runat="server" width="90%">
						<Calendar ID="cFechaInicial" runat="server" FirstDayOfWeek="Sunday" />
						<DateInput ID="diFechaInicial" runat="server" DisplayDateFormat="yyyy-MM-dd" ReadOnly="true" />
					</telerik:raddatepicker>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
					Fecha final del reporte:
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
					<telerik:raddatepicker id="FechaFinal" runat="server" width="90%">
						<Calendar ID="cFechaFinal" runat="server" FirstDayOfWeek="Sunday" />
						<DateInput ID="diFechaFinal" runat="server" DisplayDateFormat="yyyy-MM-dd" ReadOnly="true" />
					</telerik:raddatepicker>
				</div>
			</div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
			<div style="width: 120px; margin: 0 auto">
				<telerik:radbutton runat="server" id="btnConsultar" text="Consultar" onclick="btnConsultar_Click" />
			</div>
		</div>
	</div>
	<div id="contenedorReporte" class="row">
		<telerik:reportviewer id="examenesXFechasXTipo" runat="server" height="1250px" progresstext="Obteniendo informacion de reporte..."
			viewmode="PrintPreview" width="100%">
			<resources currentpagetooltip="Pagina actual" documentmaptooltip="Ocultar mapa de documento"
				exportbuttontext="Exportar" exportselectformattext="Seleccionar formato para exportar"
				exporttooltip="Exportar" firstpagetooltip="Primera página" labelof="de" lastpagetooltip="Ultima página"
				missingreportsource="No hya una fuente especificada para el reporte" navigatebacktooltip="Atras"
				navigateforwardtooltip="Adelante" nextpagetooltip="Página siguiente" nopagetodisplay="No hay página para mostrar"
				parameterstooltip="Ocultar área de parametros|mostrar area de parametros" previouspagetooltip="Página anterior"
				printtooltip="Imprimir" processingreportmessage="Generando reporte" refreshtooltip="Actualizar"
				reportparametersfalsevaluelabel="Falso" reportparametersinputdataerror="Parametros invalidos o ausentes"
				reportparametersinvalidvaluetext="Valor invalido" reportparametersnovaluetext="Valor requerido"
				reportparametersnulltext="[Vacío]" reportparameterspreviewbuttontext="Vista preliminar"
				reportparametersselectalltext="&lt;Seleccionar todos&gt;" reportparametersselectavaluetext="&lt;Seleccione un valor&gt;"
				reportparameterstruevaluelabel="Verdadero" sessionhasexpirederror="La sesion ha caducado"
				sessionhasexpiredmessage="Por favor, actualice la pagina o presione F5" togglepagelayouttooltip="Cambiar a vista interactiva|Cambiar a vista de impresion"
				zoomtopagewidth="Ancho de la pagina" zoomtowholepage="Pagina completa">
			</resources>
		</telerik:reportviewer>
	</div>
</asp:Content>