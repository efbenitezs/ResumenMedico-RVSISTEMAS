<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="Laboratorio.aspx.cs" Inherits="ResumenMedico.Consultorio.Laboratorio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
	<style type="text/css" id="printStyles">
			</style>
</asp:Content>
<asp:Content ID="cBody" ContentPlaceHolderID="MainContent" runat="server">
	<telerik:RadAjaxManager ID="ram" runat="server" UpdatePanelsRenderMode="Inline" DefaultLoadingPanelID="ralpImage">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="rcbxSero">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rntValorSero" />
					<telerik:AjaxUpdatedControl ControlID="lblValSer" />
					<telerik:AjaxUpdatedControl ControlID="lblUnitValSer" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rcbxCreatinina">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="divLblValCrea" />
					<telerik:AjaxUpdatedControl ControlID="divValCrea" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rcbxHemGli">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rntValorHemGli" />
					<telerik:AjaxUpdatedControl ControlID="lblValHemGli" />
					<telerik:AjaxUpdatedControl ControlID="lblUnitValHemGli" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="chkUro">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="chkVih">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="chkSero">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="chkHepB">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="chkHepC">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="chkCH">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="chkCrea">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="chkHemGli">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="chkOtro">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="chkCultivo">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="chkBaciloscopia">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
				</UpdatedControls>
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnGuardarInfo">
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnEliminarUro">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
					<telerik:AjaxUpdatedControl ControlID="chkUro" />
				</UpdatedControls>
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnEliminarVih">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
					<telerik:AjaxUpdatedControl ControlID="chkVih" />
				</UpdatedControls>
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnEliminarSerologia">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
					<telerik:AjaxUpdatedControl ControlID="chkSero" />
				</UpdatedControls>
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnEliminarHepB">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
					<telerik:AjaxUpdatedControl ControlID="chkHepB" />
				</UpdatedControls>
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnEliminarHepC">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
					<telerik:AjaxUpdatedControl ControlID="chkHepC" />
				</UpdatedControls>
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnEliminarCuadroHematico">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
					<telerik:AjaxUpdatedControl ControlID="chkCH" />
				</UpdatedControls>
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnEliminarCreatinina">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
					<telerik:AjaxUpdatedControl ControlID="chkCrea" />
				</UpdatedControls>
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnEliminarHemGli">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
					<telerik:AjaxUpdatedControl ControlID="chkHemGli" />
				</UpdatedControls>
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnEliminarOtro">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
					<telerik:AjaxUpdatedControl ControlID="chkOtro" />
				</UpdatedControls>
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnEliminarCultivo">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
					<telerik:AjaxUpdatedControl ControlID="chkCultivo" />
				</UpdatedControls>
			</telerik:AjaxSetting>

			<telerik:AjaxSetting AjaxControlID="rbtnEliminarBacilo">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rmpContenidoExamnes" />
					<telerik:AjaxUpdatedControl ControlID="rtsPanelesExamenes" />
					<telerik:AjaxUpdatedControl ControlID="chkBaciloscopia" />
				</UpdatedControls>
			</telerik:AjaxSetting>
		</AjaxSettings>
	</telerik:RadAjaxManager>

	<telerik:RadAjaxLoadingPanel ID="ralpImage" runat="server" IsSticky="true" Style="position: absolute; top: 0; left: 0; height: 100%; width: 100%;" />

	<div class="row">

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="titulo">
				Información Paciente
			</div>
			<div class="col-lg-2 col-md-2 col-sm-3 col-xs-12" style="float: right;">
				<div class="imgPrePhoto centeredControl">
					<telerik:RadBinaryImage ID="imgPrePhoto" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Resources/DefaultImage.jpg" />
					<asp:HiddenField ID="hfIdHist" runat="server" />
				</div>
			</div>
			<div class="col-lg-10 col-md-10 col-sm-9 col-xs-12">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Nombre
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtNombres" runat="server" ReadOnly="true" Width="90%" />
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Fecha
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadDatePicker ID="rdpFecha" runat="server" MinDate="1900-01-01" Width="90%">
								<Calendar ID="cFecha" runat="server" FirstDayOfWeek="Sunday" />
								<DateInput ID="diFecha" runat="server" DisplayDateFormat="yyyy/MM/dd" ReadOnly="true" />
							</telerik:RadDatePicker>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
						Nombre Medico Asignado
					</div>
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
						<asp:Label ID="lblNombreMedico" runat="server"></asp:Label>
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
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow controlPair">
					<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
						Comentarios
					</div>
					<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
						<telerik:RadTextBox ID="rtxtComentarioLab" runat="server" MaxLength="8000" TextMode="MultiLine" Rows="3" Width="90%" />
					</div>
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
				<telerik:RadButton ID="rbtnGuardarInfo" runat="server" Text="Almacenar estado y comentarios" OnClick="rbtnGuardarInfo_Click" />
				<telerik:RadButton ID="btnShowAbstract" AutoPostBack="false" runat="server" Text="Mostrar resumen de examenes" OnClientClicked="ViewExamsAbstract" />
				<asp:HiddenField ID="hfCodigo" runat="server" />
				<asp:HiddenField ID="hfEdad" runat="server" />
			</div>

			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow controlPair">
				<asp:CheckBox ID="chkUro" runat="server" AutoPostBack="true" CausesValidation="false" Text="Uroanálisis" OnCheckedChanged="chkUro_CheckedChanged" CssClass="chBx" />

				<asp:CheckBox ID="chkVih" runat="server" AutoPostBack="true" CausesValidation="false" Text="VIH" OnCheckedChanged="chkVih_CheckedChanged" CssClass="chBx" />

				<asp:CheckBox ID="chkSero" runat="server" AutoPostBack="true" CausesValidation="false" Text="Serología" OnCheckedChanged="chkSero_CheckedChanged" CssClass="chBx" />

				<asp:CheckBox ID="chkHepB" runat="server" AutoPostBack="true" CausesValidation="false" Text="HBS Ag" OnCheckedChanged="chkHepB_CheckedChanged" CssClass="chBx" />

				<asp:CheckBox ID="chkHepC" runat="server" AutoPostBack="true" CausesValidation="false" Text="HepatitisC" OnCheckedChanged="chkHepC_CheckedChanged" CssClass="chBx" />

				<asp:CheckBox ID="chkCH" runat="server" AutoPostBack="true" CausesValidation="false" Text="Cuadro Hemático" OnCheckedChanged="chkCH_CheckedChanged" CssClass="chBx" />

				<asp:CheckBox ID="chkCrea" runat="server" AutoPostBack="true" CausesValidation="false" Text="Creatinina" OnCheckedChanged="chkCrea_CheckedChanged" CssClass="chBx" />

				<asp:CheckBox ID="chkHemGli" runat="server" AutoPostBack="true" CausesValidation="false" Text="Hemoglobina Glicosilada" OnCheckedChanged="chkHemGli_CheckedChanged" CssClass="chBx" />

				<asp:CheckBox ID="chkOtro" runat="server" AutoPostBack="true" CausesValidation="false" Text="Otro" OnCheckedChanged="chkOtro_CheckedChanged" CssClass="chBx" />

				<asp:CheckBox ID="chkCultivo" runat="server" AutoPostBack="true" CausesValidation="false" Text="Cultivos" OnCheckedChanged="chkCultivo_CheckedChanged" CssClass="chBx" />

				<asp:CheckBox ID="chkBaciloscopia" runat="server" AutoPostBack="true" CausesValidation="false" Text="Baciloscopias" OnCheckedChanged="chkBaciloscopia_CheckedChanged" CssClass="chBx" />
			</div>
		</div>
	</div>

	<telerik:RadTabStrip ID="rtsPanelesExamenes" runat="server" MultiPageID="rmpContenidoExamnes" SelectedIndex="0" Align="Center" Skin="Default" Width="100%">
		<Tabs>
			<telerik:RadTab Text="Uroanálisis" Width="200" Visible="false" Value="1" Font-Bold="true"></telerik:RadTab>
			<telerik:RadTab Text="VIH" Width="200" Visible="false" Value="2" Font-Bold="true"></telerik:RadTab>
			<telerik:RadTab Text="Serología (VDRL)" Width="200" Visible="false" Value="3" Font-Bold="true"></telerik:RadTab>
			<telerik:RadTab Text="HBS Ag" Width="200" Visible="false" Value="4" Font-Bold="true"></telerik:RadTab>
			<telerik:RadTab Text="Hepatitis C" Width="200" Visible="false" Value="5" Font-Bold="true"></telerik:RadTab>
			<telerik:RadTab Text="Cuadro Hemático" Width="200" Visible="false" Value="6" Font-Bold="true"></telerik:RadTab>
			<telerik:RadTab Text="Creatinina" Width="200" Visible="false" Value="7" Font-Bold="true"></telerik:RadTab>
			<telerik:RadTab Text="Hemoglobina Glicosilada" Width="200" Visible="false" Value="8" Font-Bold="true"></telerik:RadTab>
			<telerik:RadTab Text="Otro" Width="200" Visible="false" Value="9" Font-Bold="true"></telerik:RadTab>
			<telerik:RadTab Text="Cultivos" Width="200" Visible="false" Value="10" Font-Bold="true"></telerik:RadTab>
			<telerik:RadTab Text="Baciloscopias" Width="200" Visible="false" Value="11" Font-Bold="true"></telerik:RadTab>
		</Tabs>
	</telerik:RadTabStrip>
	<telerik:RadMultiPage ID="rmpContenidoExamnes" runat="server" SelectedIndex="0" Width="100%">
		<telerik:RadPageView runat="server" ID="rpvUrologia" Width="100%" Visible="false">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<asp:HiddenField ID="hfIdMuestraUrol" runat="server" />
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="linia_arriba"></div>
					<div class="titulo">Uroanálisis</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 linia_estilo"></div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
						Estado
					</div>
					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
						<asp:RadioButtonList ID="rblEstadoUro" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Text="Sin Aplicar" class="chbxSinAplicar" Value="2" Selected="True"></asp:ListItem>
							<asp:ListItem Text="Normal" class="chbxNormal" Value="0"></asp:ListItem>
							<asp:ListItem Text="Anormal" class="chbxAnormal" Value="1"></asp:ListItem>
						</asp:RadioButtonList>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"></div>
					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"></div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12">
						Exámen Físico
					</div>
					<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12">
						Exámen Microquímico
					</div>
					<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12">
						Exámen Microscópico
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							Olor:
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtOlor" runat="server" MaxLength="20" Width="100px" Text="S.G." Font-Names="Verdana"></telerik:RadTextBox>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							Color:
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtColor" runat="server" MaxLength="20" Width="100px" Font-Names="Verdana"></telerik:RadTextBox>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							Aspecto:
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtAspecto" runat="server" MaxLength="20" Width="100" Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							GLU:
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtGLU" runat="server" MaxLength="20" Width="100" Text="NEGATIVO"
								Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							BIL:
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtBIL" runat="server" MaxLength="20" Width="100" Text="NEGATIVO"
								Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							CET:
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtCET" runat="server" MaxLength="20" Width="100" Text="NEGATIVO"
								Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							DEN:
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtDEN" runat="server" MaxLength="20" Width="100" Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							PH:
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtPH" runat="server" MaxLength="20" Width="100" Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							PRO:
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtPRO" runat="server" MaxLength="20" Width="100" Text="NEGATIVO"
								Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							URO:
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtUro" runat="server" MaxLength="20" Width="100" Text="Normal" class="chbxNormal"
								Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							NIT:
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtNIT" runat="server" MaxLength="20" Width="100" Text="NEGATIVO"
								Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							SAN:
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtSAN" runat="server" MaxLength="20" Width="100" Text="NEGATIVO"
								Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							LEU:
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtLEU" runat="server" MaxLength="20" Width="100" Text="NEGATIVO"
								Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
						<div class="col-lg-6 col-md-4 col-sm-12 col-xs-12">
							Leucocitos por campo:
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtLeucoCampo" runat="server" MaxLength="20" Width="100"
								Text="" Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							Hematies por campo:
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtHematiesCampo" runat="server" MaxLength="20" Width="100"
								Text="NEGATIVO" Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							Células altas por campo:
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtCelAltasCampo" runat="server" MaxLength="20" Width="100"
								Text="NEGATIVO" Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							Células bajas por campo:
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtCelBajasCampo" runat="server" MaxLength="20" Width="100"
								Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							Moco:
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtMoco" runat="server" MaxLength="20" Width="100" Text="NEGATIVO"
								Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							Bacterias:
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtBacterias" runat="server" MaxLength="20" Width="100"
								Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							Cilindros:
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtCilindros" runat="server" MaxLength="20" Width="100"
								Text="NEGATIVO" Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							Cristales:
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtCristales" runat="server" MaxLength="20" Width="100"
								Text="NEGATIVO" Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							Levaduras:
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtLevaduras" runat="server" MaxLength="20" Width="100"
								Text="NEGATIVO" Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
							Otros:
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtOtros" runat="server" MaxLength="20" Width="100" Text="NEGATIVO"
								Font-Names="Verdana">
							</telerik:RadTextBox>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<telerik:RadButton ID="rbtnUrologia" runat="server" Text="Guardar información" OnClick="rbtnUrologia_Click" Font-Bold="True" Font-Names="Verdana"
						UseSubmitBehavior="False">
					</telerik:RadButton>
					<telerik:RadButton ID="rbtnLoadFileUro" runat="server" CausesValidation="false" UseSubmitBehavior="false" OnClientClicking="CargarFileUro"
						Text="Cargar Archivo" Visible="false">
					</telerik:RadButton>
					<telerik:RadButton ID="rbtnEliminarUro" runat="server" CausesValidation="false"
						UseSubmitBehavior="False" Text="Eliminar Muestra" OnClientClicking="ValidarEliminacion" OnClick="rbtnEliminarUro_Click">
					</telerik:RadButton>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<b>Comentarios</b>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtCommentUrol" runat="server" TextMode="MultiLine" Rows="5" Width="90%" Font-Names="Verdana"></telerik:RadTextBox>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<telerik:RadGrid ID="rgUrol" runat="server" OnNeedDataSource="rgUrol_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:AbrirArchivo({0});" Text="Abrir archivo">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Nombre Adjunto" DataField="NOMBRE_ADJUNTO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="60%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario que adjunto" DataField="CREACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<telerik:RadGrid ID="rgUroAnt" runat="server" OnNeedDataSource="rgUroAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="20%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="40%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>

			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"></div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvHIV" Width="100%" Visible="false">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<asp:HiddenField ID="hfIdMuestraVIH" runat="server" />
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<h1 class="titulo">VIH</h1>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					Estado
				</div>
				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<asp:RadioButtonList ID="rblEstadoVih" runat="server" RepeatDirection="Horizontal">
						<asp:ListItem Text="Sin Aplicar" class="chbxSinAplicar" Value="2" Selected="True"></asp:ListItem>
						<asp:ListItem Text="Normal" class="chbxNormal" Value="0"></asp:ListItem>
						<asp:ListItem Text="Anormal" class="chbxAnormal" Value="1"></asp:ListItem>
					</asp:RadioButtonList>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					(HIV 1 & 2)
                    <br />
					Técnica Inmunocromatográfica (rápida)
				</div>

				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					Resultado
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<telerik:RadComboBox ID="rcbxVIHResult" runat="server" Filter="Contains" MarkFirstMatch="true" Width="200px" Font-Names="Verdana">
						<Items>
							<telerik:RadComboBoxItem Text="[Seleccione]" Value="" />
							<telerik:RadComboBoxItem Text="POSITIVO" Value="POSITIVO" />
							<telerik:RadComboBoxItem Text="NEGATIVO" Value="NEGATIVO" />
						</Items>
					</telerik:RadComboBox>
					<asp:RequiredFieldValidator ID="rfvVIH" runat="server" ControlToValidate="rcbxVIHResult" Text="Debe indicar un resultado para el análisis"
						InitialValue="[Seleccione]" ValidationGroup="VIH">
					</asp:RequiredFieldValidator>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					Prueba presuntiva sujeta a confirmación
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<telerik:RadButton ID="rbtnGuardarVIH" runat="server" CausesValidation="true" ValidationGroup="VIH" Text="Guardar información"
						OnClick="rbtnGuardarVIH_Click">
					</telerik:RadButton>
					<telerik:RadButton ID="rbtnLoadFileVih" runat="server" CausesValidation="false" UseSubmitBehavior="false" OnClientClicking="CargarFileVih"
						Text="Cargar Archivo" Visible="false">
					</telerik:RadButton>
					<telerik:RadButton ID="rbtnEliminarVih" runat="server" CausesValidation="false" UseSubmitBehavior="False" Text="Eliminar Muestra" OnClientClicking="ValidarEliminacion"
						OnClick="rbtnEliminarVih_Click">
					</telerik:RadButton>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<b>Comentarios</b>
				</div>
				<div class="col-lg-12 col-md-10 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtComentVIH" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana"></telerik:RadTextBox>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<telerik:RadGrid ID="rgVih" runat="server" OnNeedDataSource="rgVih_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">
							<Columns>
								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:AbrirArchivo({0});" Text="Abrir archivo">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Nombre Adjunto" DataField="NOMBRE_ADJUNTO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="60%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario que adjunto" DataField="CREACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<telerik:RadGrid ID="rgVihAnt" runat="server" OnNeedDataSource="rgVihAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="20%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="40%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvVDRL" Width="100%" Visible="false">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<asp:HiddenField ID="hfIdMuestraSero" runat="server" />
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"></div>

				<div class="titulo">Serología VDRL</div>

				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					Estado
				</div>

				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<asp:RadioButtonList ID="rblEstadoSero" runat="server" RepeatDirection="Horizontal">
						<asp:ListItem Text="Sin Aplicar" class="chbxSinAplicar" Value="2" Selected="True"></asp:ListItem>
						<asp:ListItem Text="Normal" class="chbxNormal" Value="0"></asp:ListItem>
						<asp:ListItem Text="Anormal" class="chbxAnormal" Value="1"></asp:ListItem>
					</asp:RadioButtonList>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					Resultado
				</div>
				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<telerik:RadComboBox ID="rcbxSero" runat="server" Filter="Contains" MarkFirstMatch="true"
						Width="200px" Font-Names="Verdana" CausesValidation="false">
						<Items>
							<telerik:RadComboBoxItem Text="[Seleccione]" Value="" />
							<telerik:RadComboBoxItem Text="REACTIVO" Value="REACTIVO" />
							<telerik:RadComboBoxItem Text="NO REACTIVO" Value="NO_REACTIVO" />
						</Items>
					</telerik:RadComboBox>
					<asp:RequiredFieldValidator ID="rfvSero" runat="server" ControlToValidate="rcbxSero" Text="Debe indicar un resultado para el análisis" InitialValue="[Seleccione]" ValidationGroup="Serologia"></asp:RequiredFieldValidator>
				</div>

				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					<asp:Label ID="lblValSer" runat="server" Visible="True" CssClass="fuente">Valor: </asp:Label>
				</div>
				<div id="contnumSer" class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<telerik:RadNumericTextBox ID="rntValorSero" runat="server" MinValue="0" MaxLength="5" MaxValue="500" Visible="True" Width="195px" Font-Names="Verdana">
						<NumberFormat DecimalDigits="2" AllowRounding="false" />
					</telerik:RadNumericTextBox>
					<asp:Label ID="lblUnitValSer" runat="server" Visible="True" CssClass="fuente">dils</asp:Label>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<telerik:RadButton ID="rbtnGuardarSerologia" runat="server" CausesValidation="true" ValidationGroup="Serologia" Text="Guardar información"
						OnClick="rbtnGuardarSerologia_Click">
					</telerik:RadButton>

					<telerik:RadButton ID="rbtnLoadFileSero" runat="server" CausesValidation="false" UseSubmitBehavior="false" OnClientClicking="CargarFileSero"
						Text="Cargar Archivo" Visible="false">
					</telerik:RadButton>

					<telerik:RadButton ID="rbtnEliminarSerologia" runat="server" CausesValidation="false"
						UseSubmitBehavior="False" Text="Eliminar Muestra" OnClientClicking="ValidarEliminacion" OnClick="rbtnEliminarSerologia_Click">
					</telerik:RadButton>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					Observaciones:
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtComentarioSerol" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana"></telerik:RadTextBox>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<telerik:RadGrid ID="rgSero" runat="server" OnNeedDataSource="rgSero_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:AbrirArchivo({0});" Text="Abrir archivo">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Nombre Adjunto" DataField="NOMBRE_ADJUNTO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="60%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario que adjunto" DataField="CREACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<telerik:RadGrid ID="rgSeroAnt" runat="server" OnNeedDataSource="rgSeroAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="20%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Valor" DataField="VALOR" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="10%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="30%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvHepatitisB" Width="100%" Visible="false">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<asp:HiddenField ID="hfIdMuestraHepB" runat="server" />
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="titulo">Hepatitis B</div>
				</div>

				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">Estado</div>

				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<asp:RadioButtonList ID="rblEstadoHepaB" runat="server" RepeatDirection="Horizontal">
						<asp:ListItem Text="Sin Aplicar" class="chbxSinAplicar" Value="2" Selected="True"></asp:ListItem>
						<asp:ListItem Text="Normal" class="chbxNormal" Value="0"></asp:ListItem>
						<asp:ListItem Text="Anormal" class="chbxAnormal" Value="1"></asp:ListItem>
					</asp:RadioButtonList>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					HBS ag
                    <br />
					Técnica Inmunocromatográfica (rápida)
				</div>
				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					Resultado
				</div>
				<div class="col-lg-10 col-md-8 col-sm-12 col-xs-12">
					<telerik:RadComboBox ID="rcbxHepB" runat="server" Filter="Contains" MarkFirstMatch="true" Width="200px" Font-Names="Verdana">
						<Items>
							<telerik:RadComboBoxItem Text="[Seleccione]" Value="" />
							<telerik:RadComboBoxItem Text="POSITIVO" Value="POSITIVO" />
							<telerik:RadComboBoxItem Text="NEGATIVO" Value="NEGATIVO" />
						</Items>
					</telerik:RadComboBox>
					<asp:RequiredFieldValidator ID="rfvHepB" runat="server" ControlToValidate="rcbxHepB" Text="Debe indicar un resultado para el análisis"
						InitialValue="[Seleccione]" ValidationGroup="HepB">
					</asp:RequiredFieldValidator>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					Prueba presuntiva sujeta a confirmación
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<telerik:RadButton ID="rbtnHepB" runat="server" Text="Guardar información" CausesValidation="true" ValidationGroup="HepB" OnClick="rbtnHepB_Click">
					</telerik:RadButton>
					<telerik:RadButton ID="rbtnLoadFileHepaB" runat="server" CausesValidation="false" UseSubmitBehavior="false" OnClientClicking="CargarFileHepaB"
						Text="Cargar Archivo" Visible="false">
					</telerik:RadButton>
					<telerik:RadButton ID="rbtnEliminarHepB" runat="server" CausesValidation="false"
						UseSubmitBehavior="False" Text="Eliminar Muestra" OnClientClicking="ValidarEliminacion" OnClick="rbtnEliminarHepB_Click">
					</telerik:RadButton>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<b>Comentarios</b>
				</div>
				<div class="col-lg-12 col-md-10 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtCommentHepB" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana"></telerik:RadTextBox>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<telerik:RadGrid ID="rgHepB" runat="server" OnNeedDataSource="rgHepB_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:AbrirArchivo({0});" Text="Abrir archivo">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Nombre Adjunto" DataField="NOMBRE_ADJUNTO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="60%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario que adjunto" DataField="CREACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<telerik:RadGrid ID="rgHepBAnt" runat="server" OnNeedDataSource="rgHepBAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="20%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="40%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvHepC" Width="100%" Visible="false">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<asp:HiddenField ID="hfIdMuestraHepC" runat="server" />
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="titulo">Hepatitis C</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					Estado
				</div>
				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<asp:RadioButtonList ID="rblEstadoHepaC" runat="server" RepeatDirection="Horizontal">
						<asp:ListItem Text="Sin Aplicar" class="chbxSinAplicar" Value="2" Selected="True"></asp:ListItem>
						<asp:ListItem Text="Normal" class="chbxNormal" Value="0"></asp:ListItem>
						<asp:ListItem Text="Anormal" class="chbxAnormal" Value="1"></asp:ListItem>
					</asp:RadioButtonList>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					Técnica Inmunocromatográfica (rápida)
				</div>
				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					Resultado
				</div>
				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<telerik:RadComboBox ID="rcbxHepC" runat="server" Filter="Contains" MarkFirstMatch="true" Width="200px" Font-Names="Verdana">
						<Items>
							<telerik:RadComboBoxItem Text="[Seleccione]" Value="" />
							<telerik:RadComboBoxItem Text="POSITIVO" Value="POSITIVO" />
							<telerik:RadComboBoxItem Text="NEGATIVO" Value="NEGATIVO" />
						</Items>
					</telerik:RadComboBox>
					<asp:RequiredFieldValidator ID="rfvHepC" runat="server" ControlToValidate="rcbxHepC" Text="Debe indicar un resultado para el análisis"
						InitialValue="[Seleccione]" ValidationGroup="HepC"></asp:RequiredFieldValidator>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					Prueba presuntiva sujeta a<br />
					confirmación
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<telerik:RadButton ID="rbtnHepC" runat="server" Text="Guardar información" CausesValidation="true" ValidationGroup="HepC" OnClick="rbtnHepC_Click">
					</telerik:RadButton>
					<telerik:RadButton ID="rbtnLoadFileHepaC" runat="server" CausesValidation="false" UseSubmitBehavior="false" OnClientClicking="CargarFileHepaC"
						Text="Cargar Archivo" Visible="false">
					</telerik:RadButton>
					<telerik:RadButton ID="rbtnEliminarHepC" runat="server" CausesValidation="false"
						UseSubmitBehavior="False" Text="Eliminar Muestra" OnClientClicking="ValidarEliminacion" OnClick="rbtnEliminarHepC_Click">
					</telerik:RadButton>
					<div class="spacio"></div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<b>Comentarios</b>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtCommentHepC" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana"></telerik:RadTextBox>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<telerik:RadGrid ID="rgHepC" runat="server" OnNeedDataSource="rgHepC_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:AbrirArchivo({0});" Text="Abrir archivo">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Nombre Adjunto" DataField="NOMBRE_ADJUNTO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="60%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario que adjunto" DataField="CREACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<telerik:RadGrid ID="rgHepCAnt" runat="server" OnNeedDataSource="rgHepCAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="20%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="40%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvCuadroHematico" Width="1200px" Visible="false">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<asp:HiddenField ID="hfIdMuestraCH" runat="server" />
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="titulo">Cuadro Hemático</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					Estado
				</div>
				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<asp:RadioButtonList ID="rblEstadoCH" runat="server" RepeatDirection="Horizontal">
						<asp:ListItem Text="Sin Aplicar" class="chbxSinAplicar" Value="2" Selected="True"></asp:ListItem>
						<asp:ListItem Text="Normal" class="chbxNormal" Value="0"></asp:ListItem>
						<asp:ListItem Text="Anormal" class="chbxAnormal" Value="1"></asp:ListItem>
					</asp:RadioButtonList>
				</div>

				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					Resultado
				</div>
				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<telerik:RadComboBox ID="rcbxCuadroHematico" runat="server" Filter="Contains" MarkFirstMatch="true" Width="200px" Font-Names="Verdana">
						<Items>
							<telerik:RadComboBoxItem Text="[Seleccione]" Value="" />
							<telerik:RadComboBoxItem Text="Normal" class="chbxNormal" Value="NORMAL" />
							<telerik:RadComboBoxItem Text="Anormal" class="chbxAnormal" Value="ANORMAL" />
						</Items>
					</telerik:RadComboBox>

					<asp:RequiredFieldValidator ID="rfvCuadroHematico" runat="server" ControlToValidate="rcbxCuadroHematico"
						InitialValue="[Seleccione]" Text="Debe indicar un resultado para el análisis"
						ValidationGroup="PruEmb">
					</asp:RequiredFieldValidator>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<telerik:RadButton ID="rbtnCuadroHematico" runat="server" CausesValidation="true"
						ValidationGroup="PruEmb" Text="Guardar información" OnClick="rbtnCuadroHematico_Click">
					</telerik:RadButton>

					<telerik:RadButton ID="rbtnLoadFileCH" runat="server" CausesValidation="false" UseSubmitBehavior="false"
						OnClientClicking="CargarFileCH" Text="Cargar Archivo" Font-Bold="True" Font-Names="Verdana"
						Visible="false">
					</telerik:RadButton>

					<telerik:RadButton ID="rbtnEliminarCuadroHematico" runat="server" CausesValidation="false"
						UseSubmitBehavior="False" Text="Eliminar Muestra" OnClientClicking="ValidarEliminacion" OnClick="rbtnEliminarCuadroHematico_Click">
					</telerik:RadButton>
					<div class="spacio"></div>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<b>Comentarios</b>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtComentarioCH" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana">
					</telerik:RadTextBox>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<telerik:RadGrid ID="rgCH" runat="server" OnNeedDataSource="rgCH_NeedDataSource" AutoGenerateColumns="false" Culture="es-CO">
						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:AbrirArchivo({0});" Text="Abrir archivo">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Nombre Adjunto" DataField="NOMBRE_ADJUNTO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="60%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario que adjunto" DataField="CREACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<telerik:RadGrid ID="rgCHAnt" runat="server" OnNeedDataSource="rgCHAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="20%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="40%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvCreatinina" Width="1200px" Visible="false">
			<div class="container">

				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<asp:HiddenField ID="hfIdMuestraCreatinina" runat="server" />
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="titulo">Creatinina</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
						Estado
					</div>
					<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
						<asp:RadioButtonList ID="rblEstadoCreat" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Text="Sin Aplicar" class="chbxSinAplicar" Value="2" Selected="True"></asp:ListItem>
							<asp:ListItem Text="Normal" class="chbxNormal" Value="0"></asp:ListItem>
							<asp:ListItem Text="Anormal" class="chbxAnormal" Value="1"></asp:ListItem>
						</asp:RadioButtonList>
					</div>
				</div>
				<div class="row">
				</div>
				<div class="row">
					<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
						Resultado
					</div>
					<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
						<telerik:RadComboBox ID="rcbxCreatinina" runat="server" Filter="Contains" MarkFirstMatch="true" Width="200px" CausesValidation="false" Font-Names="Verdana" OnClientSelectedIndexChanged="rcbxCreatinina_SelIndChang">
							<Items>
								<telerik:RadComboBoxItem Text="[Seleccione]" Value="" />
								<telerik:RadComboBoxItem Text="Normal" class="chbxNormal" Value="NORMAL" />
								<telerik:RadComboBoxItem Text="Anormal" class="chbxAnormal" Value="ANORMAL" />
							</Items>
						</telerik:RadComboBox>

						<asp:RequiredFieldValidator ID="rfvCreatinina" runat="server" ControlToValidate="rcbxCreatinina" Text="Debe indicar un resultado para el análisis" InitialValue="[Seleccione]"
							ValidationGroup="Creatinina">
						</asp:RequiredFieldValidator>
					</div>
				</div>
				<div class="row">
				</div>
				<div class="row" id="divLblValCrea">
					<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
						<asp:Label ID="lblValCrea" runat="server">Valor</asp:Label>
					</div>
					<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
						<telerik:RadNumericTextBox ID="rntValorCrea" runat="server" MinValue="0" MaxLength="5" Font-Names="Verdana" Width="195px">
							<NumberFormat DecimalDigits="2" AllowRounding="false" />
						</telerik:RadNumericTextBox>
						<asp:Label ID="lblUnitValCrea" runat="server">mg/dl</asp:Label>
					</div>
				</div>
				<div class="row">
				</div>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
						<telerik:RadButton ID="rbtnCreatinina" runat="server" CausesValidation="true" ValidationGroup="Creatinina"
							Text="Guardar información" OnClick="rbtnCreatinina_Click" Font-Bold="True" Font-Names="Verdana">
						</telerik:RadButton>

						<telerik:RadButton ID="rbtnLoadFileCre" runat="server" CausesValidation="false" UseSubmitBehavior="false"
							OnClientClicking="CargarFileCre" Text="Cargar Archivo" Font-Bold="True" Font-Names="Verdana"
							Visible="false">
						</telerik:RadButton>

						<telerik:RadButton ID="rbtnEliminarCreatinina" runat="server" CausesValidation="false"
							UseSubmitBehavior="False" Text="Eliminar Muestra" OnClientClicking="ValidarEliminacion" OnClick="rbtnEliminarCreatinina_Click">
						</telerik:RadButton>
						<div class="spacio">
						</div>
					</div>
				</div>
				<div class="row">
				</div>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<b>Comentarios</b>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<telerik:RadTextBox ID="rtxtComentarioCrea" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana"></telerik:RadTextBox>
					</div>
				</div>
				<div class="row">
				</div>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<h4><b>Archivos Adjuntos</b></h4>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<telerik:RadGrid ID="rgCrea" runat="server" OnNeedDataSource="rgCrea_NeedDataSource" AutoGenerateColumns="false">

							<PagerStyle AlwaysVisible="true" />

							<MasterTableView DataKeyNames="ID">

								<Columns>

									<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:AbrirArchivo({0});" Text="Abrir archivo">
										<ItemStyle Width="10%" />
									</telerik:GridHyperLinkColumn>

									<telerik:GridBoundColumn HeaderText="Nombre Adjunto" DataField="NOMBRE_ADJUNTO" UniqueName="Adjunto" DataType="System.String">
										<ItemStyle Width="60%" />
									</telerik:GridBoundColumn>

									<telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor" DataType="System.DateTime">
										<ItemStyle Width="15%" />
									</telerik:GridBoundColumn>

									<telerik:GridBoundColumn HeaderText="Usuario que adjunto" DataField="CREACION" UniqueName="Usuario" DataType="System.String">
										<ItemStyle Width="15%" />
									</telerik:GridBoundColumn>
								</Columns>
							</MasterTableView>
						</telerik:RadGrid>
					</div>
				</div>
				<div class="row">
				</div>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
						<h4><b>Muestras Anteriores</b></h4>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

						<telerik:RadGrid ID="rgCreaAnt" runat="server" OnNeedDataSource="rgCreaAnt_NeedDataSource" AutoGenerateColumns="false">

							<PagerStyle AlwaysVisible="true" />

							<MasterTableView DataKeyNames="ID">

								<Columns>

									<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
										<ItemStyle Width="10%" />
									</telerik:GridHyperLinkColumn>

									<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
										<ItemStyle Width="20%" />
									</telerik:GridBoundColumn>

									<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
										<ItemStyle Width="40%" />
									</telerik:GridBoundColumn>

									<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
										<ItemStyle Width="15%" />
									</telerik:GridBoundColumn>

									<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
										<ItemStyle Width="15%" />
									</telerik:GridBoundColumn>
								</Columns>
							</MasterTableView>
						</telerik:RadGrid>
					</div>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvHemoGli" Width="100%" Visible="false">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<asp:HiddenField ID="hfIdMuestraHemGli" runat="server" />
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="titulo">Hemoglobina Glicosilada</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					Estado
				</div>
				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<asp:RadioButtonList ID="rblEstadoHemGli" runat="server" RepeatDirection="Horizontal">
						<asp:ListItem Text="Sin Aplicar" class="chbxSinAplicar" Value="2" Selected="True"></asp:ListItem>
						<asp:ListItem Text="Normal" class="chbxNormal" Value="0"></asp:ListItem>
						<asp:ListItem Text="Anormal" class="chbxAnormal" Value="1"></asp:ListItem>
					</asp:RadioButtonList>
				</div>

				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					<asp:Label ID="lblValHemGli" runat="server">Valor</asp:Label>
				</div>
				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<telerik:RadNumericTextBox ID="rntValorHemGli" runat="server" MinValue="0" MaxLength="5" MaxValue="100" Font-Names="Verdana" Width="195px">
						<NumberFormat DecimalDigits="2" AllowRounding="false" />
					</telerik:RadNumericTextBox>
					<asp:Label ID="lblUnitValHemGli" runat="server">%</asp:Label>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<telerik:RadButton ID="rbtnHemGli" runat="server" CausesValidation="true" ValidationGroup="HemoglobinaGlicosilada"
						Text="Guardar información" OnClick="rbtnHemGli_Click" Font-Bold="True" Font-Names="Verdana">
					</telerik:RadButton>

					<telerik:RadButton ID="rbtnLoadFileHemGli" runat="server" CausesValidation="false"
						UseSubmitBehavior="false" OnClientClicking="CargarFileHemGli" Text="Cargar Archivo"
						Visible="false">
					</telerik:RadButton>

					<telerik:RadButton ID="rbtnEliminarHemGli" runat="server" CausesValidation="false"
						UseSubmitBehavior="False" Text="Eliminar Muestra" OnClientClicking="ValidarEliminacion" OnClick="rbtnEliminarHemGli_Click">
					</telerik:RadButton>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<b>Comentarios</b>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtComentarioHemGli" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana"></telerik:RadTextBox>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<telerik:RadGrid ID="rgHemGli" runat="server" OnNeedDataSource="rgHemGli_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:AbrirArchivo({0});" Text="Abrir archivo">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Nombre Adjunto" DataField="NOMBRE_ADJUNTO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="60%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario que adjunto" DataField="CREACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<telerik:RadGrid ID="rgHemGliAnt" runat="server" OnNeedDataSource="rgHemGliAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Valor" DataField="VALOR" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="20%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="40%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvOtro" Width="1200px" Visible="false">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<asp:HiddenField ID="hfIdMuestraOtro" runat="server" />
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="titulo">Exámenes Complementarios</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					Estado
				</div>
				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<asp:RadioButtonList ID="rblEstadoOtro" runat="server" RepeatDirection="Horizontal">
						<asp:ListItem Text="Sin Aplicar" class="chbxSinAplicar" Value="2" Selected="True"></asp:ListItem>
						<asp:ListItem Text="Normal" class="chbxNormal" Value="0"></asp:ListItem>
						<asp:ListItem Text="Anormal" class="chbxAnormal" Value="1"></asp:ListItem>
					</asp:RadioButtonList>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					Descripcion:
				</div>
				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtOtroDesc" runat="server" MaxLength="8000" TextMode="MultiLine" Rows="5" Columns="150" Width="95%" Font-Names="Verdana"></telerik:RadTextBox>

					<asp:RequiredFieldValidator ID="rfvOtroDesc" runat="server" ControlToValidate="rtxtOtroDesc" Text="Debe dar una descripción para el exámen" ValidationGroup="Otro"></asp:RequiredFieldValidator>
				</div>

				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					Resultado:
				</div>
				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtOtroResultado" runat="server" MaxLength="8000" TextMode="MultiLine" Rows="5" Columns="150" Width="95%" Font-Names="Verdana"></telerik:RadTextBox>

					<asp:RequiredFieldValidator ID="rfvOtroResultado" runat="server" ControlToValidate="rtxtOtroResultado" Text="Debe indicar un resultado para el exámen" ValidationGroup="Otro"></asp:RequiredFieldValidator>
				</div>

				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
					Observaciones:
				</div>
				<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtOtroComentario" runat="server" MaxLength="8000" TextMode="MultiLine" Rows="5" Columns="150" Width="95%" Font-Names="Verdana"></telerik:RadTextBox>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<telerik:RadButton ID="rbtnOtroGuardar" runat="server" CausesValidation="true" ValidationGroup="Otro" Text="Guardar Información" OnClick="rbtnOtroGuardar_Click" Font-Bold="True" Font-Names="Verdana">
					</telerik:RadButton>

					<telerik:RadButton ID="rbtnLoadFileOtro" runat="server" CausesValidation="false" UseSubmitBehavior="false" OnClientClicking="CargarFileOtro" Text="Cargar Archivo"
						Visible="false">
					</telerik:RadButton>

					<telerik:RadButton ID="rbtnEliminarOtro" runat="server" CausesValidation="false"
						UseSubmitBehavior="False" Text="Eliminar Muestra" OnClientClicking="ValidarEliminacion" OnClick="rbtnEliminarOtro_Click">
					</telerik:RadButton>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<telerik:RadGrid ID="rgOtro" runat="server" OnNeedDataSource="rgOtro_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:AbrirArchivo({0});" Text="Abrir archivo">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Nombre Adjunto" DataField="NOMBRE_ADJUNTO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="60%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario que adjunto" DataField="CREACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<telerik:RadGrid ID="rgOtroAnt" runat="server" OnNeedDataSource="rgOtroAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Descripcion" DataField="DESCRIPCION" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="20%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="20%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="20%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView ID="rpvCultivo" runat="server" Width="1200px" Visible="false">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<asp:HiddenField ID="hfIdMuestraCultivo" runat="server" />
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="titulo">Cultivos</div>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<telerik:RadButton ID="rbtnAddCultivo" runat="server" Text="Agregar nueva informacion" CausesValidation="false" UseSubmitBehavior="false" OnClick="rbtnAddCultivo_Click"></telerik:RadButton>

					<telerik:RadButton ID="rbtnAddFileCult" runat="server" Text="Agregar informacion" CausesValidation="false" UseSubmitBehavior="false" Visible="false" OnClientClicking="CargarFileCultivo"></telerik:RadButton>

					<telerik:RadButton ID="rbtnEliminarCultivo" runat="server" CausesValidation="false" UseSubmitBehavior="False" Text="Eliminar Muestra"
						OnClientClicking="ValidarEliminacion" OnClick="rbtnEliminarCultivo_Click">
					</telerik:RadButton>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<telerik:RadGrid ID="rgCultivos" runat="server" OnNeedDataSource="rgCultivos_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:AbrirArchivo({0});" Text="Abrir archivo">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Nombre Adjunto" DataField="NOMBRE_ADJUNTO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="60%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario que adjunto" DataField="CREACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<telerik:RadGrid ID="rgCultivosAnt" runat="server" OnNeedDataSource="rgCultivosAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="60%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="30%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView ID="rpvBaciloscopia" runat="server" Width="1200px" Visible="false">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<asp:HiddenField ID="hfIdMuestraBaciloscopia" runat="server" />
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="titulo">Baciloscopias</div>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<telerik:RadButton ID="rbtnAddBaciloscopia" runat="server" Text="Agregar nueva informacion" CausesValidation="false" UseSubmitBehavior="false" OnClick="rbtnAddBaciloscopia_Click"></telerik:RadButton>

					<telerik:RadButton ID="rbtnAddFileBacilo" runat="server" Text="Agregar informacion" CausesValidation="false" UseSubmitBehavior="false" Visible="false" OnClientClicking="CargarFileBaciloscopia"></telerik:RadButton>

					<telerik:RadButton ID="rbtnEliminarBacilo" runat="server" CausesValidation="false" UseSubmitBehavior="False" Text="Eliminar Muestra"
						OnClientClicking="ValidarEliminacion" OnClick="rbtnEliminarBacilo_Click">
					</telerik:RadButton>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<telerik:RadGrid ID="rgBacilo" runat="server" OnNeedDataSource="rgBacilo_NeedDataSource" AutoGenerateColumns="false" Culture="es-co">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:AbrirArchivo({0});" Text="Abrir archivo">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Nombre Adjunto" DataField="NOMBRE_ADJUNTO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="60%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario que adjunto" DataField="CREACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="15%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<telerik:RadGrid ID="rgBaciloAnt" runat="server" OnNeedDataSource="rgBaciloAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="10%" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="60%" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="30%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>
	</telerik:RadMultiPage>
	<asp:HiddenField ID="nombreLaboratorio" runat="server" />
	<asp:HiddenField ID="nombreBacteriologo" runat="server" />
	<asp:HiddenField ID="universidad" runat="server" />
	<asp:HiddenField ID="firmaBase64" runat="server" />
	<asp:HiddenField ID="direccionLaboratorio" runat="server" />
	<asp:HiddenField ID="ciudad" runat="server" />
	<asp:HiddenField ID="telefonoLaboratorio" runat="server" />
	<asp:HiddenField ID="faxLaboratorio" runat="server" />
	<asp:HiddenField ID="correoElectBacteriologo" runat="server" />
	<asp:HiddenField ID="registroProfesional" runat="server" />
	<!--Inicio de la tabla resumen en español-->
	<div id="examsLayout" hasbeenprinted="notANumber" style="margin: 0 auto;">
		<div id="HeaderTable" style="margin-top: 10px; margin-bottom: 10px;">
			<div class="row">
				<div class="col-lg-4">
					<p>
						<span id="spNomLaboratorio" style="font-family: 'Avenir'; font-size: 14px; font-weight: 700">Laboratorio Clínico</span>
					</p>
					<p>
						<span id="spNomBacteriologo1" style="font-family: 'Avenir'; font-size: 12px; font-weight: 600">Doctora Yadira Isabel Granda Vanegas</span>
					</p>
					<p style="font-family: 'Avenir'; font-size: 10px; font-weight: 500">
						Bacterióloga <span id="spUniversidad1">Bacteriologo Colegio Mayor de Cundinamarca</span>
					</p>
				</div>
				<div class="col-lg-4 text-center">
					<img src="../Resources/Logos/imgImpresion.jpg" class="logo-central" alt="Logo labratorio" />
				</div>

				<div class="col-lg-4 text-right">
					<div id="imgContainer" class="imgCont"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6" style="left: 450px; top: 10px">
					<div style="font-family: 'Avenir'; font-weight: 700">
						Informe de Análisis
					</div>
					<p>
						<strong>Fecha: </strong><span id="spFecha"></span>
					</p>

					<p>
						<strong>Nombre: </strong><span id="spNombre"></span>
					</p>
					<p>
						<strong>ID: </strong><span id="spID"></span>
					</p>
					<p>
						<strong>Edad: </strong><span id="spEdad"></span>
					</p>
				</div>
			</div>
			<div class="row">
				<div style="background-color: Black; height: 3px; margin-top: 14px"></div>
			</div>
		</div>
		<div id="UrolTable" class="uroanalisis" style="margin-top: 10px; margin-bottom: 10px;">
			<div class="row">
				<div class="col-lg-2" style="font-weight: 700">
					ORINA
				</div>
			</div>
			<div class="col-lg-11 col-lg-offset-1" style="border: 1px solid black; margin-top: 15px;">
				<div class="col-lg-12" style="border-bottom: 1px solid black">
					<div class="col-lg-4" style="text-align: center">
						Examen Físico
					</div>
					<div class="col-lg-4" style="text-align: center">
						Examen Microquímico
					</div>
					<div class="col-lg-4" style="text-align: center">
						Examen Microscópico
					</div>
				</div>
				<div class="col-lg-12" style="padding: 5px;">
					<div class="col-lg-4">
						<p>
							Olor: <span id="spOlor"></span>
						</p>
						<p>
							Color: <span id="spColor"></span>
						</p>
						<p>
							Aspecto: <span id="spAspecto"></span>
						</p>
					</div>
					<div class="col-lg-4">
						<p>
							GLU: <span id="spGLU"></span>
						</p>
						<p>
							BIL: <span id="spBIL"></span>
						</p>
						<p>
							CET: <span id="spCET"></span>
						</p>
						<p>
							DEN: <span id="spDEN"></span>
						</p>
						<p>
							PH: <span id="spPH"></span>
						</p>
						<p>
							PRO: <span id="spPRO"></span>
						</p>
						<p>
							URO: <span id="spURO"></span>
						</p>
						<p>
							NIT: <span id="spNIT"></span>
						</p>
						<p>
							SAN: <span id="spSAN"></span>
						</p>
						<p>
							LEU: <span id="spLEU"></span>
						</p>
					</div>
					<div class="col-lg-4">
						<p>
							Leucocitos por campo: <span id="spLeucoCampo"></span>
						</p>
						<p>
							Hematíes por campo: <span id="spHematieCampo"></span>
						</p>
						<p>
							Células altas por campo: <span id="spCelAltaCampo"></span>
						</p>
						<p>
							Células bajas por campo: <span id="spCelBajaCampo"></span>
						</p>
						<p>
							Moco: <span id="spMoco"></span>
						</p>
						<p>
							Bacterias: <span id="spBacterias"></span>
						</p>
						<p>
							Cilíndros: <span id="spCilindros"></span>
						</p>
						<p>
							Cristales: <span id="spCristales"></span>
						</p>
						<p>
							Levaduras: <span id="spLevaduras"></span>
						</p>
						<p>
							Otros: <span id="spOtros"></span>
						</p>
					</div>
					<div class="col-lg-12" style="min-height: 35px">
						<strong>Observaciones: </strong><span id="spCommentUrol"></span>
					</div>
				</div>
			</div>
		</div>
		<div id="SerumTable" class="sueroanalisis row" style="margin-top: 10px; margin-bottom: 10px;">
			<div class="row">
				<div class="col-lg-2" style="font-weight: 700">
					SUERO
				</div>
			</div>
			<div class="col-lg-11 col-lg-offset-1" style="border: 1px solid black; margin-top: 15px;">
				<div class="VIH col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-6">
						<p>
							VIH (HIV 1 & 2):
						</p>
						<p>
							Técnica Inmunocromatográfica (rápida)
						</p>
						<p>
							Prueba Presuntiva Sujeta a Confirmación
						</p>
					</div>
					<div class="col-lg-6">
						<p>
							<span id="spVIHResult"></span>
						</p>
					</div>
				</div>
				<div class="serologia col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-6">
						<p>
							SEROLOGÍA (VDRL):
						</p>
					</div>
					<div class="col-lg-6">
						<p>
							<span id="spSerolResult"></span>
						</p>
						<p>
							<span id="spValorSerol"></span>dils
						</p>
					</div>
				</div>
				<div class="hepatitisB col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-6">
						<p>
							ANTIGENO DE SUPERFICIE HEPATITIS B:
						</p>
						<p>
							HBSAg (Técnica Inmunocromatografica rápida)
						</p>
						<p>
							Prueba Presuntiva Sujeta a Confirmación
						</p>
					</div>
					<div class="col-lg-6">
						<p>
							<span id="spHepB"></span>
						</p>
					</div>
				</div>
				<div class="hepatitisC col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-6">
						<p>
							HEPATITIS C:
						</p>
						<p>
							(Técnica Inmunocromatografica rápida)
						</p>
						<p>
							Prueba Presuntiva Sujeta a Confirmación
						</p>
					</div>
					<div class="col-lg-6">
						<p>
							<span id="spHepC"></span>
						</p>
					</div>
				</div>
				<div class="cuadroHematico col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-6">
						<p>
							Cuadro hemático:
						</p>
						<p>
							(Técnica Inmunocromatografica rápida)
						</p>
						<p>
							Prueba Presuntiva Sujeta a Confirmación
						</p>
					</div>
					<div class="col-lg-6">
						<p>
							<span id="spCuadroHematico"></span>
						</p>
					</div>
				</div>
				<div class="creatinina col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-6">
						<p>
							Creatinina:
						</p>
					</div>
					<div class="col-lg-6">
						<p>
							<span id="spValorCrea"></span>mg/dl
						</p>
					</div>
				</div>
				<div class="hemGlic col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-6">
						<p>
							Hemoglobina Glicosilada:
						</p>
					</div>
					<div class="col-lg-6">
						<p>
							<span id="spValorHemGli"></span>%
						</p>
					</div>
				</div>
				<div class="otrExam col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-12">
						<p>
							Otros examenes:
						</p>
					</div>
					<div class="col-lg-12">
						<div class="col-lg-6">
							<p id="pDescrOtro"></p>
						</div>
						<div class="col-lg-6">
							<p>
								<span id="spValorResultadoOtroExamen"></span>
							</p>
						</div>
					</div>
					<div class="col-lg-12">
						<p id="pComentarioOtrosExamenes">
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="padding-top: 20px;">
			<div id="FooterTable" class="tableELD">
				<div class="row" style="margin-top: 10px; margin-bottom: 10px;">
					<div class="col-lg-4 col-lg-offset-8">
						<img id="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>
								<span id="spNomBacteriologo2"></span>
							</strong>
						</div>
						<div>
							Bacteriologa Registro: <span id="spRegistroProfesional"></span>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 10px; margin-bottom: 10px; font-family: 'Avenir'; font-weight: 400; text-align: center">
					<p>
						<span id="spDireccionLaboratorio">Carrera 11 N 94 a 25 - of 401</span>&#8226
                        <span id="spCiudad">Bogotá D.C. - Colombia</span>&#8226
                        <span id="spTelefonoLaboratorio">Tel: 6356312, 3656379, 6356402</span>&#8226
                        <span id="spFaxLaboratorio">Fax:</span>&#8226
                        <span id="spCorreoElectBacteriologo">consultoriopicu@gmail.com</span>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!--Inicio de la tabla resumen en inglés-->
	<div id="examsLayoutEng" hasbeenprinted="notANumber" style="margin: 0 auto;">
		<div id="HeaderTableEng" style="margin-top: 10px; margin-bottom: 10px;">
			<div class="row">
				<div class="col-lg-4">
					<p>
						<span id="spNomLaboratorioEng" style="font-family: 'Avenir'; font-size: 14px; font-weight: 700">CLINICAL LABORATORY</span>
					</p>
					<p>
						Doctor: <span id="spNomBacteriologo1Eng" style="font-family: 'Avenir'; font-size: 12px; font-weight: 600">Yadira Isabel Granda Vanegas</span>
					</p>
					<p style="font-family: 'Avenir'; font-size: 10px; font-weight: 500">
						Bacteriologist <span id="spUniversidad1Eng"></span>
					</p>
				</div>
				<div class="col-lg-4 text-center">
					<img src="../Resources/Logos/imgImpresion.jpg" class="logo-central" alt="Logo labratorio" />
				</div>
				<div class="col-lg-4 text-right">
					<div id="imgContainerEng" class="imgCont"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6" style="left: 450px; top: 10px">
					<div style="font-family: 'Avenir'; font-weight: 700">
						Analisys Report
					</div>
					<p>
						<strong>Date: </strong><span id="spFechaEng"></span>
					</p>

					<p>
						<strong>Name: </strong><span id="spNombreEng"></span>
					</p>
					<p>
						<strong>ID: </strong><span id="spIDEng"></span>
					</p>
					<p>
						<strong>Age: </strong><span id="spEdadEng"></span>
					</p>
				</div>
			</div>
			<div class="row">
				<div style="background-color: Black; height: 3px; margin-top: 14px"></div>
			</div>
		</div>
		<div id="UrolTableEng" class="uroanalisis" style="margin-top: 10px; margin-bottom: 10px;">
			<div class="row">
				<div class="col-lg-2" style="font-weight: 700">
					UROANÁLISIS
				</div>
			</div>
			<div class="col-lg-11 col-lg-offset-1" style="border: 1px solid black; margin-top: 15px;">
				<div class="col-lg-12" style="border-bottom: 1px solid black">
					<div class="col-lg-4" style="text-align: center">
						Physical Exam
					</div>
					<div class="col-lg-4" style="text-align: center">
						Microchemical Exam
					</div>
					<div class="col-lg-4" style="text-align: center">
						Microscopic Exam
					</div>
				</div>
				<div class="col-lg-12" style="padding: 5px;">
					<div class="col-lg-4">
						<p>
							Odor: <span id="spOlorEng"></span>
						</p>
						<p>
							Colour: <span id="spColorEng"></span>
						</p>
						<p>
							Appearance: <span id="spAspectoEng"></span>
						</p>
					</div>
					<div class="col-lg-4">
						<p>
							Glucose: <span id="spGLUEng"></span>
						</p>
						<p>
							Bilirrubin: <span id="spBILEng"></span>
						</p>
						<p>
							Ketone: <span id="spCETEng"></span>
						</p>
						<p>
							Specific gravity: <span id="spDENEng"></span>
						</p>
						<p>
							Ph: <span id="spPHEng"></span>
						</p>
						<p>
							Protein: <span id="spPROEng"></span>
						</p>
						<p>
							Urobilinogen: <span id="spUROEng"></span>
						</p>
						<p>
							Nitrite: <span id="spNITEng"></span>
						</p>
						<p>
							Blood: <span id="spSANEng"></span>
						</p>
						<p>
							Leukocytes: <span id="spLEUEng"></span>
						</p>
					</div>
					<div class="col-lg-4">
						<p>
							Leukocites by field: <span id="spLeucoCampoEng"></span>
						</p>
						<p>
							Red blood cells by field: <span id="spHematieCampoEng"></span>
						</p>
						<p>
							High cells by field: <span id="spCelAltaCampoEng"></span>
						</p>
						<p>
							Low cells by fields: <span id="spCelBajaCampoEng"></span>
						</p>
						<p>
							Mucus: <span id="spMocoEng"></span>
						</p>
						<p>
							Bacteria: <span id="spBacteriasEng"></span>
						</p>
						<p>
							Cylinders: <span id="spCilindrosEng"></span>
						</p>
						<p>
							Crystals: <span id="spCristalesEng"></span>
						</p>
						<p>
							Yeast: <span id="spLevadurasEng"></span>
						</p>
						<p>
							Others: <span id="spOtrosEng"></span>
						</p>
					</div>
					<div class="col-lg-12" style="min-height: 35px">
						<strong>Observations: </strong><span id="spCommentUrolEng"></span>
					</div>
				</div>
			</div>
		</div>
		<div id="SerumTableEng" class="sueroanalisis row" style="margin-top: 10px; margin-bottom: 10px;">
			<div class="row">
				<div class="col-lg-2" style="font-weight: 700">
					SERUM
				</div>
			</div>
			<div class="col-lg-11 col-lg-offset-1" style="border: 1px solid black; margin-top: 15px;">
				<div class="VIH col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-6">
						<p>
							HIV (HIV 1 & 2):
						</p>
						<p>
							Inmunochromatographic techique (rapid)
						</p>
						<p>
							Presumptive evidence, subject to confirmation
						</p>
					</div>
					<div class="col-lg-6">
						<p>
							<span id="spVIHResultEng"></span>
						</p>
					</div>
				</div>
				<div class="serologia col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-6">
						<p>
							SEROLOGY:
						</p>
					</div>
					<div class="col-lg-6">
						<p>
							<span id="spSerolResultEng"></span>
						</p>
						<p>
							<span id="spValorSerolEng"></span>dils
						</p>
					</div>
				</div>
				<div class="hepatitisB col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-6">
						<p>
							HEPATITIS B:
						</p>
						<p>
							Inmunochromatographic techique (rapid)
						</p>
						<p>
							Presumptive evidence, subject to confirmation
						</p>
					</div>
					<div class="col-lg-6">
						<p>
							<span id="spHepBEng"></span>
						</p>
					</div>
				</div>
				<div class="hepatitisC col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-6">
						<p>
							HEPATITIS C:
						</p>
						<p>
							Inmunochromatographic techique (rapid)
						</p>
						<p>
							Presumptive evidence, subject to confirmation
						</p>
					</div>
					<div class="col-lg-6">
						<p>
							<span id="spHepCEng"></span>
						</p>
					</div>
				</div>
				<div class="cuadroHematico col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-6">
						<p>
							Blood count
						</p>
						<p>
							Inmunochromatographic techique (rapid)
						</p>
						<p>
							Presumptive evidence, subject to confirmation
						</p>
					</div>
					<div class="col-lg-6">
						<p>
							<span id="spCuadroHematicoEng"></span>
						</p>
					</div>
				</div>
				<div class="creatinina col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-6">
						<p>
							Creatinine
						</p>
					</div>
					<div class="col-lg-6">
						<p>
							<span id="spValorCreaEng"></span>mg/dl
						</p>
					</div>
				</div>
				<div class="hemGlic col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-6">
						<p>
							Glycosylated hemoglobin
						</p>
					</div>
					<div class="col-lg-6">
						<p>
							<span id="spValorHemGliEng"></span>%
						</p>
					</div>
				</div>
				<div class="otrExam col-lg-12" style="margin-bottom: 20px">
					<div class="col-lg-12">
						<p>
							Other tests:
						</p>
					</div>
					<div class="col-lg-12">
						<div class="col-lg-6">
							<p id="pDescrOtroEng"></p>
						</div>
						<div class="col-lg-6">
							<p>
								<span id="spValorResultadoOtroExamenEng"></span>
							</p>
						</div>
					</div>
					<div class="col-lg-12">
						<p id="pComentarioOtrosExamenesEng">
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="padding-top: 20px;">
			<div id="FooterTableEng" class="tableELD">
				<div class="row" style="margin-top: 10px; margin-bottom: 10px;">
					<div class="col-lg-4 col-lg-offset-8">
						<img id="imgFirmaBacteriologoEng" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span id="spNomBacteriologo2Eng"></span>
							</strong>
						</div>
						<div>
							Bacteriology record: <span id="spRegistroProfesionalEng"></span>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 10px; margin-bottom: 10px; font-family: 'Avenir'; font-weight: 400; text-align: center">
					<p>
						<span id="spDireccionLaboratorioEng">Carrera 11 N 94 a 25 - of 401</span>&#8226
                        <span id="spCiudadEng">Bogotá D.C. - Colombia</span>&#8226
                        <span id="spTelefonoLaboratorioEng">Tel: 6356312, 3656379, 6356402</span>&#8226
                        <span id="spFaxLaboratorioEng">Fax:</span>&#8226
                        <span id="spCorreoElectBacteriologoEng">consultoriopicu@gmail.com</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!--Fin de la tabla resumen-->
	<div style="display: none;" id="hiddenSendToEmail">
		<asp:HiddenField ID="hfResumeToPdf" runat="server" />

		<telerik:RadButton ID="rbtnAbrirDialogo" runat="server" Text="Importar Maestro" CausesValidation="false" UseSubmitBehavior="false" OnClientClicked="openWindow"></telerik:RadButton>
	</div>

	<telerik:RadWindow ID="rwModalFileLoad" runat="server" Modal="true" Style="z-index: 100001;" Width="560px" Height="250px" Behaviors="Close">

		<ContentTemplate>
			<table>
				<tr>
					<td>Seleccione el archivo a enviar por correo
					</td>
				</tr>
				<tr>
					<td>
						<telerik:RadAsyncUpload ID="rauFileToLoad" runat="server" AllowedFileExtensions=".pdf" MultipleFileSelection="Disabled" MaxFileInputsCount="1" ChunkSize="1048576" InputSize="300">
							<Localization Cancel="Cancelar" Remove="Remover" Select="Seleccionar" />
						</telerik:RadAsyncUpload>
						<telerik:RadProgressArea ID="rpaFileToLoad" runat="server">
							<Localization CurrentFileName="Archivo" />
						</telerik:RadProgressArea>
					</td>
				</tr>
				<tr>
					<td align="center">
						<asp:Button ID="rbtnSendMail" runat="server" Text="Enviar" CausesValidation="false" UseSubmitBehavior="false" OnClick="rbtnSendMail_Click" />
					</td>
				</tr>
			</table>
		</ContentTemplate>
	</telerik:RadWindow>
