<%@ Page Title="" Language="C#" MasterPageFile="~/Reportes/Reportes.master" AutoEventWireup="true"
	CodeBehind="ListaPacientesPendRad.aspx.cs" Inherits="ResumenMedico.Reportes.ListaPacientesPendRad" %>

<asp:Content ID="cHead" ContentPlaceHolderID="cphHeadMaster" runat="server">
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="cphBodyMaster" runat="server">
	<telerik:RadAjaxManager ID="ram" runat="server" UpdatePanelsRenderMode="Block">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="rgData">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rgData" LoadingPanelID="ralpImage" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rbtnFiltrar">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rgData" LoadingPanelID="ralpImage" />
				</UpdatedControls>
			</telerik:AjaxSetting>
		</AjaxSettings>
	</telerik:RadAjaxManager>
	<telerik:RadAjaxLoadingPanel ID="ralpImage" runat="server">
	</telerik:RadAjaxLoadingPanel>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlHousing controlSide">
				Fecha Nacimiento
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide rightSonsAlign">
					Desde
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing ">
					<telerik:RadDatePicker ID="rdpFechaNacIni" runat="server" MinDate="1900-01-01" Width="90%">
						<DateInput DateFormat="yyyy-MM-dd" ID="diFecNacIni" runat="server" EmptyMessage="[Fecha de nacimiento desde]"
							CausesValidation="false">
						</DateInput>
						<Calendar ID="cFecNacIni" runat="server" FirstDayOfWeek="Sunday">
						</Calendar>
					</telerik:RadDatePicker>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide rightSonsAlign">
					Hasta
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
					<telerik:RadDatePicker ID="rdpFechaNacFin" runat="server" MinDate="1900-01-01" Width="90%">
						<DateInput DateFormat="yyyy-MM-dd" ID="diFecNacFin" runat="server" EmptyMessage="[Fecha nacimiento hasta]"
							CausesValidation="false">
						</DateInput>
						<Calendar ID="cFecNacFin" runat="server" FirstDayOfWeek="Sunday">
						</Calendar>
					</telerik:RadDatePicker>
				</div>
			</div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlHousing controlSide">
				Fecha Ingreso
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide rightSonsAlign">
					Desde
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing ">
					<telerik:RadDatePicker ID="rdpFechaIngIni" runat="server" MinDate="1900-01-01" Width="90%">
						<DateInput DateFormat="yyyy-MM-dd" ID="diFechaIngIni" runat="server" EmptyMessage="[Fecha de ingreso desde]"
							CausesValidation="false">
						</DateInput>
						<Calendar ID="cFechaIngIni" runat="server" FirstDayOfWeek="Sunday">
						</Calendar>
					</telerik:RadDatePicker>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide rightSonsAlign">
					Hasta
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing ">
					<telerik:RadDatePicker ID="rdpFechaIngFin" runat="server" MinDate="1900-01-01" Width="90%">
						<DateInput DateFormat="yyyy-MM-dd" ID="diFechaIngFin" runat="server" EmptyMessage="[Fecha de ingreso hasta]"
							CausesValidation="false">
						</DateInput>
						<Calendar ID="cFechaIngFin" runat="server" FirstDayOfWeek="Sunday">
						</Calendar>
					</telerik:RadDatePicker>
				</div>
			</div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
					Tipo Documento
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing ">
					<telerik:RadComboBox ID="rcbxTipoDoc" runat="server" Filter="Contains" MarkFirstMatch="true"
						Width="90%" />
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
					Número Documento
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing ">
					<telerik:RadTextBox ID="rtxtNumDoc" runat="server" MaxLength="20" EmptyMessage="[Número Documento]"
						Width="90%" />
				</div>
			</div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
					Género
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing ">
					<asp:RadioButtonList ID="rblGenero" runat="server" RepeatDirection="Horizontal">
						<asp:ListItem Text="Masculino" Value="1"></asp:ListItem>
						<asp:ListItem Text="Femenino" Value="0"></asp:ListItem>
					</asp:RadioButtonList>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
					Embajada
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing ">
					<telerik:RadComboBox ID="rcbxEmbajada" runat="server" Filter="Contains" MarkFirstMatch="true"
						Width="90%" />
				</div>
			</div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div style="width: 120px; margin: 0 auto">
				<telerik:RadButton ID="rbtnFiltrar" runat="server" UseSubmitBehavior="true" Text="Aplicar busqueda"
					OnClick="rbtnFiltrar_Click" />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="titulo">
			Listado Pacientes Pendientes Radiología
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<telerik:RadGrid ID="rgData" runat="server" AutoGenerateColumns="false" PageSize="20"
				AllowSorting="true" OnNeedDataSource="rgData_NeedDataSource" Font-Names="Verdana">
				<PagerStyle AlwaysVisible="true" Font-Names="verdana" />
				<ClientSettings>
					<Scrolling UseStaticHeaders="true" />
				</ClientSettings>
				<MasterTableView CommandItemDisplay="None" Font-Names="verdana">
					<Columns>
						<telerik:GridBoundColumn HeaderText="Tipo Documento" DataField="TIPO_DOCUMENTO" DataType="System.String"
							AllowSorting="true" UniqueName="TipoDocumento">
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn HeaderText="Número Documento" DataField="NUMERO_DOCUMENTO"
							DataType="System.String" AllowSorting="true" UniqueName="NumDoc">
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn HeaderText="Tipo Código" DataField="TIPO_CODIGO" DataType="System.String"
							AllowSorting="true" UniqueName="TipoCodigo">
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn HeaderText="Código" DataField="CODIGO_SOLICITUD" DataType="System.String"
							AllowSorting="true" UniqueName="Codigo">
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn HeaderText="Paciente" DataField="PACIENTE" DataType="System.String"
							AllowSorting="true" UniqueName="Paciente">
						</telerik:GridBoundColumn>
						<telerik:GridHyperLinkColumn HeaderText="" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="../Consultorio/Radiologia.aspx?IdHist={0}"
							Text="ir a Información">
						</telerik:GridHyperLinkColumn>
						<telerik:GridTemplateColumn HeaderText="Embajada" UniqueName="Embajada">
							<ItemTemplate>
								<img alt='<%# Eval("EMBAJADA")%>' src='../Resources/<%# Eval("FLAG_USER")%>' width="99px"
									height="50px" />
							</ItemTemplate>
						</telerik:GridTemplateColumn>
					</Columns>
				</MasterTableView>
			</telerik:RadGrid>
		</div>
	</div>
</asp:Content>
