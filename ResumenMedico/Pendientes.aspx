<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
	CodeBehind="Pendientes.aspx.cs" Inherits="ResumenMedico.Pendientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
	<%--<meta http-equiv="refresh" content="45" />--%>
	<style type="text/css">
		.linkPnl
		{
			color: Navy !important; /*#337ab7;*/
			font-size: 18px !important;
			font-family: Verdana, Arial, Calibri !important;
		}

		.rtsUL .rtsLI
		{
			width: 33% !important;
		}
	</style>
	<script type="text/javascript">
		function Redirect(idHist, idTipRev)
		{

			switch (idTipRev)
			{
				case 1:
					window.location.href = "<%=ResolveUrl("~/")%>Consultorio/Laboratorio.aspx?IdHist=" + idHist;
					break;
				case 2:
					window.location.href = "<%=ResolveUrl("~/")%>/Consultorio/Radiologia.aspx?IdHist=" + idHist;
					break;

				case 3:
					window.location.href = "<%=ResolveUrl("~/")%>/Consultorio/Medicina.aspx?IdHist=" + idHist;
					break;
			}

		}
	</script>
	<script type="text/javascript">
		function MostrarCamposFiltro(sender, e)
		{
			var oWnd = $find("<%=rwModalSolMuEx.ClientID%>");
			oWnd.show();
			e.set_cancel(true);
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<telerik:RadAjaxManager ID="ram" runat="server" UpdatePanelsRenderMode="Block" DefaultLoadingPanelID="ralpImage">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="rgPendientes">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rgPendientes" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rbtnFiltrar">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rptPacientes" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rbtnFiltrarAlerta">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rptAlertas" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="rbtnFiltrarLista">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rptPacientes" />
					<telerik:AjaxUpdatedControl ControlID="rptAlertas" />
				</UpdatedControls>
			</telerik:AjaxSetting>
		</AjaxSettings>
	</telerik:RadAjaxManager>

	<telerik:RadAjaxLoadingPanel ID="ralpImage" runat="server" IsSticky="true" Style="position: absolute; top: 0; left: 0; height: 100%; width: 100%;"></telerik:RadAjaxLoadingPanel>
	<div class="row controlPair controlRow">
		<telerik:RadTabStrip ID="rtsPest" runat="server" Align="Justify" MultiPageID="rmpInformes">
			<Tabs>
				<telerik:RadTab Text="Pacientes de hoy" Selected="true" PageViewID="rmpPendDia" Value="1" />
				<telerik:RadTab Text="Pacientes pendientes" PageViewID="rpvAlerta" Value="2" />
				<telerik:RadTab Text="Pacientes regresados desde embajada" PageViewID="rpvRetornos" Value="3" />
			</Tabs>
		</telerik:RadTabStrip>
		<telerik:RadMultiPage ID="rmpInformes" runat="server">
			<telerik:RadPageView ID="rmpPendDia" runat="server" Selected="true" Width="100%">
				<div class="row">
					<asp:Repeater ID="rptPacientes" runat="server" OnItemDataBound="rptPacientes_ItemDataBound">
						<HeaderTemplate>
							<div class="row">
						</HeaderTemplate>
						<ItemTemplate>
							<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 repeaterItem">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 dataContainner">
									<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
										<div class="pictureContainner">
											<asp:Image ID="imgPac" runat="server" Width="99%" Height="230" BackColor="Transparent" BorderStyle="None" AlternateText='<%# Bind("Paciente")%>' CssClass="img-rounded"></asp:Image>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
												<div class='<%# Eval("cssDivLab")%> roundIndicator'></div>
												&nbsp;Lab
											</div>
											<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
												<div class='<%# Eval("cssDivRad")%> roundIndicator'></div>
												&nbsp;Rx
											</div>
											<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
												<div class='<%# Eval("cssDivMed")%> roundIndicator'>
												</div>
												&nbsp;Med
											</div>
										</div>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
										<div class="controlSide">
											<%# Eval("PACIENTE")%>
										</div>
										<div>
											<span class="controlSide">Edad: </span>
											<%# Eval("Edad")%><span> años</span>
										</div>
										<div class="">
											<span class="controlSide">Fecha Ingreso: </span>
											<%# Convert.ToDateTime(Eval("FECHA_INGRESO")).ToString("yyyy-MM-dd")%>
										</div>
										<div class="">
											<span class="controlSide">Reside fuera de Bogotá: </span>
											<%# Eval("ES_PRIORITARIO")%>
										</div>
										<div class="controlSide">
											Tipo y número de documento
										</div>
										<div class="">
											<span><%# Eval("TIPO_DOCUMENTO")%></span> - <span><%# Eval("NUMERO_DOCUMENTO")%></span>
										</div>
										<div class="controlSide">
											Tipo y Código de Embajada
										</div>
										<div class="">
											<span><%# Eval("TIPO_CODIGO")%></span> - <span><%# Eval("CODIGO_SOLICITUD")%></span>
										</div>
										<div class="controlSide">
											Fecha Nacimiento
										</div>
										<div class="">
											<span><%# Convert.ToDateTime(Eval("FECHA_NACIMIENTO")).ToString("yyyy-MM-dd")%></span>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-6" style="margin: 0 auto;">
											<div class="button" onclick='Redirect(<%# Eval("ID")%>, <%# Eval("TIPO_REV")%>);'>
												Ver información paciente
											</div>
										</div>
										<div class="col-md-3">
											<div class="label">Dr.</div>
											<%# Eval("MEDICO")%>
										</div>
										<div class="col-md-3" style="margin: 0 auto;">
											<img src='Resources/<%# Eval("FLAG_USER")%>' class="img-responsive img-rounded" style="border: 0 none; width: 99px; height: 50px" alt='<%# Eval("Embajada") %>' />
										</div>
									</div>
								</div>
							</div>
						</ItemTemplate>
						<FooterTemplate>
							</div>
						</FooterTemplate>
					</asp:Repeater>
				</div>
			</telerik:RadPageView>
			<telerik:RadPageView ID="rpvAlerta" runat="server" Width="100%">
				<asp:Repeater ID="rptAlertas" runat="server" OnItemDataBound="rptAlertas_ItemDataBound">
					<HeaderTemplate>
						<div class="row">
					</HeaderTemplate>
					<ItemTemplate>
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 repeaterItem">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 dataContainner">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
									<div class="pictureContainner">
										<asp:Image ID="imgPac" runat="server" Width="99%" Height="230" BackColor="Transparent" BorderStyle="None" AlternateText='<%# Bind("Paciente")%>' CssClass="img-rounded"></asp:Image>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class='<%# Eval("cssDivLab")%> roundIndicator'></div>
											&nbsp;Lab
										</div>
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class='<%# Eval("cssDivRad")%> roundIndicator'></div>
											&nbsp;Rx
										</div>
										<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
											<div class='<%# Eval("cssDivMed")%> roundIndicator'></div>
											&nbsp;Med
										</div>
									</div>
								</div>
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
									<div class="controlSide">
										<%# Eval("PACIENTE")%>
									</div>
									<div>
										<span class="controlSide">Edad: </span>
										<%# Eval("Edad")%><span> años</span>
									</div>
									<div class="">
										<span class="controlSide">Fecha Ingreso: </span>
										<%# Convert.ToDateTime(Eval("FECHA_INGRESO")).ToString("yyyy-MM-dd")%>
									</div>
									<div class="">
										<span class="controlSide">Reside fuera de Bogotá: </span>
										<%# Eval("ES_PRIORITARIO")%>
									</div>
									<div class="controlSide">
										Tipo y número de documento
									</div>
									<div class="">
										<span><%# Eval("TIPO_DOCUMENTO")%></span> - <span><%# Eval("NUMERO_DOCUMENTO")%></span>
									</div>
									<div class="controlSide">
										Tipo y Código de Embajada
									</div>
									<div class="">
										<span><%# Eval("TIPO_CODIGO")%></span> - <span><%# Eval("CODIGO_SOLICITUD")%></span>
									</div>
									<div class="controlSide">
										Fecha Nacimiento
									</div>
									<div class="">
										<span><%# Convert.ToDateTime(Eval("FECHA_NACIMIENTO")).ToString("yyyy-MM-dd")%></span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-6" style="margin: 0 auto;">
										<div class="button" onclick='Redirect(<%# Eval("ID")%>, <%# Eval("TIPO_REV")%>);'>
											Ver información paciente
										</div>
									</div>
									<div class="col-md-3">
										<div class="label">Dr.</div>
										<%# Eval("MEDICO")%>
									</div>
									<div class="col-md-3" style="margin: 0 auto;">
										<img src='Resources/<%# Eval("FLAG_USER")%>' class="img-responsive img-rounded" style="border: 0 none; width: 99px; height: 50px" alt='<%# Eval("Embajada") %>' />
									</div>
								</div>							</div>
						</div>
					</ItemTemplate>
					<FooterTemplate>
						</div>
					</FooterTemplate>
				</asp:Repeater>
			</telerik:RadPageView>
			<telerik:RadPageView ID="rpvRetornos" runat="server" Width="100%">
				<div class="row">
					<asp:Repeater ID="rptRetornos" runat="server" OnItemDataBound="rptRetornos_ItemDataBound">
						<HeaderTemplate>
							<div class="row">
						</HeaderTemplate>
						<ItemTemplate>
							<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 repeaterItem">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 dataContainner">
									<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
										<div class="pictureContainner">
											<asp:Image ID="imgPac" runat="server" Width="99%" Height="230" BackColor="Transparent"
												BorderStyle="None" AlternateText='<%# Bind("Paciente")%>' CssClass="img-rounded"></asp:Image>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
												<div class='<%# Eval("cssDivLab")%> roundIndicator'>
												</div>
												&nbsp;Lab
											</div>
											<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
												<div class='<%# Eval("cssDivRad")%> roundIndicator'>
												</div>
												&nbsp;Rx
											</div>
											<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
												<div class='<%# Eval("cssDivMed")%> roundIndicator'>
												</div>
												&nbsp;Med
											</div>
										</div>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
										<div class="controlSide">
											<%# Eval("PACIENTE")%>
										</div>
										<div>
											<span class="controlSide">Edad: </span>
											<%# Eval("Edad")%><span> años</span>
										</div>
										<div class="">
											<span class="controlSide">Fecha Ingreso: </span>
											<%# Convert.ToDateTime(Eval("FECHA_INGRESO")).ToString("yyyy-MM-dd")%>
										</div>
										<div class="">
											<span class="controlSide">Reside fuera de Bogotá: </span>
											<%# Eval("ES_PRIORITARIO")%>
										</div>
										<div class="controlSide">
											Tipo y número de documento
										</div>
										<div class="">
											<span><%# Eval("TIPO_DOCUMENTO")%></span> - <span><%# Eval("NUMERO_DOCUMENTO")%></span>
										</div>
										<div class="controlSide">
											Tipo y Código de Embajada
										</div>
										<div class="">
											<span><%# Eval("TIPO_CODIGO")%></span> - <span><%# Eval("CODIGO_SOLICITUD")%></span>
										</div>
										<div class="controlSide">
											Fecha Nacimiento
										</div>
										<div class="">
											<span><%# Convert.ToDateTime(Eval("FECHA_NACIMIENTO")).ToString("yyyy-MM-dd")%></span>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-6" style="margin: 0 auto;">
											<div class="button" onclick='Redirect(<%# Eval("ID")%>, <%# Eval("TIPO_REV")%>);'>
												Ver información paciente
											</div>
										</div>
										<div class="col-md-3">
											<div class="label">Dr.</div>
											<%# Eval("MEDICO")%>
										</div>
										<div class="col-md-3" style="margin: 0 auto;">
											<img src='Resources/<%# Eval("FLAG_USER")%>' class="img-responsive img-rounded" style="border: 0 none; width: 99px; height: 50px" alt='<%# Eval("Embajada") %>' />
										</div>
									</div>								</div>
							</div>
						</ItemTemplate>
						<FooterTemplate>
							</div>
						</FooterTemplate>
					</asp:Repeater>
				</div>
			</telerik:RadPageView>
		</telerik:RadMultiPage>
	</div>
	<telerik:RadWindow ID="rwModalSolMuEx" runat="server" Modal="true" Style="z-index: 100001;"
		Width="460px" Height="600px" Behaviors="Close" CenterIfModal="true" DestroyOnClose="false">
		<ContentTemplate>
		</ContentTemplate>
	</telerik:RadWindow>
</asp:Content>
