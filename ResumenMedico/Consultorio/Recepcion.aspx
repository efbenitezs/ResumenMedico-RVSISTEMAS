<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master"
	AutoEventWireup="true" CodeBehind="Recepcion.aspx.cs" Inherits="ResumenMedico.Consultorio.Recepcion" %>

<asp:Content ID="cBody" ContentPlaceHolderID="MainContent" runat="server">
	<telerik:RadAjaxManager ID="ramMan" runat="server" UpdatePanelsRenderMode="Block" DefaultLoadingPanelID="ralpImage">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="ramMan">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="imgPrePhoto" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rbtnValidate">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rtxtNombres" />
					<telerik:AjaxUpdatedControl ControlID="hdIdPaciente" />
					<telerik:AjaxUpdatedControl ControlID="rtxtApellidos" />
					<telerik:AjaxUpdatedControl ControlID="rcbxEmbajada" />
					<telerik:AjaxUpdatedControl ControlID="rcbxTipoVisa" />
					<telerik:AjaxUpdatedControl ControlID="rtxtNumVisa" />
					<telerik:AjaxUpdatedControl ControlID="rtxtAcudiente" />
					<telerik:AjaxUpdatedControl ControlID="rtxtCorreo" />
					<telerik:AjaxUpdatedControl ControlID="rtxtDireccion" />
					<telerik:AjaxUpdatedControl ControlID="rdpFecNac" />
					<telerik:AjaxUpdatedControl ControlID="rblGenero" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rcbxEmbajada">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rcbxTipoVisa" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rdpFecNac">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rfvAcudiente" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rblGenero">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rtxtGeneroValue" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="chkRequiereNot">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="chkNotEnv" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rbtnRefreshAnnex">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="listaAnexos" />
				</UpdatedControls>
			</telerik:AjaxSetting>
		</AjaxSettings>
	</telerik:RadAjaxManager>
	<telerik:RadAjaxLoadingPanel ID="ralpImage" runat="server" IsSticky="true" Style="position: absolute; top: 0; left: 0; height: 100%; width: 100%;" />
	<div id="validationSummary" class="ocultos">
		<asp:ValidationSummary ID="vsErrors" runat="server" ValidationGroup="Paciente" ShowMessageBox="true"
			ShowSummary="false" DisplayMode="BulletList" HeaderText="Al validar la informacion se han detectado los siguientes inconvenientes:" />
	</div>
	<div id="invisibleControls" class="ocultos">
		<asp:HiddenField ID="hfRutImg" runat="server" />
		<telerik:RadButton ID="rbtnValidate" runat="server" Text="Validar Usuario Existe"
			OnClick="rbtnValidate_Click" CausesValidation="false" />
		<asp:HiddenField ID="hdIdPaciente" runat="server" />
		<telerik:RadAsyncUpload RenderMode="Lightweight" runat="server" ID="rauFoto" MaxFileInputsCount="1"
			HideFileInput="true" AllowedFileExtensions=".jpeg,.jpg,.png" OnClientFileUploaded="fileUploaded"
			OnFileUploaded="rauFoto_FileUploaded" />
		<asp:HiddenField ID="hfIdHistoria" runat="server" />
		<telerik:RadUpload ID="ruTestFoto" runat="server" OnClientAdded="ru_ClientAdded"
			AllowedFileExtensions=".jpeg,.jpg,.png,.gif,.bmp" OnClientFileSelected="ru_ClientFileSelected"
			ControlObjectsVisibility="RemoveButtons">
			<Localization Add="Agregar" Clear="Limpiar" Delete="Borrar" Remove="Quitar" Select="Seleccionar" />
		</telerik:RadUpload>
		<telerik:RadTextBox ID="rtxtGeneroValue" runat="server" Enabled="false" />
		<telerik:RadTextBox ID="rtxtFechaNacCompare" runat="server" Text='<%=DateTime.Now.ToString("yyyy-MM-dd")%>' />
	</div>
	<div class="row">
		<div class="col-md-12 titulo">
			Información Paciente
		</div>
		<hr />
		<div class="col-md-12">
			<div class="col-md-2" style="float: right;">
				<div class="imgPrePhoto text-center">
					<telerik:RadBinaryImage ID="imgPrePhoto" CssClass="img-rounded" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Resources/DefaultImage.jpg" />
					<div class="btn">
						<telerik:RadButton ID="rbtnCargarImagen" runat="server" CausesValidation="false"
							UseSubmitBehavior="false" Text="Cargar Foto" CssClass="centeredControl" ForeColor="#666666"
							OnClientClicking="mostrarFileupl" />
					</div>
				</div>
			</div>

			<div class="col-md-10">
				<div class="col-md-12">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Tipo Identificación
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadComboBox ID="rcbxTipoDoc" runat="server" Width="100%" Filter="Contains"
								OnClientSelectedIndexChanging="rcbTipDoc_SelIndChang" />
							<asp:RequiredFieldValidator ID="rfvTipDoc" runat="server" ControlToValidate="rcbxTipoDoc"
								InitialValue="[Seleccione]" ValidationGroup="Paciente" ErrorMessage="Debe especificar el tipo de Identificacion"
								Display="None" />
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Número Identificación
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtNumDoc" runat="server" MaxLength="50" Width="100%" EmptyMessage="[Número Documento]" Font-Names="Verdana">
								<ClientEvents OnBlur="validarPaciente" OnKeyPress="controlPress" />
							</telerik:RadTextBox>
							<asp:RequiredFieldValidator ID="rfvNumDoc" runat="server" ControlToValidate="rtxtNumDoc" ValidationGroup="Paciente" ErrorMessage="Debe especificar el numero de Identificacion"
								Display="None" />
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Número Pasaporte
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtPasaporte" runat="server" MaxLength="20" Width="100%" EmptyMessage="[Número Pasaporte]" Font-Names="Verdana">
								<ClientEvents OnKeyPress="controlPress" />
							</telerik:RadTextBox>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Nombres
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtNombres" runat="server" MaxLength="50" Width="100%">
								<ClientEvents OnKeyPress="controlPress" />
							</telerik:RadTextBox>
							<asp:RequiredFieldValidator ID="rfvNombres" runat="server" ControlToValidate="rtxtNombres" ValidationGroup="Paciente" ErrorMessage="Debe indicar el nombre del paciente"
								Display="None" />
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Apellidos
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtApellidos" runat="server" MaxLength="50" Width="100%">
								<ClientEvents OnKeyPress="controlPress" />
							</telerik:RadTextBox>
							<asp:RequiredFieldValidator ID="rfvApellidos" runat="server" ControlToValidate="rtxtApellidos" ValidationGroup="Paciente" ErrorMessage="Debe especificar los apellidos del paciente"
								Display="None" />
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Género
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<asp:RadioButtonList ID="rblGenero" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
								CausesValidation="false" OnSelectedIndexChanged="rblGenero_SelectedIndexChanged">
								<asp:ListItem Text="Masculino" Value="1"></asp:ListItem>
								<asp:ListItem Text="Femenino" Value="0"></asp:ListItem>
							</asp:RadioButtonList>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Fecha Nacimiento
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadDatePicker ID="rdpFecNac" runat="server" Width="100%" OnSelectedDateChanged="rdpFecNac_SelectedDateChanged"
								AutoPostBack="true" MinDate="1900-01-01">
								<DateInput DateFormat="yyyy-MM-dd" ID="diFecNac" runat="server" EmptyMessage="[AAAA-MM-DD]"
									CausesValidation="false">
								</DateInput>
								<Calendar ID="cFecNac" runat="server" FirstDayOfWeek="Sunday">
								</Calendar>
							</telerik:RadDatePicker>
							<asp:RequiredFieldValidator ID="rfvFecNac" runat="server" ControlToValidate="rdpFecNac"
								ValidationGroup="Paciente" ErrorMessage="debe indicar la fecha de nacimiento del paciente"
								Display="None" />
							<asp:CompareValidator ID="cvFecNac" runat="server" ControlToValidate="rdpFecNac"
								Operator="LessThan" Type="Date" ValidationGroup="Paciente" ControlToCompare="rtxtFechaNacCompare"
								Text="*" ErrorMessage="la fecha de nacimiento no puede ser mayor a la fecha de hoy"
								Display="None" />
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Embajada
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadComboBox ID="rcbxEmbajada" runat="server" Width="100%" Filter="Contains"
								AutoPostBack="true" CausesValidation="false" OnSelectedIndexChanged="rcbxEmbajada_SelectedIndexChanged" />
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Tipo Código
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadComboBox ID="rcbxTipoVisa" runat="server" Width="100%" Filter="Contains" />
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Código
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtNumVisa" runat="server" MaxLength="50" Width="100%">
								<ClientEvents OnKeyPress="controlPress" />
							</telerik:RadTextBox>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 controlPair controlHousing">
						<asp:CheckBox Text="El paciente reside fuera de Bogotá" ID="chkPrioritario" runat="server" CssClass="chBx" />
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 controlPair controlHousing">
						<asp:CheckBox Text="Es paciente externo" ID="chkPacienteExterno" runat="server" CssClass="chBx" />
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 controlPair controlHousing">
						<asp:CheckBox ID="chkRequiereNot" runat="server" OnCheckedChanged="chkRequiereNot_CheckedChanged" AutoPostBack="true" CssClass="chBx" Text="Requiere ser notificado" />
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 controlPair controlHousing">
						<asp:CheckBox Text="Ya se ha enviado la notificación" ID="chkNotEnv" runat="server" Enabled="false" CssClass="chBx" />
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Dirección
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtDireccion" runat="server" Width="100%">
								<ClientEvents OnKeyPress="controlPress" />
							</telerik:RadTextBox>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Teléfono
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtTelefono" runat="server" Width="100%">
								<ClientEvents OnKeyPress="controlPress" />
							</telerik:RadTextBox>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Correo Electrónico
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtCorreo" runat="server" Width="100%">
								<ClientEvents OnKeyPress="controlPress" />
							</telerik:RadTextBox>

							<asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="rtxtCorreo"
								Display="None" ValidationExpression="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{1,3})+$"
								ValidationGroup="Paciente" ErrorMessage="El correo electronico no es valido" />
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 controlPair">
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 controlHousing controlSide">
							Nombre Acudiente
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 controlHousing">
							<telerik:RadTextBox ID="rtxtAcudiente" runat="server" Width="100%">
								<ClientEvents OnKeyPress="controlPress" />
							</telerik:RadTextBox>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
		<div class="titulo">
			Programación de exámenes
		</div>
		<div>
			<asp:CheckBox ID="chckbxMed" Text="Examen Medico" runat="server" ClientIDMode="Static" CssClass="chBx" /><!--onclick="deployMed(this);"-->
		</div>
		<div>
			<asp:CheckBox ID="chckbxRad" Text="Toma de radiografías" runat="server" CssClass="chBx" />
		</div>
		<div>
			<asp:CheckBox ID="chckbxLab" Text="Muestras de laboratorio" runat="server" ClientIDMode="Static"
				CssClass="chBx" onclick="deployLab(this);" />
		</div>
	</div>
	<div class="col-lg-4 col-md-4 col-sm-3 col-xs-12">
		<div class="titulo">
			Detalles atención
		</div>
		<div id="MedContainer" class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display: none;">
			<div>
				Detalle medico
			</div>
			<div>
				<%--
                <telerik:RadComboBox ID="rcbxMedico" runat="server" Filter="Contains" CausesValidation="false" Width="100%"></telerik:RadComboBox>
                <asp:RequiredFieldValidator ID="rfvMedico" runat="server" ControlToValidate="rcbxMedico" InitialValue="[Seleccione]"
                            ValidationGroup="Paciente" Enabled="false" Display="None" ErrorMessage="Debe indicar el medico el cual va a valorar al paciente"></asp:RequiredFieldValidator>
				--%>
			</div>
		</div>
		<div id="labContainer" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div>
				Exámenes de laboratorio
			</div>
			<div>
				<telerik:RadListBox ID="rlbExamenes" runat="server" AllowReorder="false" CheckBoxes="true" Width="100%">
					<Localization AllToLeft="true" />
				</telerik:RadListBox>
			</div>
		</div>
	</div>
	<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
		<div class="titulo">
			Anexos para descargar
		</div>
		<div>
			<telerik:RadAjaxPanel runat="server" ID="listaAnexos"></telerik:RadAjaxPanel>
			<br />
			<telerik:RadButton ID="rbtnRefreshAnnex" runat="server" CausesValidation="false" Text="Actualizar lista anexos" OnClick="rbtnRefreshAnnex_Click" Visible="False"></telerik:RadButton>
		</div>
	</div>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
		Comentarios Adicionales
	</div>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
		<telerik:RadTextBox ID="rtxtComment" runat="server" TextMode="MultiLine" Width="100%">
			<ClientEvents OnKeyPress="controlPress" />
		</telerik:RadTextBox>
	</div>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 controlRow">
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center">
			<telerik:RadButton ID="rbtnGuardar" SingleClick="true" SingleClickText="Guardando..." runat="server" CausesValidation="true" ValidationGroup="Paciente" UseSubmitBehavior="false"
				Text="Guardar Información" OnClick="rbtnGuardar_Click" />
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center">
			<telerik:RadButton ID="rbtnFirmar" runat="server" CausesValidation="false" UseSubmitBehavior="false" Text="Abrir Firma" OnClientClicking="abrirConsentimientos" Visible="false" />
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center">
			<telerik:RadButton ID="rbtnLiberar" runat="server" CausesValidation="false"
				UseSubmitBehavior="false" Text="Liberar historia" Visible="false"
				OnClick="rbtnLiberar_Click" />
		</div>
	</div>
