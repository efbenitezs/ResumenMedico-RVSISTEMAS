<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargaArchivo.aspx.cs" Inherits="ResumenMedico.Controls.CargaArchivo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Carga Archivos</title>
	<link href="../Content/Site.css" type="text/css" rel="Stylesheet" />
	<script type="text/jscript" id="manejocierrre">
            function CerrarVentana()
            {
                window.opener.document.location.reload();
                window.close();
            }

            function CargarPadre(Tipo, muestra)
            {
                alert("Archivo cargado correctamente");
                window.opener.document.location.reload();
                window.close();
            }
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<telerik:RadScriptManager ID="rsm" runat="server"></telerik:RadScriptManager>
			<br />
			<table>
				<tr>
					<td colspan="3">
						<asp:ValidationSummary ID="vserr" runat="server" ShowMessageBox="true" DisplayMode="BulletList" HeaderText="Incompletos"
							ValidationGroup="FileUplo" />
					</td>
				</tr>
				<tr>
					<td>Nombre para el archivo
					</td>
					<td>&nbsp;</td>
					<td>
						<telerik:RadTextBox ID="rtxtNameFile" runat="server" MaxLength="100" Width="300"></telerik:RadTextBox>
						<asp:RequiredFieldValidator ID="rfvNameFile" runat="server" ControlToValidate="rtxtNameFile" ErrorMessage="Debe indicar un nombre para el archivo" ValidationGroup="FileUplo"></asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td>Archivo
					</td>
					<td>&nbsp;</td>
					<td>
						<telerik:RadAsyncUpload ID="rauFile" runat="server" MaxFileInputsCount="1">
							<Localization Select="Seleccionar" Remove="Quitar" Cancel="Cancelar" />
						</telerik:RadAsyncUpload>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<telerik:RadButton ID="rbtnCargarArchivo" runat="server" Text="Cargar Archivo" ValidationGroup="FileUplo" CausesValidation="true" UseSubmitBehavior="true" OnClick="rbtnCargarArchivo_Click"></telerik:RadButton>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>