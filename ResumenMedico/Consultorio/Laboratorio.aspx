<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="Laboratorio.aspx.cs" Inherits="ResumenMedico.Consultorio.Laboratorio" %>

<%@ Register Src="~/Controls/BacteriologySignature.ascx" TagPrefix="bs" TagName="BacteriologySignature" %>

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

		<div class="col-md-12">
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
				<div class="col-md-12 controlRow">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Nombre
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
							<telerik:RadTextBox ID="rtxtNombres" runat="server" ReadOnly="true" Width="100%" />
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Fecha
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadDatePicker ID="rdpFecha" runat="server" MinDate="1900-01-01" Width="100%">
								<Calendar ID="cFecha" runat="server" FirstDayOfWeek="Sunday" />
								<DateInput ID="diFecha" runat="server" DisplayDateFormat="yyyy/MM/dd" ReadOnly="true" />
							</telerik:RadDatePicker>
						</div>
					</div>
				</div>
				<div class="col-md-12 ">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
							Médico Asignado
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
							<asp:Label ID="lblNombreMedico" runat="server"></asp:Label>
						</div>
					</div>
				</div>
				<div class="col-md-12 controlRow">
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Tipo Identificación
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadComboBox ID="rcbxTipoDoc" runat="server" Width="100%" Filter="Contains" Enabled="false" />
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Número Identificación
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">

							<telerik:RadTextBox ID="rtxtNumDoc" runat="server" MaxLength="50" Width="100%" EmptyMessage="[Número Documento]" Font-Names="Verdana" ReadOnly="true"></telerik:RadTextBox>

							<asp:RequiredFieldValidator ID="rfvNumDoc" runat="server" ControlToValidate="rtxtNumDoc" ValidationGroup="Paciente" ErrorMessage="Debe especificar el numero de Identificacion"
								Display="None" />
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Número Pasaporte
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtPasaporte" runat="server" MaxLength="20" Width="100%" EmptyMessage="[Número Pasaporte]" Font-Names="Verdana" ReadOnly="true"></telerik:RadTextBox>
						</div>
					</div>
				</div>
				<div class="col-md-12 controlRow controlPair" style="padding-left: 35px; padding-right: 35px;">
					<div class="controlSide">
						Comentarios
					</div>
					<div class="controlHousing">
						<telerik:RadTextBox ID="rtxtComentarioLab" runat="server" MaxLength="8000" TextMode="MultiLine" Rows="3" Width="100%" />
					</div>
				</div>
			</div>
			<div class="col-md-12 text-center">
				<telerik:RadButton ID="rbtnGuardarInfo" runat="server" Text="Almacenar estado y comentarios" OnClick="rbtnGuardarInfo_Click" />
				<telerik:RadButton ID="btnShowAbstract" AutoPostBack="false" runat="server" Text="Mostrar resumen de examenes" OnClientClicked="ViewExamsAbstract" />
				<asp:HiddenField ID="hfCodigo" runat="server" />
				<asp:HiddenField ID="hfEdad" runat="server" />
			</div>

			<div class="col-md-12 controlRow controlPair">
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

	<telerik:RadTabStrip ID="rtsPanelesExamenes" runat="server" MultiPageID="rmpContenidoExamnes" SelectedIndex="0" Align="Center" Width="100%">
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
				<div class="col-md-12">
					<asp:HiddenField ID="hfIdMuestraUrol" runat="server" />
					<bs:BacteriologySignature runat="server" ID="bsUrologia" />
				</div>
				<div class="col-md-12">
					<div class="linia_arriba"></div>
					<div class="titulo">Uroanálisis</div>
					<div class="col-md-12 linia_estilo"></div>
				</div>
				<div class="col-md-12">
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
				<div class="col-md-12">
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
				<div class="col-md-12">
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
				<div class="col-md-12 text-center">
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
				<div class="col-md-12">
					<b>Comentarios</b>
				</div>
				<div class="col-md-12">
					<telerik:RadTextBox ID="rtxtCommentUrol" runat="server" TextMode="MultiLine" Rows="5" Width="90%" Font-Names="Verdana"></telerik:RadTextBox>
				</div>
				<div class="col-md-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-md-12">

					<telerik:RadGrid ID="rgUrol" runat="server" OnNeedDataSource="rgUrol_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

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
				<div class="col-md-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-md-12">

					<telerik:RadGrid ID="rgUroAnt" runat="server" OnNeedDataSource="rgUroAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="7em" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="14em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>
								<telerik:GridTemplateColumn>
									<ItemStyle Width="15em" />
									<ItemTemplate>
										<button type="button" class="button" onclick='<%# "buttonClick(this,"+Container.ItemIndex+")" %>'>
											Vista previa de impresión
										</button>
									</ItemTemplate>
								</telerik:GridTemplateColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>

			<div class="col-md-12"></div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvHIV" Width="100%" Visible="false">
			<div class="row">
				<div class="col-md-12">
					<asp:HiddenField ID="hfIdMuestraVIH" runat="server" />
					<bs:BacteriologySignature runat="server" ID="bsVIH" />
				</div>
				<div class="col-md-12">
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
				<div class="col-md-12">
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
				<div class="col-md-12">
					Prueba presuntiva sujeta a confirmación
				</div>
				<div class="col-md-12 text-center">
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
				<div class="col-md-12">
					<b>Comentarios</b>
				</div>
				<div class="col-lg-12 col-md-10 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtComentVIH" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana"></telerik:RadTextBox>
				</div>
				<div class="col-md-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-md-12">
					<telerik:RadGrid Culture="es-CO" ID="rgVih" runat="server" OnNeedDataSource="rgVih_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">
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

				<div class="col-md-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-md-12">

					<telerik:RadGrid Culture="es-CO" ID="rgVihAnt" runat="server" OnNeedDataSource="rgVihAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="7em" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="14em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>
								<telerik:GridTemplateColumn>
									<ItemStyle Width="15em" />
									<ItemTemplate>
										<button type="button" class="button" onclick='<%# "buttonClick(this,"+Container.ItemIndex+")" %>'>
											Vista previa de impresión
										</button>
									</ItemTemplate>
								</telerik:GridTemplateColumn>

							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvVDRL" Width="100%" Visible="false">
			<div class="row">
				<div class="col-md-12">
					<asp:HiddenField ID="hfIdMuestraSero" runat="server" />
					<bs:BacteriologySignature runat="server" ID="bsSerologia" />
				</div>
				<div class="col-md-12"></div>

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
					<telerik:RadNumericTextBox ID="rntValorSero" runat="server" Style="display: inline" MinValue="0" MaxLength="5" MaxValue="500" Visible="True" Width="195px" Font-Names="Verdana">
						<NumberFormat DecimalDigits="2" AllowRounding="false" />
					</telerik:RadNumericTextBox>
					<asp:Label ID="lblUnitValSer" runat="server" Style="display: inline" Visible="True" CssClass="fuente">dils</asp:Label>
				</div>

				<div class="col-md-12 text-center">
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
				<div class="col-md-12">
					Observaciones:
				</div>
				<div class="col-md-12">
					<telerik:RadTextBox ID="rtxtComentarioSerol" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana"></telerik:RadTextBox>
				</div>
				<div class="col-md-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-md-12">
					<telerik:RadGrid ID="rgSero" runat="server" OnNeedDataSource="rgSero_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

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
				<div class="col-md-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-md-12">

					<telerik:RadGrid ID="rgSeroAnt" runat="server" OnNeedDataSource="rgSeroAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="7em" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Valor" DataField="VALOR" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="14em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>
								<telerik:GridTemplateColumn>
									<ItemStyle Width="15em" />
									<ItemTemplate>
										<button type="button" class="button" onclick='<%# "buttonClick(this,"+Container.ItemIndex+")" %>'>
											Vista previa de impresión
										</button>
									</ItemTemplate>
								</telerik:GridTemplateColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvHepatitisB" Width="100%" Visible="false">
			<div class="row">
				<div class="col-md-12">
					<asp:HiddenField ID="hfIdMuestraHepB" runat="server" />
					<bs:BacteriologySignature runat="server" ID="bsHepatitisB" />
				</div>
				<div class="col-md-12">
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
				<div class="col-md-12">
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
				<div class="col-md-12">
					Prueba presuntiva sujeta a confirmación
				</div>
				<div class="col-md-12 text-center">
					<telerik:RadButton ID="rbtnHepB" runat="server" Text="Guardar información" CausesValidation="true" ValidationGroup="HepB" OnClick="rbtnHepB_Click">
					</telerik:RadButton>
					<telerik:RadButton ID="rbtnLoadFileHepaB" runat="server" CausesValidation="false" UseSubmitBehavior="false" OnClientClicking="CargarFileHepaB"
						Text="Cargar Archivo" Visible="false">
					</telerik:RadButton>
					<telerik:RadButton ID="rbtnEliminarHepB" runat="server" CausesValidation="false"
						UseSubmitBehavior="False" Text="Eliminar Muestra" OnClientClicking="ValidarEliminacion" OnClick="rbtnEliminarHepB_Click">
					</telerik:RadButton>
				</div>

				<div class="col-md-12">
					<b>Comentarios</b>
				</div>
				<div class="col-lg-12 col-md-10 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtCommentHepB" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana"></telerik:RadTextBox>
				</div>
				<div class="col-md-12">

					<telerik:RadGrid ID="rgHepB" runat="server" OnNeedDataSource="rgHepB_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

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

				<div class="col-md-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-md-12">

					<telerik:RadGrid ID="rgHepBAnt" runat="server" OnNeedDataSource="rgHepBAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="7em" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="14em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>
								<telerik:GridTemplateColumn>
									<ItemStyle Width="15em" />
									<ItemTemplate>
										<button type="button" class="button" onclick='<%# "buttonClick(this,"+Container.ItemIndex+")" %>'>
											Vista previa de impresión
										</button>
									</ItemTemplate>
								</telerik:GridTemplateColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvHepC" Width="100%" Visible="false">
			<div class="row">
				<div class="col-md-12">
					<asp:HiddenField ID="hfIdMuestraHepC" runat="server" />
					<bs:BacteriologySignature runat="server" ID="bsHepatitisC" />
				</div>
				<div class="col-md-12">
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
				<div class="col-md-12">
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
				<div class="col-md-12">
					Prueba presuntiva sujeta a<br />
					confirmación
				</div>
				<div class="col-md-12 text-center">
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
				<div class="col-md-12">
					<b>Comentarios</b>
				</div>
				<div class="col-md-12">
					<telerik:RadTextBox ID="rtxtCommentHepC" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana"></telerik:RadTextBox>
				</div>
				<div class="col-md-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-md-12">
					<telerik:RadGrid ID="rgHepC" runat="server" OnNeedDataSource="rgHepC_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

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

				<div class="col-md-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-md-12">

					<telerik:RadGrid ID="rgHepCAnt" runat="server" OnNeedDataSource="rgHepCAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="7em" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="14em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>
								<telerik:GridTemplateColumn>
									<ItemStyle Width="15em" />
									<ItemTemplate>
										<button type="button" class="button" onclick='<%# "buttonClick(this,"+Container.ItemIndex+")" %>'>
											Vista previa de impresión
										</button>
									</ItemTemplate>
								</telerik:GridTemplateColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvCuadroHematico" Width="100%" Visible="false">
			<div class="row">
				<div class="col-md-12">
					<asp:HiddenField ID="hfIdMuestraCH" runat="server" />
					<bs:BacteriologySignature runat="server" ID="bsCuadroHematico" />
				</div>
				<div class="col-md-12">
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

				<div class="col-md-12 text-center">
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

				<div class="col-md-12">
					<b>Comentarios</b>
				</div>
				<div class="col-md-12">
					<telerik:RadTextBox ID="rtxtComentarioCH" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana">
					</telerik:RadTextBox>
				</div>

				<div class="col-md-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-md-12">
					<telerik:RadGrid ID="rgCH" runat="server" OnNeedDataSource="rgCH_NeedDataSource" AutoGenerateColumns="false" Culture="es-CO">
						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

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

				<div class="col-md-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-md-12">

					<telerik:RadGrid ID="rgCHAnt" runat="server" OnNeedDataSource="rgCHAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="7em" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="14em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>
								<telerik:GridTemplateColumn>
									<ItemStyle Width="15em" />
									<ItemTemplate>
										<button type="button" class="button" onclick='<%# "buttonClick(this,"+Container.ItemIndex+")" %>'>
											Vista previa de impresión
										</button>
									</ItemTemplate>
								</telerik:GridTemplateColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvCreatinina" Width="100%" Visible="false">
			<div class="row">
				<div class="col-md-12 form-group">
					<asp:HiddenField ID="hfIdMuestraCreatinina" runat="server" />
					<bs:BacteriologySignature runat="server" ID="bsCreatinina" />
					<div class="titulo">Creatinina</div>
				</div>
				<div class="col-md-12 form-group">
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

				<div class="col-md-12 form-group">
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

				<div class="col-md-12 form-group">
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
				<div class="col-md-12 form-group text-center">
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
				</div>

				<div class="col-md-12 form-group">
					<div class="col-md-12">
						<b>Comentarios</b>
					</div>
					<div class="col-md-12">
						<telerik:RadTextBox ID="rtxtComentarioCrea" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana"></telerik:RadTextBox>
					</div>
				</div>

				<div class="col-md-12 form-group">
					<div class="col-md-12">
						<h4><b>Archivos Adjuntos</b></h4>
					</div>

					<div class="col-md-12">
						<telerik:RadGrid ID="rgCrea" runat="server" OnNeedDataSource="rgCrea_NeedDataSource" AutoGenerateColumns="false">

							<PagerStyle AlwaysVisible="true" />

							<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

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

				<div class="col-md-12 form-group">
					<div class="col-md-12 text-center">
						<h4><b>Muestras Anteriores</b></h4>
					</div>

					<div class="col-md-12">

						<telerik:RadGrid ID="rgCreaAnt" runat="server" OnNeedDataSource="rgCreaAnt_NeedDataSource" AutoGenerateColumns="false">

							<PagerStyle AlwaysVisible="true" />

							<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

								<Columns>

									<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
										<ItemStyle Width="7em" />
									</telerik:GridHyperLinkColumn>

									<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
										<ItemStyle Width="12em" />
									</telerik:GridBoundColumn>

									<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
									</telerik:GridBoundColumn>

									<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
										<ItemStyle Width="14em" />
									</telerik:GridBoundColumn>

									<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
										<ItemStyle Width="12em" />
									</telerik:GridBoundColumn>
									<telerik:GridTemplateColumn>
										<ItemStyle Width="15em" />
										<ItemTemplate>
											<button type="button" class="button" onclick='<%# "buttonClick(this,"+Container.ItemIndex+")" %>'>
												Vista previa de impresión
											</button>
										</ItemTemplate>
									</telerik:GridTemplateColumn>
								</Columns>
							</MasterTableView>
						</telerik:RadGrid>
					</div>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvHemoGli" Width="100%" Visible="false">
			<div class="row">
				<div class="col-md-12">
					<asp:HiddenField ID="hfIdMuestraHemGli" runat="server" />
					<bs:BacteriologySignature runat="server" ID="bsHemGli" />
				</div>
				<div class="col-md-12">
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
				<div class="col-md-12 text-center">
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

				<div class="col-md-12">
					<b>Comentarios</b>
				</div>
				<div class="col-md-12">
					<telerik:RadTextBox ID="rtxtComentarioHemGli" runat="server" TextMode="MultiLine" Rows="5" Width="99%" Font-Names="Verdana"></telerik:RadTextBox>
				</div>

				<div class="col-md-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-md-12">
					<telerik:RadGrid ID="rgHemGli" runat="server" OnNeedDataSource="rgHemGli_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

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

				<div class="col-md-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-md-12">

					<telerik:RadGrid ID="rgHemGliAnt" runat="server" OnNeedDataSource="rgHemGliAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="7em" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Valor" DataField="VALOR" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="14em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>
								<telerik:GridTemplateColumn>
									<ItemStyle Width="15em" />
									<ItemTemplate>
										<button type="button" class="button" onclick='<%# "buttonClick(this,"+Container.ItemIndex+")" %>'>
											Vista previa de impresión
										</button>
									</ItemTemplate>
								</telerik:GridTemplateColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView runat="server" ID="rpvOtro" Width="100%" Visible="false">
			<div class="row">
				<div class="col-md-12">
					<asp:HiddenField ID="hfIdMuestraOtro" runat="server" />
					<bs:BacteriologySignature runat="server" ID="bsOtros" />
				</div>
				<div class="col-md-12">
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

				<div class="col-md-12 text-center">
					<telerik:RadButton ID="rbtnOtroGuardar" runat="server" CausesValidation="true" ValidationGroup="Otro" Text="Guardar Información" OnClick="rbtnOtroGuardar_Click" Font-Bold="True" Font-Names="Verdana">
					</telerik:RadButton>

					<telerik:RadButton ID="rbtnLoadFileOtro" runat="server" CausesValidation="false" UseSubmitBehavior="false" OnClientClicking="CargarFileOtro" Text="Cargar Archivo"
						Visible="false">
					</telerik:RadButton>

					<telerik:RadButton ID="rbtnEliminarOtro" runat="server" CausesValidation="false"
						UseSubmitBehavior="False" Text="Eliminar Muestra" OnClientClicking="ValidarEliminacion" OnClick="rbtnEliminarOtro_Click">
					</telerik:RadButton>
				</div>

				<div class="col-md-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-md-12">
					<telerik:RadGrid ID="rgOtro" runat="server" OnNeedDataSource="rgOtro_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

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
								<telerik:GridTemplateColumn>
									<ItemTemplate>
										<button type="button" class="button" onclick='<%# "buttonClick(this,"+Container.ItemIndex+")" %>'>
											Vista previa de impresión
										</button>
									</ItemTemplate>
								</telerik:GridTemplateColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>

				<div class="col-md-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-md-12">

					<telerik:RadGrid ID="rgOtroAnt" runat="server" OnNeedDataSource="rgOtroAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

							<Columns>

								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:VerMuestraAnt({0});" Text="Ver Detalle">
									<ItemStyle Width="7em" />
								</telerik:GridHyperLinkColumn>

								<telerik:GridBoundColumn HeaderText="Descripcion" DataField="DESCRIPCION" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Adjunto" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Adjunto" DataType="System.String">
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Fecha Toma" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.DateTime">
									<ItemStyle Width="14em" />
								</telerik:GridBoundColumn>

								<telerik:GridBoundColumn HeaderText="Usuario toma" DataField="ULTIMA_MODIFICACION" UniqueName="Usuario" DataType="System.String">
									<ItemStyle Width="12em" />
								</telerik:GridBoundColumn>
								<telerik:GridTemplateColumn>
									<ItemStyle Width="15em" />
									<ItemTemplate>
										<button type="button" class="button" onclick='<%# "buttonClick(this,"+Container.ItemIndex+")" %>'>
											Vista previa de impresión
										</button>
									</ItemTemplate>
								</telerik:GridTemplateColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</telerik:RadPageView>

		<telerik:RadPageView ID="rpvCultivo" runat="server" Width="100%" Visible="false">
			<div class="row">
				<div class="col-md-12">
					<asp:HiddenField ID="hfIdMuestraCultivo" runat="server" />
				</div>
				<div class="col-md-12">
					<div class="titulo">Cultivos</div>
				</div>

				<div class="col-md-12 text-center">
					<telerik:RadButton ID="rbtnAddCultivo" runat="server" Text="Agregar nueva informacion" CausesValidation="false" UseSubmitBehavior="false" OnClick="rbtnAddCultivo_Click"></telerik:RadButton>

					<telerik:RadButton ID="rbtnAddFileCult" runat="server" Text="Agregar informacion" CausesValidation="false" UseSubmitBehavior="false" Visible="false" OnClientClicking="CargarFileCultivo"></telerik:RadButton>

					<telerik:RadButton ID="rbtnEliminarCultivo" runat="server" CausesValidation="false" UseSubmitBehavior="False" Text="Eliminar Muestra"
						OnClientClicking="ValidarEliminacion" OnClick="rbtnEliminarCultivo_Click">
					</telerik:RadButton>
				</div>

				<div class="col-md-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-md-12">
					<telerik:RadGrid ID="rgCultivos" runat="server" OnNeedDataSource="rgCultivos_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

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

				<div class="col-md-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-md-12">

					<telerik:RadGrid ID="rgCultivosAnt" runat="server" OnNeedDataSource="rgCultivosAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

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

		<telerik:RadPageView ID="rpvBaciloscopia" runat="server" Width="100%" Visible="false">
			<div class="row">
				<div class="col-md-12">
					<asp:HiddenField ID="hfIdMuestraBaciloscopia" runat="server" />
				</div>
				<div class="col-md-12">
					<div class="titulo">Baciloscopias</div>
				</div>

				<div class="col-md-12 text-center">
					<telerik:RadButton ID="rbtnAddBaciloscopia" runat="server" Text="Agregar nueva informacion" CausesValidation="false" UseSubmitBehavior="false" OnClick="rbtnAddBaciloscopia_Click"></telerik:RadButton>

					<telerik:RadButton ID="rbtnAddFileBacilo" runat="server" Text="Agregar informacion" CausesValidation="false" UseSubmitBehavior="false" Visible="false" OnClientClicking="CargarFileBaciloscopia"></telerik:RadButton>

					<telerik:RadButton ID="rbtnEliminarBacilo" runat="server" CausesValidation="false" UseSubmitBehavior="False" Text="Eliminar Muestra"
						OnClientClicking="ValidarEliminacion" OnClick="rbtnEliminarBacilo_Click">
					</telerik:RadButton>
				</div>

				<div class="col-md-12 text-center">
					<h4><b>Archivos Adjuntos</b></h4>
				</div>
				<div class="col-md-12">
					<telerik:RadGrid ID="rgBacilo" runat="server" OnNeedDataSource="rgBacilo_NeedDataSource" AutoGenerateColumns="false" Culture="es-co">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

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

				<div class="col-md-12 text-center">
					<h4><b>Muestras Anteriores</b></h4>
				</div>
				<div class="col-md-12">

					<telerik:RadGrid ID="rgBaciloAnt" runat="server" OnNeedDataSource="rgBaciloAnt_NeedDataSource" AutoGenerateColumns="false">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID" ClientDataKeyNames="ID">

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

	<asp:HiddenField ID="direccionLaboratorio" runat="server" />
	<asp:HiddenField ID="ciudad" runat="server" />
	<asp:HiddenField ID="telefonoLaboratorio" runat="server" />
	<asp:HiddenField ID="faxLaboratorio" runat="server" />

	<asp:HiddenField ID="registroProfesional" runat="server" />
	<!--Inicio de la tabla resumen en español-->
	<div id="examsLayout" hasbeenprinted="notANumber" style="margin: 0 auto;">
		<div id="HeaderTable" style="margin-top: 10px; margin-bottom: 10px;">
			<div class="row">
				<div class="col-lg-4">
					<p style="font-family: 'Avenir'; font-size: 14px; font-weight: 700">
						Laboratorio Clínico
					</p>
					<p style="font-family: 'Avenir'; font-size: 12px; font-weight: 600">
						Doctora Yadira Isabel Granda Vanegas
					</p>
					<p style="font-family: 'Avenir'; font-size: 10px; font-weight: 500">
						Bacterióloga Colegio Mayor de Cundinamarca
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
						<strong>Pasaporte: </strong><span id="spID"></span>
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
							OLOR: <span id="spOlor"></span>
						</p>
						<p>
							COLOR: <span id="spColor"></span>
						</p>
						<p>
							ASPECTO: <span id="spAspecto"></span>
						</p>
					</div>
					<div class="col-lg-4">
						<p>
							GLUCOSA: <span id="spGLU"></span>
						</p>
						<p>
							BILIRRUBINA: <span id="spBIL"></span>
						</p>
						<p>
							CETONA: <span id="spCET"></span>
						</p>
						<p>
							DENSIDAD: <span id="spDEN"></span>
						</p>
						<p>
							PH: <span id="spPH"></span>
						</p>
						<p>
							PROTEINA: <span id="spPRO"></span>
						</p>
						<p>
							UROBILINOGENOS: <span id="spURO"></span>
						</p>
						<p>
							NITRITOS: <span id="spNIT"></span>
						</p>
						<p>
							SANGRE: <span id="spSAN"></span>
						</p>
						<p>
							LEUCOCITOS: <span id="spLEU"></span>
						</p>
					</div>
					<div class="col-lg-4">
						<p>
							LEUCOCITOS POR CAMPO: <span id="spLeucoCampo"></span>
						</p>
						<p>
							HEMATÍES POR CAMPO: <span id="spHematieCampo"></span>
						</p>
						<p>
							CÉLULAS ALTAS POR CAMPO: <span id="spCelAltaCampo"></span>
						</p>
						<p>
							CÉLULAS BAJAS POR CAMPO: <span id="spCelBajaCampo"></span>
						</p>
						<p>
							MOCO: <span id="spMoco"></span>
						</p>
						<p>
							BACTERIAS: <span id="spBacterias"></span>
						</p>
						<p>
							CILÍNDROS: <span id="spCilindros"></span>
						</p>
						<p>
							CRISTALES: <span id="spCristales"></span>
						</p>
						<p>
							LEVADURAS: <span id="spLevaduras"></span>
						</p>
						<p>
							OTROS: <span id="spOtros"></span>
						</p>
					</div>
					<div class="col-lg-12" style="min-height: 35px">
						<strong>Observaciones: </strong><span id="spCommentUrol"></span>
					</div>
				</div>
				<div class="col-lg-5 col-lg-offset-7 firmaUrologia">
					<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
					<div>
						<strong>Dr. <span class="spNomBacteriologo"></span>
						</strong>
					</div>
					<div>
						Registro profesional: <span class="spRegistroProfesional"></span>
					</div>
					<div>
						Universidad: <span class="spUniversidad"></span>
					</div>
					<div>
						E-mail: <span class="spCorreoElectronico"></span>
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
					<div class="col-lg-5 col-lg-offset-7 firmaVIH">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Registro profesional: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							Universidad: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
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
					<div class="col-lg-5 col-lg-offset-7 firmaSerologia">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Registro profesional: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							Universidad: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
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
					<div class="col-lg-5 col-lg-offset-7 firmaHepatitisB">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Registro profesional: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							Universidad: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
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
					<div class="col-lg-5 col-lg-offset-7 firmaHepatitisC">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Registro profesional: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							Universidad: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
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
					<div class="col-lg-5 col-lg-offset-7 firmaCuadroHematico">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Registro profesional: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							Universidad: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
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
							<span id="spCrea"></span>
						</p>
					</div>
					<div class="col-lg-6 col-lg-offset-6 valor-creatinina">
						<p>
							<span id="spValorCrea"></span>mg/dl
						</p>
					</div>
					<div class="col-lg-5 col-lg-offset-7 firmaCreatinina">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Registro profesional: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							Universidad: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
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
					<div class="col-lg-5 col-lg-offset-7 firmaHemGli">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Registro profesional: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							Universidad: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
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
					<div class="col-lg-5 col-lg-offset-7 firmaOtros">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Registro profesional: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							Universidad: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="row" style="padding-top: 20px;">
			<div id="FooterTable" class="tableELD">
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
					<p style="font-family: 'Avenir'; font-size: 14px; font-weight: 700">
						Clinical Laboratory
					</p>
					<p style="font-family: 'Avenir'; font-size: 12px; font-weight: 600">
						Doctor Yadira Isabel Granda Vanegas
					</p>
					<p style="font-family: 'Avenir'; font-size: 10px; font-weight: 500">
						Colegio Mayor de Cundinamarca Bacteriologist
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
						<strong>Passport: </strong><span id="spIDEng"></span>
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
							ODOR: <span id="spOlorEng"></span>
						</p>
						<p>
							COLOUR: <span id="spColorEng"></span>
						</p>
						<p>
							APPEARANCE: <span id="spAspectoEng"></span>
						</p>
					</div>
					<div class="col-lg-4">
						<p>
							GLUCOSE: <span id="spGLUEng"></span>
						</p>
						<p>
							BILIRRUBIN: <span id="spBILEng"></span>
						</p>
						<p>
							KETONE: <span id="spCETEng"></span>
						</p>
						<p>
							SPECIFIC GRAVITY: <span id="spDENEng"></span>
						</p>
						<p>
							PH: <span id="spPHEng"></span>
						</p>
						<p>
							PROTEIN: <span id="spPROEng"></span>
						</p>
						<p>
							UROBILINOGEN: <span id="spUROEng"></span>
						</p>
						<p>
							NITRITE: <span id="spNITEng"></span>
						</p>
						<p>
							BLOOD: <span id="spSANEng"></span>
						</p>
						<p>
							LEUKOCYTES: <span id="spLEUEng"></span>
						</p>
					</div>
					<div class="col-lg-4">
						<p>
							LEUKOCITES BY FIELD: <span id="spLeucoCampoEng"></span>
						</p>
						<p>
							RED BLOOD CELLS BY FIELD: <span id="spHematieCampoEng"></span>
						</p>
						<p>
							HIGH CELLS BY FIELD: <span id="spCelAltaCampoEng"></span>
						</p>
						<p>
							LOW CELLS BY FIELDS: <span id="spCelBajaCampoEng"></span>
						</p>
						<p>
							MUCUS: <span id="spMocoEng"></span>
						</p>
						<p>
							BACTERIA: <span id="spBacteriasEng"></span>
						</p>
						<p>
							CYLINDERS: <span id="spCilindrosEng"></span>
						</p>
						<p>
							CRYSTALS: <span id="spCristalesEng"></span>
						</p>
						<p>
							YEAST: <span id="spLevadurasEng"></span>
						</p>
						<p>
							OTHERS: <span id="spOtrosEng"></span>
						</p>
					</div>
					<div class="col-lg-12" style="min-height: 35px">
						<strong>Observations: </strong><span id="spCommentUrolEng"></span>
					</div>
				</div>
				<div class="col-lg-5 col-lg-offset-7 firmaUrologia">
					<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
					<div>
						<strong>Dr. <span class="spNomBacteriologo"></span>
						</strong>
					</div>
					<div>
						Bacteriology record: <span class="spRegistroProfesional"></span>
					</div>
					<div>
						University: <span class="spUniversidad"></span>
					</div>
					<div>
						E-mail: <span class="spCorreoElectronico"></span>
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
					<div class="col-lg-5 col-lg-offset-7 firmaVIH">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Bacteriology record: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							University: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
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
					<div class="col-lg-5 col-lg-offset-7 firmaSerologia">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Bacteriology record: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							University: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
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
					<div class="col-lg-5 col-lg-offset-7 firmaHepatitisB">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Bacteriology record: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							University: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
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
					<div class="col-lg-5 col-lg-offset-7 firmaHepatitisC">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Bacteriology record: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							University: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
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
					<div class="col-lg-5 col-lg-offset-7 firmaCuadroHematico">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Bacteriology record: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							University: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
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
							<span id="spCreaEng"></span>
						</p>
					</div>
					<div class="col-lg-6  col-lg-offset-6 valor-creatinina">
						<p>
							<span id="spValorCreaEng"></span>mg/dl
						</p>
					</div>
					<div class="col-lg-5 col-lg-offset-7 firmaCreatinina">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Bacteriology record: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							University: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
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
					<div class="col-lg-5 col-lg-offset-7 firmaHemGli">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Bacteriology record: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							University: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>

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
					<div class="col-lg-5 col-lg-offset-7 firmaOtros">
						<img class="imgFirmaBacteriologo" width="215px" alt="Firma bacteriologo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" /><br />
						<div>
							<strong>Dr. <span class="spNomBacteriologo"></span>
							</strong>
						</div>
						<div>
							Bacteriology record: <span class="spRegistroProfesional"></span>
						</div>
						<div>
							University: <span class="spUniversidad"></span>
						</div>
						<div>
							E-mail: <span class="spCorreoElectronico"></span>
						</div>
					</div>

				</div>
			</div>

		</div>
		<div class="row" style="padding-top: 20px;">
			<div id="FooterTableEng" class="tableELD">
				<div class="row" style="margin-top: 10px; margin-bottom: 10px; font-family: 'Avenir'; font-weight: 400; text-align: center">
					<p>
						<span id="spDireccionLaboratorioEng">Carrera 11 N 94 a 25 - of 401</span>&#8226
                        <span id="spCiudadEng">Bogotá D.C. - Colombia</span>&#8226
                        <span id="spTelefonoLaboratorioEng">Tel: 6356312, 3656379, 6356402</span>&#8226
                        <span id="spFaxLaboratorioEng">Fax:</span>&#8226
                        <span id="CorreoElectBacteriologoEng">consultoriopicu@gmail.com</span>
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
			var idh = $("#<%=this.hfIdHist.ClientID%>").val();
			var idMu = $('#<%=this.hfIdMuestraUrol.ClientID%>').val();
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileVih(sender, e)
		{
			var idh = $("#<%=this.hfIdHist.ClientID%>").val();
			var idMu = $('#<%=this.hfIdMuestraVIH.ClientID%>').val();
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileSero(sender, e)
		{
			var idh = $("#<%=this.hfIdHist.ClientID%>").val();
			var idMu = $('#<%=this.hfIdMuestraSero.ClientID%>').val();
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileHepaB(sender, e)
		{
			var idh = $("#<%=this.hfIdHist.ClientID%>").val();
			var idMu = $('#<%=this.hfIdMuestraHepB.ClientID%>').val();
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileHepaC(sender, e)
		{
			var idh = $("#<%=this.hfIdHist.ClientID%>").val();
			var idMu = $('#<%=this.hfIdMuestraHepC.ClientID%>').val();
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileCH(sender, e)
		{
			var idh = $("#<%=this.hfIdHist.ClientID%>").val();
			var idMu = $('#<%=this.hfIdMuestraCH.ClientID%>').val();
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileCre(sender, e)
		{
			var idh = $("#<%=this.hfIdHist.ClientID%>").val();
			var idMu = $('#<%=this.hfIdMuestraCreatinina.ClientID%>').val();
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileHemGli(sender, e)
		{
			var idh = $("#<%=this.hfIdHist.ClientID%>").val();
			var idMu = $('#<%=this.hfIdMuestraHemGli.ClientID%>').val();
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileOtro(sender, e)
		{
			var idh = $("#<%=this.hfIdHist.ClientID%>").val();
			var idMu = $('#<%=this.hfIdMuestraOtro.ClientID%>').val();
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileCultivo(sender, e)
		{
			var idh = $("#<%=this.hfIdHist.ClientID%>").val();
			var idMu = $('#<%=this.hfIdMuestraCultivo.ClientID%>').val();
			openFileupload(idh, idMu);
			e.set_cancel(true);
		}

		function CargarFileBaciloscopia(sender, e)
		{
			var idh = $("#<%=this.hfIdHist.ClientID%>").val();
			var idMu = $('#<%=this.hfIdMuestraBaciloscopia.ClientID%>').val();
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
			var btnShow = $("#<%=this.rbtnAbrirDialogo.ClientID%>");
			btnShow.click();

			var hf = $("#<%=this.hfResumeToPdf.ClientID%>");
			var btn = $("#<%=this.rbtnSendMail.ClientID%>");

			var ficha = $("#printable").cloneNode(true);

			var estilo = $("#printStyles").cloneNode(true);
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

			hf.value = entireText.replace(/</g, "___|").replace(/>/g, "|___");
			console.log("El resultado");
			console.log(hf.value);
			btn.click();
		}
	</script>

	<script type="text/javascript" id="printBuilder">
		var PrevTest = null;
		//Put your JavaScript code here.
		function buttonClick(sender, index)
		{
			var tableID = $(sender).closest("table.rgMasterTable").attr("id")

			var masterTable = $find(tableID);
			var item = masterTable.get_dataItems()[index];
			var obj = { "idMuestra": item.getDataKeyValue("ID") }

			$.ajax({
				type: "GET",
				url: "Laboratorio.aspx/LoadInfo",
				data: obj,
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: PreparePrintPreview,
				error: function (status, error, xhr)
				{
					console.log(xhr.response);
				}
			});
		}

		function PreparePrintPreview(response)
		{
			PrevTest = JSON.parse(response.d);
			if (PrevTest.Resultado == "SIN APLICAR")
			{
				alert("La prueba que desea visualizar no te tomó");
				return;
			}
			ViewExamsAbstract();
			updateLayout(null, PrevTest);
		}

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
			checks.chkUrologia = $("#<%=this.chkUro.ClientID%>").prop("checked");
			checks.chkVIH = $("#<%=this.chkVih.ClientID%>").prop("checked");
			checks.chkSerologia = $("#<%=this.chkSero.ClientID%>").prop("checked");
			checks.chkHepatitisB = $("#<%=this.chkHepB.ClientID%>").prop("checked");
			checks.chkHepatitisC = $("#<%=this.chkHepC.ClientID%>").prop("checked");
			checks.chkCuadroHematico = $("#<%=this.chkCH.ClientID%>").prop("checked");
			checks.chkCreatinina = $("#<%=this.chkCrea.ClientID%>").prop("checked");
			checks.chkHemGlicosilada = $("#<%=this.chkHemGli.ClientID%>").prop("checked");
			checks.chkOtrosExamenes = $("#<%=this.chkOtro.ClientID%>").prop("checked");

			var objReturn = divSelExamenesObj(checks);
			return objReturn;
		}

		function updateLayout(sender, obj)
		{


			if ($("#printable").length)
			{
				removeChildren("impresion");
			}
			if ($("#printableEng").length)
			{
				removeChildren("impresionEng");
			}

			var message = "";

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

			if (sender != null)
			{
				checks.Uro = returnppty("checkBxUro", "checked");
				checks.VIH = returnppty("checkBxVIH", "checked");
				checks.Ser = returnppty("checkBxSero", "checked");
				checks.HpB = returnppty("checkBxHepB", "checked");
				checks.HpC = returnppty("checkBxHepC", "checked");
				checks.CHm = returnppty("checkBxCH", "checked");
				checks.Crt = returnppty("checkBxCre", "checked");
				checks.OEx = returnppty("checkBxOEx", "checked");
				checks.HmG = returnppty("checkBxHmGl", "checked");
			}
			else
			{
				switch (obj.IdTipoExamen)
				{
					//Uroanalisis = 1,
					case 1:
						checks.Uro = true;
						break;
					//Vih = 2,
					case 2:
						checks.VIH = true;
						break;
					//SerologiaVdrl = 3,
					case 3:
						checks.Ser = true;
						break;
					//HbsAg = 4,
					case 4:
						checks.HpB = true;
						break;
					//HepatitisC = 5,
					case 5:
						checks.HpC = true;
						break;
					//CuadroHematico = 6,
					case 6:
						checks.CHm = true;
						break;
					//Creatinina = 7,
					case 7:
						checks.Crt = true;
						break;
					//HemoglobinaGlicosilada = 8,
					case 8:
						checks.HmG = true;
						break;
					//Otro = 9,
					case 9:
						checks.OEx = true;
						break;
					//Cultivo = 10, // 0x0000000A
				}
			}

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

			var parentNodeBackup = $("#examsLayout").parent();
			var copybackup = $("#examsLayout").clone(true);
			var copybackupEng = $("#examsLayoutEng").clone(true);

			var datosLab = {
				nomLab: $("#<%=this.nombreLaboratorio.ClientID %>").val(),
				dirLab: $("#<%=this.direccionLaboratorio.ClientID %>").val(),
				ciudad: $("#<%=this.ciudad.ClientID %>").val(),
				telLab: $("#<%=this.telefonoLaboratorio.ClientID %>").val(),
				faxLab: $("#<%=this.faxLaboratorio.ClientID %>").val(),
			};

			UpdateInfoLab(datosLab);

			//Español
			$('#spNombre').html($("#<%=this.rtxtNombres.ClientID%>").val());
			$('#spFecha').html($("#<%=this.rdpFecha.ClientID%>").val());
			$('#spID').html($find("<%=this.rtxtPasaporte.ClientID%>").get_value());
			$('#spEdad').html(calcularEdad($("#<%=this.hfEdad.ClientID%>").val()));
			//English
			$('#spNombreEng').html($("#<%=this.rtxtNombres.ClientID%>").val());
			$('#spFechaEng').html($("#<%=this.rdpFecha.ClientID%>").val());
			$('#spIDEng').html($find("<%=this.rtxtPasaporte.ClientID%>").get_value());
			$('#spEdadEng').html(calcularEdad($("#<%=this.hfEdad.ClientID%>").val()));

			var fotoSrc = $("#<%=this.imgPrePhoto.ClientID%>").attr("src");
			var foto = $("<img class='paciente'/>")
			foto.attr("src", fotoSrc);

			$("#imgContainer").empty();
			$('#imgContainer').append(foto.clone());

			$("#imgContainerEng").empty();
			$('#imgContainerEng').append(foto.clone());

			//verificacion uroanalisis
			if ($("#<%=this.rblEstadoUro.ClientID %>").length && checks.Uro)
			{
				//Se obtiene el valor de radio Sin Aplicar
				var check = sender == null ? false : $("#<%=this.rblEstadoUro.ClientID %>_0").prop("checked");

				if (!check)
				{

					var firmaContainner = sender == null ? null : $("[id*='<%=bsUrologia.ClientID%>']");
					var firmasDocumento = $(".firmaUrologia");

					var FirmaNombre = firmaContainner != null ? $(firmaContainner).get(0).value : obj.Bacteriologo.Nombres + " " + obj.Bacteriologo.Apellidos;
					var FirmaUniversidad = firmaContainner != null ? $(firmaContainner).get(1).value : obj.Bacteriologo.FirmaProfesional.Universidad;
					var FirmaRegistroProfesional = firmaContainner != null ? $(firmaContainner).get(2).value : obj.Bacteriologo.FirmaProfesional.RegistroProfesional;
					var FirmaFirmaBase64 = firmaContainner != null ? $(firmaContainner).get(3).value : obj.Bacteriologo.FirmaProfesional.FirmaBase64;
					var FirmaCorreoElectronico = firmaContainner != null ? $(firmaContainner).get(4).value : obj.Bacteriologo.FirmaProfesional.CorreoElectronico;

					firmasDocumento.find("img.imgFirmaBacteriologo").attr("src", FirmaFirmaBase64);
					firmasDocumento.find("span.spNomBacteriologo").text(FirmaNombre);
					firmasDocumento.find("span.spRegistroProfesional").text(FirmaRegistroProfesional);
					firmasDocumento.find("span.spUniversidad").text(FirmaUniversidad);
					firmasDocumento.find("span.spCorreoElectronico").text(FirmaCorreoElectronico);

					//Español
					$('#spOlor').html(sender == null ? obj.Olor : $("#<%=this.rtxtOlor.ClientID%>").val());
					$('#spColor').html(sender == null ? obj.Color : $("#<%=this.rtxtColor.ClientID%>").val());
					$('#spAspecto').html(sender == null ? obj.Aspecto : $("#<%=this.rtxtAspecto.ClientID%>").val());
					$('#spGLU').html(sender == null ? obj.Glu : $("#<%=this.rtxtGLU.ClientID%>").val());
					$('#spBIL').html(sender == null ? obj.Bil : $("#<%=this.rtxtBIL.ClientID%>").val());
					$('#spCET').html(sender == null ? obj.Cet : $("#<%=this.rtxtCET.ClientID%>").val());
					$('#spDEN').html(sender == null ? obj.Deh : $("#<%=this.rtxtDEN.ClientID%>").val());
					$('#spPH').html(sender == null ? obj.Ph : $("#<%=this.rtxtPH.ClientID%>").val());
					$('#spPRO').html(sender == null ? obj.Pro : $("#<%=this.rtxtPRO.ClientID%>").val());
					$('#spURO').html(sender == null ? obj.Uro : $("#<%=this.rtxtUro.ClientID%>").val());
					$('#spNIT').html(sender == null ? obj.Nit : $("#<%=this.rtxtNIT.ClientID%>").val());
					$('#spSAN').html(sender == null ? obj.San : $("#<%=this.rtxtSAN.ClientID%>").val());
					$('#spLEU').html(sender == null ? obj.Leu : $("#<%=this.rtxtLEU.ClientID%>").val());
					$('#spLeucoCampo').html(sender == null ? obj.LeucocitosCampo : $("#<%=this.rtxtLeucoCampo.ClientID%>").val());
					$('#spHematieCampo').html(sender == null ? obj.HematiesCampo : $("#<%=this.rtxtHematiesCampo.ClientID%>").val());
					$('#spCelAltaCampo').html(sender == null ? obj.CelulasAltasCampo : $("#<%=this.rtxtCelAltasCampo.ClientID%>").val());
					$('#spCelBajaCampo').html(sender == null ? obj.CelulasBajasCampo : $("#<%=this.rtxtCelBajasCampo.ClientID%>").val());
					$('#spMoco').html(sender == null ? obj.Moco : $("#<%=this.rtxtMoco.ClientID%>").val());
					$('#spBacterias').html(sender == null ? obj.Bacterias : $("#<%=this.rtxtBacterias.ClientID%>").val());
					$('#spCilindros').html(sender == null ? obj.Cilindros : $("#<%=this.rtxtCilindros.ClientID%>").val());
					$('#spCristales').html(sender == null ? obj.Cristales : $("#<%=this.rtxtCristales.ClientID%>").val());
					$('#spLevaduras').html(sender == null ? obj.Levaduras : $("#<%=this.rtxtLevaduras.ClientID%>").val());
					$('#spOtros').html(sender == null ? obj.Otros : $("#<%=this.rtxtOtros.ClientID%>").val());
					$('#spCommentUrol').html(sender == null ? obj.Observaciones : $("#<%=this.rtxtCommentUrol.ClientID%>").val());

					//English
					$('#spOlorEng').html(sender == null ? obj.Olor : $("#<%=this.rtxtOlor.ClientID%>").val());
					$('#spColorEng').html(sender == null ? obj.Color : $("#<%=this.rtxtColor.ClientID%>").val());
					$('#spAspectoEng').html(sender == null ? obj.Aspecto : $("#<%=this.rtxtAspecto.ClientID%>").val());
					$('#spGLUEng').html(sender == null ? obj.Glu : $("#<%=this.rtxtGLU.ClientID%>").val());
					$('#spBILEng').html(sender == null ? obj.Bil : $("#<%=this.rtxtBIL.ClientID%>").val());
					$('#spCETEng').html(sender == null ? obj.Cet : $("#<%=this.rtxtCET.ClientID%>").val());
					$('#spDENEng').html(sender == null ? obj.Deh : $("#<%=this.rtxtDEN.ClientID%>").val());
					$('#spPHEng').html(sender == null ? obj.Ph : $("#<%=this.rtxtPH.ClientID%>").val());
					$('#spPROEng').html(sender == null ? obj.Pro : $("#<%=this.rtxtPRO.ClientID%>").val());
					$('#spUROEng').html(sender == null ? obj.Uro : $("#<%=this.rtxtUro.ClientID%>").val());
					$('#spNITEng').html(sender == null ? obj.Nit : $("#<%=this.rtxtNIT.ClientID%>").val());
					$('#spSANEng').html(sender == null ? obj.San : $("#<%=this.rtxtSAN.ClientID%>").val());
					$('#spLEUEng').html(sender == null ? obj.Leu : $("#<%=this.rtxtLEU.ClientID%>").val());
					$('#spLeucoCampoEng').html(sender == null ? obj.LeucocitosCampo : $("#<%=this.rtxtLeucoCampo.ClientID%>").val());
					$('#spHematieCampoEng').html(sender == null ? obj.HematiesCampo : $("#<%=this.rtxtHematiesCampo.ClientID%>").val());
					$('#spCelAltaCampoEng').html(sender == null ? obj.CelulasAltasCampo : $("#<%=this.rtxtCelAltasCampo.ClientID%>").val());
					$('#spCelBajaCampoEng').html(sender == null ? obj.CelulasBajasCampo : $("#<%=this.rtxtCelBajasCampo.ClientID%>").val());
					$('#spMocoEng').html(sender == null ? obj.Moco : $("#<%=this.rtxtMoco.ClientID%>").val());
					$('#spBacteriasEng').html(sender == null ? obj.Bacterias : $("#<%=this.rtxtBacterias.ClientID%>").val());
					$('#spCilindrosEng').html(sender == null ? obj.Cilindros : $("#<%=this.rtxtCilindros.ClientID%>").val());
					$('#spCristalesEng').html(sender == null ? obj.Cristales : $("#<%=this.rtxtCristales.ClientID%>").val());
					$('#spLevadurasEng').html(sender == null ? obj.Levaduras : $("#<%=this.rtxtLevaduras.ClientID%>").val());
					$('#spOtrosEng').html(sender == null ? obj.Otros : $("#<%=this.rtxtOtros.ClientID%>").val());
					$('#spCommentUrolEng').html(sender == null ? obj.Observaciones : $("#<%=this.rtxtCommentUrol.ClientID%>").val());

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

			//verificacion VIH
			if ($("#<%=this.rblEstadoVih.ClientID %>").length && checks.VIH)
			{
				//Se obtiene el valor de radio Sin Aplicar
				var check = sender == null ? false : $("#<%=this.rblEstadoVih.ClientID %>_0").prop("checked");
				if (!check)
				{
					var firmaContainner = sender == null ? null : $("[id*='<%=bsVIH.ClientID%>']");
					var firmasDocumento = $(".firmaVIH");

					var FirmaNombre = sender == null ? obj.Bacteriologo.Nombres + " " + obj.Bacteriologo.Apellidos : $(firmaContainner).get(0).value;
					var FirmaUniversidad = sender == null ? obj.Bacteriologo.FirmaProfesional.Universidad : $(firmaContainner).get(1).value;
					var FirmaRegistroProfesional = sender == null ? obj.Bacteriologo.FirmaProfesional.RegistroProfesional : $(firmaContainner).get(2).value;
					var FirmaFirmaBase64 = sender == null ? obj.Bacteriologo.FirmaProfesional.FirmaBase64 : $(firmaContainner).get(3).value;
					var FirmaCorreoElectronico = sender == null ? obj.Bacteriologo.FirmaProfesional.CorreoElectronico : $(firmaContainner).get(4).value;

					firmasDocumento.find("img.imgFirmaBacteriologo").attr("src", FirmaFirmaBase64);
					firmasDocumento.find("span.spNomBacteriologo").text(FirmaNombre);
					firmasDocumento.find("span.spRegistroProfesional").text(FirmaRegistroProfesional);
					firmasDocumento.find("span.spUniversidad").text(FirmaUniversidad);
					firmasDocumento.find("span.spCorreoElectronico").text(FirmaCorreoElectronico);

					$('#spVIHResult').html(sender == null ? obj.Resultado : $("#<%=this.rcbxVIHResult.ClientID%>").val());
					$('#spVIHResultEng').html(sender == null ? obj.Resultado : $("#<%=this.rcbxVIHResult.ClientID%>").val());
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

			//verificacion Serologia
			if ($("#<%=this.rblEstadoSero.ClientID %>").length && checks.Ser)
			{
				var check = sender == null ? false : $("#<%=this.rblEstadoSero.ClientID %>_0").prop("checked");

				if (!check)
				{
					var firmaContainner = sender == null ? null : $("[id*='<%=bsSerologia.ClientID%>']");
					var firmasDocumento = $(".firmaSerologia");

					var FirmaNombre = sender == null ? obj.Bacteriologo.Nombres + " " + obj.Bacteriologo.Apellidos : $(firmaContainner).get(0).value;
					var FirmaUniversidad = sender == null ? obj.Bacteriologo.FirmaProfesional.Universidad : $(firmaContainner).get(1).value;
					var FirmaRegistroProfesional = sender == null ? obj.Bacteriologo.FirmaProfesional.RegistroProfesional : $(firmaContainner).get(2).value;
					var FirmaFirmaBase64 = sender == null ? obj.Bacteriologo.FirmaProfesional.FirmaBase64 : $(firmaContainner).get(3).value;
					var FirmaCorreoElectronico = sender == null ? obj.Bacteriologo.FirmaProfesional.CorreoElectronico : $(firmaContainner).get(4).value;

					firmasDocumento.find("img.imgFirmaBacteriologo").attr("src", FirmaFirmaBase64);
					firmasDocumento.find("span.spNomBacteriologo").text(FirmaNombre);
					firmasDocumento.find("span.spRegistroProfesional").text(FirmaRegistroProfesional);
					firmasDocumento.find("span.spUniversidad").text(FirmaUniversidad);
					firmasDocumento.find("span.spCorreoElectronico").text(FirmaCorreoElectronico);

					$('#spSerolResult').html(sender == null ? obj.Resultado.replace('_', ' ') : $find("<%=this.rcbxSero.ClientID%>").get_value().replace('_', ' '));

					if ($('#spSerolResult').html() == "REACTIVO")
					{
						$('#spSerolResultEng').html("REACTIVE");
						$('#spValorSerol').html(sender == null ? (obj.Valor <= 0 ? "" : obj.Valor) : $find("<%=this.rntValorSero.ClientID%>").get_value());
						$('#spValorSerolEng').html(sender == null ? (obj.Valor <= 0 ? "" : obj.Valor) : $find("<%=this.rntValorSero.ClientID%>").get_value());
					}
					else if ($('#spSerolResult').html() == "NO REACTIVO")
					{
						$('#spSerolResultEng').html(" NON REACTIVE");
						$('#spSerolResult').closest("div").html($('#spSerolResult').parent().html().replace("dils", ""));
						$('#spSerolResultEng').closest("div").html($('#spSerolResult').parent().html().replace("dils", ""));
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

			//verificacion Hepatitis B
			if ($("#<%=this.rblEstadoHepaB.ClientID %>").length && checks.HpB)
			{
				var check = sender == null ? false : $("#<%=this.rblEstadoHepaB.ClientID %>_0").prop("checked");

				if (!check)
				{
					var firmaContainner = sender == null ? null : $("[id*='<%=bsHepatitisB.ClientID%>']");
					var firmasDocumento = $(".firmaHepatitisB");

					var FirmaNombre = sender == null ? obj.Bacteriologo.Nombres + " " + obj.Bacteriologo.Apellidos : $(firmaContainner).get(0).value;
					var FirmaUniversidad = sender == null ? obj.Bacteriologo.FirmaProfesional.Universidad : $(firmaContainner).get(1).value;
					var FirmaRegistroProfesional = sender == null ? obj.Bacteriologo.FirmaProfesional.RegistroProfesional : $(firmaContainner).get(2).value;
					var FirmaFirmaBase64 = sender == null ? obj.Bacteriologo.FirmaProfesional.FirmaBase64 : $(firmaContainner).get(3).value;
					var FirmaCorreoElectronico = sender == null ? obj.Bacteriologo.FirmaProfesional.CorreoElectronico : $(firmaContainner).get(4).value;

					firmasDocumento.find("img.imgFirmaBacteriologo").attr("src", FirmaFirmaBase64);
					firmasDocumento.find("span.spNomBacteriologo").text(FirmaNombre);
					firmasDocumento.find("span.spRegistroProfesional").text(FirmaRegistroProfesional);
					firmasDocumento.find("span.spUniversidad").text(FirmaUniversidad);
					firmasDocumento.find("span.spCorreoElectronico").text(FirmaCorreoElectronico);
					$('#spHepB').html(sender == null ? obj.Resultado.replace('_', ' ') : $("#<%=this.rcbxHepB.ClientID%>").val());
					$('#spHepBEng').html(sender == null ? obj.Resultado.replace('_', ' ') : $("#<%=this.rcbxHepB.ClientID%>").val());
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

			//verificacion Hepatitis C
			if ($("#<%=this.rblEstadoHepaC.ClientID %>").length && checks.HpC)
			{
				var check = sender == null ? false : $("#<%=this.rblEstadoHepaC.ClientID %>_0").prop("checked");

				if (!check)
				{
					var firmaContainner = sender == null ? null : $("[id*='<%=bsHepatitisC.ClientID%>']");
					var firmasDocumento = $(".firmaHepatitisC");

					var FirmaNombre = sender == null ? obj.Bacteriologo.Nombres + " " + obj.Bacteriologo.Apellidos : $(firmaContainner).get(0).value;
					var FirmaUniversidad = sender == null ? obj.Bacteriologo.FirmaProfesional.Universidad : $(firmaContainner).get(1).value;
					var FirmaRegistroProfesional = sender == null ? obj.Bacteriologo.FirmaProfesional.RegistroProfesional : $(firmaContainner).get(2).value;
					var FirmaFirmaBase64 = sender == null ? obj.Bacteriologo.FirmaProfesional.FirmaBase64 : $(firmaContainner).get(3).value;
					var FirmaCorreoElectronico = sender == null ? obj.Bacteriologo.FirmaProfesional.CorreoElectronico : $(firmaContainner).get(4).value;

					firmasDocumento.find("img.imgFirmaBacteriologo").attr("src", FirmaFirmaBase64);
					firmasDocumento.find("span.spNomBacteriologo").text(FirmaNombre);
					firmasDocumento.find("span.spRegistroProfesional").text(FirmaRegistroProfesional);
					firmasDocumento.find("span.spUniversidad").text(FirmaUniversidad);
					firmasDocumento.find("span.spCorreoElectronico").text(FirmaCorreoElectronico);

					$('#spHepC').html(sender == null ? obj.Resultado.replace('_', ' ') : $("#<%=this.rcbxHepC.ClientID%>").val());
					$('#spHepCEng').html(sender == null ? obj.Resultado.replace('_', ' ') : $("#<%=this.rcbxHepC.ClientID%>").val());
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

			//verificacion Cuadro hemático
			if ($("#<%=this.rblEstadoCH.ClientID %>").length && checks.CHm)
			{
				var check = sender == null ? false : $("#<%=this.rblEstadoCH.ClientID %>_0").prop("checked");

				if (!check)
				{
					var firmaContainner = sender == null ? null : $("[id*='<%=bsCuadroHematico.ClientID%>']");
					var firmasDocumento = $(".firmaCuadroHematico");

					var FirmaNombre = sender == null ? obj.Bacteriologo.Nombres + " " + obj.Bacteriologo.Apellidos : $(firmaContainner).get(0).value;
					var FirmaUniversidad = sender == null ? obj.Bacteriologo.FirmaProfesional.Universidad : $(firmaContainner).get(1).value;
					var FirmaRegistroProfesional = sender == null ? obj.Bacteriologo.FirmaProfesional.RegistroProfesional : $(firmaContainner).get(2).value;
					var FirmaFirmaBase64 = sender == null ? obj.Bacteriologo.FirmaProfesional.FirmaBase64 : $(firmaContainner).get(3).value;
					var FirmaCorreoElectronico = sender == null ? obj.Bacteriologo.FirmaProfesional.CorreoElectronico : $(firmaContainner).get(4).value;

					firmasDocumento.find("img.imgFirmaBacteriologo").attr("src", FirmaFirmaBase64);
					firmasDocumento.find("span.spNomBacteriologo").text(FirmaNombre);
					firmasDocumento.find("span.spRegistroProfesional").text(FirmaRegistroProfesional);
					firmasDocumento.find("span.spUniversidad").text(FirmaUniversidad);
					firmasDocumento.find("span.spCorreoElectronico").text(FirmaCorreoElectronico);

					$('#spCuadroHematico').html(sender == null ? obj.Resultado.replace('_', ' ') : $("#<%=this.rcbxCuadroHematico.ClientID%>").val());
					$('#spCuadroHematicoEng').html(sender == null ? obj.Resultado.replace('_', ' ') : $("#<%=this.rcbxCuadroHematico.ClientID%>").val());
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

			//verificacion Creatinina
			if ($("#<%=this.rblEstadoCreat.ClientID %>").length && checks.Crt)
			{
				var check = sender == null ? false : $("#<%=this.rblEstadoCreat.ClientID %>_0").prop("checked");

				if (!check)
				{
					var firmaContainner = sender == null ? null : $("[id*='<%=bsCreatinina.ClientID%>']");
					var firmasDocumento = $(".firmaCreatinina");

					var FirmaNombre = sender == null ? obj.Bacteriologo.Nombres + " " + obj.Bacteriologo.Apellidos : $(firmaContainner).get(0).value;
					var FirmaUniversidad = sender == null ? obj.Bacteriologo.FirmaProfesional.Universidad : $(firmaContainner).get(1).value;
					var FirmaRegistroProfesional = sender == null ? obj.Bacteriologo.FirmaProfesional.RegistroProfesional : $(firmaContainner).get(2).value;
					var FirmaFirmaBase64 = sender == null ? obj.Bacteriologo.FirmaProfesional.FirmaBase64 : $(firmaContainner).get(3).value;
					var FirmaCorreoElectronico = sender == null ? obj.Bacteriologo.FirmaProfesional.CorreoElectronico : $(firmaContainner).get(4).value;

					firmasDocumento.find("img.imgFirmaBacteriologo").attr("src", FirmaFirmaBase64);
					firmasDocumento.find("span.spNomBacteriologo").text(FirmaNombre);
					firmasDocumento.find("span.spRegistroProfesional").text(FirmaRegistroProfesional);
					firmasDocumento.find("span.spUniversidad").text(FirmaUniversidad);
					firmasDocumento.find("span.spCorreoElectronico").text(FirmaCorreoElectronico);

					$('#spCrea').html(sender == null ? obj.Resultado.replace('_', ' ') : $find("<%=this.rcbxCreatinina.ClientID%>").get_value())
					$('#spCreaEng').html(sender == null ? obj.Resultado.replace('_', ' ') : $find("<%=this.rcbxCreatinina.ClientID%>").get_value())

					if ($find("<%=this.rcbxCreatinina.ClientID%>").get_value() == "ANORMAL")
					{
						$('#spValorCrea').html(sender == null ? (obj.Valor <= 0 ? "" : obj.Valor) : $("#<%=this.rntValorCrea.ClientID%>").val());
						$('#spValorCreaEng').html(sender == null ? (obj.Valor <= 0 ? "" : obj.Valor) : $("#<%=this.rntValorCrea.ClientID%>").val());
					}
					else if ($find("<%=this.rcbxCreatinina.ClientID%>").get_value() == "NORMAL")
					{
						$(".valor-creatinina").remove()
					}

				}
				else
				{
					message = message + '\n Aun no se ha tomado la muestra de Creatinina'
				}
			}
			else
			{
				removeChildren("creatinina");
			}

			//verificacion Hemoglobina Glicosilada
			if ($("#<%=this.rblEstadoHemGli.ClientID %>").length && checks.HmG)
			{
				var check = sender == null ? false : $("#<%=this.rblEstadoHemGli.ClientID %>_0").prop("checked");

				if (!check)
				{
					var firmaContainner = sender == null ? null : $("[id*='<%=bsHemGli.ClientID%>']");
					var firmasDocumento = $(".firmaHemGli");

					var FirmaNombre = sender == null ? obj.Bacteriologo.Nombres + " " + obj.Bacteriologo.Apellidos : $(firmaContainner).get(0).value;
					var FirmaUniversidad = sender == null ? obj.Bacteriologo.FirmaProfesional.Universidad : $(firmaContainner).get(1).value;
					var FirmaRegistroProfesional = sender == null ? obj.Bacteriologo.FirmaProfesional.RegistroProfesional : $(firmaContainner).get(2).value;
					var FirmaFirmaBase64 = sender == null ? obj.Bacteriologo.FirmaProfesional.FirmaBase64 : $(firmaContainner).get(3).value;
					var FirmaCorreoElectronico = sender == null ? obj.Bacteriologo.FirmaProfesional.CorreoElectronico : $(firmaContainner).get(4).value;

					firmasDocumento.find("img.imgFirmaBacteriologo").attr("src", FirmaFirmaBase64);
					firmasDocumento.find("span.spNomBacteriologo").text(FirmaNombre);
					firmasDocumento.find("span.spRegistroProfesional").text(FirmaRegistroProfesional);
					firmasDocumento.find("span.spUniversidad").text(FirmaUniversidad);
					firmasDocumento.find("span.spCorreoElectronico").text(FirmaCorreoElectronico);
					$('#spValorHemGli').html(sender == null ? obj.Resultado : $("#<%=this.rntValorHemGli.ClientID%>").val());
					$('#spValorHemGliEng').html(sender == null ? obj.Resultado : $("#<%=this.rntValorHemGli.ClientID%>").val());
				}
				else
				{
					message = message + '\n Aun no se ha tomado la muestra de Hemoglobina Glicosilada'
				}
			}
			else
			{
				removeChildren("hemGlic");
			}

			if ($("#<%=this.rblEstadoOtro.ClientID %>").length && checks.OEx)
			{
				var check = sender == null ? false : $("#<%=this.rblEstadoOtro.ClientID %>_0").prop("checked");

				if (!check)
				{
					var firmaContainner = sender == null ? null : $("[id*='<%=bsOtros.ClientID%>']");
					var firmasDocumento = $(".firmaOtros");

					var FirmaNombre = sender == null ? obj.Bacteriologo.Nombres + " " + obj.Bacteriologo.Apellidos : $(firmaContainner).get(0).value;
					var FirmaUniversidad = sender == null ? obj.Bacteriologo.FirmaProfesional.Universidad : $(firmaContainner).get(1).value;
					var FirmaRegistroProfesional = sender == null ? obj.Bacteriologo.FirmaProfesional.RegistroProfesional : $(firmaContainner).get(2).value;
					var FirmaFirmaBase64 = sender == null ? obj.Bacteriologo.FirmaProfesional.FirmaBase64 : $(firmaContainner).get(3).value;
					var FirmaCorreoElectronico = sender == null ? obj.Bacteriologo.FirmaProfesional.CorreoElectronico : $(firmaContainner).get(4).value;

					firmasDocumento.find("img.imgFirmaBacteriologo").attr("src", FirmaFirmaBase64);
					firmasDocumento.find("span.spNomBacteriologo").text(FirmaNombre);
					firmasDocumento.find("span.spRegistroProfesional").text(FirmaRegistroProfesional);
					firmasDocumento.find("span.spUniversidad").text(FirmaUniversidad);
					firmasDocumento.find("span.spCorreoElectronico").text(FirmaCorreoElectronico);


					$('#pDescrOtro').html(sender == null ? obj.Descripcion : $("#<%=this.rtxtOtroDesc.ClientID%>").val());
					$('#spValorResultadoOtroExamen').html(sender == null ? obj.Resultado : $("#<%=this.rtxtOtroResultado.ClientID%>").val());
					$('#pComentarioOtrosExamenes').html(sender == null ? obj.Observaciones : $("#<%=this.rtxtOtroComentario.ClientID%>").val());
					$('#pDescrOtroEng').html($("#<%=this.rtxtOtroDesc.ClientID%>").val());
					$('#spValorResultadoOtroExamenEng').html($("#<%=this.rtxtOtroResultado.ClientID%>").val());
					$('#pComentarioOtrosExamenesEng').html($("#<%=this.rtxtOtroComentario.ClientID%>").val());
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

			if (message.length > 0)
			{
				alert(message);
				parentNodeBackup.replaceChild(copybackup, $("#examsLayout"));
				parentNodeBackup.replaceChild(copybackupEng, $("#examsLayoutEng"));
				sender.preventDefault();
				return;
			}

			//Verificacion de examenes de suero
			if (!checks.VIH && !checks.CHm && !checks.Crt && !checks.HmG && !checks.HpB && !checks.HpC && !checks.Ser && !checks.OEx)
			{
				RemoveChildById("SerumTable");
				RemoveChildById("SerumTableEng");
			}

			var subModal = $("<div></div>");
			subModal.addClass("impresion");

			var copyLayout = $("#examsLayout").clone(true);

			copyLayout.addClass('collapse');
			copyLayout.attr("id", "printable");
			subModal.append(copyLayout);

			var copyLayoutEng = $("#examsLayoutEng").clone(true);
			copyLayoutEng.html(copyLayoutEng.html()
				.replace(/NO REACTIVO/g, 'NON REACTIVE')
				.replace(/REACTIVO/g, 'REACTIVE')
				.replace(/NEGATIVO/g, 'NEGATIVE')
				.replace(/POSITIVO/g, 'POSITIVE')
				.replace(/anormal/g, 'abnormal')
				.replace(/Anormal/g, 'Abnormal')
				.replace(/ANORMAL/g, 'ABNORMAL'));

			copyLayoutEng.addClass('collapse');
			copyLayoutEng.attr("id", "printableEng");
			subModal.append(copyLayoutEng);

			var contButton = $("<div class='btnStrip'></div>");
			var editor = $("<div id='editor'></div>");


			var btnPrint = $("<div id='btnPrintForm' class='botonesVPE' onclick='imprSelec()'>Imprimir</div>");

			var btnSendMail = $("<div id='btnSenMa' class='botonesVPE btnCerrarVP' onclick='MostrarEnvio()'>Enviar por correo</div>");

			contButton.append(btnPrint);
			contButton.append(btnSendMail);

			subModal.append(editor);
			subModal.append(contButton);

			$(modal).append(subModal)

			//se reemplaza el segundo parametro cn el primero
			parentNodeBackup.find("#examsLayout").replaceWith(copybackup);
			parentNodeBackup.find("#examsLayoutEng").replaceWith(copybackupEng);

			$("#checkLang").on("click", ToogleView);
			$("#checkLang").trigger("click");
			$("#checkLang").trigger("click");

			scroll(0, 0);
			PrevTest = null;
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
			var div1 = $("#divLblValCrea");
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
