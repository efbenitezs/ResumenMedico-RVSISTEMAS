<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
	CodeBehind="ListaHistorias.aspx.cs" Inherits="ResumenMedico.Reportes.ListaHistorias" %>

<asp:Content ID="cBody" ContentPlaceHolderID="MainContent" runat="server">

	<telerik:RadAjaxManager ID="ram" runat="server" UpdatePanelsRenderMode="Block" DefaultLoadingPanelID="ralpImage">
		<AjaxSettings>

			<telerik:AjaxSetting AjaxControlID="rgData">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rgData" />
				</UpdatedControls>
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnFiltrarLista">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rgData" />
				</UpdatedControls>
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnLimpiar">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rdpFechaIngIni" />
					<telerik:AjaxUpdatedControl ControlID="rdpFechaIngFin" />
					<telerik:AjaxUpdatedControl ControlID="rcOperFecha" />
					<telerik:AjaxUpdatedControl ControlID="rcOperNombre" />
					<telerik:AjaxUpdatedControl ControlID="rcOperApellido" />
					<telerik:AjaxUpdatedControl ControlID="rcOperEmbajada" />
					<telerik:AjaxUpdatedControl ControlID="rcOperNumDoc" />
					<telerik:AjaxUpdatedControl ControlID="rcOperCierre" />
					<telerik:AjaxUpdatedControl ControlID="rcOperMedico" />

					<telerik:AjaxUpdatedControl ControlID="rcFiltroNombre" />
					<telerik:AjaxUpdatedControl ControlID="rcFiltroApellido" />
					<telerik:AjaxUpdatedControl ControlID="rcFiltroEmb" />
					<telerik:AjaxUpdatedControl ControlID="rcCierreHis" />
					<telerik:AjaxUpdatedControl ControlID="rtxtNumDoc" />
					<telerik:AjaxUpdatedControl ControlID="rcMedico" />
				</UpdatedControls>
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnVerTodos">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rgData" />
				</UpdatedControls>
			</telerik:AjaxSetting>
		</AjaxSettings>
	</telerik:RadAjaxManager>

	<telerik:RadAjaxLoadingPanel ID="ralpImage" runat="server" IsSticky="true" Style="position: absolute; top: 0; left: 0; height: 100%; width: 100%;"></telerik:RadAjaxLoadingPanel>

	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 showHideButton" onclick="ShowHideInfo(this)" id="btnFilterDaily">
			<span class="glyphicon glyphicon-chevron-down"></span>
			<span class="texto txtMostrar"></span>campos para filtro
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
			<div class="collapse" id="FilterDaily">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						Fecha Examen
					</div>
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox ID="rcOperFecha" runat="server" Width="100px" ZIndex="100002" OnClientDropDownClosing="rcOperFecha_IndexChange">
							<Items>
								<telerik:RadComboBoxItem Text="=" Value="1" Selected="true" />
								<telerik:RadComboBoxItem Text="&#62;" Value="2" />
								<telerik:RadComboBoxItem Text="&#62;=" Value="3" />
								<telerik:RadComboBoxItem Text="&#60;" Value="4" />
								<telerik:RadComboBoxItem Text="&#60;=" Value="5" />
								<telerik:RadComboBoxItem Text="&#60;&#62;" Value="6" />
								<telerik:RadComboBoxItem Text="Entre" Value="7" />
							</Items>
						</telerik:RadComboBox>
					</div>
					<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12">
						<telerik:RadDatePicker ID="rdpFechaIngIni" runat="server" MinDate="1900-01-01" Width="100%">
							<DateInput DateFormat="yyyy-MM-dd" ID="diFechaIngIni" runat="server" EmptyMessage="[AAAA-MM-DD]" CausesValidation="false"></DateInput>
							<Calendar ID="cFechaIngIni" runat="server" FirstDayOfWeek="Sunday"></Calendar>
						</telerik:RadDatePicker>
					</div>
					<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12">
						<div id="dFechaIngFin" class="collapse">
							<telerik:RadDatePicker ID="rdpFechaIngFin" runat="server" MinDate="1900-01-01" Width="100%">
								<DateInput DateFormat="yyyy-MM-dd" ID="diFechaIngFin" runat="server" EmptyMessage="[AAAA-MM-DD]" CausesValidation="false"></DateInput>
								<Calendar ID="cFechaIngFin" runat="server" FirstDayOfWeek="Sunday"></Calendar>
							</telerik:RadDatePicker>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						Nombres
					</div>
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox ID="rcOperNombre" runat="server" Width="100px" ZIndex="100002">
							<Items>
								<telerik:RadComboBoxItem Text="=" Value="1" Selected="true" />
								<telerik:RadComboBoxItem Text="&#60;&#62;" Value="2" />
							</Items>
						</telerik:RadComboBox>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox ID="rcFiltroNombre" runat="server" Filter="Contains" MarkFirstMatch="true" AllowCustomText="false" Width="100%"></telerik:RadComboBox>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						Apellidos
					</div>
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox ID="rcOperApellido" runat="server" Width="100px" ZIndex="100002">
							<Items>
								<telerik:RadComboBoxItem Text="=" Value="1" Selected="true" />
								<telerik:RadComboBoxItem Text="&#60;&#62;" Value="2" />
							</Items>
						</telerik:RadComboBox>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox ID="rcFiltroApellido" runat="server" Filter="Contains" MarkFirstMatch="true" AllowCustomText="false" Width="100%"></telerik:RadComboBox>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						Embajada
					</div>
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox ID="rcOperEmbajada" runat="server" Width="100px" ZIndex="100002">
							<Items>
								<telerik:RadComboBoxItem Text="=" Value="1" Selected="true" />
								<telerik:RadComboBoxItem Text="&#60;&#62;" Value="2" />
							</Items>
						</telerik:RadComboBox>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox ID="rcFiltroEmb" runat="server" Filter="Contains" MarkFirstMatch="true" AllowCustomText="false" Width="100%"></telerik:RadComboBox>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						Número Documento
					</div>
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox ID="rcOperNumDoc" runat="server" Width="100px" ZIndex="100002">
							<Items>
								<telerik:RadComboBoxItem Text="=" Value="1" Selected="true" />
								<telerik:RadComboBoxItem Text="&#60;&#62;" Value="2" />
							</Items>
						</telerik:RadComboBox>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadTextBox ID="rtxtNumDoc" runat="server" MaxLength="30" EmptyMessage="[Num. Documento]"></telerik:RadTextBox>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						Número Pasaporte
					</div>
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox ID="rcOperPasaporte" runat="server" Width="100px" ZIndex="100002">
							<Items>
								<telerik:RadComboBoxItem Text="=" Value="1" Selected="true" />
								<telerik:RadComboBoxItem Text="&#60;&#62;" Value="2" />
							</Items>
						</telerik:RadComboBox>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadTextBox ID="rtxtPasaporte" runat="server" MaxLength="30" EmptyMessage="[Num. Pasaporte]"></telerik:RadTextBox>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						Historia Cerradas
					</div>
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox ID="rcOperCierre" runat="server" Width="100px" ZIndex="100002">
							<Items>
								<telerik:RadComboBoxItem Text="=" Value="1" Selected="true" />
								<telerik:RadComboBoxItem Text="&#60;&#62;" Value="2" />
							</Items>
						</telerik:RadComboBox>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox runat="server" ID="rcCierreHis" Filter="Contains" MarkFirstMatch="true"
							AllowCustomText="false" Width="100%" EmptyMessage="[Seleccione]">
							<Items>
								<telerik:RadComboBoxItem Text="Todos" Value="2" Selected="true" />
								<telerik:RadComboBoxItem Text="Abiertas" Value="0" />
								<telerik:RadComboBoxItem Text="Cerradas" Value="1" />
							</Items>
						</telerik:RadComboBox>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						Medico que atendio
					</div>
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox ID="rcOperMedico" runat="server" Width="100px" ZIndex="100002">
							<Items>
								<telerik:RadComboBoxItem Text="=" Value="1" Selected="true" />
								<telerik:RadComboBoxItem Text="&#60;&#62;" Value="2" />
							</Items>
						</telerik:RadComboBox>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox ID="rcMedico" runat="server" Filter="Contains" MarkFirstMatch="true" AllowCustomText="false" Width="100%"></telerik:RadComboBox>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						Liberados
					</div>
					<div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox ID="rcOperLiberado" runat="server" Width="100px" ZIndex="100002">
							<Items>
								<telerik:RadComboBoxItem Text="=" Value="1" Selected="true" />
								<telerik:RadComboBoxItem Text="&#60;&#62;" Value="2" />
							</Items>
						</telerik:RadComboBox>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadComboBox runat="server" ID="rcLiberado" Filter="Contains" MarkFirstMatch="true"
							AllowCustomText="false" Width="100%" EmptyMessage="[Seleccione]">
							<Items>
								<telerik:RadComboBoxItem Text="Todos" Value="2" Selected="true" />
								<telerik:RadComboBoxItem Text="No Liberados" Value="0" />
								<telerik:RadComboBoxItem Text="Liberados" Value="1" />
							</Items>
						</telerik:RadComboBox>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">&nbsp;</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<telerik:RadButton ID="rbtnFiltrarLista" runat="server" CausesValidation="false" UseSubmitBehavior="false" Text="Buscar" OnClick="rbtnFiltrarLista_Click"></telerik:RadButton>
						&nbsp;&nbsp;
                        <telerik:RadButton ID="rbtnLimpiar" runat="server" CausesValidation="false" UseSubmitBehavior="false" Text="Limpiar Valores" OnClick="rbtnLimpiar_Click"></telerik:RadButton>
						&nbsp;&nbsp;
                        <telerik:RadButton ID="rbtnVerTodos" runat="server" CausesValidation="false" UseSubmitBehavior="false" Text="Ver Todos" OnClick="rbtnVerTodos_Click"></telerik:RadButton>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">&nbsp;</div>
				</div>
			</div>
		</div>
		<div class="titulo col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
			Listado Pacientes
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<telerik:RadGrid ID="rgData" runat="server" AutoGenerateColumns="false" PageSize="20" AllowSorting="true" OnNeedDataSource="rgData_NeedDataSource"
				Font-Names="Verdana" OnItemDataBound="rgData_ItemDataBound" OnItemCommand="rgData_ItemCommand" Culture="es-CO">
				<PagerStyle AlwaysVisible="true" Font-Names="verdana" />
				<ClientSettings>
					<Scrolling UseStaticHeaders="true" />
				</ClientSettings>
				<MasterTableView CommandItemDisplay="None" Font-Names="verdana" DataKeyNames="ID">
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
						<telerik:GridBoundColumn HeaderText="Laboratorio" DataField="TIENE_REV_LAB_TEXT"
							DataType="System.String" AllowSorting="true" UniqueName="Laboratorio">
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn HeaderText="Radiología" DataField="TIENE_REV_RAD_TEXT" DataType="System.String"
							AllowSorting="true" UniqueName="Radiologia">
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn HeaderText="Medicina" DataField="TIENE_REV_MED_TEXT" DataType="System.String"
							AllowSorting="true" UniqueName="Medicina">
						</telerik:GridBoundColumn>
						<%--<telerik:GridHyperLinkColumn HeaderText="" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="../Consultorio/Laboratorio.aspx?IdHist={0}" Text="ir a información"></telerik:GridHyperLinkColumn>--%>
						<telerik:GridTemplateColumn HeaderText="Embajada" UniqueName="Embajada">
							<ItemTemplate>
								<telerik:RadCodeBlock runat="server">
									<img alt='<%# Eval("EMBAJADA")%>' src='../Resources/<%# Eval("FLAG_USER")%>' width="99px"
										height="50px" />
								</telerik:RadCodeBlock>
							</ItemTemplate>
						</telerik:GridTemplateColumn>
						<telerik:GridTemplateColumn UniqueName="Vinculos" DataField="ID">
							<ItemTemplate>
								<asp:HyperLink ID="lnkInfoRec" runat="server" NavigateUrl='<%# "~/Consultorio/Recepcion.aspx?IdHist=" + Eval("ID")%>'
									Text="Ir a recepción"></asp:HyperLink>
								<br />
								<asp:HyperLink ID="lnkInfoLab" runat="server" NavigateUrl='<%# "~/Consultorio/Laboratorio.aspx?IdHist=" + Eval("ID")%>'
									Visible='<%# (this.IsAdmin || this.PerfilActual == RMEntity.Constants.Perfiles.Laboratorio)%>'
									Text="Ir a Laboratorio">
								</asp:HyperLink>
								<br />
								<asp:HyperLink ID="lnkInfopRad" runat="server" NavigateUrl='<%# "~/Consultorio/Radiologia.aspx?IdHist=" + Eval("ID")%>'
									Visible='<%# (this.IsAdmin || this.PerfilActual == RMEntity.Constants.Perfiles.Radiologia)%>'
									Text="Ir a Radiologia">
								</asp:HyperLink>
								<br />
								<asp:HyperLink ID="lnkInfoMed" runat="server" NavigateUrl='<%# "~/Consultorio/Medicina.aspx?IdHist=" + Eval("ID")%>'
									Visible='<%# (this.IsAdmin || this.PerfilActual == RMEntity.Constants.Perfiles.MedicoGeneral)%>'
									Text="Ir a Medicina">
								</asp:HyperLink>
							</ItemTemplate>
						</telerik:GridTemplateColumn>
						<telerik:GridButtonColumn ButtonType="LinkButton" CommandName="DelHist" ConfirmDialogType="RadWindow"
							ConfirmTitle="Eliminar Historia?" UniqueName="EliminarHistoria" Text="Eliminar<br />Historia"
							ConfirmText="Esta seguro(a) de eliminar esta historia\n\nEste proceso eliminará toda la información de la historia del paciente así como también sus adjuntos(Imagen, Consentimientos, Reultados y examenes)\n\nEste proceso no es reversible, Desea Continuar?">
						</telerik:GridButtonColumn>
					</Columns>
				</MasterTableView>
			</telerik:RadGrid>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="PageScriptsHolder" runat="server">
	<script type="text/javascript">

		function rcOperFecha_IndexChange(sender, eventArgs)
		{
			var rcOperFecha = $find("<%=rcOperFecha.ClientID%>");
			var dFechaIngFin = document.getElementById("dFechaIngFin");

			var opcion = rcOperFecha.get_value();

			if (opcion == "7")
			{
				dFechaIngFin.classList.add("in");
			}
			else
			{
				dFechaIngFin.classList.remove("in");
			}

		}
	</script>
	<script type="text/javascript">
		function ShowHideInfo(sender)
		{
			var idButton = sender.id;

			var spGi = sender.getElementsByClassName('glyphicon')[0];
			var spOp = sender.getElementsByClassName('texto')[0];

			if (spGi.classList.contains("glyphicon-chevron-down"))
			{
				spGi.classList.add("glyphicon-chevron-up")
				spGi.classList.remove("glyphicon-chevron-down");
			}
			else
			{
				spGi.classList.remove("glyphicon-chevron-up")
				spGi.classList.add("glyphicon-chevron-down");
			}

			if (spOp.classList.contains("txtMostrar"))
			{
				spOp.classList.add("txtOcultar");
				spOp.classList.remove("txtMostrar")
			}
			else
			{
				spOp.classList.remove("txtOcultar");
				spOp.classList.add("txtMostrar")
			}

			var divName = sender.id.replace('btn', '#');

			$(divName).toggleClass('in');

		}
	</script>
</asp:Content>