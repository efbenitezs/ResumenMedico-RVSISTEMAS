<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="ResumenMedico.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="row">

		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<div class="texto_menu" onclick="menu(1);">
				<span class="botonLink">Ingreso Paciente</span>
			</div>
			<div class="texto_menu" onclick='menu(3);'>
				<span class="botonLink">Laboratorio</span>
			</div>
			<div class="texto_menu" onclick="menu(5);">
				<span class="botonLink">Examen Médico</span>
			</div>
			<div class="texto_menu" onclick='menu(8);'>
				<a class="botonLink">Listado General de Pacientes</a>
			</div>
			<div class="texto_menu" onclick='menu(9);'>
				<span class="botonLink">Retornar Pacientes</span>
			</div>
		</div>
		<div class=" col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<div class="img" style="display: flex; align-items: center;">
				<img src="/ResumenMedicoPublicado/Resources/caduceu-símbolo-da-medicina-u7735.png" class="img-responsive"
					alt="" style="margin: auto auto;" />
			</div>
		</div>
		<div class=" col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<div class="texto_menu" onclick="menu(2);">
				<span class="botonLink">Administración</span>
			</div>
			<div class="texto_menu" onclick="menu(4);">
				<span class="botonLink">Rayos X</span>
			</div>
			<div class="texto_menu" onclick='menu(6);'>
				<span class="botonLink">Cerrar historias</span>
			</div>
			<div class="texto_menu" onclick='menu(7);'>
				<span class="botonLink">Reporte Muestras Laboratorio por Fechas</span>
			</div>
		</div>

	</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageScriptsHolder" runat="server">
	<script type="text/javascript">
		function menu(par)
		{
			var appRoot = "<%=ResolveUrl("~/")%>";

			switch (par)
			{
				case 1:
					window.location = appRoot + "/Consultorio/Recepcion.aspx";
					break;
				case 2:
					window.location = appRoot + "/Admin/Usuarios.aspx";
					break;
				case 3: // Pendientes Laboratorio
					window.location = appRoot + "/Pendientes.aspx?T=1";
					//window.location = "Reportes/ListaPacientesPendLab.aspx";
					break;
				case 4: //Pendientes Radiologia
					window.location = appRoot + "/Pendientes.aspx?T=2";
					//window.location = "Reportes/ListaPacientesPendRad.aspx";
					break;
				case 5: //pendientes Medicina
					window.location = "/Pendientes.aspx?T=3";
					//window.location = "Reportes/ListaPacientesPendMed.aspx";
					break;
				case 6:
					window.location = appRoot + "/Consultorio/Cierre.aspx";
					break;
				case 7:
					window.location = appRoot + "/Reportes/ReporteExamenesXFechas.aspx";
					break;
				case 8:
					window.location = appRoot + "/Reportes/ListaHistorias.aspx";
					break;
				case 9:
					window.location = appRoot + "/Consultorio/RetornoEmb.aspx";
					break;
			}
		}
	</script>
</asp:Content>
