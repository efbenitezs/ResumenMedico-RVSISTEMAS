<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="TiposDeVisa.aspx.cs" Inherits="ResumenMedico.Admin.TiposDeVisa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="titulo">
		Administración de Tipos de Codigos de Solicitud
	</div>
	<div>
		<telerik:RadAjaxManager ID="ram" runat="server" UpdatePanelsRenderMode="Block">
			<ClientEvents OnResponseEnd="responseEnd" />
			<AjaxSettings>
				<telerik:AjaxSetting AjaxControlID="gvTipoVisa">
					<UpdatedControls>
						<telerik:AjaxUpdatedControl ControlID="gvTipoVisa" LoadingPanelID="ralpImage" />
						<telerik:AjaxUpdatedControl ControlID="Validator" />
						<telerik:AjaxUpdatedControl ControlID="erroresCarga" />
					</UpdatedControls>
				</telerik:AjaxSetting>
			</AjaxSettings>
		</telerik:RadAjaxManager>

		<telerik:RadAjaxLoadingPanel ID="ralpImage" runat="server" BackgroundPosition="Center" HorizontalAlign="Center"></telerik:RadAjaxLoadingPanel>

		<div class="ocultos">
			<telerik:RadTextBox ID="erroresCarga" ClientIDMode="Static" runat="server" onchange="mostrar(this)"></telerik:RadTextBox>
			<telerik:RadTextBox ID="tbxhidden" ClientIDMode="Static" runat="server" onchange="detectar(this)"></telerik:RadTextBox>

			<asp:RegularExpressionValidator ID="Validator" runat="server" Display="Dynamic" ErrorMessage="Hay errores en los datos que quiere enviar"
				ValidationExpression="Correcto" ControlToValidate="tbxhidden">
			</asp:RegularExpressionValidator>
		</div>

		<telerik:RadGrid ClientIDMode="Static" ID="gvTipoVisa" runat="server" AutoGenerateColumns="False" AllowSorting="True" OnNeedDataSource="gvTipoVisa_NeedDataSource" OnDeleteCommand="gvTipoVisa_DeleteCommand"
			OnInsertCommand="gvTipoVisa_InsertCommand" OnUpdateCommand="gvTipoVisa_UpdateCommand" PageSize="15" CellSpacing="-1" GridLines="Both" GroupPanelPosition="Top" ResolvedRenderMode="Classic" Font-Names="Verdana" 
            Font-Size="12px" Font-Bold="True">

			<ValidationSettings CommandsToValidate="PerformInsert,Update" ValidationGroup="TipoVisa" />

			<PagerStyle AlwaysVisible="true" />

			<ClientSettings>
				<Scrolling UseStaticHeaders="true" />
			</ClientSettings>

			<MasterTableView CommandItemDisplay="Top" DataKeyNames="ID" EditItemStyle-CssClass="h2">

				<CommandItemSettings AddNewRecordText="Agregar Nuevo Tipo de Codigo de Solicitud" ShowRefreshButton="false" />

				<EditFormSettings>
					<EditColumn InsertText="Agregar" CancelText="Cancelar" UpdateText="Actualizar" ButtonType="PushButton"></EditColumn>
				</EditFormSettings>

				<Columns>

					<telerik:GridButtonColumn UniqueName="EditColumn" ButtonType="ImageButton" CommandName="Edit"></telerik:GridButtonColumn>
					
                    <telerik:GridBoundColumn UniqueName="NombreVisa" HeaderText="Nombre Código" SortExpression="NombreVisa" DataField="NOMBRE">
						<ColumnValidationSettings EnableRequiredFieldValidation="true">
							<RequiredFieldValidator ValidationGroup="TipoVisa"></RequiredFieldValidator>
						</ColumnValidationSettings>
					</telerik:GridBoundColumn>

					<telerik:GridDropDownColumn DataSourceID="odsEmbajadas" ListTextField="NOMBRE" ListValueField="ID" UniqueName="Embajada" SortExpression="EMBAJADA" HeaderText="Embajada" DataField="ID_EMBAJADA" 
                        AllowAutomaticLoadOnDemand="true" ShowMoreResultsBox="true" ItemsPerRequest="10" DropDownControlType="RadComboBox">
					</telerik:GridDropDownColumn>

					<telerik:GridCheckBoxColumn UniqueName="Activo" HeaderText="Activo?" SortExpression="Activo"
						DataField="ACTIVO">
					</telerik:GridCheckBoxColumn>
				</Columns>

<PagerStyle AlwaysVisible="True"></PagerStyle>
			</MasterTableView>
		</telerik:RadGrid>
		<asp:ObjectDataSource ID="odsEmbajadas" runat="server" SelectMethod="GetList" TypeName="RMBLL.EmbajadaBll">
			<SelectParameters>
				<asp:Parameter Name="nombre" Type="String" DefaultValue="" />
				<asp:Parameter Name="activo" Type="Boolean" DefaultValue="true" />
				<asp:Parameter Name="showAllActivo" Type="Boolean" DefaultValue="false" />
			</SelectParameters>
		</asp:ObjectDataSource>
	</div>
	<script type="text/javascript">
		function responseEnd( sender, eventArgs )
		{
			var origen = eventArgs.get_eventTarget();
			var arbol = origen.split( "$" );
			var maxArbol = arbol.length - 1;

			var texto = arbol[maxArbol];
			var hid2 = document.getElementById( "erroresCarga" );

			var longitud = ( hid2.value ).length;
			if ( longitud > 0 )
			{
				errorCheck( hid2 );
				hid2.value = "";
			}
		}

        
	</script>
</asp:Content>
