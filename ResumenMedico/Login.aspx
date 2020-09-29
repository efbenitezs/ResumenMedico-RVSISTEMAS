<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ResumenMedico.Login" %>

<!DOCTYPE html>
<html lang="es">
    <head id="Head1" runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sistema de Informacion Medica - Inmigration Medical</title>
		<telerik:RadCodeBlock runat="server">
			<%:Styles.Render("~/bundles/css") %>
		</telerik:RadCodeBlock>

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
        <script type="text/javascript">
            function AbrirCambio() 
            {
                window.open("CambioPass.aspx", "ChngPwrd", "menubar=1,resizable=1,width=350,height=250");
            }
        </script>
		<telerik:RadCodeBlock runat="server">
			<%:Scripts.Render("~/bundles/modernizr") %>
		</telerik:RadCodeBlock>
    </head>
    <body>
        <form id="form1" runat="server">
            <telerik:RadScriptManager ID="rsm" runat="server" />
            <div class="ocultos">
                <asp:ValidationSummary ID="vsErrors" runat="server" ValidationGroup="Ingreso" ShowMessageBox="true" ShowSummary="false" HeaderText="Errores al iniciar" DisplayMode="BulletList" />
            </div>
            <div class="row" style="padding: 5px">
                <div class="loginContainner">
                    <div style="height: 170px;">
                        <div style="margin: 0 auto; margin-bottom: 55px; width: 310px">
                            <img src="/ResumenMedicoPublicado/Resources/logo.png" class="img-responsive" alt="IMMIMED" style="width: 300px" />
                        </div>
                        <div class="form-group">
                            <div class="label">
                                Usuario:
                            </div>
                            <div>
                                <telerik:RadTextBox ID="rtxtUser" runat="server" Width="100%" EmptyMessage="[Usuario]" />
                                <asp:RequiredFieldValidator ID="rfvUsr" runat="server" ControlToValidate="rtxtUser" Display="None" ErrorMessage="El nombre de usuario no puede ser vacio" ValidationGroup="Ingreso"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="label">
                                Contraseña:
                            </div>
                            <div>
                                <telerik:RadTextBox ID="rtxtPwd" runat="server" TextMode="Password" Width="100%" EmptyMessage="[Contraseña]" />
                                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="rtxtPwd" ErrorMessage="El campo contraseña no puede ser vacio" ValidationGroup="Ingreso" Display="None" />
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

		<telerik:RadCodeBlock runat="server">
			<%: Scripts.Render("~/bundles/WebFormsJs") %>
			<%: Scripts.Render("~/bundles/MsAjaxJs") %>
			<%: Scripts.Render("~/bundles/ResumenMedicoJs") %>
		</telerik:RadCodeBlock>
	</body>
</html>
