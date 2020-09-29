<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DwldFil.aspx.cs" Inherits="ResumenMedico.Controls.DwldFil" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Descarga Archivo</title>
        <link href="../Styles/global.css" type="text/css" rel="Stylesheet" />
        <script type="text/jscript" id="manejocierrre">
            function CerrarVentana() 
            {
                window.opener.document.location.reload();
                window.close();
            }
            function FileNotFound() 
            {
                alert('El archivo solicitado no ha sido encontrado por favor verifique e intentelo nuevamente')
            }
        </script>
    </head>
    <body>
        <form id="form1" runat="server">
            <div>
    
            </div>
        </form>
    </body>
</html>
