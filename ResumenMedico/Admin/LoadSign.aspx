<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="LoadSign.aspx.cs" Inherits="ResumenMedico.Admin.LoadSign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<table class="table">
		<tr>
			<td>Carga firma profesional bacteriología
			</td>
		</tr>
	</table>
	<div>
		<table border="1" cellpadding="0" width="500">
			<tbody>
				<tr>
					<td height="100" width="500"></td>
				</tr>
			</tbody>
		</table>
		<br />

		<br />
		<div>
			<telerik:radbutton id="rbtnGuardar" runat="server" text="Guardar firma"
				onclick="rbtnGuardar_Click"></telerik:radbutton>
		</div>
	</div>
</asp:Content>