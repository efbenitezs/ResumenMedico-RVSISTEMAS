<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderPrint.aspx.cs" Inherits="ResumenMedico.Consultorio.OrderPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<link href="/Styles/bootstrap.css" type="text/css" rel="Stylesheet" />
	<script type="text/javascript">
            function Imprimir(sender, e) {
                var btnPrnt = document.getElementById("rbtnImp");
                btnPrnt.style.visibility = "hidden";
                window.print();
                btnPrnt.style.visibility = "visible";
            }
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<telerik:RadScriptManager ID="ram" runat="server"></telerik:RadScriptManager>
		<div style="margin: 0 auto; background-color: White;">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
				&nbsp;&nbsp;&nbsp;&nbsp;<%=DateTime.Now.ToString("yyyy-MM-dd")%>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">&nbsp;</div>
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
				<b>Ref:
					<asp:Label ID="lblNomPac" runat="server"></asp:Label></b>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">&nbsp;</div>
			<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
				Por motivos de migración a
				<asp:Label ID="lblEmbajada" runat="server"></asp:Label>
				se requiere concepto de
				<asp:Label ID="lblMedtrantante" runat="server"></asp:Label>
				que indique:
			</div>
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">&nbsp;</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<center>
					<asp:Label ID="lblinfoOrden" runat="server"></asp:Label></center>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>

			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<center>
					<b>Dr Paul Vaillancourt</b><br />
					Registro 9628.93 Ministerio de Salud<br />
					79439692 Sec Dist. Salud
				</center>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<center>
					Carrera 11 # 94a - 25, piso 4, Bogotá, Colombia<br />
					Tel (57)(1)6356312, 6356402,6356379<br />
					<b style="text-decoration: underline;">paulvaillancourt@cable.net.co</b>
				</center>
			</div>

			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<center>
					<telerik:RadButton ID="rbtnImp" runat="server" Text="imprimir" OnClientClicking="Imprimir"></telerik:RadButton>
				</center>
			</div>
		</div>
	</form>
</body>
</html>