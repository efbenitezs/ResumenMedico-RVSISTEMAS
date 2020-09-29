using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using ResumenMedico.Controls;
using Telerik.Web.UI;
using RMBLL;
using RMEntity;

namespace ResumenMedico.Consultorio
{
    public partial class Firmar : BasePage
    {

        #region Propiedades

        #region PathTemplateFilesDecl
        protected string PathTemplateFilesDecl
        {
            get
            {
                return Server.MapPath("../Resources/Files/");
            }
        }
        #endregion PathTemplateFilesDecl

        #region PathFolderLogos
        protected string PathFolderLogos
        {
            get
            {
                return Server.MapPath("../Resources/Logos/");
            }
        }
        #endregion PathFolderLogos

        #region IdHist
        protected int IdHist
        {
            get
            {
                return ViewState["IdHist"] != null ? Convert.ToInt32(ViewState["IdHist"]) : int.MinValue;
            }
            set
            {
                if(ViewState["IdHist"] != null)
                {
                    ViewState["IdHist"] = value;
                }
                else
                {
                    ViewState.Add("IdHist", value);
                }
            }
        }
        #endregion IdHist

        #region imgSignContent
        protected string imgSignContent
        {
            get
            {
                return ViewState["signCaptured"] != null ? ViewState["signCaptured"].ToString() : string.Empty;
            }
            set
            {
                if (ViewState["signCaptured"] != null)
                {
                    ViewState["signCaptured"] = value;
                }
                else
                {
                    ViewState.Add("signCaptured", value);
                }
            }
        }
        #endregion imgSignContent

        #region imgSignWitContent
        protected string imgSignWitContent
        {
            get
            {
                return ViewState["signWitCaptured"] != null ? ViewState["signWitCaptured"].ToString() : string.Empty;
            }
            set
            {
                if (ViewState["signWitCaptured"] != null)
                {
                    ViewState["signWitCaptured"] = value;
                }
                else
                {
                    ViewState.Add("signWitCaptured", value);
                }
            }
        }
        #endregion imgSignWitContent

        #region IsUnderAgePatient
        /// <summary>
        /// 
        /// </summary>
        protected bool IsUnderAgePatient
        {
            get
            {
                return ViewState["IsUndAg"] != null ? Convert.ToBoolean(ViewState["IsUndAg"]) : false;
            }
            set
            {
                if (ViewState["IsUndAg"] != null)
                {
                    ViewState["IsUndAg"] = value;
                }
                else
                {
                    ViewState.Add("IsUndAg", value);
                }
            }
        }
        #endregion IsUnderAgePatient

