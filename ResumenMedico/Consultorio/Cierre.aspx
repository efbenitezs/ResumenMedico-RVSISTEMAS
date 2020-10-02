<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master"
	AutoEventWireup="true" CodeBehind="Cierre.aspx.cs" Inherits="ResumenMedico.Consultorio.Cierre" %>

<asp:Content ID="cBody" ContentPlaceHolderID="MainContent" runat="server">

	<telerik:RadAjaxManager ID="ram" runat="server" UpdatePanelsRenderMode="Block">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="rbtnFinishHistory">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="rptPacientes" LoadingPanelID="ralpImage" />
				</UpdatedControls>
			</telerik:AjaxSetting>
		</AjaxSettings>
	</telerik:RadAjaxManager>

	<telerik:RadAjaxLoadingPanel ID="ralpImage" runat="server" IsSticky="true" Style="position: absolute; top: 0; left: 0; height: 100%; width: 100%;"></telerik:RadAjaxLoadingPanel>

	<div class="titulo">
		Listado Historias Pendientes de Cierre
	</div>
	<div class="row">
		<div class="row">
			<asp:Repeater ID="rptPacientes" runat="server" OnItemDataBound="rptPacientes_ItemDataBound">
				<HeaderTemplate>
					<div class="row">
				</HeaderTemplate>
				<ItemTemplate>
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 repeaterItem repeaterItemCloseHistory">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 dataContainner">
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 patientData">

								<div class="pictureContainner">
									<asp:Image ID="imgPac" runat="server" Width="100%" Height="230" BackColor="Transparent" AlternateText='<%# Bind("Paciente")%>' CssClass="img-rounded" />
								</div>

								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 personalDataContainner">

									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 checkState">
										<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
											<div class='<%# Eval("cssDivLab")%> roundIndicator '></div>
											<div class="centeredLabel">
												Lab
											</div>
										</div>
										<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
											<div class='<%# Eval("cssDivRad")%> roundIndicator'></div>
											<div class="centeredLabel">
												Rx
											</div>
										</div>
										<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
											<div class='<%# Eval("cssDivMed")%> roundIndicator'></div>
											<div class="centeredLabel">
												Med
											</div>
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 basicInfo">
										<div class="controlSide"><%# Eval("PACIENTE")%></div>
										<div>
											Edad:
											<%# Eval("EDAD")%>
											años
										</div>
										<div>
											<div>
												Peso:
												<%# Eval("PESO")%>
												kg
											</div>
											<div>
												Estatura:
												<%# (Convert.ToDecimal(Eval("ESTATURA")) * 100M).ToString("0.0")%>
												cm
											</div>
										</div>
										<div>
											<div>Número de código</div>
											<asp:Label ID="lblTipoCod" runat="server" Text='<%# Eval("TIPO_CODIGO")%>'></asp:Label>
											<asp:Label ID="lblCodSol" runat="server" Text='<%# Eval("CODIGO_SOLICITUD")%>'></asp:Label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12 commentData">
								<div class='collapse comment <%# (Eval("cssDivMed").ToString()) == "divRojo" ?"in":"" %> <%# Eval("ClassAbnormals")%>'>
									<div class="controlSide">Comentarios medicina</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<%# Eval("COMENTARIO_MED")%>
									</div>
								</div>
								<div class='collapse comment <%# (Eval("cssDivLab").ToString()) == "divRojo" ?"in":"" %> <%# Eval("ClassAbnormals")%>'>
									<div class="controlSide">Comentarios laboratorio</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<%# Eval("COMENTARIO_LAB")%>
									</div>
								</div>
								<div class='collapse comment <%# (Eval("cssDivRad").ToString()) == "divRojo" ?"in":"" %> <%# Eval("ClassAbnormals")%>'>
									<div class="controlSide">Comentarios radiologia</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<%# Eval("COMENTARIO_RAD")%>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 formButtons">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 btnConntainner">
									<a class="button" href="#" onclick='Redirect(<%# Eval("ID")%>)'>Ver Detalles</a>
									<asp:HiddenField ID="hfThisHistory" runat="server" Value='<%# Eval("ID")%>' />
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 btnConntainner">
									<telerik:RadButton CssClass="button" runat="server" ID='rbtnFinishHistory' OnClick="BtnSaveClick" Text="Finalizar Historia" ButtonType="LinkButton" />
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 controlSide" style="margin: 0 auto;">
								Dr.<span><%# Eval("MEDICO")%></span>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
								<img src='/Resources/<%# Eval("FLAG_USER")%>' class="img-responsive img-rounded" style="border: 0 none; width: 99px; height: 50px; float: right;"
									alt='<%# Eval("Embajada") %>' />
							</div>
						</div>
					</div>
				</ItemTemplate>
				<FooterTemplate>
					</div>
				</FooterTemplate>
			</asp:Repeater>
		</div>
	</div>
</asp:Content>
<asp:Content ID="chead" ContentPlaceHolderID="PageScriptsHolder" runat="server">
	<script type="text/javascript">
		function Redirect(idHist)
		{
			window.location.href = "/Consultorio/CierreDetalle.aspx?IdHist=" + idHist;
		}
	</script>
</asp:Content>