<%@ Page Title="" Language="C#" MasterPageFile="~/Reportes/Reportes.master" AutoEventWireup="true"
	CodeBehind="ReporteExamenes.aspx.cs" Inherits="ResumenMedico.Reportes.ReporteExamenes" %>

<%@ Register Assembly="Telerik.ReportViewer.WebForms, Version=9.1.15.624, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
	Namespace="Telerik.ReportViewer.WebForms" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHeadMaster" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBodyMaster" runat="server">
	<div class="titulo">
		Generar reporte de examenes
	</div>
	<div id="contenedorParametros">
		<div class="">
			Fecha inicial del reporte:
		</div>
		<div class="">
			<telerik:RadDatePicker ID="FechaInicial" runat="server" />
		</div>
		<div class="">
			Fecha final del reporte:
		</div>
		<div class="">
			<telerik:RadDatePicker ID="FechaFinal" runat="server" />
		</div>
		<div class="">
			<telerik:RadButton runat="server" ID="btnConsultar" Text="Consultar" OnClick="btnConsultar_Click" />
		</div>
	</div>
	<div id="contenedorReporte">
		<telerik:ReportViewer ID="examenesXFechas" runat="server" Height="1250px" ProgressText="Obteniendo informacion de reporte..."
			ViewMode="PrintPreview" Width="100%">
			<Resources CurrentPageToolTip="Pagina actual" 
				DocumentMapToolTip="Ocultar mapa de documento" ExportButtonText="Exportar" 
				ExportSelectFormatText="Seleccionar formato para exportar" 
				ExportToolTip="Exportar" FirstPageToolTip="Primera página" LabelOf="de" 
				LastPageToolTip="Ultima página" 
				MissingReportSource="No hya una fuente especificada para el reporte" 
				NavigateBackToolTip="Atras" NavigateForwardToolTip="Adelante" 
				NextPageToolTip="Página siguiente" NoPageToDisplay="No hay página para mostrar" 
				ParametersToolTip="Ocultar área de parametros|mostrar area de parametros" 
				PreviousPageToolTip="Página anterior" PrintToolTip="Imprimir" 
				ProcessingReportMessage="Generando reporte" RefreshToolTip="Actualizar" 
				ReportParametersFalseValueLabel="Falso" 
				ReportParametersInputDataError="Parametros invalidos o ausentes" 
				ReportParametersInvalidValueText="Valor invalido" 
				ReportParametersNoValueText="Valor requerido" 
				ReportParametersNullText="[Vacío]" 
				ReportParametersPreviewButtonText="Vista preliminar" 
				ReportParametersSelectAllText="&lt;Seleccionar todos&gt;" 
				ReportParametersSelectAValueText="&lt;Seleccione un valor&gt;" 
				ReportParametersTrueValueLabel="Verdadero" 
				SessionHasExpiredError="La sesion ha caducado" 
				SessionHasExpiredMessage="Por favor, actualice la pagina o presione F5" 
				TogglePageLayoutToolTip="Cambiar a vista interactiva|Cambiar a vista de impresion" 
				ZoomToPageWidth="Ancho de la pagina" ZoomToWholePage="Pagina completa">
			</Resources>
		</telerik:ReportViewer>
	</div>
</asp:Content>
