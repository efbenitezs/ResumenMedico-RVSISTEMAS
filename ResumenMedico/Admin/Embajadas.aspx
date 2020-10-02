<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
	CodeBehind="Embajadas.aspx.cs" Inherits="ResumenMedico.Admin.Embajadas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="titulo">
		Administración de Embajadas
	</div>
	<div>
		<telerik:radajaxmanager id="ram" runat="server" updatepanelsrendermode="Block">
            <ClientEvents OnResponseEnd="responseEnd" />
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="gvEmbajadas">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="gvEmbajadas" LoadingPanelID="ralpImage" />
                        <telerik:AjaxUpdatedControl ControlID="Validator" />
                        <telerik:AjaxUpdatedControl ControlID="erroresCarga" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:radajaxmanager>
		<telerik:radajaxloadingpanel id="ralpImage" runat="server" backgroundposition="Center"
			horizontalalign="Center">
        </telerik:radajaxloadingpanel>
		<div class="ocultos">
			<telerik:radtextbox id="erroresCarga" clientidmode="Static" runat="server" onchange="mostrar(this)">
            </telerik:radtextbox>
			<telerik:radtextbox id="tbxhidden" clientidmode="Static" runat="server" onchange="detectar(this)">
            </telerik:radtextbox>
			<asp:RegularExpressionValidator ID="Validator" runat="server" Display="Dynamic" ErrorMessage="Hay errores en los datos que quiere enviar"
				ValidationExpression="Correcto" ControlToValidate="tbxhidden">
			</asp:RegularExpressionValidator>
		</div>
		<telerik:radgrid id="gvEmbajadas" runat="server" autogeneratecolumns="false" allowsorting="true"
			onneeddatasource="gvEmbajadas_NeedDataSource" ondeletecommand="gvEmbajadas_DeleteCommand"
			oninsertcommand="gvEmbajadas_InsertCommand" onupdatecommand="gvEmbajadas_UpdateCommand"
			pagesize="15" font-names="Verdana" font-size="12px" font-bold="True">
            <ValidationSettings CommandsToValidate="PerformInsert,Update" ValidationGroup="Embajada" />
            <PagerStyle AlwaysVisible="true" />
            <ClientSettings>
                <Scrolling UseStaticHeaders="true" />
            </ClientSettings>
            <MasterTableView CommandItemDisplay="Top" DataKeyNames="ID" EditItemStyle-CssClass="h2">
                <CommandItemSettings AddNewRecordText="Agregar Nueva Embajada" ShowRefreshButton="false" />
                <EditFormSettings>
                    <EditColumn InsertText="Agregar" CancelText="Cancelar" UpdateText="Actualizar" ButtonType="PushButton">
                    </EditColumn>
                </EditFormSettings>
                <Columns>
                    <telerik:GridButtonColumn UniqueName="EditColumn" ButtonType="ImageButton" CommandName="Edit">
                    </telerik:GridButtonColumn>
                    <telerik:GridBoundColumn UniqueName="NombreEmbajada" HeaderText="Nombre embajada"
                        SortExpression="NombreEmbajada" DataField="NOMBRE">
                        <ColumnValidationSettings EnableRequiredFieldValidation="true">
                            <RequiredFieldValidator ValidationGroup="Embajada"></RequiredFieldValidator>
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn UniqueName="Activo" HeaderText="Activo?" SortExpression="Activo"
                        DataField="ACTIVO">
                    </telerik:GridCheckBoxColumn>
                </Columns>
            </MasterTableView>
        </telerik:radgrid>
	</div>
	<script type="text/javascript">
        function responseEnd(sender, eventArgs) {
            var origen = eventArgs.get_eventTarget();
            var arbol = origen.split("$");
            var maxArbol = arbol.length - 1;

            var texto = arbol[maxArbol];
            var hid2 = document.getElementById("erroresCarga");

            var longitud = (hid2.value).length;
            if (longitud > 0) {
                errorCheck(hid2);
                hid2.value = "";
            }
        }
	</script>
</asp:Content>