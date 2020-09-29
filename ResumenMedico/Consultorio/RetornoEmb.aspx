<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" 
CodeBehind="RetornoEmb.aspx.cs" Inherits="ResumenMedico.Consultorio.RetornoEmb" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager ID="ram" runat="server" UpdatePanelsRenderMode="Block" DefaultLoadingPanelID="ralpImage">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="rgData">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rgData" LoadingPanelID="ralpImage" />
				</UpdatedControls>
			</telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="rcbxEmbajada">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rcbxTipoVisa" />
                </UpdatedControls>
            </telerik:AjaxSetting>
           
		</AjaxSettings>
	</telerik:RadAjaxManager>
	<telerik:RadAjaxLoadingPanel ID="ralpImage" runat="server"  />
    <div class="ocultos">
		<asp:ValidationSummary ID="vsErrors" runat="server" ValidationGroup="Paciente,Retorno" ShowMessageBox="true" DisplayMode="BulletList" HeaderText="Al validar la informacion se han detectado los siguientes inconvenientes:"
			ShowSummary="false" />
		<asp:HiddenField ID="hfRutImg" runat="server" />
		<asp:HiddenField ID="hfIdHist" runat="server" />
	</div>
	<div class="titulo">
		Busqueda de paciente para reapertura de historia por retorno desde embajada
	</div>
	<div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlPair">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
					Embajada
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
					<telerik:RadComboBox ID="rcbxEmbajada" runat="server" Width="90%" Filter="Contains" AutoPostBack="true" onselectedindexchanged="rcbxEmbajada_SelectedIndexChanged" CausesValidation="false"/>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlPair">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
					Tipo Código
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
					<telerik:RadComboBox ID="rcbxTipoVisa" runat="server" Width="90%" Filter="Contains"/>
					<asp:RequiredFieldValidator ID="rfvTipoVisa" runat="server" ControlToValidate="rcbxTipoVisa" InitialValue="[Seleccione]" ValidationGroup="Paciente" ErrorMessage="Debe especificar el tipo de código" Display="None" />
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlPair">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
					Código
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
					<telerik:RadTextBox ID="rtxtNumVisa" runat="server" MaxLength="50" Width="90%" />
					<asp:RequiredFieldValidator ID="rfvNumVisa" runat="server" ControlToValidate="rtxtNumVisa" ValidationGroup="Paciente" ErrorMessage="Debe especificar el código" Display="None" />
				</div>
			</div>
		</div>
        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 controlRow">&nbsp;</div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 controlRow">
            <telerik:RadButton ID="rbtnConsultar" runat="server" Text="Buscar historia paciente" CausesValidation="true" ValidationGroup="Paciente" onclick="rbtnConsultar_Click"></telerik:RadButton>
        </div>
        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 controlRow">&nbsp;</div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">&nbsp;</div>
        <asp:Panel ID="pnlInfoPac" runat="server" CssClass="col-lg-12 col-md-12 col-sm-12 col-xs-12" Visible="false">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlHousing" style="padding: 1px">
                <div style="border: 3px solid #000; border-radius: 10px; background-color: rgba(0,0,0, 0.25);">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                        <asp:Image ID="imgPac" runat="server" Width="99%" Height="230" BackColor="Transparent" BorderStyle="None" CssClass="img-rounded" ></asp:Image>
                    </div>

                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                            <b>Paciente</b>&nbsp;
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
                        <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12">
                            <b>Fecha Ingreso</b>&nbsp;
                        </div>

                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                            <asp:Label ID="lblPaciente" runat="server"></asp:Label>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>

                        <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="lblFecIng" runat="server"></asp:Label>
                        </div>

                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <b>Tipo y Número de Documento</b>&nbsp;
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                            <asp:Label ID="lblTipDoc" runat="server"></asp:Label>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>

                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                            <asp:Label ID="lblNumDoc" runat="server"></asp:Label>
                        </div>
                                        
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <b>Tipo y Código de Embajada</b>&nbsp;
                        </div>
                                        
                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                            <asp:Label ID="lblTipoCod" runat="server"></asp:Label>
                        </div>
                                        
                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>

                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                            <asp:Label ID="lblCodSol" runat="server"></asp:Label>
                        </div>
                                        
                        <div class="spacio">&nbsp;</div>

                        <div class="spacio">&nbsp;</div>

                        <div class="spacio">&nbsp;</div>

                    </div>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        
                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">&nbsp;</div>

                        <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                            <telerik:RadButton ID="rbtnShowComment" runat="server" OnClientClicking="ValidarRetorno" Text="Retornar historia del paciente"></telerik:RadButton>
                        </div>

                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">&nbsp;</div>
                        
                    </div>

                </div>
            </div>
        </asp:Panel>

        <telerik:RadWindow ID="rwJustification" runat="server" Modal="true" Style="z-index: 100001;" Width="460px" Height="250px" Behaviors="Close" >
        
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            Indique las razones para el retorno de la historia
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <telerik:RadTextBox ID="rtxtComentarioRetorno" runat="server" TextMode="MultiLine" Rows="6" Width="100%"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="rfvComentarioRetorno" runat="server" ControlToValidate="rtxtComentarioRetorno" Text="*" ErrorMessage="Debe indicar una justificacion del regreso del paciente" ValidationGroup="Retorno"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <telerik:RadButton ID="rbtnRetornar" runat="server" CausesValidation="true" UseSubmitBehavior="false" Text="Retornar paciente" ValidationGroup="Retorno" OnClick="rbtnRetornar_Click"></telerik:RadButton>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </telerik:RadWindow>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="PageScriptsHolder" runat="server">
    <script type="text/javascript">
        function ValidarRetorno(sender, e) {

            if (confirm("Esta seguro de retornar al paciente al retornarlo debera dar una justificacion y este se habilitara para reproceso")) 
            {
                //var oWnd = $find("<rwJustification.ClientID>");
                //oWnd.show();
            } 
            e.set_cancel(true);
        }
    </script>
</asp:Content>
