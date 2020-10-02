<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master"
	AutoEventWireup="true" CodeBehind="Radiologia.aspx.cs" Inherits="ResumenMedico.Consultorio.Radiologia" %>

<asp:Content ID="cBody" ContentPlaceHolderID="MainContent" runat="server">
	<telerik:RadAjaxManager ID="ram" runat="server" UpdatePanelsRenderMode="Block">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="btnSaveInfo">
			</telerik:AjaxSetting>
		</AjaxSettings>
	</telerik:RadAjaxManager>

	<telerik:RadAjaxLoadingPanel ID="ralpImage" runat="server" IsSticky="true" Style="position: absolute; top: 0; left: 0; height: 100%; width: 100%;"></telerik:RadAjaxLoadingPanel>

	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="titulo">
				Información Paciente
			</div>
			<div class="row">
				<div class="col-lg-2 col-md-2 col-sm-3 col-xs-12" style="float: right;">
					<div class="imgPrePhoto centeredControl">
						<telerik:RadBinaryImage ID="imgPrePhoto" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Resources/DefaultImage.jpg" />
						<asp:HiddenField ID="hfIdHist" runat="server" />
					</div>
				</div>
				<div class="col-lg-10 col-md-10 col-sm-9 col-xs-12">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
							<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlSide controlHousing">
								Nombre
							</div>
							<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
								<telerik:RadTextBox ID="rtxtNombres" runat="server" ReadOnly="true" Width="90%" />
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
							<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlSide controlHousing">
								Fecha Ingreso
							</div>
							<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
								<telerik:RadDatePicker ID="rdpFecha" runat="server" Width="90%">
									<Calendar ID="cFecha" runat="server" FirstDayOfWeek="Sunday" />
									<DateInput ID="diFecha" runat="server" DisplayDateFormat="yyyy/MM/dd" ReadOnly="true" />
								</telerik:RadDatePicker>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12 controlRow">
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 controlPair">
							<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
								Tipo Identificación
							</div>
							<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
								<telerik:RadComboBox ID="rcbxTipoDoc" runat="server" Width="90%" Filter="Contains" Enabled="false" />
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 controlPair">
							<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
								Número Identificación
							</div>
							<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">

								<telerik:RadTextBox ID="rtxtNumDoc" runat="server" MaxLength="50" Width="90%" EmptyMessage="[Número Documento]" Font-Names="Verdana" ReadOnly="true"></telerik:RadTextBox>

								<asp:RequiredFieldValidator ID="rfvNumDoc" runat="server" ControlToValidate="rtxtNumDoc" ValidationGroup="Paciente" ErrorMessage="Debe especificar el numero de Identificacion"
									Display="None" />
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlPair">
							<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
								Número Pasaporte
							</div>
							<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
								<telerik:RadTextBox ID="rtxtPasaporte" runat="server" MaxLength="20" Width="90%" EmptyMessage="[Número Pasaporte]" Font-Names="Verdana" ReadOnly="true"></telerik:RadTextBox>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
							<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlSide controlHousing">
								Fecha de Nacimiento
							</div>
							<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
								<telerik:RadDatePicker ID="rdpFecNacimiento" runat="server" Width="90%" MinDate="01/01/1900">
									<Calendar ID="cFecNacimiento" runat="server" FirstDayOfWeek="Sunday" />
									<DateInput ID="diFecNacimiento" runat="server" DisplayDateFormat="yyyy/MM/dd" ReadOnly="true" />
								</telerik:RadDatePicker>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
							<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlSide controlHousing">
								Correo Electronico
							</div>
							<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
								<telerik:RadTextBox ID="rtxtCorreo" runat="server" ReadOnly="true" Width="90%" />
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
							<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlSide controlHousing">
								Estatura
							</div>
							<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
								<telerik:RadNumericTextBox ID="rntEstatura" runat="server" MinValue="0" MaxValue="300" MaxLength="4" Width="90%">
									<ClientEvents OnBlur="calculateBMI" />
									<NumberFormat DecimalDigits="0" DecimalSeparator="," />
									<IncrementSettings Step="1" />
								</telerik:RadNumericTextBox>
								&nbsp;cm
								<asp:RequiredFieldValidator ID="rfvEstatura" runat="server" ControlToValidate="rntEstatura"
									ValidationGroup="Paciente" Display="None" ErrorMessage="debe indicar la estatura del paciente" />
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
							<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlSide controlHousing">
								BMI
							</div>
							<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
								<telerik:RadNumericTextBox ID="rntBmi" runat="server" MinValue="0" MaxValue="100" MaxLength="4" ReadOnly="true" Width="90%">
									<NumberFormat DecimalDigits="2" DecimalSeparator="," />
									<IncrementSettings Step="0.1" />
								</telerik:RadNumericTextBox>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
							<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlSide controlHousing">
								Peso
							</div>
							<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
								<telerik:RadNumericTextBox ID="rntPeso" runat="server" MinValue="0" MaxValue="300" MaxLength="6" Width="90%">
									<ClientEvents OnBlur="calculateBMI" />
									<NumberFormat DecimalDigits="2" DecimalSeparator="," />
								</telerik:RadNumericTextBox>
								&nbsp;&nbsp;kg
								<asp:RequiredFieldValidator ID="rfvPeso" Display="None" runat="server" ControlToValidate="rntPeso"
									ValidationGroup="Paciente" ErrorMessage="debe indicar el peso del paciente" />
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
							<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlSide controlHousing">
								Perímetro Cefálico
							</div>
							<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
								<telerik:RadNumericTextBox ID="rntPC" runat="server" MinValue="0" MaxValue="100" MaxLength="4" Width="90%">
									<NumberFormat DecimalDigits="2" DecimalSeparator="," />
									<IncrementSettings Step="0.1" />
								</telerik:RadNumericTextBox>
								<asp:RequiredFieldValidator ID="rfvPC" Display="None" runat="server" ControlToValidate="rntPC"
									ValidationGroup="Paciente" ErrorMessage="Se debe especificar el perímetro cefálico del paciente" />
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 controlPair">
							<asp:CheckBox ID="chkRadiografiaTom" runat="server" Text="Radiografía Tomada" CssClass="chBx" />
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 controlPair">
							<asp:CheckBox ID="chkCargadaEmedical" runat="server" Text="Cargada a emedical" Enabled="false" CssClass="chBx" />
						</div>

						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 controlPair">
							<asp:CheckBox ID="ChkRequiereNotificacion" runat="server" Text="Requiere Notificación" CssClass="chBx" />
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 controlPair">
							<asp:CheckBox ID="ChkNotificado" runat="server" Text="Ya fue Notificado" CssClass="chBx" />
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlHousing controlSide">
					Información Medico General
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
						Nombre Medico Asignado
					</div>
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
						<asp:Label ID="lblNombreMedico" runat="server"></asp:Label>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlPair">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 controlHousing controlSide">
						Estado
					</div>
					<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 controlHousing">
						<asp:RadioButtonList ID="rblEstado" runat="server" RepeatDirection="Horizontal" Enabled="false">
							<asp:ListItem Text="Sin Aplicar" class="chbxSinAplicar" Value="2" Selected="True"></asp:ListItem>
							<asp:ListItem Text="Normal" class="chbxNormal" Value="0"></asp:ListItem>
							<asp:ListItem Text="Anormal" class="chbxAnormal" Value="1"></asp:ListItem>
						</asp:RadioButtonList>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlPair">
					<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 controlHousing controlSide">
						Comentarios Medico General
					</div>
					<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 controlHousing">
						<telerik:RadTextBox ID="rtxtCommentRadGen" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana" Font-Size="11px"
							Enabled="false">
						</telerik:RadTextBox>
					</div>
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlHousing controlSide">
					Información Radiólogo
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlPair">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 controlHousing controlSide">
						Estado
					</div>
					<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 controlHousing">
						<asp:RadioButtonList ID="rblEstadoRad" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Text="Sin Aplicar" class="chbxSinAplicar" Value="2" Selected="True"></asp:ListItem>
							<asp:ListItem Text="Normal" class="chbxNormal" Value="0"></asp:ListItem>
							<asp:ListItem Text="Anormal" class="chbxAnormal" Value="1"></asp:ListItem>
						</asp:RadioButtonList>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlPair">
					<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 controlHousing controlSide">
						Comentarios Radiólogo
					</div>
				</div>
				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 controlHousing">
					<telerik:RadTextBox ID="rtxtCommentRad" runat="server" TextMode="MultiLine" Rows="5" Width="99%" />
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<telerik:RadButton ID="btnSaveInfo" runat="server" CausesValidation="true" ValidationGroup="Paciente"
							Text="Guardar Cambios" OnClick="btnSaveInfo_Click" CssClass="leftSideButton" />
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<telerik:RadButton ID="rbtnLoadFile" runat="server" CausesValidation="false" Text="Adjuntar archivo" UseSubmitBehavior="false"
							CssClass="rightSideButton" OnClientClicking="CargarFile" />
					</div>
				</div>
			</div>

			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

				<telerik:RadGrid ID="rgFilesAttached" runat="server" AutoGenerateColumns="false" PageSize="10" OnNeedDataSource="rgFilesAttached_NeedDataSource" Width="100%">

					<PagerStyle AlwaysVisible="true" />

					<MasterTableView DataKeyNames="ID">

						<Columns>

							<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:AbrirArchivo({0});" Text="Abrir archivo"></telerik:GridHyperLinkColumn>

							<telerik:GridBoundColumn HeaderText="Nombre Adjunto" DataField="NOMBRE_ADJUNTO" UniqueName="Adjunto" DataType="System.String"></telerik:GridBoundColumn>

							<telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor" DataType="System.DateTime"></telerik:GridBoundColumn>

							<telerik:GridBoundColumn HeaderText="Usuario que adjunto" DataField="CREACION" UniqueName="Usuario" DataType="System.String"></telerik:GridBoundColumn>

						</Columns>
					</MasterTableView>
				</telerik:RadGrid>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="cHead" ContentPlaceHolderID="PageScriptsHolder" runat="server">
	<script type="text/javascript">
		function calculateBMI(sender, e)
		{
			var txtPes = $find("<%=this.rntPeso.ClientID%>");
			var txtEst = $find("<%=this.rntEstatura.ClientID%>");

			var pes = txtPes.get_value();
			var est = txtEst.get_value();
			est = est / 100;

			if (pes != "" && est != "")
			{
				var Bmi = $find("<%=this.rntBmi.ClientID%>");
				Bmi.set_value(pes / (est * est));
			}
		}

		function openFileupload(idHist)
		{
			var a = window.open("../Controls/CargaArchivo.aspx?IdHist=" + idHist + "&IdTR=2&IdMu=0", "filupl", "location=0,width=600,height=400");
		}

		function CargarFile(sender, e)
		{
			var idh = document.getElementById("<%=this.hfIdHist.ClientID%>").value;
			openFileupload(idh);
			e.set_cancel(true);
		}

		function AbrirArchivo(idFil) 
		{
			window.open("../Controls/DwldFil.aspx?idFil=" + idFil, "", "height=400,width=500,resizable=no,scrollbars=yes");
		}
	</script>
</asp:Content>
