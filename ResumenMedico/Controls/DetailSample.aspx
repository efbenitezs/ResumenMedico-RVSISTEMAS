<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailSample.aspx.cs" Inherits="ResumenMedico.Controls.DetailSample" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Detalle de muestra de laboratorio</title>
        <link href="../Content/Site.css" type="text/css" rel="Stylesheet" />
        <link href="../Content/bootstrap.css?1" type="text/css" rel="Stylesheet" />
    </head>
    <body>
        <form id="form1" runat="server">
            <telerik:RadScriptManager ID="rsm" runat="server" />
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                <asp:Label ID="lblTipoMuestra" runat="server" CssClass="titulo"></asp:Label>
            </div>
            <div class="contenedor" id="divUro" runat="server">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="contenedor">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                        <h4>Examen Fisico</h4>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>Olor:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblOlor" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>Color:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblColor" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>Aspecto:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblAspecto" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>                
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="contenedor">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                        <h4>Examen Microquimico</h4>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>GLU:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblGLU" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>BIL:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblBIL" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>CET:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblCET" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>DEN:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblDEN" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>PH:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblPH" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>PRO:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblPRO" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>URO:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblURO" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>NIT:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblNIT" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>SAN:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblSAN" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>LEU:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblLEU" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="contenedor">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                        <h4>Examen Microscopico</h4>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>Leucocitos por campo:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblLeuco" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>Hematies por campo:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblHematies" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>Celulas altas por campo:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblCelAltas" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>Celulas bajas por campo:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblCelBajas" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>Moco:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblMoco" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>Bacterias:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblBacteria" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>Cilindros:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblCilindros" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>Cristales:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblCristales" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>Levaduras:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblLevaduras" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <h5>Otros:</h5>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblOtros" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
            <div class="contenedor" id="divMuestras" runat="server">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblAviso" runat="server" Visible="false"></asp:Label>
                    </div>
                </div>
                <div class="row" id="divResultado" runat="server">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        Resultado
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <asp:Label ID="lblResultado" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="row" id="divValor" runat="server">
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        valor
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <asp:Label ID="lblValor" runat="server"></asp:Label>&nbsp;<asp:Label ID="lblUnidadesValor" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                <h4><b>Comentarios</b></h4>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <telerik:RadTextBox ID="rtxtCommentario" runat="server" TextMode="MultiLine" Rows="5" Width="95%" Enabled="false"></telerik:RadTextBox>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                <h4><b>Archivos Adjuntos</b></h4>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                <telerik:RadGrid ID="rgArchivos" runat="server"  AutoGenerateColumns="false" onneeddatasource="rgArchivos_NeedDataSource">

                    <PagerStyle AlwaysVisible="true" />

                    <MasterTableView DataKeyNames="ID">

                        <Columns>

                            <telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:AbrirArchivo({0});" Text="Abrir archivo">
                                <ItemStyle Width="10%" />
                            </telerik:GridHyperLinkColumn>

                            <telerik:GridBoundColumn HeaderText="Nombre Adjunto" DataField="NOMBRE_ADJUNTO" UniqueName="Adjunto" DataType="System.String">
                                <ItemStyle Width="60%" />
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor" DataType="System.DateTime">
                                <ItemStyle Width="15%" />
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn HeaderText="Usuario que adjunto" DataField="CREACION" UniqueName="Usuario" DataType="System.String">
                                <ItemStyle Width="15%" />
                            </telerik:GridBoundColumn>

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </form>

		<script src="../Scripts/jquery-3.5.1.min" type="text/javascript"></script>
		<script src="../Scripts/AppScripts.js" type="text/javascript"></script>
		<script type="text/javascript">
			function ReloadParent()
			{
				window.opener.location.reload(false);
				window.close();
			}
		</script>

	</body>
</html>
