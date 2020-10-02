<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
	CodeBehind="TiposDeExamen.aspx.cs" Inherits="ResumenMedico.Admin.TiposDeExamen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="titulo">
		Administración de Exámenes
	</div>
	<div>
		<telerik:RadAjaxManager ID="ram" runat="server" UpdatePanelsRenderMode="Block">
			<ClientEvents OnResponseEnd="responseEnd" />
			<AjaxSettings>
				<telerik:AjaxSetting AjaxControlID="gvExamenLaboratorio">
					<UpdatedControls>
						<telerik:AjaxUpdatedControl ControlID="gvExamenLaboratorio" LoadingPanelID="ralpImage" />
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
		<telerik:RadGrid ClientIDMode="Static" ID="gvExamenLaboratorio" runat="server" AutoGenerateColumns="false"
			AllowSorting="true" OnNeedDataSource="gvExamenLaboratorio_NeedDataSource" OnDeleteCommand="gvExamenLaboratorio_DeleteCommand"
			OnInsertCommand="gvExamenLaboratorio_InsertCommand" OnUpdateCommand="gvExamenLaboratorio_UpdateCommand"
			PageSize="15" Font-Names="Verdana" Font-Size="12px" Font-Bold="True">

			<ValidationSettings CommandsToValidate="PerformInsert,Update" ValidationGroup="TiposExamen" />
			<PagerStyle AlwaysVisible="true" />
			<ClientSettings>
				<Scrolling UseStaticHeaders="true" />
			</ClientSettings>
			<MasterTableView CommandItemDisplay="Top" DataKeyNames="ID" EditItemStyle-CssClass="h2">
				<CommandItemSettings AddNewRecordText="Agregar Nuevo Tipo de Examen" ShowRefreshButton="false" />
				<EditFormSettings>
					<EditColumn InsertText="Agregar" CancelText="Cancelar" UpdateText="Actualizar" ButtonType="PushButton">
					</EditColumn>
				</EditFormSettings>
				<Columns>
					<telerik:GridButtonColumn UniqueName="EditColumn" ButtonType="ImageButton" CommandName="Edit">
					</telerik:GridButtonColumn>
					<telerik:GridBoundColumn UniqueName="NombreExamen" HeaderText="Nombre Examen" SortExpression="NombreExamen"
						DataField="NOMBRE">
						<ColumnValidationSettings EnableRequiredFieldValidation="true">
							<RequiredFieldValidator ValidationGroup="TiposExamen"></RequiredFieldValidator>
						</ColumnValidationSettings>
					</telerik:GridBoundColumn>
					<telerik:GridCheckBoxColumn UniqueName="Externo" HeaderText="Externo?" SortExpression="Externo"
						DataField="EXTERNO">
					</telerik:GridCheckBoxColumn>
					<telerik:GridCheckBoxColumn UniqueName="Requiere_Venopuncion" HeaderText="Requiere Venopunción?"
						SortExpression="Requiere_Venopuncion" DataField="REQUIERE_VENOPUNCION">
					</telerik:GridCheckBoxColumn>
					<telerik:GridCheckBoxColumn UniqueName="Requiere_Consentimiento" HeaderText="Requiere Consentimiento?"
						SortExpression="Requiere_Consentimiento" DataField="REQUIERE_CONSENTIMIENTO">
					</telerik:GridCheckBoxColumn>
					<telerik:GridCheckBoxColumn UniqueName="Activo" HeaderText="Activo?" SortExpression="Activo"
						DataField="ACTIVO">
					</telerik:GridCheckBoxColumn>
				</Columns>
			</MasterTableView>
		</telerik:RadGrid>
	</div>
	<script type="text/javascript">
		function responseEnd( sender, eventArgs )
		{
			var origen =  eventArgs.get_eventTarget();
			var arbol = origen.split("$");
			var maxArbol = arbol.length - 1;

			var texto = arbol[maxArbol];
			/*alert( arrgl );
			alert( texto );*/
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