</asp:Content>
<asp:Content ID="cHead" ContentPlaceHolderID="PageScriptsHolder" runat="server">
	<script type="text/javascript">
		function readImage(input)
		{
			if (input.files && input.files[0])
			{
				var reader = new FileReader();

				reader.onload = function (e)
				{
					$('#imgFoto')
						.attr('src', e.target.result)
						.width(250)
						.height(300);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<script id="scrConcentimi" type="text/javascript">
		function abrirConsentimientos(sender, eventArgs)
		{
			var hidId = document.getElementById("<%=this.hfIdHistoria.ClientID%>");
			window.open("Firmar.aspx?IdHist=" + hidId.value, "signin", "height=400,width=520,resizable=no,scrollbars=yes");
			eventArgs.set_cancel(true);
			return false;
		}
	</script>
	<script type="text/javascript" id="fleUpld">

		var $flUpl;

		function ru_ClientAdded(sender, args)
		{
			$flUpl = $telerik.$(args._fileInputField);
		}

		function ru_ClientFileSelected(sender, args)
		{
			var input = args.get_fileInputField();
			if (input.files && input.files[0])
			{
				var reader = new FileReader();

				reader.onload = function (e)
				{

					$('#<%=imgPrePhoto.ClientID%>')
						.attr('src', e.target.result)
						.width(140)
						.height(170);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}

		function openFileDialog()
		{
			$telerik.$("#<%=this.rauFoto.ClientID%>").click();
			return false;
            /*
            $flUpl.click();
            
            */
		}

		function fileUploaded(sender, args)
		{
			var mang = $find("<%=this.ramMan.ClientID%>")
			mang.ajaxRequest();
		}


		function mostrarFileupl(sender, e)
		{
			$flUpl.click();
			e.set_cancel(true);
		}
	</script>
	<script type="text/javascript" id="valPac">

		function validarPaciente(sender, eventArgs)
		{
			ValidarDatos();
		}

		function rcbTipDoc_SelIndChang(sender, eventArgs)
		{
			ValidarDatos();
		}

		function ValidarDatos()
		{
			var txt = $find("<%=this.rtxtNumDoc.ClientID%>");
			var rcTipDoc = $find("<%=this.rcbxTipoDoc.ClientID%>");

			var num = txt.get_value();

			var tipDoc = rcTipDoc.get_value();

			if (num != "" && tipDoc != "")
			{
				var rbtn = $find("<%=this.rbtnValidate.ClientID%>");
				rbtn.click();
			}
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function ()
		{
			var obj = document.getElementById("chckbxLab");
			deployLab(obj)
		});

		function deployLab(obj)
		{
			if (obj.checked == true)
			{
				document.getElementById("labContainer").style.display = "block";
			}
			else
			{
				document.getElementById("labContainer").style.display = "none";
			}
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function ()
		{
			var obj = document.getElementById("chckbxMed");
			deployMed(obj)
		});


		function controlPress(sender, args)
		{
			if (args.get_keyCode() == '13')
			{
				args.set_cancel(true);
			}
		}
	</script>
</asp:Content>
