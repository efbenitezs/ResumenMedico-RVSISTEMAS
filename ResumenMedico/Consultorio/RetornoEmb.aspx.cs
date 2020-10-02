using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI.WebControls;
using ResumenMedico.Controls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico.Consultorio
{
	public partial class RetornoEmb : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (this.IdUserCurrent != int.MinValue)
			{
				if (!IsPostBack)
				{
					this.LoadList();
				}
				else
				{
				}
				LinkButton lbRegList = (LinkButton)Master.FindControl("lbRegList");
				lbRegList.Visible = false;
			}
			else
			{
				Response.Redirect(ResolveUrl("~/Login.aspx"), true);
			}
			Session["ShowConsultorio"] = true;
			Session["ShowMenu"] = false;
		}

		private void LoadList()
		{
			EmbajadaBll objBllEmb = new EmbajadaBll();
			Utilidades.LlenarRC(this.rcbxEmbajada, objBllEmb.GetList(string.Empty, true, false), "ID", "NOMBRE", true);
			Utilidades.LlenarRCEnBlanco(this.rcbxTipoVisa);
		}

		protected void rcbxEmbajada_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
		{
			if (this.rcbxEmbajada.SelectedValue != string.Empty)
			{
				TipoVisaBll objBllTipVisa = new TipoVisaBll();
				Utilidades.LlenarRC(this.rcbxTipoVisa, objBllTipVisa.GetList(string.Empty, (RMEntity.Constants.Embajadas)Convert.ToInt32(this.rcbxEmbajada.SelectedValue), false, true, false), "ID", "NOMBRE", true);
			}
			else
			{
				Utilidades.LlenarRCEnBlanco(this.rcbxTipoVisa);
			}
		}

		protected void rbtnConsultar_Click(object sender, EventArgs e)
		{
			if (this.rcbxEmbajada.SelectedValue != string.Empty && this.rcbxTipoVisa.SelectedValue != string.Empty && this.rtxtNumVisa.Text.Trim() != string.Empty)
			{
				HistoriaMedicaBll objBll = new HistoriaMedicaBll();
				List<HistoriaMedica> lstHm = objBll.GetHistoriasMedicas(int.MinValue, DateTime.MinValue, Convert.ToInt32(rcbxTipoVisa.SelectedValue), this.rtxtNumVisa.Text.Trim(), true, true, Constants.EstadoRevision.Normal, true, true, true,
					Constants.EstadoRevision.Normal, true, true, true, Constants.EstadoRevision.Normal, true, true, false, true, false, int.MinValue);

				if (lstHm.Count > 0)
				{
					HistoriaMedica objEntHm = lstHm[0];
					PacienteBll objBllPac = new PacienteBll();
					Paciente objEntPac = objBllPac.Load(objEntHm.IdPaciente);
					TipoDocumentoBll objBlltipDoc = new TipoDocumentoBll();
					TipoDocumento objEntTipDoc = objBlltipDoc.Load(objEntPac.IdTipoDocumento);

					this.hfIdHist.Value = objEntHm.Id.ToString();
					this.lblCodSol.Text = objEntHm.CodigoSolicitud;
					this.lblFecIng.Text = objEntHm.FechaIngreso.ToString("yyyy-MM-dd");
					this.lblNumDoc.Text = objEntPac.NumeroDocumento;
					this.lblPaciente.Text = objEntPac.Nombres + " " + objEntPac.Apellidos;
					this.lblTipDoc.Text = objEntTipDoc.Nombre;
					this.lblTipoCod.Text = rcbxTipoVisa.SelectedItem.Text;

					this.pnlInfoPac.Visible = true;

					AnexoHistoriaBll objAhBll = new AnexoHistoriaBll();
					int idHistoria = objEntHm.Id;
					List<AnexoHistoria> lst = objAhBll.GetAnexoHistorias(idHistoria, Constants.TipoRevision.MedicinaGeneral, false, int.MinValue, Constants.NombreArchivoImagenPaciente);
					if (lst.Count > 0)
					{
						AnexoHistoria objAhFileImage = lst[0];
						if (Directory.Exists(this.PathFilesToAttach + idHistoria + "\\"))
						{
							StreamReader srImg = new StreamReader(this.PathFilesToAttach + idHistoria + "\\" + objAhFileImage.NombreArchivo);
							BinaryReader reader = new BinaryReader(srImg.BaseStream);
							Byte[] data = reader.ReadBytes((int)srImg.BaseStream.Length);

							string contentFile = Convert.ToBase64String(data);
							this.imgPac.ImageUrl = String.Format("data:image/png;base64,{0}", contentFile);
						}
					}

					/*
                    this.Page.Controls.Add(new LiteralControl("<span>Nombre paciente: " + objEntPac.Nombres + " " + objEntPac.Apellidos + "</span>"));
                    */
				}
				else
				{
					this.pnlInfoPac.Visible = false;
					RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "notFounded", "alert('La historia con tipo " + rcbxTipoVisa.SelectedItem.Text + " y número " + this.rtxtNumVisa.Text.Trim() + " no se ha encontrado o aun no ha finalizado \\n\\nPara regresarla de la embajada');", true);
				}
			}
			else
			{
				this.pnlInfoPac.Visible = false;
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "notSelected", "alert('No ha seleccionado los datos para busqueda del paciente');", true);
			}
		}

		protected void rbtnRetornar_Click(object sender, EventArgs e)
		{
			int idHistoria = Convert.ToInt32(this.hfIdHist.Value);
			string comment = this.rtxtComentarioRetorno.Text.Trim();

			HistoriaMedicaBll objBllHisMed = new HistoriaMedicaBll();
			HistoriaMedica objEntHisMed = objBllHisMed.Load(idHistoria);

			objEntHisMed.ComentarioMed += " Comentario Retorno -- " + comment;
			objEntHisMed.RetornadoEmbajada = true;
			objEntHisMed.IdUltimaModificacion = this.IdUserCurrent;

			if (!objBllHisMed.Save(objEntHisMed, null))
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "noReturn", "alert('Se ha presentado el siguiente inconveniente al tratar de reornar la historia:\\n\\n" + Utilidades.AjustarMensajeError(objBllHisMed.Error) + "');", true);
			}
			else
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "okReturn", "alert('La historia ha sido retornada a los pendientes correctamente');", true);
				this.rcbxEmbajada.SelectedValue = string.Empty;
				this.rcbxEmbajada_SelectedIndexChanged(rcbxEmbajada, null);
				this.rtxtNumVisa.Text = string.Empty;
			}
		}
	}
}