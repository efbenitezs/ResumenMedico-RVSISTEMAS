using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RMBLL;
using RMEntity;
using ResumenMedico.Controls;
using Telerik.Web.UI;
using System.Data;
using System.IO;

namespace ResumenMedico.Consultorio
{
	public partial class Cierre : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (this.IdUserCurrent != int.MinValue)
			{
				if (this.FinalizaHistora || (this.IsAdmin || this.PerfilActual == RMEntity.Constants.Perfiles.MedicoGeneral))
				{
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

			LinkButton lbRegList = (LinkButton)Master.FindControl("lbRegList");
			
			lbRegList.Visible = false;

			this.ReloadRepeater();
			Session["ShowMenu"] = false;
			Session["ShowConsultorio"] = true;

		}

		private void ReloadRepeater()
		{
			this.rptPacientes.DataSource = (new HistoriaMedicaBll()).GetHistoriasPendientesFinalizacion(this.IdUserCurrent);
			this.rptPacientes.DataBind();

		}

		private void lnkSalir_Click(object sender, EventArgs e)
		{
			Response.Redirect(ResolveUrl("~/Login.aspx"), true);
		}

		protected void rptPacientes_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				RepeaterItem cell = (RepeaterItem)e.Item;
				DataRowView dataItm = (DataRowView)e.Item.DataItem;

				int idHist = Convert.ToInt32(dataItm["ID"]);
				Image imgPac = (Image)cell.FindControl("imgPac");
                if (Directory.Exists(this.PathFilesToAttach + idHist + "\\"))
                {
                    System.Drawing.Image image = System.Drawing.Image.FromFile(this.PathFilesToAttach + idHist + "\\" + dataItm["IMG_PAC"].ToString());
                    System.Drawing.Image img = this.ScaleImage(image, 200, 230);
                    MemoryStream ms = new MemoryStream();
                    img.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                    //se vuelve al inicio la trama
                    ms.Position = 0;
                    BinaryReader reader = new BinaryReader(ms);
                    Byte[] data = reader.ReadBytes((int)ms.Length);

                    string contentFile = Convert.ToBase64String(data);
                    imgPac.ImageUrl = String.Format("data:image/png;base64,{0}", contentFile);
                    imgPac.BackColor = System.Drawing.Color.Transparent;
                }
			}
		}

		protected void BtnSaveClick(object sender, EventArgs e) 
		{
            RadButton btn = (RadButton)sender;
			RepeaterItem item = (RepeaterItem)btn.NamingContainer;

			HiddenField hfId = (HiddenField)item.FindControl("hfThisHistory");
			HistoriaMedicaBll objbll = new HistoriaMedicaBll();
			HistoriaMedica objEnt = objbll.Load(Convert.ToInt32(hfId.Value));
			objEnt.Finalizada = true;
			objEnt.IdUltimaModificacion = this.IdUserCurrent;
			objEnt.FechaUltimaModificacion = DateTime.Now;
			if (!objbll.Save(objEnt, null))
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Errclosisng", "alert('Se ha presentado el siguiente error al cerrar la historia:\\n\\n" + Utilidades.AjustarMensajeError(objbll.Error) + "');", true);
			}
			else
			{
				Response.Redirect(ResolveUrl("~/Cierre.aspx"), true);
			}
			ReloadRepeater();
		}
	}
}