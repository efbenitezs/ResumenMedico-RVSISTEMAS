<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Parametros.aspx.cs" Inherits="ResumenMedico.Admin.Parametros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="titulo">
		Parámetros
	</div>
	<telerik:RadAjaxManager ID="ram" runat="server" UpdatePanelsRenderMode="Block">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="rgData">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rgData" />
				</UpdatedControls>
			</telerik:AjaxSetting>
		</AjaxSettings>
	</telerik:RadAjaxManager>

	<telerik:RadAjaxLoadingPanel ID="ralpImage" runat="server"></telerik:RadAjaxLoadingPanel>

	<telerik:RadGrid ID="rgData" runat="server" AutoGenerateColumns="false"
		OnNeedDataSource="rgData_NeedDataSource" OnUpdateCommand="rgData_UpdateCommand">
		<GroupingSettings CaseSensitive="false" />

		<ClientSettings>
			<Scrolling UseStaticHeaders="true" />
		</ClientSettings>

		<MasterTableView DataKeyNames="ID" CommandItemDisplay="None" EditItemStyle-CssClass="h2">
			<Columns>
				<telerik:GridEditCommandColumn ButtonType="ImageButton" CancelText="Cancelar" EditText="Actualizar"></telerik:GridEditCommandColumn>

				<telerik:GridBoundColumn DataField="NOMBRE" HeaderText="Nombre" UniqueName="Nombre" ReadOnly="true"></telerik:GridBoundColumn>

				<telerik:GridBoundColumn DataField="DESCRIPCION" HeaderText="Descripcion" UniqueName="Descripcion" ReadOnly="true"></telerik:GridBoundColumn>

				<telerik:GridBoundColumn DataField="VALOR" HeaderText="Valor Variable" UniqueName="Valor"></telerik:GridBoundColumn>
			</Columns>
		</MasterTableView>
	</telerik:RadGrid>
</asp:Content>