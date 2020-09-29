using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResumenMedico.Controls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico.Reportes
{
    public partial class ListaPacientesPendRad : BasePage
    {

        private DateTime FechaIngIni
        {
            get
            {
                return this.rdpFechaIngIni.SelectedDate != null ? Convert.ToDateTime(this.rdpFechaIngIni.SelectedDate) : DateTime.MinValue;
            }
        }

        private DateTime FechaIngFin
        {
            get
            {
                return this.rdpFechaIngFin.SelectedDate != null ? Convert.ToDateTime(this.rdpFechaIngFin.SelectedDate) : DateTime.MinValue;
            }
        }

        private DateTime FechaNacIni
        {
            get
            {
                return this.rdpFechaNacIni.SelectedDate != null ? Convert.ToDateTime(this.rdpFechaNacIni.SelectedDate) : DateTime.MinValue;
            }
        }

        private DateTime FechaNacFin
        {
            get
            {
                return this.rdpFechaNacFin.SelectedDate != null ? Convert.ToDateTime(this.rdpFechaNacFin.SelectedDate) : DateTime.MinValue;
            }
        }

        private int IdEmbajada
        {
            get
            {
                return this.rcbxEmbajada.SelectedValue != string.Empty ? Convert.ToInt32(this.rcbxEmbajada.SelectedValue) : int.MinValue;
            }
        }

        private int IdTipoDoc
        {
            get
            {
                return this.rcbxTipoDoc.SelectedValue != string.Empty ? Convert.ToInt32(this.rcbxTipoDoc.SelectedValue) : int.MinValue;
            }
        }

        private bool IsSelectedGender
        {
            get
            {
                return this.rblGenero.SelectedItem != null;
            }
        }

        private bool Genero
        {
            get
            {
                return this.rblGenero.SelectedItem != null ? Convert.ToBoolean(Convert.ToByte(this.rblGenero.SelectedValue)) : false;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IdUserCurrent != int.MinValue)
            {
                if (!(this.IsAdmin || this.PerfilActual == Constants.Perfiles.Radiologia))
                {
                    Response.Redirect(ResolveUrl("~/Default.aspx"), true);
                }

                if (!IsPostBack)
                {
                    this.LoadLists();
                    DateTime fechaIn = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                    DateTime fechaFin = fechaIn.AddDays(1);
                    this.rdpFechaIngIni.SelectedDate = fechaIn;
                    this.rdpFechaIngFin.SelectedDate = fechaFin;
                }
            }
            else
            {
                Response.Redirect(ResolveUrl("~/Login.aspx"), true);
            }
            LinkButton lnkSalir = (LinkButton)this.Master.Master.FindControl("lnkCerrarSesion");
            lnkSalir.Click += new EventHandler(lnkSalir_Click);
            this.EmbajadaCurr = RMEntity.Constants.Embajadas.Colombia;

        }

        private void LoadLists()
        {
            EmbajadaBll objEmbBll = new EmbajadaBll();
            TipoDocumentoBll objTDBll = new TipoDocumentoBll();

            Utilidades.LlenarRC(this.rcbxEmbajada, objEmbBll.GetList(string.Empty, true, false), "ID", "NOMBRE", true);
            Utilidades.LlenarRC(this.rcbxTipoDoc, objTDBll.GetList(string.Empty, true, false), "ID", "NOMBRE", true);
        }

        private void lnkSalir_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Login.aspx"), true);
        }

        protected void rgData_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            PacienteBll objPaciente = new PacienteBll();
        }

        protected void rbtnFiltrar_Click(object sender, EventArgs e)
        {
            this.rgData.Rebind();
        }
    }
}