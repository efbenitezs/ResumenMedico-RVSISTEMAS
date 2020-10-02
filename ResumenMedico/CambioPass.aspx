<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambioPass.aspx.cs" Inherits="ResumenMedico.CambioPass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Sistema de Informacion Medica - Inmigration Medical</title>
	<link href="Styles/bootstrap.css?1" type="text/css" rel="Stylesheet" />
	<link href="Styles/global.css?1" type="text/css" rel="Stylesheet" />
	<style type="text/css">
		.loginContainner
		{
			width: 355px;
			height: 330px;
			margin: 80px auto;
			padding: 10px;
			-ms-border-radius: 10px;
			-webkit-border-radius: 10px;
			-moz-border-radius: 10px;
			border-radius: 10px;
			box-shadow: 0 4px 30px 0 rgba(126, 126, 126, 0.2), 0 6px 30px 0 rgba(126, 126, 126, 0.2), 0 8px 30px 0 rgba(126, 126, 126, 0.2);
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">
		<telerik:RadScriptManager ID="rsm" runat="server" />
		<div class="ocultos">
			<asp:ValidationSummary ID="vsErrors" runat="server" ValidationGroup="Ingreso" ShowMessageBox="true" ShowSummary="false" HeaderText="Errores al iniciar" DisplayMode="BulletList" />
		</div>
		<div class="row" style="padding: 5px">
			<div class="loginContainner">
				<div style="height: 170px; margin-top: 55px">
					<div style="margin: 0 auto; width: 310px">
						<img src="Resources/logo.png" class="img-responsive" alt="IMMIMED" style="width: 300px" />
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlPair controlRow">
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlHousing controlSide">
							Usuario:
						</div>
						<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtUser" runat="server" Width="90%" EmptyMessage="[Usuario]" />
							<asp:RequiredFieldValidator ID="rfvUsr" runat="server" ControlToValidate="rtxtUser" Display="None" ErrorMessage="El nombre de usuario no puede ser vacio" ValidationGroup="Ingreso"></asp:RequiredFieldValidator>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlPair controlRow">
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlHousing controlSide">
							Nueva Contraseña:
						</div>
						<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtPwd" runat="server" TextMode="Password" Width="90%" EmptyMessage="[Contraseña]" />
							<asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="rtxtPwd" ErrorMessage="El campo contraseña no puede ser vacio" ValidationGroup="Ingreso" Display="None" />
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlPair controlRow">
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlHousing controlSide">
							Confirme Nueva Contraseña:
						</div>
						<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtPwd2" runat="server" TextMode="Password" Width="90%" EmptyMessage="[Contraseña]" />
							<asp:RequiredFieldValidator ID="rfvPwd2" runat="server" ControlToValidate="rtxtPwd2" ErrorMessage="Debe confirmar el campo contraseña" ValidationGroup="Ingreso" Display="None" />
							<asp:CompareValidator ID="cvPwd" runat="server" ControlToValidate="rtxtPwd2" ControlToCompare="rtxtPwd" ErrorMessage="Las contraseñas no coinciden" ValidationGroup="Ingreso" Display="None" Operator="Equal"></asp:CompareValidator>
						</div>
					</div>
					<div style="width: 100%">
						<div style="width: 70px; margin: 0 auto">
							<telerik:RadButton ID="rbtnIngresar" runat="server" Text="Ingresar" OnClick="rbtnIngresar_Click" CausesValidation="True" ValidationGroup="Ingreso" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>