</asp:Content>
<asp:Content ContentPlaceHolderID="PageScriptsHolder" runat="server">
	<script type="text/javascript">
		function openFileupload(idHist, idMu)
		{
			var a = window.open("<%= ResolveUrl("~/Controls/CargaArchivo.aspx")%>?IdHist=" + idHist + "&IdTR=1&IdMu=" + idMu, "filupl", "location=0,width=600,height=400");
		}

		function CargarFileUro(sender, e)
		{
			var idh = document.getElementById("<%=this.hfIdHist.ClientID%>").value;
			var idMu = document.getElementById('<%=this.hfIdMuestraUrol.ClientID%>').value;
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileVih(sender, e)
		{
			var idh = document.getElementById("<%=this.hfIdHist.ClientID%>").value;
			var idMu = document.getElementById('<%=this.hfIdMuestraVIH.ClientID%>').value;
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileSero(sender, e)
		{
			var idh = document.getElementById("<%=this.hfIdHist.ClientID%>").value;
			var idMu = document.getElementById('<%=this.hfIdMuestraSero.ClientID%>').value;
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileHepaB(sender, e)
		{
			var idh = document.getElementById("<%=this.hfIdHist.ClientID%>").value;
			var idMu = document.getElementById('<%=this.hfIdMuestraHepB.ClientID%>').value;
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileHepaC(sender, e)
		{
			var idh = document.getElementById("<%=this.hfIdHist.ClientID%>").value;
			var idMu = document.getElementById('<%=this.hfIdMuestraHepC.ClientID%>').value;
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileCH(sender, e)
		{
			var idh = document.getElementById("<%=this.hfIdHist.ClientID%>").value;
			var idMu = document.getElementById('<%=this.hfIdMuestraCH.ClientID%>').value;
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileCre(sender, e)
		{
			var idh = document.getElementById("<%=this.hfIdHist.ClientID%>").value;
			var idMu = document.getElementById('<%=this.hfIdMuestraCreatinina.ClientID%>').value;
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileHemGli(sender, e)
		{
			var idh = document.getElementById("<%=this.hfIdHist.ClientID%>").value;
			var idMu = document.getElementById('<%=this.hfIdMuestraHemGli.ClientID%>').value;
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileOtro(sender, e)
		{
			var idh = document.getElementById("<%=this.hfIdHist.ClientID%>").value;
			var idMu = document.getElementById('<%=this.hfIdMuestraOtro.ClientID%>').value;
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileCultivo(sender, e)
		{
			var idh = document.getElementById("<%=this.hfIdHist.ClientID%>").value;
			var idMu = document.getElementById('<%=this.hfIdMuestraCultivo.ClientID%>').value;
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileBaciloscopia(sender, e)
		{
			var idh = document.getElementById("<%=this.hfIdHist.ClientID%>").value;
			var idMu = document.getElementById('<%=this.hfIdMuestraBaciloscopia.ClientID%>').value;
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function AbrirArchivo(idFil)
		{
			window.open("<%=ResolveUrl("~/Controls/DwldFil.aspx")%>?idFil=" + idFil, "", "height=400,width=500,resizable=no,scrollbars=yes");
		}

		function VerMuestraAnt(idMl)
		{
			window.open("<%= ResolveUrl("~/Controls/DetailSample.aspx")%>?idSmpl=" + idMl, "", "height=800,width=1250,resizable=no,scrollbars=yes");
		}

		function ValidarEliminacion(sender, e)
		{
			if (!confirm("Esta seguro de eliminar esta muestra de la historia del paciente"))
			{
				e.set_cancel(true);
			}
		}
	</script>
	<script id="scrShowSendMail" type="text/javascript">
		//No se si esta funcion se esta Llamando
		function MostrarEnvio(sender, args)
		{

			//alert("Entro al manejador de eventos");
			console.log("Entro al manejador de eventos");
			var btnShow = document.getElementById("<%=this.rbtnAbrirDialogo.ClientID%>");
			btnShow.click();

			var hf = document.getElementById("<%=this.hfResumeToPdf.ClientID%>");
			var btn = document.getElementById("<%=this.rbtnSendMail.ClientID%>");

			var ficha = document.getElementById("printable").cloneNode(true);

			var estilo = document.getElementById("printStyles").cloneNode(true);
			//var escript = document.createElement('script');
			var link = document.createElement("LINK");
			var head = document.createElement("HEAD");
			var body = document.createElement("BODY");
			var title = document.createElement("title");

			//se agregan las referencias a bootstrap
			//<link href="Styles/bootstrap.css?1" type="text/css" rel="Stylesheet" />
			link.setAttribute("href", "../Content/bootstrap.css");
			link.setAttribute("rel", "Stylesheet");
			link.setAttribute("type", "text/css");

			title.innerHTML = ficha.getElementsByTagName("span")["spNombre"].innerHTML;

			head.appendChild(title);
			head.appendChild(link);
			head.appendChild(estilo);

			body.appendChild(ficha);
			var entireText = head.outerHTML + body.outerHTML;

			hf.value = entireText.replace(/</g, "___|").replace( />/g, "|___");
			console.log("El resultado");
			console.log(hf.value);
			btn.click();
		}
	</script>

	<script type="text/javascript" id="printBuilder">

		function divSelExamenes()
		{

			var checks =
			{
				chkUrologia: false,
				chkVIH: false,
				chkSerologia: false,
				chkHepatitisB: false,
				chkHepatitisC: false,
				chkCuadroHematico: false,
				chkCreatinina: false,
				chkHemGlicosilada: false,
				chkOtrosExamenes: false
			}
			checks.chkUrologia = document.getElementById("<%=this.chkUro.ClientID%>").checked;
			checks.chkVIH = document.getElementById("<%=this.chkVih.ClientID%>").checked;
			checks.chkSerologia = document.getElementById("<%=this.chkSero.ClientID%>").checked;
			checks.chkHepatitisB = document.getElementById("<%=this.chkHepB.ClientID%>").checked;
			checks.chkHepatitisC = document.getElementById("<%=this.chkHepC.ClientID%>").checked;
			checks.chkCuadroHematico = document.getElementById("<%=this.chkCH.ClientID%>").checked;
			checks.chkCreatinina = document.getElementById("<%=this.chkCrea.ClientID%>").checked;
			checks.chkHemGlicosilada = document.getElementById("<%=this.chkHemGli.ClientID%>").checked;
			checks.chkOtrosExamenes = document.getElementById("<%=this.chkOtro.ClientID%>").checked;

			var objReturn = divSelExamenesObj(checks);
			return objReturn;
		}

		function updateLayout(sender, e)
		{

			if (document.getElementById("printable") != undefined)
			{
				removeChildren("impresion");
			}
			if (document.getElementById("printableEng") != undefined)
			{
				removeChildren("impresionEng");
			}

			var checks =
			{
				Uro: false,
				VIH: false,
				Ser: false,
				HpB: false,
				HpC: false,
				CHm: false,
				Crt: false,
				HmG: false,
				OEx: false
			}

			checks.Uro = returnppty("checkBxUro", "checked");
			checks.VIH = returnppty("checkBxVIH", "checked");
			checks.Ser = returnppty("checkBxSero", "checked");
			checks.HpB = returnppty("checkBxHepB", "checked");
			checks.HpC = returnppty("checkBxHepC", "checked");
			checks.CHm = returnppty("checkBxCH", "checked");
			checks.Crt = returnppty("checkBxCre", "checked");
			checks.OEx = returnppty("checkBxOEx", "checked");
			checks.HmG = returnppty("checkBxHmGl", "checked");

			var message = "";

			if ((checks.Uro == false || checks.Uro == null) &&
				(checks.VIH == false || checks.VIH == null) &&
				(checks.Ser == false || checks.Ser == null) &&
				(checks.HpB == false || checks.HpB == null) &&
				(checks.HpC == false || checks.HpC == null) &&
				(checks.CHm == false || checks.CHm == null) &&
				(checks.Crt == false || checks.Crt == null) &&
				(checks.OEx == false || checks.OEx == null) &&
				(checks.HmG == false || checks.HmG == null))
			{
				message = "Seleccione al menos una de las casillas de verificacion para visualizar el resumen";
				alert(message);
				return
			}

			var chExamenes = checksPreview();

			var parentNodeBackup = document.getElementById("examsLayout").parentNode;
			var copybackup = document.getElementById("examsLayout").cloneNode(true);
			var copybackupEng = document.getElementById("examsLayoutEng").cloneNode(true);

			var datosLab = {
				nomLab: "",
				nomBact: "",
				univ: "",
				dirLab: "",
				ciudad: "",
				telLab: "",
				faxLab: "",
				corrElBact: "",
				regPro: "",
				firmaBase64: ""
			};

			datosLab.nomLab = document.getElementById("<%=this.nombreLaboratorio.ClientID %>").value;
			datosLab.nomBact = document.getElementById("<%=this.nombreBacteriologo.ClientID %>").value;
			datosLab.univ = document.getElementById("<%=this.universidad.ClientID %>").value;
			datosLab.dirLab = document.getElementById("<%=this.direccionLaboratorio.ClientID %>").value;
			datosLab.ciudad = document.getElementById("<%=this.ciudad.ClientID %>").value;
			datosLab.telLab = document.getElementById("<%=this.telefonoLaboratorio.ClientID %>").value;
			datosLab.faxLab = document.getElementById("<%=this.faxLaboratorio.ClientID %>").value;
			datosLab.corrElBact = document.getElementById("<%=this.correoElectBacteriologo.ClientID %>").value;
			datosLab.regPro = document.getElementById("<%=this.registroProfesional.ClientID %>").value;
			datosLab.firmaBase64 = document.getElementById("<%=this.firmaBase64.ClientID %>").value;

			UpdateInfoLab(datosLab);

			//Español
			document.getElementById('spNombre').innerHTML = document.getElementById("<%=this.rtxtNombres.ClientID%>").value;
			document.getElementById('spFecha').innerHTML = document.getElementById("<%=this.rdpFecha.ClientID%>").value;
			document.getElementById('spID').innerHTML = document.getElementById("<%=this.hfCodigo.ClientID%>").value;
			document.getElementById('spEdad').innerHTML = calcularEdad(document.getElementById("<%=this.hfEdad.ClientID%>").value);
			//English
			document.getElementById('spNombreEng').innerHTML = document.getElementById("<%=this.rtxtNombres.ClientID%>").value;
			document.getElementById('spFechaEng').innerHTML = document.getElementById("<%=this.rdpFecha.ClientID%>").value;
			document.getElementById('spIDEng').innerHTML = document.getElementById("<%=this.hfCodigo.ClientID%>").value;
			document.getElementById('spEdadEng').innerHTML = calcularEdad(document.getElementById("<%=this.hfEdad.ClientID%>").value);

			var foto = document.getElementById("<%=this.imgPrePhoto.ClientID%>").cloneNode(true);
			foto.className = "paciente";
			$(foto).removeAttr("style");
			$("#imgContainer").empty();
			document.getElementById('imgContainer').appendChild(foto);

			var fotoEng = document.getElementById("<%=this.imgPrePhoto.ClientID%>").cloneNode(true);
			fotoEng.className = "paciente";
			$(fotoEng).removeAttr("style");
			$("#imgContainerEng").empty();
			document.getElementById('imgContainerEng').appendChild(fotoEng);

			//verificacion uroanalisis
			if (document.getElementById("<%=this.rblEstadoUro.ClientID %>") != undefined)
			{
				if (checks.Uro == true)
				{
					var check = document.getElementById("<%=this.rblEstadoUro.ClientID %>").id;
					check = check + '_0';

					bit = document.getElementById(check).checked;

					if (bit == false)
					{
						//Español
						document.getElementById('spOlor').innerHTML = document.getElementById("<%=this.rtxtOlor.ClientID%>").value;
						document.getElementById('spColor').innerHTML = document.getElementById("<%=this.rtxtColor.ClientID%>").value;
						document.getElementById('spAspecto').innerHTML = document.getElementById("<%=this.rtxtAspecto.ClientID%>").value;
						document.getElementById('spGLU').innerHTML = document.getElementById("<%=this.rtxtGLU.ClientID%>").value;
						document.getElementById('spBIL').innerHTML = document.getElementById("<%=this.rtxtBIL.ClientID%>").value;
						document.getElementById('spCET').innerHTML = document.getElementById("<%=this.rtxtCET.ClientID%>").value;
						document.getElementById('spDEN').innerHTML = document.getElementById("<%=this.rtxtDEN.ClientID%>").value;
						document.getElementById('spPH').innerHTML = document.getElementById("<%=this.rtxtPH.ClientID%>").value;
						document.getElementById('spPRO').innerHTML = document.getElementById("<%=this.rtxtPRO.ClientID%>").value;
						document.getElementById('spURO').innerHTML = document.getElementById("<%=this.rtxtUro.ClientID%>").value;
						document.getElementById('spNIT').innerHTML = document.getElementById("<%=this.rtxtNIT.ClientID%>").value;
						document.getElementById('spSAN').innerHTML = document.getElementById("<%=this.rtxtSAN.ClientID%>").value;
						document.getElementById('spLEU').innerHTML = document.getElementById("<%=this.rtxtLEU.ClientID%>").value;
						document.getElementById('spLeucoCampo').innerHTML = document.getElementById("<%=this.rtxtLeucoCampo.ClientID%>").value;
						document.getElementById('spHematieCampo').innerHTML = document.getElementById("<%=this.rtxtHematiesCampo.ClientID%>").value;
						document.getElementById('spCelAltaCampo').innerHTML = document.getElementById("<%=this.rtxtCelAltasCampo.ClientID%>").value;
						document.getElementById('spCelBajaCampo').innerHTML = document.getElementById("<%=this.rtxtCelBajasCampo.ClientID%>").value;
						document.getElementById('spMoco').innerHTML = document.getElementById("<%=this.rtxtMoco.ClientID%>").value;
						document.getElementById('spBacterias').innerHTML = document.getElementById("<%=this.rtxtBacterias.ClientID%>").value;
						document.getElementById('spCilindros').innerHTML = document.getElementById("<%=this.rtxtCilindros.ClientID%>").value;
						document.getElementById('spCristales').innerHTML = document.getElementById("<%=this.rtxtCristales.ClientID%>").value;
						document.getElementById('spLevaduras').innerHTML = document.getElementById("<%=this.rtxtLevaduras.ClientID%>").value;
						document.getElementById('spOtros').innerHTML = document.getElementById("<%=this.rtxtOtros.ClientID%>").value;
						document.getElementById('spCommentUrol').innerHTML = document.getElementById("<%=this.rtxtCommentUrol.ClientID%>").value;

						//English
						document.getElementById('spOlorEng').innerHTML = document.getElementById("<%=this.rtxtOlor.ClientID%>").value;
						document.getElementById('spColorEng').innerHTML = document.getElementById("<%=this.rtxtColor.ClientID%>").value;
						document.getElementById('spAspectoEng').innerHTML = document.getElementById("<%=this.rtxtAspecto.ClientID%>").value;
						document.getElementById('spGLUEng').innerHTML = document.getElementById("<%=this.rtxtGLU.ClientID%>").value;
						document.getElementById('spBILEng').innerHTML = document.getElementById("<%=this.rtxtBIL.ClientID%>").value;
						document.getElementById('spCETEng').innerHTML = document.getElementById("<%=this.rtxtCET.ClientID%>").value;
						document.getElementById('spDENEng').innerHTML = document.getElementById("<%=this.rtxtDEN.ClientID%>").value;
						document.getElementById('spPHEng').innerHTML = document.getElementById("<%=this.rtxtPH.ClientID%>").value;
						document.getElementById('spPROEng').innerHTML = document.getElementById("<%=this.rtxtPRO.ClientID%>").value;
						document.getElementById('spUROEng').innerHTML = document.getElementById("<%=this.rtxtUro.ClientID%>").value;
						document.getElementById('spNITEng').innerHTML = document.getElementById("<%=this.rtxtNIT.ClientID%>").value;
						document.getElementById('spSANEng').innerHTML = document.getElementById("<%=this.rtxtSAN.ClientID%>").value;
						document.getElementById('spLEUEng').innerHTML = document.getElementById("<%=this.rtxtLEU.ClientID%>").value;
						document.getElementById('spLeucoCampoEng').innerHTML = document.getElementById("<%=this.rtxtLeucoCampo.ClientID%>").value;
						document.getElementById('spHematieCampoEng').innerHTML = document.getElementById("<%=this.rtxtHematiesCampo.ClientID%>").value;
						document.getElementById('spCelAltaCampoEng').innerHTML = document.getElementById("<%=this.rtxtCelAltasCampo.ClientID%>").value;
						document.getElementById('spCelBajaCampoEng').innerHTML = document.getElementById("<%=this.rtxtCelBajasCampo.ClientID%>").value;
						document.getElementById('spMocoEng').innerHTML = document.getElementById("<%=this.rtxtMoco.ClientID%>").value;
						document.getElementById('spBacteriasEng').innerHTML = document.getElementById("<%=this.rtxtBacterias.ClientID%>").value;
						document.getElementById('spCilindrosEng').innerHTML = document.getElementById("<%=this.rtxtCilindros.ClientID%>").value;
						document.getElementById('spCristalesEng').innerHTML = document.getElementById("<%=this.rtxtCristales.ClientID%>").value;
						document.getElementById('spLevadurasEng').innerHTML = document.getElementById("<%=this.rtxtLevaduras.ClientID%>").value;
						document.getElementById('spOtrosEng').innerHTML = document.getElementById("<%=this.rtxtOtros.ClientID%>").value;
						document.getElementById('spCommentUrolEng').innerHTML = document.getElementById("<%=this.rtxtCommentUrol.ClientID%>").value;

					}
					else
					{
						message = message + '\n Aun no se ha tomado el uroanálisis'
					}
				}
				else
				{
					removeChildren("uroanalisis");
				}
			}
			else
			{
				removeChildren("uroanalisis");
			}

			//verificacion VIH
			if (document.getElementById("<%=this.rblEstadoVih.ClientID %>") != undefined)
			{
				if (checks.VIH == true)
				{
					var check = document.getElementById("<%=this.rblEstadoVih.ClientID %>").id;
					check = check + '_0';

					bit = document.getElementById(check).checked;

					if (bit == false)
					{
						document.getElementById('spVIHResult').innerHTML = document.getElementById("<%=this.rcbxVIHResult.ClientID%>").value;
						document.getElementById('spVIHResultEng').innerHTML = document.getElementById("<%=this.rcbxVIHResult.ClientID%>").value;
					}
					else
					{
						message = message + '\n Aun no se ha tomado la muestra de VIH'
					}
				}
				else
				{
					removeChildren("VIH");
				}

			}
			else
			{
				removeChildren("VIH");
			}

			//verificacion Serologia
			if (document.getElementById("<%=this.rblEstadoSero.ClientID %>") != undefined)
			{
				if (checks.Ser == true)
				{
					var check = document.getElementById("<%=this.rblEstadoSero.ClientID %>").id;
					check = check + '_0';

					bit = document.getElementById(check).checked;

					if (bit == false)
					{
						document.getElementById('spSerolResult').innerHTML = document.getElementById("<%=this.rcbxSero.ClientID%>").value;

						if (document.getElementById('spSerolResult').innerHTML == "REACTIVO")
						{
							document.getElementById('spSerolResultEng').innerHTML = "REACTIVE";
							document.getElementById('spValorSerol').innerHTML = document.getElementById("<%=this.rntValorSero.ClientID%>").value;
							document.getElementById('spValorSerolEng').innerHTML = document.getElementById("<%=this.rntValorSero.ClientID%>").value;
						}
						else if (document.getElementById('spSerolResult').innerHTML == "NO REACTIVO")
						{
							document.getElementById('spSerolResultEng').innerHTML = " NON REACTIVE";
							document.getElementById('spSerolResult').parentNode.innerHTML == document.getElementById('spSerolResult').parentNode.innerHTML.replace("dils", "");
							document.getElementById('spSerolResultEng').parentNode.innerHTML == document.getElementById('spSerolResult').parentNode.innerHTML.replace("dils", "");

						}
					}
					else
					{
						message = message + '\n Aun no se ha tomado la muestra de Serología'
					}
				}
				else
				{
					removeChildren("serologia");
				}
			}
			else
			{
				removeChildren("serologia");
			}

			//verificacion Hepatitis B
			if (document.getElementById("<%=this.rblEstadoHepaB.ClientID %>") != undefined)
			{
				if (checks.HpB == true)
				{
					var check = document.getElementById("<%=this.rblEstadoHepaB.ClientID %>").id;
					check = check + '_0';

					bit = document.getElementById(check).checked;

					if (bit == false)
					{
						document.getElementById('spHepB').innerHTML = document.getElementById("<%=this.rcbxHepB.ClientID%>").value;
						document.getElementById('spHepBEng').innerHTML = document.getElementById("<%=this.rcbxHepB.ClientID%>").value;
					}
					else
					{
						message = message + '\n Aun no se ha tomado la muestra de Hepatitis B'
					}
				}
				else
				{
					removeChildren("hepatitisB");
				}
			}
			else
			{
				removeChildren("hepatitisB");
			}

			//verificacion Hepatitis C
			if (document.getElementById("<%=this.rblEstadoHepaC.ClientID %>") != undefined)
			{
				if (checks.HpC == true)
				{
					var check = document.getElementById("<%=this.rblEstadoHepaC.ClientID %>").id;
					check = check + '_0';

					bit = document.getElementById(check).checked;

					if (bit == false)
					{
						document.getElementById('spHepC').innerHTML = document.getElementById("<%=this.rcbxHepC.ClientID%>").value;
						document.getElementById('spHepCEng').innerHTML = document.getElementById("<%=this.rcbxHepC.ClientID%>").value;
					}
					else
					{
						message = message + '\n Aun no se ha tomado la muestra de Hepatitis C'
					}
				}

				else
				{
					removeChildren("hepatitisC");
				}
			}
			else
			{
				removeChildren("hepatitisC");
			}

			//verificacion Cuadro hemático
			if (document.getElementById("<%=this.rblEstadoCH.ClientID %>") != undefined)
			{
				if (checks.CHm == true)
				{
					var check = document.getElementById("<%=this.rblEstadoCH.ClientID %>").id;
					check = check + '_0';

					bit = document.getElementById(check).checked;

					if (bit == false)
					{
						document.getElementById('spCuadroHematico').innerHTML = document.getElementById("<%=this.rcbxCuadroHematico.ClientID%>").value;
						document.getElementById('spCuadroHematicoEng').innerHTML = document.getElementById("<%=this.rcbxCuadroHematico.ClientID%>").value;
					}
					else
					{
						message = message + '\n Aun no se ha tomado la muestra de Cuadro Hemático'
					}
				}
				else
				{
					removeChildren("cuadroHematico");
				}
			}

			else
			{
				removeChildren("cuadroHematico");
			}

			//verificacion Creatinina
			if (document.getElementById("<%=this.rblEstadoCreat.ClientID %>") != undefined)
			{
				if (checks.Crt == true)
				{
					var check = document.getElementById("<%=this.rblEstadoCreat.ClientID %>").id;
					check = check + '_0';

					bit = document.getElementById(check).checked;

					if (bit == false)
					{
						document.getElementById('spValorCrea').innerHTML = document.getElementById("<%=this.rntValorCrea.ClientID%>").value;
						document.getElementById('spValorCreaEng').innerHTML = document.getElementById("<%=this.rntValorCrea.ClientID%>").value;
					}
					else
					{
						message = message + '\n Aun no se ha tomado la muestra de Creatinina'
					}
				} else
				{
					removeChildren("creatinina");
				}
			}

			else
			{
				removeChildren("creatinina");
			}

			//verificacion Hemoglobina Glicosilada
			if (document.getElementById("<%=this.rblEstadoHemGli.ClientID %>") != undefined)
			{
				if (checks.HmG == true)
				{
					var check = document.getElementById("<%=this.rblEstadoHemGli.ClientID %>").id;
					check = check + '_0';

					bit = document.getElementById(check).checked;

					if (bit == false)
					{
						document.getElementById('spValorHemGli').innerHTML = document.getElementById("<%=this.rntValorHemGli.ClientID%>").value;
						document.getElementById('spValorHemGliEng').innerHTML = document.getElementById("<%=this.rntValorHemGli.ClientID%>").value;
					}
					else
					{
						message = message + '\n Aun no se ha tomado la muestra de Hemoglobina Glicosilada'
					}
				} else
				{
					removeChildren("hemGlic");
				}
			}
			else
			{
				removeChildren("hemGlic");
			}

			if (document.getElementById("<%=this.rblEstadoOtro.ClientID %>") != undefined)
			{
				if (checks.OEx == true)
				{
					var check = document.getElementById("<%=this.rblEstadoOtro.ClientID %>").id;
					check = check + '_0';

					bit = document.getElementById(check).checked;

					if (bit == false)
					{
						document.getElementById('pDescrOtro').innerHTML = document.getElementById("<%=this.rtxtOtroDesc.ClientID%>").value;
						document.getElementById('spValorResultadoOtroExamen').innerHTML = document.getElementById("<%=this.rtxtOtroResultado.ClientID%>").value;
						document.getElementById('pComentarioOtrosExamenes').innerHTML = document.getElementById("<%=this.rtxtOtroComentario.ClientID%>").value;
						document.getElementById('pDescrOtroEng').innerHTML = document.getElementById("<%=this.rtxtOtroDesc.ClientID%>").value;
						document.getElementById('spValorResultadoOtroExamenEng').innerHTML = document.getElementById("<%=this.rtxtOtroResultado.ClientID%>").value;
						document.getElementById('pComentarioOtrosExamenesEng').innerHTML = document.getElementById("<%=this.rtxtOtroComentario.ClientID%>").value;
					}
					else
					{
						message = message + '\n Aun no se ha tomado la muestra programada de Otros Examenes'
					}
				}
				else
				{
					removeChildren("otrExam");
				}
			}
			else
			{
				removeChildren("otrExam");
			}

			if (message.length > 0)
			{
				alert(message);
				parentNodeBackup.replaceChild(copybackup, document.getElementById("examsLayout"));
				parentNodeBackup.replaceChild(copybackupEng, document.getElementById("examsLayoutEng"));

				e._cancel = true;
			}

			//Verificacion de examenes de suero
			if (!checks.VIH && !checks.CHm && !checks.Crt && !checks.HmG && !checks.HpB && !checks.HpC && !checks.Ser && !checks.OEx)
			{
				RemoveChildById("SerumTable");
				RemoveChildById("SerumTableEng");
			}

			var subModal = document.createElement("div");
			subModal.className = "impresion";

			var copyLayout = document.getElementById("examsLayout").cloneNode(true);

			copyLayout.className = 'collapse';
			copyLayout.id = "printable";
			subModal.appendChild(copyLayout);

			var copyLayoutEng = document.getElementById("examsLayoutEng").cloneNode(true);
			copyLayoutEng.innerHTML = copyLayoutEng.innerHTML
				.replace(/NEGATIVO/g, 'NEGATIVE')
				.replace(/POSITIVO/g, 'POSITIVE')
				.replace(/REACTIVO/g, 'REACTIVE')
				.replace(/NO REACTIVO/g, 'NON REACTIVE')
				.replace(/anormal/g, 'abnormal')

			copyLayoutEng.className = 'collapse';
			copyLayoutEng.id = "printableEng";
			subModal.appendChild(copyLayoutEng);

			var contButton = document.createElement('div');
			contButton.className = "btnStrip";
			var editor = document.createElement('div');
			editor.id = "editor";

			var btnPrint = document.createElement('div');
			btnPrint.innerHTML = "Imprimir";
			btnPrint.addEventListener('click', imprSelec);
			btnPrint.id = "btnPrintForm"
			btnPrint.className = "botonesVPE";

			var btnSendMail = document.createElement('div');
			btnSendMail.innerHTML = "Enviar por correo";
			btnSendMail.Id = "btnSenMa";
			btnSendMail.className = "botonesVPE btnCerrarVP";
			btnSendMail.addEventListener("click", MostrarEnvio);

			contButton.appendChild(btnPrint);
			contButton.appendChild(btnSendMail);

			subModal.appendChild(editor);
			subModal.appendChild(contButton);

			modal.appendChild(subModal)

			parentNodeBackup.replaceChild(copybackup, parentNodeBackup.childNodes.item("examsLayout"));
			parentNodeBackup.replaceChild(copybackupEng, parentNodeBackup.childNodes.item("examsLayoutEng"));

			$("#checkLang").on("click", ToogleView);
			$("#checkLang").trigger("click");
			$("#checkLang").trigger("click");

			return false;
		}
	</script>

	<script type="text/javascript">

		function openWindow(sender, e)
		{
			var oWnd = $find("<%=rwModalFileLoad.ClientID%>");
			oWnd.show();
			e.set_cancel(true);
		}

		function mostrarCreat(val)
		{
			var div1 = document.getElementById("divLblValCrea");
			div1.style.display = "inline";

			//alert(val);
			if (val == "ANORMAL")
			{
				div1.style.display = "inline";
			}
			else
			{
				div1.style.display = "none";
			}
		}

		function rcbxCreatinina_SelIndChang(sender, eventArgs)
		{
			var item = eventArgs.get_item();
			mostrarCreat(item.get_value());
		}

		$(document).ready(
			function ()
			{
				var host = location.hostname;
				appRoot = "<%=ResolveUrl("~/")%>";
				$(".logo-central").attr("src", "http://" + host + appRoot + "Resources/Logos/imgImpresion.jpg")
			}
		);
	</script>
</asp:Content>