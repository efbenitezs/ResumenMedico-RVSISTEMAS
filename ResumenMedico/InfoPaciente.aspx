<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
	CodeBehind="InfoPaciente.aspx.cs" Inherits="ResumenMedico.InfoPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
			window.open("Consultorio/Firmar.aspx?IdHist=" + hidId.value, "signin", "height=400,width=500,resizable=no,scrollbars=yes");
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
			//alert("Entro al metodo manejador del boton");
			$flUpl.click();
			//$telerik.$(".ruFileInput").click();
			//<%=this.rauFoto.ClientID%>
			//openFileDialog();
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<telerik:RadAjaxManager ID="ramMan" runat="server" UpdatePanelsRenderMode="Inline">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="ramMan">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="imgPrePhoto" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rbtnValidate">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rtxtNombres" LoadingPanelID="ralpImage" />
					<telerik:AjaxUpdatedControl ControlID="hdIdPaciente" LoadingPanelID="ralpImage" />
					<telerik:AjaxUpdatedControl ControlID="rtxtApellidos" LoadingPanelID="ralpImage" />
					<telerik:AjaxUpdatedControl ControlID="rcbxEmbajada" LoadingPanelID="ralpImage" />
					<telerik:AjaxUpdatedControl ControlID="rcbxTipoVisa" LoadingPanelID="ralpImage" />
					<telerik:AjaxUpdatedControl ControlID="rtxtNumVisa" LoadingPanelID="ralpImage" />
					<telerik:AjaxUpdatedControl ControlID="rtxtAcudiente" LoadingPanelID="ralpImage" />
					<telerik:AjaxUpdatedControl ControlID="rtxtCorreo" LoadingPanelID="ralpImage" />
					<telerik:AjaxUpdatedControl ControlID="rtxtDireccion" LoadingPanelID="ralpImage" />
					<telerik:AjaxUpdatedControl ControlID="rdpFecNac" LoadingPanelID="ralpImage" />
					<telerik:AjaxUpdatedControl ControlID="rblGenero" LoadingPanelID="ralpImage" />
				</UpdatedControls>
			</telerik:AjaxSetting>
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
			<telerik:AjaxSetting AjaxControlID="rblGenero">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rtxtGeneroValue" LoadingPanelID="ralpImage" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="chkRequiereNot">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="chkNotEnv" LoadingPanelID="ralpImage" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rbtnGuardar">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="chkNotEnv" LoadingPanelID="ralpImage" />
				</UpdatedControls>
			</telerik:AjaxSetting>
		</AjaxSettings>
	</telerik:RadAjaxManager>
	<div class="ocultos">
		<asp:ValidationSummary ID="vsErrors" runat="server" ValidationGroup="Paciente" ShowMessageBox="true"
			DisplayMode="BulletList" ShowSummary="false" HeaderText="Al validar la informacion se han detectado los siguientes inconvenientes:" />
		<telerik:RadTextBox ID="rtxtGeneroValue" runat="server" Enabled="false" />
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 titulo">
				Información Paciente
			</div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					Tipo Identificación
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<telerik:RadComboBox ID="rcbxTipoDoc" runat="server" Width="100%" Filter="Contains"
						OnClientSelectedIndexChanging="rcbTipDoc_SelIndChang" />
					<asp:RequiredFieldValidator ID="rfvTipDoc" runat="server" ControlToValidate="rcbxTipoDoc"
						InitialValue="[Seleccione]" ValidationGroup="Paciente" ErrorMessage="Debe especificar el tipo de Identificacion" />
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					Nombres
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtNombres" runat="server" MaxLength="50" Width="100%" />
					<asp:RequiredFieldValidator ID="rfvNombres" runat="server" Display="None" ControlToValidate="rtxtNombres"
						ValidationGroup="Paciente" ErrorMessage="Debe indicar el nombre del paciente" />
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					Embajada
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<telerik:RadComboBox ID="rcbxEmbajada" runat="server" Width="100%" Filter="Contains"
						AutoPostBack="true" CausesValidation="false" OnSelectedIndexChanged="rcbxEmbajada_SelectedIndexChanged" />
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					Género
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<asp:RadioButtonList ID="rblGenero" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
						CausesValidation="false" OnSelectedIndexChanged="rblGenero_SelectedIndexChanged">
						<asp:ListItem Text="Masculino" Value="1"></asp:ListItem>
						<asp:ListItem Text="Femenino" Value="0"></asp:ListItem>
					</asp:RadioButtonList>
					<asp:RequiredFieldValidator ID="rfvGenero" runat="server" ControlToValidate="rtxtGeneroValue"
						ErrorMessage="Debe indicar el genero del paciente" ValidationGroup="Paciente" />
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					Código
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtNumVisa" runat="server" MaxLength="50" Width="100%"/>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					Es paciente Externo
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<asp:CheckBox ID="chkPacienteExterno" runat="server" />
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					Requiere ser notificado
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<asp:CheckBox ID="chkRequiereNot" runat="server" OnCheckedChanged="chkRequiereNot_CheckedChanged"
						AutoPostBack="true" />
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					Número Identificación
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtNumDoc" runat="server" MaxLength="50" Width="100%" EmptyMessage="[Número Documento]">
						<ClientEvents OnBlur="validarPaciente" />
					</telerik:RadTextBox>
					<asp:RequiredFieldValidator ID="rfvNumDoc" runat="server" ControlToValidate="rtxtNumDoc"
						ValidationGroup="Paciente" ErrorMessage="Debe especificar el numero de Identificacion" Display="None"/>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					Apellidos
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<telerik:RadTextBox ID="rtxtApellidos" runat="server" MaxLength="50" Width="100%"/>
					<asp:RequiredFieldValidator ID="rfvApellidos" runat="server" ControlToValidate="rtxtApellidos"
						ValidationGroup="Paciente" ErrorMessage="Debe especificar los apellidos del paciente"/>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					Tipo Código
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<telerik:RadComboBox ID="rcbxTipoVisa" runat="server" Width="100%" Filter="Contains"/>
					<asp:RequiredFieldValidator ID="rfvTipoVisa" runat="server" ControlToValidate="rcbxTipoVisa"
						InitialValue="[Seleccione]" ValidationGroup="Paciente" ErrorMessage="Debe especificar el tipo de código"/>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					Fecha Nacimiento
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<telerik:RadDatePicker ID="rdpFecNac" runat="server" Width="100%" OnSelectedDateChanged="rdpFecNac_SelectedDateChanged"
						AutoPostBack="true" MinDate="1900-01-01">
						<DateInput DateFormat="yyyy-MM-dd" ID="diFecNac" runat="server" EmptyMessage="[Ingrese la fecha de nacimiento]"
							CausesValidation="false"/>
						<Calendar ID="cFecNac" runat="server" FirstDayOfWeek="Sunday"/>
					</telerik:RadDatePicker>
					<asp:RequiredFieldValidator ID="rfvFecNac" runat="server" ControlToValidate="rdpFecNac"
						ValidationGroup="Paciente" ErrorMessage="debe indicar la fecha de nacimiento del paciente" Display="None"/>
					<asp:CompareValidator ID="cvFecNac" runat="server" ControlToValidate="rdpFecNac"
						Operator="LessThan" Type="Date" ValidationGroup="Paciente" ControlToCompare="rtxtFechaNacCompare"
						ErrorMessage="la fecha de nacimiento no puede ser mayor a la fecha de hoy"
						>
					</asp:CompareValidator>
					<div style="display: none;">
						<telerik:RadTextBox ID="rtxtFechaNacCompare" runat="server" Text='<%=DateTime.Now.ToString("yyyy-MM-dd")%>'>
						</telerik:RadTextBox>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="spacio">
					</div>
					Dirección
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<div class="spacio">
					</div>
					<telerik:RadTextBox ID="rtxtDireccion" runat="server" MaxLength="100" TextMode="MultiLine"
						Rows="3" LabelWidth="64px" Width="100%" Font-Names="Verdana">
					</telerik:RadTextBox>
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<div class="spacio">
					</div>
					Ya se ha enviado la notificación
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="spacio">
					</div>
					<asp:CheckBox ID="chkNotEnv" runat="server" Enabled="false" />
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<div class="col-lg-6 col-lg-offset-5 col-md-6 col-md-offset-5 col-sm-12 col-xs-12">
					<div class="spacio">
					</div>
					<telerik:RadBinaryImage ID="imgPrePhoto" runat="server" ImageAlign="AbsMiddle" Width="140px"
						Height="170px" ImageUrl="~/Resources/DefaultImage.jpg" BorderStyle="Ridge" />
					<asp:HiddenField ID="hfRutImg" runat="server" />
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div style="display: none;">
						<telerik:RadButton ID="rbtnValidate" runat="server" Text="Validar Usuario Existe"
							OnClick="rbtnValidate_Click" CausesValidation="false">
						</telerik:RadButton>
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
					</div>
				</div>
				<div class="col-lg-6 col-lg-offset-4 col-md-6 col-md-offset-4 col-sm-12 col-xs-12 btn">
					<div class="spacio">
					</div>
					<telerik:RadButton ID="rbtnCargarImagen" runat="server" CausesValidation="false"
						UseSubmitBehavior="false" Text="Cargar Foto" Font-Bold="true" Font-Names="Verdana"
						ForeColor="#666666" OnClientClicking="mostrarFileupl">
					</telerik:RadButton>
				</div>
			</div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="spacio">
					</div>
					Correo Electrónico
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<div class="spacio">
					</div>
					<telerik:RadTextBox ID="rtxtCorreo" runat="server" MaxLength="100" Width="100%" Font-Names="Verdana">
					</telerik:RadTextBox>
					<asp:RegularExpressionValidator ID="revCorreo" runat="server" SetFocusOnError="true"
						ControlToValidate="rtxtCorreo"  Text="* el formato del correo no es valido"
						ValidationExpression="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{1,3})+$" ValidationGroup="Paciente"
						ErrorMessage="El correo electronico no es valido">
					</asp:RegularExpressionValidator>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="spacio">
					</div>
					Teléfono
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<div class="spacio">
					</div>
					<telerik:RadTextBox ID="rtxtTelefono" runat="server" MaxLength="40" Width="330px"
						Font-Names="Verdana">
					</telerik:RadTextBox>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="spacio">
						</div>
						Nombre Acudiente
					</div>
					<div class="col-lg-7 col-md-7 col-sm-12 col-xs-|12">
						<div class="spacio">
						</div>
						<telerik:RadTextBox ID="rtxtAcudiente" runat="server" MaxLength="50" Width="100%"
							Font-Names="Verdana">
						</telerik:RadTextBox>
						<asp:RequiredFieldValidator ID="rfvAcudiente" runat="server" ControlToValidate="rtxtAcudiente"
							Text="*" ErrorMessage="para los pacientes menores de edad debe indicar el nombre del acudiente"
							ValidationGroup="Paciente" Enabled="false" >
						</asp:RequiredFieldValidator>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<h1>
				Programación de examenes</h1>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<h1>
				Exámenes a practicarse</h1>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<h1>
				Anexos para descargar</h1>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<div>
				<asp:CheckBox ID="chckbxMed" Text="Examen Medico" runat="server" />
			</div>
			<div>
				<asp:CheckBox ID="chckbxRad" Text="Toma de radiografias" runat="server" />
			</div>
			<div>
				<asp:CheckBox ID="chckbxLab" Text="Muestras de laboratorio" runat="server" ClientIDMode="Static"
					onclick="deployLab(this);" />
			</div>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<div id="labContainer" style="text-align: left">
				<telerik:RadListBox ID="rlbExamenes" runat="server" AllowReorder="false" CheckBoxes="true"
					EmptyMessage="[No se encuentran examenes en el sistema]" Width="400" Height="300"
					Font-Names="Verdana">
					<Localization AllToLeft="true" />
				</telerik:RadListBox>
			</div>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<telerik:RadAjaxPanel runat="server" ID="listaAnexos">
			</telerik:RadAjaxPanel>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			</div>
			<div class="col-lg-6 col-lg-offset-5 col-md-6 col-md-offset-5 col-sm-12 col-xs-12">
				<telerik:RadButton ID="rbtnGuardar" runat="server" CausesValidation="true" ValidationGroup="Paciente"
					UseSubmitBehavior="true" Text="Guardar Información" OnClick="rbtnGuardar_Click"
					Font-Bold="true" Font-Names="Verdana" ForeColor="#666666">
				</telerik:RadButton>
				&nbsp;
				<telerik:RadButton ID="rbtnFirmar" runat="server" CausesValidation="false" UseSubmitBehavior="false"
					Text="Abrir Firma" OnClientClicking="abrirConsentimientos" Visible="false" Font-Bold="true"
					Font-Names="Verdana" ForeColor="#666666">
				</telerik:RadButton>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			</div>
		</div>
	</div>
	<div class="Row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="linia">
				<h1>
					Laboratorio</h1>
			</div>
		</div>
	</div>
</asp:Content>
