<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master"
	AutoEventWireup="true" CodeBehind="CierreDetalle.aspx.cs" Inherits="ResumenMedico.Consultorio.CierreDetalle" %>

<asp:Content ID="cBody" ContentPlaceHolderID="MainContent" runat="server">
	<telerik:RadAjaxManager ID="ramMan" runat="server" UpdatePanelsRenderMode="Inline">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="rcbxEmbajada">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rcbxTipoVisa" LoadingPanelID="ralpImage" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rdpFecNac">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rfvAcudiente" LoadingPanelID="ralpImage" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="chkRequiereNot">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="chkNotEnv" LoadingPanelID="ralpImage" />
				</UpdatedControls>
			</telerik:AjaxSetting>
		</AjaxSettings>
	</telerik:RadAjaxManager>
	<telerik:RadAjaxLoadingPanel ID="ralpImage" runat="server" BackgroundPosition="Center" BackgroundTransparency="30"></telerik:RadAjaxLoadingPanel>
	<div class="ocultos">
		<asp:ValidationSummary ID="vsErrors" runat="server" ValidationGroup="Paciente" ShowMessageBox="true"
			ShowSummary="false" DisplayMode="BulletList" HeaderText="Al validar la informacion se han detectado los siguientes inconvenientes:" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Cierre" ShowMessageBox="true"
			ShowSummary="false" DisplayMode="BulletList" HeaderText="Al validar la informacion se han detectado los siguientes inconvenientes:" />
	</div>
	<div class="row">
		<div class="titulo">
			Información Paciente
		</div>
		<div class="col-lg-2 col-md-2 col-sm-3 col-xs-12" style="float: right;">
			<div class="imgPrePhoto centeredControl">
				<telerik:RadBinaryImage ID="imgPrePhoto" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Resources/DefaultImage.jpg" />
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlHousing controlSide">
					Fecha Ingreso
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlHousing">
					<telerik:RadDatePicker ID="rdpFecha" MinDate="1900-01-01" runat="server" Width="90%">
						<Calendar ID="cFecha" runat="server" FirstDayOfWeek="Sunday" />
						<DateInput ID="diFecha" runat="server" DisplayDateFormat="yyyy/MM/dd" ReadOnly="true" />
					</telerik:RadDatePicker>
				</div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlHousing controlSide">
					Edad
				</div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlHousing controlSide">
					<asp:Label ID="lblEdad" runat="server"></asp:Label>&nbsp;Años
				</div>
			</div>
		</div>
		<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
			<!--fila Informacion personal -->
			<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12 controlRow">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
						Nombres
					</div>
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
						<telerik:RadTextBox ID="rtxtNombres" runat="server" MaxLength="50" Width="90%" Font-Names="Verdana">
						</telerik:RadTextBox>
						<asp:RequiredFieldValidator ID="rfvNombres" runat="server" ControlToValidate="rtxtNombres"
							ValidationGroup="Paciente" ErrorMessage="Debe indicar el nombre del paciente"
							Display="None" />
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
						Apellidos
					</div>
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
						<telerik:RadTextBox ID="rtxtApellidos" runat="server" MaxLength="50" Width="90%"
							Font-Names="Verdana">
						</telerik:RadTextBox>
						<asp:RequiredFieldValidator ID="rfvApellidos" runat="server" ControlToValidate="rtxtApellidos"
							ValidationGroup="Paciente" ErrorMessage="Debe especificar los apellidos del paciente"
							Display="None" />
					</div>
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12 controlRow">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
						Fecha Nacimiento
					</div>
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
						<telerik:RadDatePicker ID="rdpFecNac" runat="server" Width="90%" MinDate="01/01/1900"
							Enabled="false">
							<DateInput DateFormat="yyyy-MM-dd" ID="diFecNac" runat="server" />
							<Calendar ID="cFecNac" runat="server" FirstDayOfWeek="Sunday" />
						</telerik:RadDatePicker>
						<asp:RequiredFieldValidator ID="rfvFecNac" runat="server" ControlToValidate="rdpFecNac"
							ValidationGroup="Paciente" ErrorMessage="debe indicar la fecha de nacimiento del paciente"
							Display="None" />
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
						Género
					</div>
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
						<asp:RadioButtonList ID="rblGenero" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Text="Masculino" Value="1"></asp:ListItem>
							<asp:ListItem Text="Femenino" Value="0"></asp:ListItem>
						</asp:RadioButtonList>
					</div>
				</div>
			</div>
			<!--fila de Identificacion -->
			<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12 controlRow">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
						Tipo Identificación
					</div>
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
						<telerik:RadComboBox ID="rcbxTipoDoc" runat="server" Width="90%" Filter="Contains" />
						<asp:RequiredFieldValidator ID="rfvTipDoc" runat="server" ControlToValidate="rcbxTipoDoc"
							InitialValue="[Seleccione]" Display="None" ValidationGroup="Paciente" ErrorMessage="Debe especificar el tipo de Identificacion" />
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
						Número Identificación
					</div>
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
						<telerik:RadTextBox ID="rtxtNumDoc" runat="server" MaxLength="50" Width="90%" EmptyMessage="[Número Documento]"
							Font-Names="Verdana">
						</telerik:RadTextBox>
						<asp:RequiredFieldValidator ID="rfvNumDoc" runat="server" ControlToValidate="rtxtNumDoc"
							ValidationGroup="Paciente" ErrorMessage="Debe especificar el numero de Identificacion"
							Display="None" />
					</div>
				</div>
			</div>
			<!--fila de destino -->
			<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12 controlRow">
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlPair">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
						Embajada
					</div>
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
						<telerik:RadComboBox ID="rcbxEmbajada" runat="server" Width="90%" Filter="Contains"
							AutoPostBack="true" OnSelectedIndexChanged="rcbxEmbajada_SelectedIndexChanged" />
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlPair">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
						Tipo Código
					</div>
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
						<telerik:RadComboBox ID="rcbxTipoVisa" runat="server" Width="90%" Filter="Contains" />
						<asp:RequiredFieldValidator ID="rfvTipoVisa" runat="server" ControlToValidate="rcbxTipoVisa"
							InitialValue="[Seleccione]" ValidationGroup="Paciente" ErrorMessage="Debe especificar el tipo de código"
							Display="None" />
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlPair">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
						Código
					</div>
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
						<telerik:RadTextBox ID="rtxtNumVisa" runat="server" MaxLength="50" Width="90%" />
						<asp:RequiredFieldValidator ID="rfvNumVisa" runat="server" ControlToValidate="rtxtNumVisa"
							ValidationGroup="Paciente" ErrorMessage="Debe especificar el código" Display="None" />
					</div>
				</div>
			</div>
			<!--Datos generales-->
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 showHideButton" onclick="ShowHideInfo(this)" id="btnmedicalData">
				<span class="glyphicon glyphicon-chevron-down"></span>
                <span class="texto txtMostrar"></span>
                Datos Biométricos
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
				<div class="collapse" id="medicalData">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Estatura
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadNumericTextBox ID="rntEstatura" runat="server" MinValue="0" MaxValue="3" MaxLength="4" Width="80%">
								<ClientEvents OnBlur="calculateBMI" />
								<NumberFormat DecimalDigits="2" DecimalSeparator="," />
								<IncrementSettings Step="0.1" />
							</telerik:RadNumericTextBox>
							<span style="width: 20%; float: right; padding-left: 5px">m</span>
							<asp:RequiredFieldValidator ID="rfvEstatura" runat="server" ControlToValidate="rntEstatura" ValidationGroup="Paciente" ErrorMessage="debe indicar la estatura del paciente" Display="None" />
                            <asp:RequiredFieldValidator ID="rfvEstCierre" runat="server" ControlToValidate="rntEstatura" ValidationGroup="Cierre" ErrorMessage="debe indicar la estatura del paciente" Display="None" />
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Peso
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadNumericTextBox ID="rntPeso" runat="server" MinValue="0" MaxValue="300" MaxLength="6" Width="80%">
								<ClientEvents OnBlur="calculateBMI" />
								<NumberFormat DecimalDigits="2" DecimalSeparator="," />
							</telerik:RadNumericTextBox>
							<span style="width: 20%; float: right; padding-left: 5px">kg</span>
							<asp:RequiredFieldValidator ID="rfvPeso" runat="server" ControlToValidate="rntPeso"
								ValidationGroup="Paciente" ErrorMessage="debe indicar el peso del paciente" Display="None" />
                            <asp:RequiredFieldValidator ID="rfvPesoCierre" runat="server" ControlToValidate="rntPeso"
								ValidationGroup="Cierre" ErrorMessage="debe indicar el peso del paciente" Display="None" />
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Perímetro Cefálico
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadNumericTextBox ID="rntPC" runat="server" MinValue="0" MaxValue="100"
								MaxLength="4" ReadOnly="true" Width="90%">
								<NumberFormat DecimalDigits="2" DecimalSeparator="," />
								<IncrementSettings Step="0.1" />
							</telerik:RadNumericTextBox>
							<asp:RequiredFieldValidator ID="rfvPC" runat="server" ControlToValidate="rntPC" ErrorMessage="Se debe especificar el perímetro cefálico del paciente"
								ValidationGroup="Paciente" Display="None" />
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							BMI
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadNumericTextBox ID="rntBmi" runat="server" MinValue="0" MaxValue="100"
								MaxLength="4" ReadOnly="true" Width="90%">
								<NumberFormat DecimalDigits="2" DecimalSeparator="," />
								<IncrementSettings Step="0.1" />
							</telerik:RadNumericTextBox>
						</div>
					</div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                        <telerik:RadButton ID="rbtnSavePeso" runat="server" CausesValidation="true" ValidationGroup="Cierre" Text="Guardar Datos Biometricos"
			                Font-Names="Verdana" Font-Bold="True" ForeColor="#666666" onclick="rbtnSavePeso_Click">
		                </telerik:RadButton>
                    </div>
				</div>
			</div>
			<!--fila de datos de contacto-->
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 showHideButton" onclick="ShowHideInfo(this)" id="btncontactData">
				<span class="glyphicon glyphicon-chevron-down"></span><span class="texto txtMostrar"></span>Datos de contacto
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
				<div class="collapse" id="contactData">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Correo Electrónico
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtCorreo" runat="server" Width="90%" />
							<asp:RegularExpressionValidator ID="revCorreo" runat="server" SetFocusOnError="true"
								ControlToValidate="rtxtCorreo" ValidationExpression="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$"
								ValidationGroup="Paciente" ErrorMessage="El campo de correo electronico debe corresponder al patron a@a.a"
								Display="None" />
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Dirección
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtDireccion" runat="server" MaxLength="100" TextMode="MultiLine"
								Rows="3" LabelWidth="64px" Width="90%" Font-Names="Verdana" />
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Teléfono
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtTelefono" runat="server" MaxLength="40" Width="90%" />
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Acudiente
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtAcudiente" runat="server" Width="90%" />
						</div>
						<asp:RequiredFieldValidator ID="rfvAcudiente" runat="server" ControlToValidate="rtxtAcudiente"
							Display="None" ErrorMessage="para los pacientes menores de edad debe indicar el nombre del acudiente"
							ValidationGroup="Paciente" Enabled="false" />
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow controlPair">
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlHousing controlSide">
							<asp:CheckBox ID="chkRequiereNot" runat="server" OnCheckedChanged="chkRequiereNot_CheckedChanged"
								CssClass="chBx" Text="Requiere ser notificado?" />
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlHousing controlSide">
							<asp:CheckBox ID="chkNotEnv" runat="server" style="z-index:-10" CssClass="chBx" Text="Ya se ha enviado la notificación?" />
						</div>
					</div>
				</div>
			</div>
		</div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 showHideButton" onclick="ShowHideInfo(this)" id="btnMedData" >
			<span id="spMedData1" runat="server" clientidmode="Static" class="glyphicon glyphicon-chevron-down"></span>
            <span id="spMedData2" runat="server" clientidmode="Static" class="texto txtOcultar"></span>Información Medicina
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
            <div id="MedData" class="collapse" runat="server" clientidmode="Static">
			    <div class="titulo">
				    Información Medicina
			    </div>
			    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlPair controlRow">
				    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 controlHousing controlSide">
					    Estado Medicina
				    </div>
				    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 controlHousing">
					    <asp:RadioButtonList ID="rblEstado" runat="server" RepeatDirection="Horizontal" CssClass="rblDisabled">
						    <asp:ListItem Text="Normal" class="chbxNormal" Value="0"></asp:ListItem>
						    <asp:ListItem Text="Anormal" class="chbxAnormal" Value="1"></asp:ListItem>
					    </asp:RadioButtonList>
				    </div>
			    </div>
			    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlPair controlRow">
				    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 controlHousing controlSide">
					    Comentarios
				    </div>
				    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 controlHousing">
					    <telerik:RadTextBox ID="rtxtCommentMedGen" runat="server" TextMode="MultiLine" Rows="3"
						    Width="99%" />
				    </div>
			    </div>
            </div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 showHideButton" onclick="ShowHideInfo(this)" id="btnLabData">
			<span id="spLabData1" runat="server" clientidmode="Static" class="glyphicon glyphicon-chevron-down"></span>
            <span id="spLabData2" runat="server" clientidmode="Static" class="texto txtMostrar"></span>información de laboratorio
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div id="LabData" runat="server" clientidmode="Static" class="collapse">
				<div class="titulo">
					Información Laboratorio
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlPair controlRow">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
						Estado Laboratorio
					</div>
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
						<asp:RadioButtonList ID="rblEstadoLab" runat="server" RepeatDirection="Horizontal" CssClass="rblDisabled">
							<asp:ListItem Text="Normal" class="chbxNormal" Value="0" />
							<asp:ListItem Text="Anormal" class="chbxAnormal" Value="1" />
						</asp:RadioButtonList>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow controlPair">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 controlHousing controlSide">
						Comentarios Laboratorio
					</div>
					<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 controlHousing">
						<telerik:RadTextBox ID="rtxtCommentLab" runat="server" TextMode="MultiLine" Rows="5"
							Width="99%" />
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlPair controlRow">
					<telerik:RadGrid ID="rgDataLab" runat="server" AutoGenerateColumns="false" PageSize="10" OnNeedDataSource="rgDataLab_NeedDataSource" Width="100%">

						<PagerStyle AlwaysVisible="true" />

						<MasterTableView DataKeyNames="ID">

							<Columns>

								<telerik:GridBoundColumn HeaderText="Tipo Laboratorio" DataField="TIPO_EXAMEN" UniqueName="ExamenLab" DataType="System.String">
									<ItemStyle Width="15%" />
									<HeaderStyle Width="15%" />
								</telerik:GridBoundColumn>
							
                            	<telerik:GridBoundColumn HeaderText="Estado" DataField="ESTADO_TEXT" UniqueName="Estado" DataType="System.String">
									<ItemStyle Width="10%" />
									<HeaderStyle Width="10%" />
								</telerik:GridBoundColumn>
							
                            	<telerik:GridBoundColumn HeaderText="Resultado" DataField="RESULTADO" UniqueName="Resultado" DataType="System.String">
									<ItemStyle Width="15%" />
									<HeaderStyle Width="15%" />
								</telerik:GridBoundColumn>
							
                            	<telerik:GridBoundColumn HeaderText="Valor" DataField="VALOR" UniqueName="Valor" DataType="System.String">
									<ItemStyle Width="10%" />
									<HeaderStyle Width="10%" />
								</telerik:GridBoundColumn>
							
                            	<telerik:GridBoundColumn HeaderText="Fecha Toma Muestra" DataField="FECHA_TOMA_MUESTRA" UniqueName="Valor" DataType="System.String">
									<ItemStyle Width="10%" />
									<HeaderStyle Width="10%" />
								</telerik:GridBoundColumn>
							
                            	<telerik:GridBoundColumn HeaderText="Observaciones" DataField="OBSERVACIONES" UniqueName="Observaciones" DataType="System.String">
									<ItemStyle Width="40%" />
									<HeaderStyle Width="40%" />
								</telerik:GridBoundColumn>

							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 showHideButton" onclick="ShowHideInfo(this)" id="btnRadiologyData">
			<span id="spRadiologyData1" runat="server" clientidmode="Static" class="glyphicon glyphicon-chevron-down"></span>
            <span id="spRadiologyData2" runat="server" clientidmode="Static" class="texto txtMostrar"></span>información de radiología
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="collapse" id="RadiologyData" runat="server" clientidmode="Static">
				<div class="titulo">
					Información Radiología
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlPair controlRow">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
						Estado Radiología - Radiologo
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing">
						<asp:RadioButtonList ID="rblEstadoRad" runat="server" RepeatDirection="Horizontal" CssClass="rblDisabled">
							
							<asp:ListItem Text="Normal" class="chbxNormal" Value="0"></asp:ListItem>
							<asp:ListItem Text="Anormal" class="chbxAnormal" Value="1"></asp:ListItem>
						</asp:RadioButtonList>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow controlPair">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlSide">
						<asp:CheckBox ID="chkRadTomada" Text="Radiografia Tomada" runat="server" style="z-index:-10" CssClass="chBx" />
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlSide">
						<asp:CheckBox ID="chkCargEMedical" runat="server" Text="Radiografia cargada Emedical" style="z-index:-10" CssClass="chBx" />
					</div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 controlPair">
						<asp:CheckBox ID="ChkRequiereNotificacion" runat="server" Text="Requiere Notificación" CssClass="chBx" />
					</div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 controlPair">
						<asp:CheckBox ID="ChkNotificado" runat="server" Text="Ya fue Notificado" CssClass="chBx" />
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-8 col-xs-12 controlRow controlPair">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 controlHousing controlSide">
						Comentarios Radiología - Radiologo
					</div>
					<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
						<telerik:RadTextBox ID="rtxtCommentRad" runat="server" TextMode="MultiLine" Rows="3" Width="99%"></telerik:RadTextBox>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-8 col-xs-12 controlRow controlPair">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlHousing controlSide">
						Estado Radiología - Medico General
					</div>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
						<asp:RadioButtonList ID="rblEstadoRadGen" runat="server" RepeatDirection="Horizontal" CssClass="rblDisabled">
							<asp:ListItem Text="Normal" class="chbxNormal" Value="0"></asp:ListItem>
							<asp:ListItem Text="Anormal" class="chbxAnormal" Value="1"></asp:ListItem>
						</asp:RadioButtonList>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow controlPair">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 controlHousing controlSide">
						Comentarios Radiología - Medico General
					</div>
					<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 controlHousing">
						<telerik:RadTextBox ID="rtxtCommentRadGen" runat="server" TextMode="MultiLine" Rows="3" Width="99%" />
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 showHideButton" onclick="ShowHideInfo(this)" id="btnattachmentData">
			<span class="glyphicon glyphicon-chevron-down"></span><span class="texto txtMostrar">
			</span>Documentos anexos
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="collapse" id="attachmentData">
				<div class="titulo">
					Archivos relacionados con la historia
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<telerik:RadGrid ID="rgFilesAttached" runat="server" AutoGenerateColumns="false"
						PageSize="10" OnNeedDataSource="rgFilesAttached_NeedDataSource" Width="100%">
						<PagerStyle AlwaysVisible="true" />
						<MasterTableView DataKeyNames="ID">
							<Columns>
								<telerik:GridHyperLinkColumn DataNavigateUrlFields="ID" DataNavigateUrlFormatString="javascript:AbrirArchivo({0});"
									Text="Abrir archivo">
								</telerik:GridHyperLinkColumn>
								<telerik:GridBoundColumn HeaderText="Etapa de carga" DataField="TIPO_REVISION" UniqueName="TipoRevision"
									DataType="System.String">
								</telerik:GridBoundColumn>
								<telerik:GridBoundColumn HeaderText="Corresponde a la <br />Muesta" DataField="TIPO_EXAMEN"
									UniqueName="ExamenLab" DataType="System.String">
								</telerik:GridBoundColumn>
								<telerik:GridBoundColumn HeaderText="Nombre Adjunto" DataField="NOMBRE_ADJUNTO" UniqueName="Adjunto"
									DataType="System.String">
								</telerik:GridBoundColumn>
								<telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor"
									DataType="System.DateTime">
								</telerik:GridBoundColumn>
								<telerik:GridBoundColumn HeaderText="Usuario que adjunto" DataField="CREACION" UniqueName="Usuario"
									DataType="System.String">
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 showHideButton" onclick="ShowHideInfo(this)"
			id="btnexternalTestsData">
			<span class="glyphicon glyphicon-chevron-down"></span><span class="texto txtMostrar">
			</span>Ordenes de examen externo
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="collapse" id="externalTestsData">
				<div class="titulo">
					Ordenes de examenes externas
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<asp:ValidationSummary ID="vsOrdenes" runat="server" ValidationGroup="Ordenes" ShowMessageBox="true" />
					<telerik:RadGrid ID="rgOrdenes" runat="server" AutoGenerateColumns="false" PageSize="10"
						OnNeedDataSource="rgOrdenes_NeedDataSource" Width="100%" OnInsertCommand="rgOrdenes_InsertCommand">
						<PagerStyle AlwaysVisible="true" />
						<ValidationSettings CommandsToValidate="PerformInsert" ValidationGroup="Ordenes" />
						<MasterTableView DataKeyNames="ID" CommandItemDisplay="Top">
							<CommandItemSettings AddNewRecordText="Agregar nueva orden" />
							<Columns>
								<telerik:GridBoundColumn HeaderText="Descripción" DataField="DESCRIPCION" UniqueName="Descripcion"
									DataType="System.String" MaxLength="500">
									<ItemStyle Width="80%" />
									<ColumnValidationSettings EnableRequiredFieldValidation="true">
										<RequiredFieldValidator ErrorMessage="Debe indicar la descripción de la orden" ValidationGroup="Ordenes"></RequiredFieldValidator>
									</ColumnValidationSettings>
								</telerik:GridBoundColumn>
								<telerik:GridBoundColumn HeaderText="Fecha Carga" DataField="FECHA_CREACION" UniqueName="Valor"
									DataType="System.DateTime" ReadOnly="true">
									<ItemStyle Width="20%" />
								</telerik:GridBoundColumn>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
				</div>
			</div>
		</div>
	</div>
	<!--end row-->
	<div class="col-lg-6 col-lg-offset-5 col-md-6 col-lg-offset-5 col-sm-12 col-xs-12">
		<div class="spacio"></div>
		<telerik:RadButton ID="rbtnFinalizar" runat="server" CausesValidation="false" Text="Finalizar Proceso"
			Font-Names="Verdana" Font-Bold="True" ForeColor="#666666" OnClick="rbtnFinalizar_Click">
		</telerik:RadButton>
	</div>
</asp:Content>
<asp:Content ID="cScripts" ContentPlaceHolderID="PageScriptsHolder" runat="server">
	<script type="text/javascript">
		function calculateBMI(sender, e)
		{
			var txtPes = $find("<%=this.rntPeso.ClientID%>");
			var txtEst = $find("<%=this.rntEstatura.ClientID%>");

			var pes = txtPes.get_value();
			var est = txtEst.get_value();

			if (pes != "" && est != "")
			{

				var estNum = parseFloat(est);
				var Bmi = $find("<%=this.rntBmi.ClientID%>");
				if (estNum > 0)
				{
					Bmi.set_value(pes / (est * est));
				}
				else
				{
					Bmi.set_value(0);
				}
			}
		}

		function AbrirArchivo(idFil)
		{
			window.open("../Controls/DwldFil.aspx?idFil=" + idFil, "", "height=400,width=500,resizable=no,scrollbars=yes");
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
