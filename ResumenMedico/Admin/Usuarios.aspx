<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Usuarios.aspx.cs" Inherits="ResumenMedico.Admin.Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server" ClientIDMode="Static">
    <div class="titulo">
        Administración de Usuarios
    </div>
    <div>
        <telerik:RadAjaxManager ID="ram" runat="server" UpdatePanelsRenderMode="Block">
            <ClientEvents OnResponseEnd="TelerikAjaxResponseEnd" />
            <AjaxSettings>

                <telerik:AjaxSetting AjaxControlID="gvUsuarios">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="gvUsuarios" LoadingPanelID="ralpImage" />
                    </UpdatedControls>
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="emailValidator" />
                    </UpdatedControls>
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="erroresCarga" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>

        <telerik:RadAjaxLoadingPanel ID="ralpImage" runat="server" BackgroundPosition="Center" HorizontalAlign="Center"></telerik:RadAjaxLoadingPanel>

        <div class="ocultos">

            <telerik:RadTextBox ID="erroresCarga" ClientIDMode="Static" runat="server" onchange="mostrar(this)"></telerik:RadTextBox>

            <telerik:RadTextBox ID="tbxhidden" ClientIDMode="Static" runat="server" onchange="detectar(this)"></telerik:RadTextBox>

            <asp:RegularExpressionValidator ID="emailValidator" runat="server" Display="Dynamic" ErrorMessage="Hay errores en los datos que quiere enviar"
                ValidationExpression="Correcto" ControlToValidate="tbxhidden">
            </asp:RegularExpressionValidator>
        </div>

        <telerik:RadGrid ID="gvUsuarios" runat="server" Culture="es-CO" AutoGenerateColumns="False" AllowSorting="True" PageSize="15"
            OnNeedDataSource="gvUsuarios_NeedDataSource" OnDeleteCommand="gvUsuarios_DeleteCommand"
            OnInsertCommand="gvUsuarios_InsertCommand" OnUpdateCommand="gvUsuarios_UpdateCommand"
            OnItemDataBound="gvUsuarios_ItemDataBound" CellSpacing="-1" GridLines="Both"
            GroupPanelPosition="Top" ResolvedRenderMode="Classic" AllowPaging="True" Font-Names="Verdana" Font-Size="12px" Font-Bold="True">

            <ValidationSettings CommandsToValidate="PerformInsert,Update" ValidationGroup="Usuarios" />

            <PagerStyle AlwaysVisible="true" />

            <ClientSettings>
                <Scrolling UseStaticHeaders="true" />
            </ClientSettings>

            <MasterTableView CommandItemDisplay="Top" DataKeyNames="ID">

                <CommandItemSettings AddNewRecordText="Agregar Nuevo Usuario" ShowRefreshButton="false" />

                <Columns>
                    <telerik:GridButtonColumn UniqueName="EditColumn" ButtonType="ImageButton" CommandName="Edit"></telerik:GridButtonColumn>

                    <telerik:GridBoundColumn UniqueName="Nombres" HeaderText="Nombres Usuario" DataField="NOMBRES">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Apellidos" HeaderText="Apellidos Usuario" DataField="APELLIDOS">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Cuenta" HeaderText="Cuenta de usuario" DataField="CUENTA">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Cargo" HeaderText="Cargo Usuario" DataField="NOMBRE_CARGO">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Perfil" HeaderText="Perfil Usuario" DataField="PERFIL">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn UniqueName="FinalizaHistoria" HeaderText="Finaliza Historias" DataField="FINALIZA_HISTORIA">
						<HeaderStyle Width="123px" />
					</telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn UniqueName="Administrador" HeaderText="Es Administrador?" DataField="ADMINISTRADOR">
						<HeaderStyle Width="123px" />
					</telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn UniqueName="Activo" HeaderText="Activo" DataField="ACTIVO">
						<HeaderStyle Width="123px" />
					</telerik:GridCheckBoxColumn>
                </Columns>
                <EditFormSettings EditFormType="Template">
                    <FormTemplate>
                        <div style="display: grid; padding: 10px;">
                            <div class="text-center">
                                <h3>Detalles de Usuario</h3>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <div class="label">Nombres:</div>
                                        <div>
                                            <telerik:RadTextBox ID="tbxNombres" runat="server" TabIndex="1"
                                                Text='<%# Bind("NOMBRES")%>' Width="100%">
                                            </telerik:RadTextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <div class="label">Apellidos:</div>
                                        <div>
                                            <telerik:RadTextBox ID="tbxApellidos" runat="server" TabIndex="2"
                                                Text='<%# Bind("APELLIDOS")%>' Width="100%">
                                            </telerik:RadTextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <div class="label">Cuenta:</div>
                                        <div>
                                            <telerik:RadTextBox ID="tbxCuenta" runat="server" TabIndex="3"
                                                Text='<%# Bind("CUENTA")%>' Width="100%">
                                            </telerik:RadTextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <div class="label">Cambiar Password:</div>
                                        <div>
                                            <asp:CheckBox ID="chkChangePass" Checked="false" runat="server" CssClass="chBx" onclick="ShowHidePasswordChange(this)" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-8 col-md-8 col-lg-8 collapse" id="passContainner">
                                    <div class="col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <div class="label">Ingrese contraseña:</div>
                                            <div>
                                                <telerik:RadTextBox ID="tbxPassword12" runat="server" TextMode="Password"
                                                    TabIndex="4" ClientEvents-OnBlur="chkPwd" Width="100%">
                                                </telerik:RadTextBox>
                                                <span id="RFVPassword1" style="display: inline;">*
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <div class="label">Confirme contraseña:</div>
                                            <div>
                                                <telerik:RadTextBox ID="tbxPassword22" runat="server" TextMode="Password"
                                                    TabIndex="5" ClientEvents-OnBlur="chkPwd" Width="100%">
                                                </telerik:RadTextBox>
                                                <span id="RFVPassword2" style="display: inline;">*
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <div class="label">Perfil:</div>
                                        <div>
                                            <telerik:RadComboBox ID="rcbPerfil" runat="server" TabIndex="7"
                                                Width="100%" OnClientDropDownClosed="ShowHideSignPanel">
                                            </telerik:RadComboBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <div class="label">Cargo:</div>
                                        <div>
                                            <telerik:RadComboBox ID="rcbCargo" runat="server" TabIndex="6" DataSourceID="odsCargo"
                                                DataTextField="NOMBRE_CARGO" DataValueField="ID" SelectedValue='<%# Bind("ID_CARGO") %>'
                                                Width="100%">
                                            </telerik:RadComboBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-12 collapse" id="panelFirmaContainner">
                                <div class="col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <div class="label">Registro profesional:</div>
                                        <div>
                                            <telerik:RadTextBox ID="tbxRegistroProfesional" runat="server" Width="100%">
                                            </telerik:RadTextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <div class="label">Correo electrónico:</div>
                                        <div>
                                            <telerik:RadTextBox ID="tbxCorreoElectronico" runat="server" Width="100%">
                                            </telerik:RadTextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <div class="label">Universidad:</div>
                                        <div>
                                            <telerik:RadTextBox ID="tbxUniversidad" runat="server" Width="100%">
                                            </telerik:RadTextBox>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-sm-12 col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <div class="label">Firma</div>
                                        <div>
                                            <canvas id="cnv" name="cnv" width="448" height="106" style="border-style: outset; border-width: 3px;"></canvas>
                                            <asp:HiddenField ID="hidBase64ImageData" runat="server" />
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <div class="label">Finaliza Historias:</div>
                                        <div>
                                            <asp:CheckBox ID="chkFinHis" runat="server" TabIndex="8" Checked='<%# (Container is GridEditFormInsertItem)? false : Eval("FINALIZA_HISTORIA") %>' CssClass="chBx"></asp:CheckBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <div class="label">Es administrador:</div>
                                        <div>
                                            <asp:CheckBox ID="chkAdmin" runat="server" TabIndex="9" Checked='<%# (Container is GridEditFormInsertItem)? false : Eval("ADMINISTRADOR") %>' CssClass="chBx"></asp:CheckBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group">
                                        <div class="label">Activo:</div>
                                        <div>
                                            <asp:CheckBox ID="chkbxActivo" runat="server" TabIndex="10" Checked='<%# (Container is GridEditFormInsertItem)? false : Eval("ACTIVO") %>' CssClass="chBx"></asp:CheckBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <telerik:RadButton ID="btnUpdate" Text='<%# (Container is GridEditFormInsertItem) ? "Crear" : "Actualizar" %>' runat="server"
                                        CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                        OnClientClicking="ValidateUser">
                                    </telerik:RadButton>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <telerik:RadButton ID="rbtnCancel" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancelar"></telerik:RadButton>
                                </div>
                            </div>
                        </div>
                    </FormTemplate>
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:ObjectDataSource ID="odsCargo" runat="server" SelectMethod="GetList" TypeName="RMBLL.CargoBll">
            <SelectParameters>
                <asp:Parameter Name="nombreCargo" Type="String" DefaultValue="" />
                <asp:Parameter Name="activo" Type="Boolean" DefaultValue="true" />
                <asp:Parameter Name="showAllActivo" Type="Boolean" DefaultValue="false" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="PageScriptsHolder" runat="server">
    <script type="text/javascript">
        var grid;

        $(document).ready(function () {
            grid = $find('<%= gvUsuarios.ClientID %>');
        });

        function TelerikAjaxResponseEnd(sender, args) {
            var eventtree = args.get_eventTarget().split("$");

            switch (eventtree[eventtree.length - 1]) {
                case "gbcEditColumn":
                case "InitInsertButton":
                    var TableElement = grid.get_masterTableView().get_element();
                    var ComboPerfil = $telerik.findControl(TableElement, "rcbPerfil");
                    if (eventtree[eventtree.length - 1] == "gbcEditColumn") {
                        if (ComboPerfil.get_selectedItem().get_value() == 2) {
                            $("#panelFirmaContainner").addClass("in");

                            startTablet('usuario');

                            var imgcontent = $("input[id$='hidBase64ImageData']")[0].value;

                            if (imgcontent.length > 0) {
                                var c = document.getElementById("cnv");
                                var ctx = c.getContext("2d");
                                var img = document.createElement("img");
                                img.src = imgcontent;
                                ctx.drawImage(img, 1, 1);
                            }
                        }
                        else {
                            $("#panelFirmaContainner").removeClass("in")
                            endDemo();
                        }
                    }
                    break;
                default:
            }
        }

        function ShowHidePasswordChange(sender, event) {
            var passcontainner = $("#passContainner");
            var TableElement = grid.get_masterTableView().get_element();
            var p1 = $telerik.findControl(TableElement, "tbxPassword12");
            var p2 = $telerik.findControl(TableElement, "tbxPassword22");

            if (sender.checked) {
                $(passcontainner).addClass("in");
            }
            else {
                $(passcontainner).removeClass("in");
            }
            p1.value = "";
            p2.value = "";
        }

        function ShowHideSignPanel(sender, event) {

            if (sender.get_selectedItem().get_value() == 2) {
                $("#panelFirmaContainner").addClass("in");
                startTablet('usuario');
            }
            else {
                $("#panelFirmaContainner").removeClass("in")
                endDemo();
            }
        }

        function btnDoneClick() {
            onDone();
        }

        function ValidateUser(sender, args) {
            var error_message = "";
            var grid = $find('<%= gvUsuarios.ClientID%>');
            var TableElement = grid.get_masterTableView().get_element();
            var Nombres = $telerik.findControl(TableElement, "tbxNombres");
            var Apellidos = $telerik.findControl(TableElement, "tbxApellidos");
            var Cuenta = $telerik.findControl(TableElement, "tbxCuenta");
            var chkCambiarPassword = $(TableElement).find("input[id$='chkChangePass']")[0];
            var Password = $telerik.findControl(TableElement, "tbxPassword12");
            var ComboPerfil = $telerik.findControl(TableElement, "rcbPerfil");
            var ComboCargo = $telerik.findControl(TableElement, "rcbCargo");
            var FirmaBacteriologo = $("input[id$='hidBase64ImageData']")[0];
            var Universidad = $telerik.findControl(TableElement, "tbxRegistroProfesional");
            var RegistroMedico = $telerik.findControl(TableElement, "tbxUniversidad");
            var CorreoElectronico = $telerik.findControl(TableElement, "tbxCorreoElectronico");

            if (Nombres.get_value() == "") error_message += "- La casilla de Nombres no puede estar vacía.\n";
            if (Apellidos.get_value() == "") error_message += "- La casilla de Apellidos no puede estar vacía.\n";
            if (Cuenta.get_value() == "") error_message += "- La casilla de Cuenta no puede estar vacía.\n";
            if (chkCambiarPassword.checked) {
                if (Password.get_value() == "") error_message += "- La casilla de password no puede estar vacía.\n";
                else if (!chkPwd) error_message += "- Las contraseñas ingresadas no coinciden.\n";
            }
            if (ComboPerfil.get_selectedItem().get_value() == "") error_message += "- Debe seleccionar un perfil para el usuario.\n";
            else {
                if (ComboPerfil.get_selectedItem().get_value() == 2) {
                    if ($(FirmaBacteriologo).val() == "") error_message += "- Hay que diligenciar la firma del bacteriólogo.\n";
                    if (Universidad.get_value() == "") error_message += "- La casilla de universidad no puede estar vacia.\n";
                    if (RegistroMedico.get_value() == "") error_message += "- La casilla de Registro medico no puede estar vacia.\n";
                    if (CorreoElectronico.get_value() == "") error_message += "- La casilla de correo electronico no puede estar vacia.\n";
                }
            }

            if (ComboCargo.get_selectedItem().get_value() == "") error_message += "- Debe seleccionar un cargo para el usuario.\n";

            if (error_message.length > 0) {
                alert(error_message);
                args.set_cancel(true);
            }
        }

        function chkPwd() {
            var grid = $find('<%= gvUsuarios.ClientID %>');
            var TableElement = grid.get_masterTableView().get_element();

            var p1 = $telerik.findControl(TableElement, "tbxPassword12");
            var p2 = $telerik.findControl(TableElement, "tbxPassword22");
            var validator = $("#RFVPassword2");

            if (p1.get_value() != p2.get_value()) {
                $(validator).html("Las contraseñas ingresadas no coinciden");
                return false;
            }
            else {
                $(validator).html("");
                return true
            }
        }

        function responseEnd(sender, eventArgs) {

            var args = eventArgs.get_eventTarget();
            var ini = (args.lastIndexOf("$") + 1);
            var fin = args.length;
            var texto = args.substring(ini, fin);

            var hid = document.getElementById("tbxhidden");
            var hid2 = document.getElementById("erroresCarga");

            switch (texto) {
                case "AddNewRecordButton":
                    hid.value = "Crear";
                    break;
                case "gbcEditColumn":
                    hid.value = "Editar";
                    break;
                case "btnUpdate":
                    hid.value = "finEditar";
                    break;
                case "rbtnCancel":
                    hid.value = "finEditar";
                    break;
                default:
                    hid.value = "";
                    break;
            }

            check_init(hid, texto);

            var longitud = (hid2.value).length;

            if (longitud > 0) {
                errorCheck(hid2);
                hid2.value = "";
            }

        }
    </script>


</asp:Content>
