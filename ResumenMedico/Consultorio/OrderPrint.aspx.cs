using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResumenMedico.Controls;
using RMBLL;
using RMEntity;

namespace ResumenMedico.Consultorio
{
    public partial class OrderPrint : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IdUserCurrent != int.MinValue)
            {
                if (!IsPostBack)
                {
                    int idOrden = int.MinValue;
                    idOrden = Convert.ToInt32(this.GetValueFromRequest("idOrd", "0"));
                    if (idOrden <= 0)
                    {
                        Telerik.Web.UI.RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "noOrd", "alert('No se encontro la orden por favor verifiquelo e intente nuevamente');", true);
                        return;
                    }
                    this.LoadInfoOrden(idOrden);
                }
            }
            else
            {
                Telerik.Web.UI.RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "sesend", "window.close();", true);
            }
            Session["ShowConsultorio"] = true;
            Session["ShowMenu"] = false;


        }

        private void LoadInfoOrden(int idOrden)
        {
            OrdenesHistoriaBll objBllOrdHis = new OrdenesHistoriaBll();
            OrdenesHistoria objEntOrden = objBllOrdHis.Load(idOrden);

            HistoriaMedicaBll objBllHisMed = new HistoriaMedicaBll();
            HistoriaMedica objEntHisMed = objBllHisMed.Load(objEntOrden.IdHistoria);

            PacienteBll objBllPac = new PacienteBll();
            Paciente objEntPac = objBllPac.Load(objEntHisMed.IdPaciente);

            TipoVisaBll objBllTipvis = new TipoVisaBll();
            TipoVisa objEnttipVis = objBllTipvis.Load(objEntHisMed.IdTipoVisa);

            string emba = string.Empty;
            switch (objEnttipVis.IdEmbajada)
            {
                case Constants.Embajadas.Canada:
                    emba = "Canada";
                    break;
                case Constants.Embajadas.Australia:
                    emba = "Australia";
                    break;
                case Constants.Embajadas.NuevaZelanda:
                    emba = "Nueva Zelanda";
                    break;
            }

            this.lblEmbajada.Text = emba;
            this.lblNomPac.Text = objEntPac.Nombres + " " + objEntPac.Apellidos;
            this.lblinfoOrden.Text = objEntOrden.Descripcion;
            this.lblMedtrantante.Text = objEntOrden.MedicoTratante;
        }
    }
}