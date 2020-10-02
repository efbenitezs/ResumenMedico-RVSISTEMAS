using System;
using System.Web.UI.WebControls;
using ResumenMedico.Controls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico.Consultorio
{
	public partial class Radiologia : BasePage
	{
		private int idHist = int.MinValue;

		private int IdHist
		{
			get
			{
				idHist = ViewState["idHi"] != null ? Convert.ToInt32(ViewState["idHi"]) : int.MinValue;
				return idHist;
			}
			set
			{
				if (ViewState["idHi"] != null)
				{
					ViewState["idHi"] = value;
				}
				else
				{
					ViewState.Add("idHi", value);
				}
				this.idHist = value;
			}
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			if (this.IdUserCurrent != int.MinValue)
			{
				if (this.IsAdmin || this.PerfilActual == Constants.Perfiles.Radiologia)
				{
					if (!IsPostBack)
					{
						this.IdHist = Convert.ToInt32(this.GetValueFromRequest("IdHist", "0"));
						if (this.idHist <= 0)
						{
							RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "errHisMed", "alert('No hay informacion acerca del paciente intentelo nuevamente')", true);
						}
						else
						{
							this.LoadInfoHist(this.idHist);
						}
					}
					LinkButton lbRegList = (LinkButton)Master.FindControl("lbRegList");
					lbRegList.PostBackUrl = ResolveUrl("../Pendientes.aspx") + "?T=2";
				}
				else
				{
					Response.Redirect(ResolveUrl("~/Inicio.aspx"), true);
				}
			}
			else
			{
				Response.Redirect(ResolveUrl("~/Login.aspx"), true);
			}
			Session["ShowConsultorio"] = true;
			Session["ShowMenu"] = false;
		}

		private void lnkSalir_Click(object sender, EventArgs e)
		{
			Response.Redirect(ResolveUrl("~/Login.aspx"), true);
		}

		private void LoadInfoHist(int idHistoria)
		{
			HistoriaMedicaBll objHMBll = new HistoriaMedicaBll();
			HistoriaMedica objEntHm = objHMBll.Load(idHistoria);
			PacienteBll objPBll = new PacienteBll();
			Paciente objEntPac = objPBll.Load(objEntHm.IdPaciente);
			Utilidades.LlenarRC(this.rcbxTipoDoc, new TipoDocumentoBll().GetList(string.Empty, true, false), "ID", "NOMBRE", true);
			Utilidades.PosicionarRC(this.rcbxTipoDoc, objEntPac.IdTipoDocumento.ToString());

			this.hfIdHist.Value = idHistoria.ToString();
			this.rdpFecha.SelectedDate = objEntHm.FechaIngreso;
			this.rdpFecha.Enabled = false;

			this.rdpFecNacimiento.SelectedDate = objEntPac.FechaNacimiento;
			this.rdpFecNacimiento.Enabled = false;

			this.rtxtNombres.Text = objEntPac.Nombres + " " + objEntPac.Apellidos;
			this.rtxtCorreo.Text = objEntPac.Correo;
			this.rtxtNumDoc.Text = objEntPac.NumeroDocumento;
			this.rtxtPasaporte.Text = objEntPac.NumeroPasaporte;
			this.rntPeso.Value = Convert.ToDouble(objEntHm.Peso);
			this.rntEstatura.Value = Convert.ToDouble(objEntHm.Estatura * 100M);
			try
			{
				this.rntBmi.Value = Convert.ToDouble(objEntHm.BMI);
			}
			catch
			{
				this.rntBmi.Value = null;
			}
			//si es menor de dos años debe especificar el perimetro cefalico
			this.rntPC.Value = objEntPac.FechaNacimiento > DateTime.Now.AddYears(-2) ? (objEntHm.PerimetroCefalico != decimal.MinValue ? Convert.ToDouble(objEntHm.PerimetroCefalico) : 0d) : 0d;
			this.rntPC.Enabled = this.rfvPC.Enabled = objEntPac.FechaNacimiento > DateTime.Now.AddYears(-2);

			this.rtxtCommentRad.Text = objEntHm.ComentarioRad;
			this.rtxtCommentRadGen.Text = objEntHm.ComentarioRadMed;
			this.ChkRequiereNotificacion.Checked = objEntHm.RequiereNotificacion;
			this.ChkNotificado.Checked = objEntHm.NotificacionEnviada;

			this.chkRadiografiaTom.Checked = objEntHm.RadiografiaTomada;

			if (objEntHm.PacienteExterno)
			{
				this.chkCargadaEmedical.Enabled = true;
				this.chkCargadaEmedical.Checked = objEntHm.RadiografiaCargadaEmedical;
			}

			if (objEntHm.IdMedico != int.MinValue)
			{
				UsuarioBll objUsuBll = new UsuarioBll();
				Usuario objEntUserMedico = objUsuBll.Load(objEntHm.IdMedico);

				this.lblNombreMedico.Text = objEntUserMedico.Nombres + " " + objEntUserMedico.Apellidos;
			}
			else
			{
				this.lblNombreMedico.Text = "No Asignado";
			}

			this.rblEstado.SelectedValue = Convert.ToByte(objEntHm.EstadoRevisionRadMed).ToString();
			this.rblEstadoRad.SelectedValue = Convert.ToByte(objEntHm.EstadoRevisionRad).ToString();

			TipoVisaBll objTvBll = new TipoVisaBll();
			TipoVisa objTvEnt = objTvBll.Load(objEntHm.IdTipoVisa);

			this.EmbajadaCurr = objTvEnt.IdEmbajada;

			this.LoadImgPerfilPaciente(idHistoria, this.imgPrePhoto);
		}

		protected void rgFilesAttached_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
		{
			int idMuestra = this.rblEstadoRad.SelectedValue != string.Empty ? Convert.ToInt32(this.rblEstadoRad.SelectedValue) : 0;
			AnexoHistoriaBll objBllData = new AnexoHistoriaBll();
			this.rgFilesAttached.DataSource = objBllData.GetList(this.IdHist, Constants.TipoRevision.Radiologia, false, int.MinValue, string.Empty);
		}

		protected void btnSaveInfo_Click(object sender, EventArgs e)
		{
			HistoriaMedicaBll objHmBll = new HistoriaMedicaBll();
			HistoriaMedica objHmEnt = objHmBll.Load(this.IdHist);
			if (this.rblEstadoRad.SelectedValue != string.Empty)
			{
				objHmEnt.EstadoRevisionRad = (Constants.EstadoRevision)(Convert.ToByte(this.rblEstadoRad.SelectedValue));
			}
			objHmEnt.ComentarioRad = this.rtxtCommentRad.Text.Trim();
			objHmEnt.Estatura = Convert.ToDecimal(this.rntEstatura.Value) / 100;
			objHmEnt.Peso = Convert.ToDecimal(this.rntPeso.Value);
			objHmEnt.PerimetroCefalico = this.rntPC.Value != null ? Convert.ToDecimal(this.rntPC.Value) : decimal.MinValue;
			objHmEnt.TieneRevisionRad = true;
			objHmEnt.IdUltimaModificacion = this.IdUserCurrent;
			objHmEnt.FechaUltimaModificacion = DateTime.Now;
			objHmEnt.RadiografiaTomada = this.chkRadiografiaTom.Checked;
			objHmEnt.RadiografiaCargadaEmedical = this.chkCargadaEmedical.Checked;
			objHmEnt.RequiereNotificacion = this.ChkRequiereNotificacion.Checked;
			objHmEnt.NotificacionEnviada = this.ChkNotificado.Checked;

			if (!objHmBll.Save(objHmEnt, null))
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "savedFailHead", "alert('Se ha presentado el sisguiente inconveniente al almacenar la informacion:\\n\\n" + Utilidades.AjustarMensajeError(objHmBll.Error) + "');", true);
			}
			else
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "savedOKHead", "alert('Se ha almacenado la información');", true);
			}
		}
	}
}