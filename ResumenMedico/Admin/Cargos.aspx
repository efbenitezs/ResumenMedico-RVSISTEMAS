<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Cargos.aspx.cs" Inherits="ResumenMedico.Admin.Cargos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo">
        Administración de Cargos
    </div>
    <div>
        <telerik:RadAjaxManager ID="ram" runat="server" UpdatePanelsRenderMode="Block">
            <ClientEvents OnResponseEnd="responseEnd" />
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="gvCargos">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="gvCargos" LoadingPanelID="ralpImage" />
                        <telerik:AjaxUpdatedControl ControlID="Validator" />
                        <telerik:AjaxUpdatedControl ControlID="erroresCarga" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="ralpImage" runat="server" BackgroundPosition="Center"
            HorizontalAlign="Center">
        </telerik:RadAjaxLoadingPanel>
        <div class="ocultos">
            <telerik:RadTextBox ID="erroresCarga" ClientIDMode="Static" runat="server" onchange="mostrar(this)">
            </telerik:RadTextBox>
            <telerik:RadTextBox ID="tbxhidden" ClientIDMode="Static" runat="server" onchange="detectar(this)">
            </telerik:RadTextBox>
            <asp:RegularExpressionValidator ID="Validator" runat="server" Display="Dynamic" ErrorMessage="Hay errores en los datos que quiere enviar"
                ValidationExpression="Correcto" ControlToValidate="tbxhidden">
            </asp:RegularExpressionValidator>
        </div>
        <telerik:RadGrid ID="gvCargos" runat="server" AutoGenerateColumns="false" AllowSorting="true"
            OnNeedDataSource="gvCargos_NeedDataSource" OnDeleteCommand="gvCargos_DeleteCommand"
            OnInsertCommand="gvCargos_InsertCommand" OnUpdateCommand="gvCargos_UpdateCommand"
            PageSize="15" Font-Names="Verdana" Font-Size="12px" Font-Bold="True">

            <ValidationSettings CommandsToValidate="PerformInsert,Update" ValidationGroup="Cargos" />
            <PagerStyle AlwaysVisible="true" />
            <ClientSettings>
                <Scrolling UseStaticHeaders="true" />
            </ClientSettings>
            <GroupPanel Font-Names="Verdana" Font-Size="12px">
                <PanelItemsStyle Font-Names="Verdana" Font-Size="12px"  />
            </GroupPanel>
            <MasterTableView CommandItemDisplay="Top" DataKeyNames="ID" EditItemStyle-CssClass="h2">
                <CommandItemSettings AddNewRecordText="Agregar Nuevo Cargo" ShowRefreshButton="false" />
                <EditFormSettings>
                    <EditColumn InsertText="Agregar" CancelText="Cancelar" UpdateText="Actualizar" ButtonType="PushButton">
                    </EditColumn>
                </EditFormSettings>
                <Columns>
                    <telerik:GridButtonColumn UniqueName="EditColumn" ButtonType="ImageButton" CommandName="Edit">
                    </telerik:GridButtonColumn>
                    <telerik:GridBoundColumn UniqueName="NombreCargo" HeaderText="Nombre Cargo" SortExpression="NombreCargo"
                        DataField="NOMBRE_CARGO" >
                        <ColumnValidationSettings EnableRequiredFieldValidation="true">
                            <RequiredFieldValidator ValidationGroup="Cargo"></RequiredFieldValidator>
                        </ColumnValidationSettings>
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn UniqueName="Activo" HeaderText="Activo?" SortExpression="Activo"
                        DataField="ACTIVO">
                    </telerik:GridCheckBoxColumn>
                </Columns>
                <PagerStyle AlwaysVisible="True"></PagerStyle>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="PageScriptsHolder" runat="server">
        <script type="text/javascript">
            function responseEnd(sender, eventArgs) {
                var origen = eventArgs.get_eventTarget();
                var arbol = origen.split("$");

                var texto = arbol[arbol.length - 1];
                var hid2 = document.getElementById("erroresCarga");

                var longitud = (hid2.value).length;
                if (longitud > 0) {
                    errorCheck(hid2);
                    hid2.value = "";
                }
            }
        </script>
</asp:Content>