        #endregion Propiedades

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IdUserCurrent != int.MinValue)
            {
                int idHM = Convert.ToInt32(this.GetValueFromRequest("IdHist", "0"));
                this.IdHist = idHM;
                if (idHM <= 0)
                {
                    //se cierra la pagina
                    RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "noHisFound", "window.close();", true);
                }
                else
                {
                    PacienteBll objBllPac = new PacienteBll();
                    HistoriaMedicaBll objBllHm = new HistoriaMedicaBll();
                    HistoriaMedica objEntHm = objBllHm.Load(idHM);
                    Paciente objEntPac = objBllPac.Load(objEntHm.IdPaciente);
                    TipoVisaBll objBllTv = new TipoVisaBll();
                    TipoVisa objEntTv = objBllTv.Load(objEntHm.IdTipoVisa);

                    this.hfIdHist.Value = idHM.ToString();

                    switch (objEntTv.IdEmbajada)
                    {
                        case Constants.Embajadas.Canada:
                            this.rbtnDeclNZ.Visible = false;
                            this.rbtnDeclAus.Visible = false;
                            this.SignBtnWit.Visible = false;
                            break;
                        case Constants.Embajadas.NuevaZelanda:
                            this.rbtnDeclCan.Visible = false;
                            this.rbtnDeclAus.Visible = false;
                            this.SignBtnWit.Visible = false;
                            break;
                        case Constants.Embajadas.Australia:
                            this.rbtnDeclNZ.Visible = false;
                            this.rbtnDeclCan.Visible = false;
                            this.SignBtnWit.Visible = false;
                            break;
                        case Constants.Embajadas.Colombia:
                            this.rbtnDeclCan.Visible = false;
                            this.rbtnDeclNZ.Visible = false;
                            this.SignBtnWit.Visible = false;
                            break;

                    }

                    //si el paciente es menor a 15 años
                    if (objEntPac.FechaNacimiento >= DateTime.Now.AddYears(-15))
                    {
                        this.IsUnderAgePatient = true;
                        // se oculta la generacion de consentimiento para toma de muestra de vih
                        this.rbtnDecVih.Visible = false;
                        if (objEntTv.IdEmbajada == Constants.Embajadas.Canada)
                        {
                            //si es canada debe solicitar firma de testigo
                            this.SignBtnWit.Visible = true;
                        }
                    }

                    // TODO: eliminar esto antes de publicar
                    //this.LoadDefaultSignature();
                }
            }
            else
            {
                //se cierra la pagina y se recarga la padre
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "noUserReg", "window.opener.location.reload(); window.close();", true);
            }
            Session["ShowConsultorio"] = true;
            Session["ShowMenu"] = false;


        }

        private void LoadDefaultSignature()
        {
            string img = "data:image/png;base64,{0}";



            byte[] buffSign = System.IO.File.ReadAllBytes(Server.MapPath("../Resources/") + "imgFirmaBase.png");
            byte[] buffwitSign = System.IO.File.ReadAllBytes(Server.MapPath("../Resources/") + "imgFirmaWitBase.png");


            string returnValue = Convert.ToBase64String(buffSign);
            this.imgResultado.Src = String.Format(img, returnValue);
            this.imgSignContent = returnValue;

            string returnValueWit = Convert.ToBase64String(buffwitSign);
            this.imgResultado.Src = String.Format(img, returnValue);
            this.imgSignWitContent = returnValue;
        }

        protected void rbtnLoad_Click(object sender, EventArgs e)
        {
            if (this.sigImageDataPac.Value.Trim() != string.Empty)
            {
                int type = Convert.ToInt32(this.hfTipoCarga.Value.Trim() != string.Empty ? this.hfTipoCarga.Value.Trim() : "1");
                string img = "data:image/png;base64,{0}"; //change image type if need be
                string returnValue = type == 1 ? this.sigImageDataPac.Value : this.sigImageDataWit.Value;//System.Convert.ToBase64String(toEncodeAsBytes);
                this.imgResultado.Src = String.Format(img, returnValue);
               
			    if (type == 1)
                {
                    this.imgSignContent = returnValue;
                }
                else
                {
                    this.imgSignWitContent = returnValue;
                }
               
            }
        }

        protected void rbtnDeclCan_Click(object sender, EventArgs e)
        {
            this.GenerateDeclaration(Constants.TipoDeclaracion.Canada);
        }

        protected void rbtnDeclNZ_Click(object sender, EventArgs e)
        {
            this.GenerateDeclaration(Constants.TipoDeclaracion.NuevaZelanda);
        }

        protected void rbtnDeclAus_Click(object sender, EventArgs e)
        {
            this.GenerateDeclaration(Constants.TipoDeclaracion.Australia);
        }

        protected void rbtnDecVih_Click(object sender, EventArgs e)
        {
            this.GenerateDeclaration(Constants.TipoDeclaracion.Vih);
        }

        protected void rbtnDecVenPun_Click(object sender, EventArgs e)
        {
            this.GenerateDeclaration(Constants.TipoDeclaracion.VenoPuncion);
        }

        private void GenerateDeclaration(Constants.TipoDeclaracion tipoDeclaracion)
        {
            AnexoHistoriaBll objBll = new AnexoHistoriaBll();


            string fileNameTemplate = string.Empty;
            switch (tipoDeclaracion)
            {
                case Constants.TipoDeclaracion.Canada:
                    fileNameTemplate = "DeclaracionCanada.txt";
                    break;
                case Constants.TipoDeclaracion.NuevaZelanda:
                    fileNameTemplate = "DeclaracionNZ.txt";
                    break;
                case Constants.TipoDeclaracion.Vih:
                    fileNameTemplate = "DeclaracionVIH.txt";
                    break;
                case Constants.TipoDeclaracion.VenoPuncion:
                    fileNameTemplate = "DeclaracionVenoPuncion.txt";
                    break;
                case Constants.TipoDeclaracion.Australia:
                    fileNameTemplate = "DeclaracionAustralia.txt";
                    break;
            }


            byte[] arrSignaturePatient = Convert.FromBase64String(this.hfBase64Pac.Text);

            byte[] arrSignatureWitness = Convert.FromBase64String(this.hfBase64Wit.Text.Replace("Base64 String: ", ""));

            if (tipoDeclaracion == Constants.TipoDeclaracion.Canada && this.IsUnderAgePatient && arrSignatureWitness.Length <= 0)
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "errValDecl", "alert('No se ha detectado la firma del testigo, por favor valide e intente nuevamente');", true);
                return;
            }

            if (objBll.GenerarDeclaracion2(this.PathFilesToAttach, this.PathTemplateFilesDecl, fileNameTemplate, arrSignaturePatient, arrSignatureWitness, this.IdHist, tipoDeclaracion, this.IdUserCurrent, this.PathFolderLogos))
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "okCreateDecl", "alert('La declaración se ha generado correctamente');", true);//actualizarPadre();
            }
            else
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "errCreateDecl", "alert('Se ha presentado el siguiente inconveniente al tratar de generar la declaración\\n\\n"
                    + Utilidades.AjustarMensajeError(objBll.Error) + "');", true);
            }
        }

        
    }
}