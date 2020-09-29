using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResumenMedico.Controls;
using Telerik.Web.UI;
using RMBLL;
using RMEntity;
using System.IO;
using System.Data;
using System.Collections;
namespace ResumenMedico
{



    public partial class Pendientes : BasePage
    {


        private Constants.TipoRevision TipoRev
        {
            get
            {
                return ViewState["TipVal"] != null ? (Constants.TipoRevision)Convert.ToInt32(ViewState["TipVal"]) : Constants.TipoRevision.MedicinaGeneral;
            }
            set
            {
                if (ViewState["TipVal"] != null)
                {
                    ViewState["TipVal"] = Convert.ToInt32(value);
                }
                else
                {
                    ViewState.Add("TipVal", Convert.ToInt32(value));
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //IsFilterLoad = false;
                this.TipoRev = (Constants.TipoRevision)Convert.ToInt32(this.GetValueFromRequest("T", "3"));

                this.LoadRepeater();

                this.LoadRepeaterAlerta();

                if (this.TipoRev == Constants.TipoRevision.MedicinaGeneral)
                {
                    this.LoadRepeaterRetornos();
                }
                else
                {
                    RadTab tabToHide = this.rtsPest.Tabs.FindTabByValue("3", true);
                    tabToHide.Visible = false;
                    this.rpvRetornos.Visible = false;
                }
            }
        }

        private void LoadRepeater()
        {
            PacienteBll objPaciente = new PacienteBll();



            this.rptPacientes.DataSource = objPaciente.GetListaPacientesPendientes(this.TipoRev, true, false);
            this.rptPacientes.DataBind();
        }

        private void LoadRepeaterAlerta()
        {
            PacienteBll objPaciente = new PacienteBll();

            this.rptAlertas.DataSource = objPaciente.GetListaPacientesPendientes(this.TipoRev, false, false);
            this.rptAlertas.DataBind();
        }

        private void LoadRepeaterRetornos()
        {
            PacienteBll objPaciente = new PacienteBll();

            this.rptRetornos.DataSource = objPaciente.GetListaPacientesPendientes(this.TipoRev, false, true);
            this.rptRetornos.DataBind();
        }

        protected void rbtnFiltrar_Click(object sender, EventArgs e)
        {
            this.LoadRepeater();
        }

        protected void rbtnFiltrarAlerta_Click(object sender, EventArgs e)
        {
            this.LoadRepeaterAlerta();
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

        protected void rptAlertas_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RepeaterItem cell = (RepeaterItem)e.Item;
                DataRowView dataItm = (DataRowView)e.Item.DataItem;

                int idHist = Convert.ToInt32(dataItm["ID"]);
                Image imgPac = (Image)cell.FindControl("imgPac");
                if (Directory.Exists(this.PathFilesToAttach + idHist + "\\"))
                {
                    StreamReader srImg = new StreamReader(this.PathFilesToAttach + idHist + "\\" + dataItm["IMG_PAC"].ToString());
                    BinaryReader reader = new BinaryReader(srImg.BaseStream);
                    Byte[] data = reader.ReadBytes((int)srImg.BaseStream.Length);

                    string contentFile = Convert.ToBase64String(data);
                    imgPac.ImageUrl = String.Format("data:image/png;base64,{0}", contentFile);
                }
            }
        }

        protected void rptRetornos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RepeaterItem cell = (RepeaterItem)e.Item;
                DataRowView dataItm = (DataRowView)e.Item.DataItem;

                int idHist = Convert.ToInt32(dataItm["ID"]);
                Image imgPac = (Image)cell.FindControl("imgPac");
                if (Directory.Exists(this.PathFilesToAttach + idHist + "\\"))
                {
                    StreamReader srImg = new StreamReader(this.PathFilesToAttach + idHist + "\\" + dataItm["IMG_PAC"].ToString());
                    BinaryReader reader = new BinaryReader(srImg.BaseStream);
                    Byte[] data = reader.ReadBytes((int)srImg.BaseStream.Length);

                    string contentFile = Convert.ToBase64String(data);
                    imgPac.ImageUrl = String.Format("data:image/png;base64,{0}", contentFile);
                }
            }
        }

        protected void rbtnFiltrarLista_Click(object sender, EventArgs e)
        {
            //IsFilterLoad = true;
            this.LoadRepeater();
            this.LoadRepeaterAlerta();
        }

    }
}