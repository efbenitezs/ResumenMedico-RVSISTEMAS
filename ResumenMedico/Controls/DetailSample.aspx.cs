using System;
using System.Web.UI;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico.Controls
{
	public partial class DetailSample : BasePage
	{
		public int IdHistoria
		{
			get
			{
				return ViewState["idHist"] != null ? Convert.ToInt32(ViewState["idHist"]) : int.MinValue;
			}
			set
			{
				if (ViewState["idHist"] != null)
				{
					ViewState["idHist"] = value;
				}
				else
				{
					ViewState.Add("idHist", value);
				}
			}
		}

		public int IdMuestra
		{
			get
			{
				return ViewState["idMu"] != null ? Convert.ToInt32(ViewState["idMu"]) : int.MinValue;
			}
			set
			{
				if (ViewState["idMu"] != null)
				{
					ViewState["idMu"] = value;
				}
				else
				{
					ViewState.Add("idMu", value);
				}
			}
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			if (this.IdUserCurrent != int.MinValue)
			{
				if (!IsPostBack)
				{
					int idMuestra = Convert.ToInt32(this.GetValueFromRequest("idSmpl", int.MinValue.ToString()));
					if (idMuestra != int.MinValue)
					{
						LoadInfo(idMuestra);
					}
				}
			}
			else
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "reloadParent", "ReloadParent();", true);
			}
		}

		private void LoadInfo(int idMuestra)
		{
			MuestraLaboratorioBll objBll = new MuestraLaboratorioBll();
			MuestraLaboratorio objEnt = objBll.Load(idMuestra);
			if (objEnt.Id != int.MinValue)
			{
				this.IdMuestra = objEnt.Id;
				this.IdHistoria = objEnt.IdHistoria;

				this.rtxtCommentario.Text = objEnt.Observaciones;

				switch (objEnt.IdTipoExamen)
				{
					case Constants.ExamenLab.Baciloscopia:
					case Constants.ExamenLab.Cultivo:
						this.lblTipoMuestra.Text = objEnt.IdTipoExamen == Constants.ExamenLab.Baciloscopia ? "Baciloscopia" : "Cultivo";
						divMuestras.Style.Add(HtmlTextWriterStyle.Display, "none");
						divUro.Style.Add(HtmlTextWriterStyle.Display, "none");
						break;

					case Constants.ExamenLab.Vih:
						this.lblTipoMuestra.Text = "VIH";
						divUro.Style.Add(HtmlTextWriterStyle.Display, "none");
						divValor.Style.Add(HtmlTextWriterStyle.Display, "none");

						this.lblResultado.Text = objEnt.Resultado;
						this.lblAviso.Text = "(HIV 1 & 2) Técnica Inmunocromatográfica (rápida) <br />Prueba presuntiva sujeta a confirmación ";
						break;

					case Constants.ExamenLab.SerologiaVdrl:
						this.lblTipoMuestra.Text = "Serología VDRL";
						divUro.Style.Add(HtmlTextWriterStyle.Display, "none");

						this.lblResultado.Text = objEnt.Resultado;
						this.lblAviso.Text = "";
						this.lblValor.Text = objEnt.Valor != decimal.MinValue ? objEnt.Valor.ToString() : "No Disponible";
						this.lblUnidadesValor.Text = "dils";
						break;

					case Constants.ExamenLab.HbsAg:
						this.lblTipoMuestra.Text = "Hepatitis B";
						divUro.Style.Add(HtmlTextWriterStyle.Display, "none");
						divValor.Style.Add(HtmlTextWriterStyle.Display, "none");

						this.lblResultado.Text = objEnt.Resultado;
						this.lblAviso.Text = "HBS Ag Técnica Inmunocromatográfica (rápida) <br />Prueba presuntiva sujeta a confirmación ";
						break;

					case Constants.ExamenLab.HepatitisC:
						this.lblTipoMuestra.Text = "Hepatitis C";
						divUro.Style.Add(HtmlTextWriterStyle.Display, "none");
						divValor.Style.Add(HtmlTextWriterStyle.Display, "none");

						this.lblResultado.Text = objEnt.Resultado;
						this.lblAviso.Text = "Técnica Inmunocromatográfica (rápida) <br />Prueba presuntiva sujeta a confirmación ";
						break;

					case Constants.ExamenLab.CuadroHematico:
						this.lblTipoMuestra.Text = "Cuadro Hemático";
						divUro.Style.Add(HtmlTextWriterStyle.Display, "none");
						divValor.Style.Add(HtmlTextWriterStyle.Display, "none");

						this.lblResultado.Text = objEnt.Resultado;
						this.lblAviso.Text = "";
						break;

					case Constants.ExamenLab.Creatinina:
						this.lblTipoMuestra.Text = "Creatinina";
						divUro.Style.Add(HtmlTextWriterStyle.Display, "none");

						this.lblResultado.Text = objEnt.Resultado;
						this.lblAviso.Text = "";
						this.lblValor.Text = objEnt.Valor != decimal.MinValue ? objEnt.Valor.ToString() : "No Disponible";
						this.lblUnidadesValor.Text = "mg/dl";
						break;

					case Constants.ExamenLab.HemoglobinaGlicosilada:
						this.lblTipoMuestra.Text = "Hemoglobina Glicosilada";
						divUro.Style.Add(HtmlTextWriterStyle.Display, "none");
						divResultado.Style.Add(HtmlTextWriterStyle.Display, "none");

						this.lblValor.Text = objEnt.Valor != decimal.MinValue ? objEnt.Valor.ToString() : "No Disponible";
						this.lblUnidadesValor.Text = @"%";
						break;

					case Constants.ExamenLab.Otro:
						this.lblTipoMuestra.Text = "Exámenes Complementarios";
						divUro.Style.Add(HtmlTextWriterStyle.Display, "none");
						divValor.Style.Add(HtmlTextWriterStyle.Display, "none");

						this.lblResultado.Text = objEnt.Resultado;
						this.lblAviso.Text = objEnt.Descripcion;
						break;

					case Constants.ExamenLab.Uroanalisis:
						this.lblTipoMuestra.Text = "Uroanálisis";
						//Datos examen Fisico
						this.lblOlor.Text = objEnt.Olor;
						this.lblColor.Text = objEnt.Color;
						this.lblAspecto.Text = objEnt.Aspecto;

						//Datos Examen Microquimico
						this.lblGLU.Text = objEnt.Glu;
						this.lblBIL.Text = objEnt.Bil;
						this.lblCET.Text = objEnt.Cet;
						this.lblDEN.Text = objEnt.Deh;
						this.lblPH.Text = objEnt.Ph;
						this.lblPRO.Text = objEnt.Pro;
						this.lblURO.Text = objEnt.Uro;
						this.lblNIT.Text = objEnt.Nit;
						this.lblSAN.Text = objEnt.San;
						this.lblLEU.Text = objEnt.Leu;

						//datos Examen Microscopico
						this.lblLeuco.Text = objEnt.LeucocitosCampo;
						this.lblHematies.Text = objEnt.HematiesCampo;
						this.lblCelAltas.Text = objEnt.CelulasAltasCampo;
						this.lblCelBajas.Text = objEnt.CelulasBajasCampo;
						this.lblMoco.Text = objEnt.Moco;
						this.lblBacteria.Text = objEnt.Bacterias;
						this.lblCilindros.Text = objEnt.Cilindros;
						this.lblCristales.Text = objEnt.Cristales;
						this.lblLevaduras.Text = objEnt.Levaduras;
						this.lblOtros.Text = objEnt.Otros;

						divMuestras.Style.Add(HtmlTextWriterStyle.Display, "none");
						break;
				}
			}
		}

		protected void rgArchivos_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
		{
			AnexoHistoriaBll objSrc = new AnexoHistoriaBll();
			this.rgArchivos.DataSource = objSrc.GetList(this.IdHistoria, Constants.TipoRevision.Laboratorio, false, this.IdMuestra, string.Empty);
		}
	}
}