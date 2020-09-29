using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;
using System.IO;

namespace ResumenMedico.Controls
{
    public partial class CargaArchivo : BasePage
    {
        private int idHist = int.MinValue;
        private Constants.TipoRevision tipoRevision = Constants.TipoRevision.MedicinaGeneral;
        private int idMuestraRelacionada = int.MinValue;

        public int IdMuestraRelacionada
        {
            get
            {
                this.idMuestraRelacionada = ViewState["idMR"] != null ? Convert.ToInt32(ViewState["idMR"]) : int.MinValue;
                return this.idMuestraRelacionada;
            }
            set
            {
                if (ViewState["idMR"] != null)
                {
                    ViewState["idMR"] = value;
                }
                else
                {
                    ViewState.Add("idMR", value);
                }
                this.idMuestraRelacionada = value;
            }
        }

        public Constants.TipoRevision TipoRevision
        {
            get
            {
                this.tipoRevision = ViewState["idTR"] != null ? (Constants.TipoRevision)Convert.ToInt32(ViewState["idTR"]) : Constants.TipoRevision.MedicinaGeneral;
                return this.tipoRevision;
            }
            set
            {
                if (ViewState["idTR"] != null)
                {
                    ViewState["idTR"] = Convert.ToInt32(value);
                }
                else
                {
                    ViewState.Add("idTR", Convert.ToInt32(value));
                }
                this.tipoRevision = value;
            }
        }

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
                this.IdHist = Convert.ToInt32(this.GetValueFromRequest("IdHist", "0"));
                this.TipoRevision = (Constants.TipoRevision)Convert.ToInt32(this.GetValueFromRequest("IdTR", "3"));
                this.IdMuestraRelacionada = Convert.ToInt32(this.GetValueFromRequest("IdMu", int.MinValue.ToString()));
            }
            else
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "cloSess", "CerrarVentana();", true);
            }
        }

        protected void rbtnCargarArchivo_Click(object sender, EventArgs e)
        {
            if (this.rauFile.UploadedFiles.Count > 0)
            {
                AnexoHistoriaBll objBll = new AnexoHistoriaBll();
                AnexoHistoria objEntity = new AnexoHistoria();
                objEntity.IdHistoria = this.IdHist;
                objEntity.IdMuestra = this.IdMuestraRelacionada;
                objEntity.IdTipoRevision = this.TipoRevision;
                objEntity.IdCreacion = this.IdUserCurrent;
                objEntity.NombreAdjunto = this.rtxtNameFile.Text.Trim();

                int idTipoEx = 0;

                if (this.IdMuestraRelacionada != int.MinValue)
                {
                    MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                    MuestraLaboratorio objEntMl = objBllMl.Load(this.idMuestraRelacionada);
                    idTipoEx = Convert.ToInt32(objEntMl.IdTipoExamen);
                }

                Stream dataFoto = null;
                dataFoto = this.rauFile.UploadedFiles[0].InputStream;

                if (!objBll.GuardarNuevoArchivo(objEntity, dataFoto, this.PathFilesToAttach, this.rauFile.UploadedFiles[0].GetExtension()))
                {
                    RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "errSav", "alert('Se presento el siguiente error al cargar el archivo');", true);
                }
                else
                {
                    RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "okSav", "CargarPadre(" + Convert.ToInt32(this.tipoRevision) + ", " + idTipoEx + ");", true);
                }
            }
        }
    }
}