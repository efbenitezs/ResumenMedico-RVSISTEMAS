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
using System.IO;
using System.Data;
using System.Configuration;
using System.Net.Configuration;
using System.Web.Configuration;
using System.Net.Mail;


namespace ResumenMedico.Consultorio
{
    public partial class Laboratorio : BasePage
    {
        private int idHist = int.MinValue;

        #region PathTemplateFiles
        protected string PathTemplateFiles
        {
            get
            {
                return Server.MapPath("../Resources/Files/");
            }
        }
        #endregion PathTemplateFiles

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

        #region Eventos

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IdUserCurrent != int.MinValue)
            {
                if (!(this.IsAdmin || this.PerfilActual == Constants.Perfiles.Laboratorio))
                {
                    Response.Redirect(ResolveUrl("~/Inicio.aspx"), true);
                }
                else
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

                        //TODO: Cargar los datos del bacteriologo y el consultorio
                        this.LoadInfoLab();

                    }
                    LinkButton lbRegList = (LinkButton)Master.FindControl("lbRegList");
                    lbRegList.PostBackUrl = ResolveUrl("~/Pendientes.aspx")+"?T=1";
                }
            }
            else
            {
                Response.Redirect(ResolveUrl("~/Login.aspx"), true);
            }
            Session["ShowMenu"] = false;

            Session["ShowConsultorio"] = true;

        }
        #endregion Page_Load

        #region lnkSalir_Click
        private void lnkSalir_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Login.aspx"), true);
        }
        #endregion lnkSalir_Click

        #region Botones

        #region rbtnGuardarInfo_Click
        protected void rbtnGuardarInfo_Click(object sender, EventArgs e)
        {

            MuestraLaboratorioBll objMlBll = new MuestraLaboratorioBll();
            HistoriaMedicaBll objHmBll = new HistoriaMedicaBll();
            HistoriaMedica objHmEnt = objHmBll.Load(this.IdHist);

            UpdateBacteriologo(ref objHmEnt);

            objHmEnt.ComentarioLab = this.rtxtComentarioLab.Text.Trim();
            objHmEnt.IdUltimaModificacion = this.IdUserCurrent;
            objHmEnt.FechaUltimaModificacion = DateTime.Now;

            if (!objMlBll.UpdateComments(objHmEnt))
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "savedFailHead", "alert('Se ha presentado el siguiente inconveniente al almacenar la informacion:\\n\\n" + Utilidades.AjustarMensajeError(objHmBll.Error) + "');", true);
            }
            else
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "savedOKHead", "alert('Se ha almacenado la información');", true);
            }
        }

        private void UpdateBacteriologo(ref HistoriaMedica objHmEnt)
        {
            if (objHmEnt.Bacteriologo is null)
            {
                objHmEnt.Bacteriologo = (new UsuarioBll()).Load(this.IdUserCurrent);
            }
        }
        #endregion rbtnGuardarInfo_Click

        #region rbtnUrologia_Click
        protected void rbtnUrologia_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraUrol.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraUrol.Value));
                if (objEntML.Estado == Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    objEntML.FechaTomaMuestra = DateTime.Now;
                }
            }
            else
            {
                objEntML.IdCreacion = this.IdUserCurrent;
                objEntML.FechaCreacion = DateTime.Now;
                objEntML.FechaTomaMuestra = DateTime.Now;
                objEntML.NumeroMuestra = 1;
            }

            Constants.ExamenLab tipoExamen = Constants.ExamenLab.Uroanalisis;

            objEntML.IdTipoExamen = tipoExamen;
            objEntML.IdHistoria = this.IdHist;
            objEntML.Observaciones = this.rtxtCommentUrol.Text.Trim();

            //Datos examen Fisico
            objEntML.Olor = this.rtxtOlor.Text.Trim();
            objEntML.Color = this.rtxtColor.Text.Trim();
            objEntML.Aspecto = this.rtxtAspecto.Text.Trim();

            //Datos Examen Microquimico
            objEntML.Glu = this.rtxtGLU.Text.Trim();
            objEntML.Bil = this.rtxtBIL.Text.Trim();
            objEntML.Cet = this.rtxtCET.Text.Trim();
            objEntML.Deh = this.rtxtDEN.Text.Trim();
            objEntML.Ph = this.rtxtPH.Text.Trim();
            objEntML.Pro = this.rtxtPRO.Text.Trim();
            objEntML.Uro = this.rtxtUro.Text.Trim();
            objEntML.Nit = this.rtxtNIT.Text.Trim();
            objEntML.San = this.rtxtSAN.Text.Trim();
            objEntML.Leu = this.rtxtSAN.Text.Trim();

            //datos Examen Microscopico
            objEntML.LeucocitosCampo = this.rtxtLeucoCampo.Text.Trim();
            objEntML.HematiesCampo = this.rtxtHematiesCampo.Text.Trim();
            objEntML.CelulasAltasCampo = this.rtxtCelAltasCampo.Text.Trim();
            objEntML.CelulasBajasCampo = this.rtxtCelBajasCampo.Text.Trim();
            objEntML.Moco = this.rtxtMoco.Text.Trim();
            objEntML.Bacterias = this.rtxtBacterias.Text.Trim();
            objEntML.Cilindros = this.rtxtCilindros.Text.Trim();
            objEntML.Cristales = this.rtxtCristales.Text.Trim();
            objEntML.Levaduras = this.rtxtLevaduras.Text.Trim();
            objEntML.Otros = this.rtxtOtros.Text.Trim();

            objEntML.Estado = (Constants.EstadosMuestraLaboratorio)Convert.ToInt32(this.rblEstadoUro.SelectedValue);
            objEntML.Resultado = objEntML.Estado.ToString();

            this.SaveMuestraExamen(objEntML, tipoExamen);
        }
        #endregion rbtnUrologia_Click

        #region rbtnGuardarVIH_Click
        protected void rbtnGuardarVIH_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraVIH.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraVIH.Value));
                if (objEntML.Estado == Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    objEntML.FechaTomaMuestra = DateTime.Now;
                }
            }
            else
            {
                objEntML.IdCreacion = this.IdUserCurrent;
                objEntML.FechaCreacion = DateTime.Now;
                objEntML.FechaTomaMuestra = DateTime.Now;
                objEntML.NumeroMuestra = 1;
            }

            if (objEntML.Estado == Constants.EstadosMuestraLaboratorio.SinAplicar)
            {
                objEntML.FechaTomaMuestra = DateTime.Now;
            }

            Constants.ExamenLab tipoExamen = Constants.ExamenLab.Vih;

            objEntML.IdTipoExamen = tipoExamen;
            objEntML.IdHistoria = this.IdHist;
            objEntML.Observaciones = this.rtxtComentVIH.Text.Trim();

            objEntML.Resultado = this.rcbxVIHResult.SelectedValue;
            objEntML.Estado = (Constants.EstadosMuestraLaboratorio)Convert.ToInt32(this.rblEstadoVih.SelectedValue);

            this.SaveMuestraExamen(objEntML, tipoExamen);
        }
        #endregion rbtnGuardarVIH_Click

        #region rbtnGuardarSerologia_Click
        protected void rbtnGuardarSerologia_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraSero.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraSero.Value));
                if (objEntML.Estado == Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    objEntML.FechaTomaMuestra = DateTime.Now;
                }
            }
            else
            {
                objEntML.IdCreacion = this.IdUserCurrent;
                objEntML.FechaCreacion = DateTime.Now;
                objEntML.FechaTomaMuestra = DateTime.Now;
                objEntML.NumeroMuestra = 1;
            }

            Constants.ExamenLab tipoExamen = Constants.ExamenLab.SerologiaVdrl;

            objEntML.IdTipoExamen = tipoExamen;
            objEntML.IdHistoria = this.IdHist;
            objEntML.Observaciones = this.rtxtComentarioSerol.Text.Trim();

            objEntML.Resultado = this.rcbxSero.SelectedValue;
            objEntML.Valor = this.rntValorSero.Value != null ? Convert.ToDecimal(this.rntValorSero.Value) : decimal.MinValue;
            objEntML.Estado = (Constants.EstadosMuestraLaboratorio)Convert.ToInt32(this.rblEstadoSero.SelectedValue);

            this.SaveMuestraExamen(objEntML, tipoExamen);
        }
        #endregion rbtnGuardarSerologia_Click

        #region rbtnHepB_Click
        protected void rbtnHepB_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraHepB.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraHepB.Value));
                if (objEntML.Estado == Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    objEntML.FechaTomaMuestra = DateTime.Now;
                }
            }
            else
            {
                objEntML.IdCreacion = this.IdUserCurrent;
                objEntML.FechaCreacion = DateTime.Now;
                objEntML.FechaTomaMuestra = DateTime.Now;
                objEntML.NumeroMuestra = 1;
            }

            Constants.ExamenLab tipoExamen = Constants.ExamenLab.HbsAg;

            objEntML.IdTipoExamen = tipoExamen;
            objEntML.IdHistoria = this.IdHist;
            objEntML.Observaciones = this.rtxtCommentHepB.Text.Trim();

            objEntML.Resultado = this.rcbxHepB.SelectedValue;

            objEntML.Estado = (Constants.EstadosMuestraLaboratorio)Convert.ToInt32(this.rblEstadoHepaB.SelectedValue);

            this.SaveMuestraExamen(objEntML, tipoExamen);
        }
        #endregion rbtnHepB_Click

        #region rbtnHepC_Click
        protected void rbtnHepC_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraHepC.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraHepC.Value));
                if (objEntML.Estado == Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    objEntML.FechaTomaMuestra = DateTime.Now;
                }
            }
            else
            {
                objEntML.IdCreacion = this.IdUserCurrent;
                objEntML.FechaCreacion = DateTime.Now;
                objEntML.FechaTomaMuestra = DateTime.Now;
                objEntML.NumeroMuestra = 1;
            }

            Constants.ExamenLab tipoExamen = Constants.ExamenLab.HepatitisC;

            objEntML.IdTipoExamen = tipoExamen;
            objEntML.IdHistoria = this.IdHist;
            objEntML.Observaciones = this.rtxtCommentHepC.Text.Trim();

            objEntML.Resultado = this.rcbxHepC.SelectedValue;
            objEntML.Estado = (Constants.EstadosMuestraLaboratorio)Convert.ToInt32(this.rblEstadoHepaC.SelectedValue);

            this.SaveMuestraExamen(objEntML, tipoExamen);
        }
        #endregion rbtnHepC_Click

        #region rbtnCuadroHematico_Click
        protected void rbtnCuadroHematico_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraCH.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraCH.Value));
                if (objEntML.Estado == Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    objEntML.FechaTomaMuestra = DateTime.Now;
                }
            }
            else
            {
                objEntML.IdCreacion = this.IdUserCurrent;
                objEntML.FechaCreacion = DateTime.Now;
                objEntML.FechaTomaMuestra = DateTime.Now;
                objEntML.NumeroMuestra = 1;
            }

            Constants.ExamenLab tipoExamen = Constants.ExamenLab.CuadroHematico;

            objEntML.IdTipoExamen = tipoExamen;
            objEntML.IdHistoria = this.IdHist;
            objEntML.Observaciones = this.rtxtComentarioCH.Text.Trim();

            objEntML.Resultado = this.rcbxCuadroHematico.SelectedValue;

            objEntML.Estado = (Constants.EstadosMuestraLaboratorio)Convert.ToInt32(this.rblEstadoCH.SelectedValue);

            this.SaveMuestraExamen(objEntML, tipoExamen);
        }
        #endregion rbtnCuadroHematico_Click

        #region rbtnOtroGuardar_Click
        protected void rbtnOtroGuardar_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraOtro.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraOtro.Value));
                if (objEntML.Estado == Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    objEntML.FechaTomaMuestra = DateTime.Now;
                }
            }
            else
            {
                objEntML.IdCreacion = this.IdUserCurrent;
                objEntML.FechaCreacion = DateTime.Now;
                objEntML.FechaTomaMuestra = DateTime.Now;
                objEntML.NumeroMuestra = 1;
            }

            Constants.ExamenLab tipoExamen = Constants.ExamenLab.Otro;

            objEntML.IdTipoExamen = tipoExamen;
            objEntML.IdHistoria = this.IdHist;
            objEntML.Descripcion = this.rtxtOtroDesc.Text.Trim();
            objEntML.Observaciones = this.rtxtOtroComentario.Text.Trim();

            objEntML.Resultado = this.rtxtOtroResultado.Text.Trim();

            objEntML.Estado = (Constants.EstadosMuestraLaboratorio)Convert.ToInt32(this.rblEstadoOtro.SelectedValue);

            this.SaveMuestraExamen(objEntML, tipoExamen);
        }
        #endregion rbtnOtroGuardar_Click

        #region rbtnCreatinina_Click
        protected void rbtnCreatinina_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraCreatinina.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraCreatinina.Value));
                if (objEntML.Estado == Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    objEntML.FechaTomaMuestra = DateTime.Now;
                }
            }
            else
            {
                objEntML.IdCreacion = this.IdUserCurrent;
                objEntML.FechaCreacion = DateTime.Now;
                objEntML.FechaTomaMuestra = DateTime.Now;
                objEntML.NumeroMuestra = 1;
            }

            Constants.ExamenLab tipoExamen = Constants.ExamenLab.Creatinina;

            objEntML.IdTipoExamen = tipoExamen;
            objEntML.IdHistoria = this.IdHist;

            if (this.rcbxCreatinina.SelectedValue == "ANORMAL")
            {
                if (this.rntValorCrea.Value != null)
                {
                    objEntML.Valor = Convert.ToDecimal(this.rntValorCrea.Value);
                }
                else
                {
                    RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "errValCreaMiss", "alert('Debe indicar el valor para la muestra');", true);
                    return;
                }
            }

            objEntML.Observaciones = this.rtxtComentarioCrea.Text.Trim();

            objEntML.Resultado = this.rcbxCreatinina.SelectedValue;

            objEntML.Estado = (Constants.EstadosMuestraLaboratorio)Convert.ToInt32(this.rblEstadoCreat.SelectedValue);

            this.SaveMuestraExamen(objEntML, tipoExamen);
        }
        #endregion rbtnCreatinina_Click

        #region rbtnHemGli_Click
        protected void rbtnHemGli_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraHemGli.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraHemGli.Value));
                if (objEntML.Estado == Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    objEntML.FechaTomaMuestra = DateTime.Now;
                }
            }
            else
            {
                objEntML.IdCreacion = this.IdUserCurrent;
                objEntML.FechaCreacion = DateTime.Now;
                objEntML.FechaTomaMuestra = DateTime.Now;
                objEntML.NumeroMuestra = 1;
            }

            Constants.ExamenLab tipoExamen = Constants.ExamenLab.HemoglobinaGlicosilada;

            objEntML.IdTipoExamen = tipoExamen;
            objEntML.IdHistoria = this.IdHist;

            if (this.rntValorHemGli.Value != null)
            {
                objEntML.Valor = Convert.ToDecimal(this.rntValorHemGli.Value);
                objEntML.Resultado = this.rntValorHemGli.Value.ToString();
            }
            else
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "errValCreaMiss", "alert('Debe indicar el valor para la muestra');", true);
                return;
            }

            objEntML.Observaciones = this.rtxtComentarioHemGli.Text.Trim();
            objEntML.Estado = (Constants.EstadosMuestraLaboratorio)Convert.ToInt32(this.rblEstadoHemGli.SelectedValue);

            this.SaveMuestraExamen(objEntML, tipoExamen);
        }
        #endregion rbtnHemGli_Click

        #region rbtnAddCultivo_Click
        protected void rbtnAddCultivo_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraCultivo.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraCultivo.Value));
            }
            else
            {
                objEntML.IdCreacion = this.IdUserCurrent;
                objEntML.FechaCreacion = DateTime.Now;
                objEntML.FechaTomaMuestra = DateTime.Now;
                objEntML.NumeroMuestra = 1;
            }

            Constants.ExamenLab tipoExam = Constants.ExamenLab.Cultivo;
            objEntML.IdTipoExamen = tipoExam;
            objEntML.IdHistoria = IdHist;

            objEntML.Estado = Constants.EstadosMuestraLaboratorio.Normal;
            this.SaveMuestraExamen(objEntML, tipoExam);
        }
        #endregion rbtnAddCultivo_Click

        #region rbtnAddBaciloscopia_Click
        protected void rbtnAddBaciloscopia_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraBaciloscopia.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraBaciloscopia.Value));
            }
            else
            {
                objEntML.IdCreacion = this.IdUserCurrent;
                objEntML.FechaCreacion = DateTime.Now;
                objEntML.FechaTomaMuestra = DateTime.Now;
                objEntML.NumeroMuestra = 1;
            }

            Constants.ExamenLab tipoExam = Constants.ExamenLab.Baciloscopia;
            objEntML.IdTipoExamen = tipoExam;
            objEntML.IdHistoria = IdHist;

            objEntML.Estado = Constants.EstadosMuestraLaboratorio.Normal;
            this.SaveMuestraExamen(objEntML, tipoExam);

        }
        #endregion rbtnAddBaciloscopia_Click

        #region Botones Eliminacion Muestras

        #region rbtnEliminarUro_Click
        protected void rbtnEliminarUro_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraUrol.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraUrol.Value));
            }

            objEntML.IdUltimaModificacion = this.IdUserCurrent;
            this.EliminarMuestra(objEntML);
        }
        #endregion rbtnEliminarUro_Click

        #region rbtnEliminarVih_Click
        protected void rbtnEliminarVih_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraVIH.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraVIH.Value));
            }

            objEntML.IdUltimaModificacion = this.IdUserCurrent;
            this.EliminarMuestra(objEntML);
        }
        #endregion rbtnEliminarVih_Click

        #region rbtnEliminarSerologia_Click
        protected void rbtnEliminarSerologia_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraSero.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraSero.Value));
            }

            objEntML.IdUltimaModificacion = this.IdUserCurrent;
            this.EliminarMuestra(objEntML);
        }
        #endregion rbtnEliminarVih_Click

        #region rbtnEliminarHepB_Click
        protected void rbtnEliminarHepB_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraHepB.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraHepB.Value));
            }

            objEntML.IdUltimaModificacion = this.IdUserCurrent;
            this.EliminarMuestra(objEntML);
        }
        #endregion rbtnEliminarHepB_Click

        #region rbtnEliminarHepC_Click
        protected void rbtnEliminarHepC_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraHepC.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraHepC.Value));
            }

            objEntML.IdUltimaModificacion = this.IdUserCurrent;
            this.EliminarMuestra(objEntML);
        }
        #endregion rbtnEliminarHepC_Click

        #region rbtnEliminarCuadroHematico_Click
        protected void rbtnEliminarCuadroHematico_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraCH.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraCH.Value));
            }

            objEntML.IdUltimaModificacion = this.IdUserCurrent;
            this.EliminarMuestra(objEntML);
        }
        #endregion rbtnEliminarCuadroHematico_Click

        #region rbtnEliminarCreatinina_Click
        protected void rbtnEliminarCreatinina_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraCreatinina.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraCreatinina.Value));
            }

            objEntML.IdUltimaModificacion = this.IdUserCurrent;
            this.EliminarMuestra(objEntML);
        }
        #endregion rbtnEliminarCreatinina_Click

        #region rbtnEliminarHemGli_Click
        protected void rbtnEliminarHemGli_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraHemGli.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraHemGli.Value));
            }

            objEntML.IdUltimaModificacion = this.IdUserCurrent;
            this.EliminarMuestra(objEntML);
        }
        #endregion rbtnEliminarHemGli_Click

        #region rbtnEliminarOtro_Click
        protected void rbtnEliminarOtro_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraOtro.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraOtro.Value));
            }

            objEntML.IdUltimaModificacion = this.IdUserCurrent;
            this.EliminarMuestra(objEntML);
        }
        #endregion rbtnEliminarOtro_Click

        #region rbtnEliminarCultivo_Click
        protected void rbtnEliminarCultivo_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraCultivo.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraCultivo.Value));
            }

            objEntML.IdUltimaModificacion = this.IdUserCurrent;
            this.EliminarMuestra(objEntML);
        }
        #endregion rbtnEliminarCultivo_Click

        #region rbtnEliminarBacilo_Click
        protected void rbtnEliminarBacilo_Click(object sender, EventArgs e)
        {
            MuestraLaboratorio objEntML = new MuestraLaboratorio();
            if (this.hfIdMuestraBaciloscopia.Value != string.Empty)
            {
                MuestraLaboratorioBll objBllMl = new MuestraLaboratorioBll();
                objEntML = objBllMl.Load(Convert.ToInt32(this.hfIdMuestraBaciloscopia.Value));
            }

            objEntML.IdUltimaModificacion = this.IdUserCurrent;
            this.EliminarMuestra(objEntML);
        }
        #endregion rbtnEliminarBacilo_Click

        #endregion Botones Eliminacion Muestras

        #endregion Botones

        #region RadComboBoxes

        #region rcbxSero_SelectedIndexChanged
        protected void rcbxSero_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            this.lblValSer.Visible = this.rntValorSero.Visible = this.lblUnitValSer.Visible = this.rcbxSero.SelectedValue == "REACTIVO";
        }
        #endregion rcbxSero_SelectedIndexChanged

        #region rcbxCreatinina_SelectedIndexChanged
        protected void rcbxCreatinina_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            /*
            if (this.rcbxCreatinina.SelectedValue == "ANORMAL")
            {   
                this.divLblValCrea.Style.Add(HtmlTextWriterStyle.Display, "inline");
                this.divValCrea.Style.Add(HtmlTextWriterStyle.Display, "inline");
            }
            else
            {
                this.divLblValCrea.Style.Add(HtmlTextWriterStyle.Display, "none");
                this.divValCrea.Style.Add(HtmlTextWriterStyle.Display, "none");
            }
            */
            //this.lblValCrea.Visible = this.rntValorCrea.Visible = this.lblUnitValCrea.Visible = this.rcbxCreatinina.SelectedValue == "ANORMAL";
        }
        #endregion rcbxCreatinina_SelectedIndexChanged

        #region rcbxHemGli_SelectedIndexChanged
        protected void rcbxHemGli_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            this.lblValHemGli.Visible = this.rntValorHemGli.Visible = this.lblUnitValHemGli.Visible = this.rcbxCreatinina.SelectedValue == "ANORMAL";
        }
        #endregion rcbxHemGli_SelectedIndexChanged

        #endregion RadComboBoxes

        #region Checks Habilitar examenes

        #region chkUro_CheckedChanged
        protected void chkUro_CheckedChanged(object sender, EventArgs e)
        {
            //Se obtiene el tab            
            RadTab tabUro = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Uroanalisis).ToString());
            this.rpvUrologia.Visible = tabUro.Visible = this.chkUro.Checked;
        }
        #endregion chkUro_CheckedChanged

        #region chkVih_CheckedChanged
        protected void chkVih_CheckedChanged(object sender, EventArgs e)
        {
            //Se Obtiene el tab
            RadTab tabVih = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Vih).ToString());
            this.rpvHIV.Visible = tabVih.Visible = this.chkVih.Checked;
        }
        #endregion chkVih_CheckedChanged

        #region chkSero_CheckedChanged
        protected void chkSero_CheckedChanged(object sender, EventArgs e)
        {
            //Se Obtiene el tab
            RadTab tabSero = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.SerologiaVdrl).ToString());
            this.rpvVDRL.Visible = tabSero.Visible = this.chkSero.Checked;
        }
        #endregion chkSero_CheckedChanged

        #region chkHepB_CheckedChanged
        protected void chkHepB_CheckedChanged(object sender, EventArgs e)
        {
            //Se Obtiene el tab
            RadTab tabHepB = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.HbsAg).ToString());
            this.rpvHepatitisB.Visible = tabHepB.Visible = this.chkHepB.Checked;
        }
        #endregion chkHepB_CheckedChanged

        #region chkHepC_CheckedChanged
        protected void chkHepC_CheckedChanged(object sender, EventArgs e)
        {
            //Se Obtiene el tab
            RadTab tabHepC = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.HepatitisC).ToString());
            this.rpvHepC.Visible = tabHepC.Visible = this.chkHepC.Checked;
        }
        #endregion chkHepC_CheckedChanged

        #region chkCH_CheckedChanged
        protected void chkCH_CheckedChanged(object sender, EventArgs e)
        {
            //Se Obtiene el tab
            RadTab tabCH = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.CuadroHematico).ToString());
            this.rpvCuadroHematico.Visible = tabCH.Visible = this.chkCH.Checked;
        }
        #endregion chkCH_CheckedChanged

        #region chkCrea_CheckedChanged
        protected void chkCrea_CheckedChanged(object sender, EventArgs e)
        {
            //Se Obtiene el tab
            RadTab tabCrea = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Creatinina).ToString());
            this.rpvCreatinina.Visible = tabCrea.Visible = this.chkCrea.Checked;
        }
        #endregion chkCrea_CheckedChanged

        #region chkHemGli_CheckedChanged
        protected void chkHemGli_CheckedChanged(object sender, EventArgs e)
        {
            //Se Obtiene el tab
            RadTab tabHemGli = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.HemoglobinaGlicosilada).ToString());
            this.rpvHemoGli.Visible = tabHemGli.Visible = this.chkHemGli.Checked;
        }
        #endregion chkHemGli_CheckedChanged

        #region chkOtro_CheckedChanged
        protected void chkOtro_CheckedChanged(object sender, EventArgs e)
        {
            //Se obtiene el tab
            RadTab tabOtro = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Otro).ToString());
            this.rpvOtro.Visible = tabOtro.Visible = this.chkOtro.Checked;
        }
        #endregion chkOtro_CheckedChanged

        #region chkCultivo_CheckedChanged
        protected void chkCultivo_CheckedChanged(object sender, EventArgs e)
        {
            //Se obtiene el tab
            RadTab tabCult = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Cultivo).ToString());
            this.rpvCultivo.Visible = tabCult.Visible = this.chkCultivo.Checked;
        }
        #endregion chkCultivo_CheckedChanged

        #region chkBaciloscopia_CheckedChanged
        protected void chkBaciloscopia_CheckedChanged(object sender, EventArgs e)
        {
            //Se obtiene el tab
            RadTab tabBacil = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Baciloscopia).ToString());
            this.rpvBaciloscopia.Visible = tabBacil.Visible = this.chkBaciloscopia.Checked;
        }
        #endregion chkBaciloscopia_CheckedChanged

        #endregion Checks Habilitar examenes

        #region Carga Grillas Archivos

        #region rgUrol_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgUrol_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            int idMuestra = this.hfIdMuestraUrol.Value != string.Empty ? Convert.ToInt32(this.hfIdMuestraUrol.Value) : 0;
            this.LoadDataSourceFileGrids(idMuestra, rgUrol);
        }
        #endregion rgUrol_NeedDataSource

        #region rgVih_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgVih_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            int idMuestra = this.hfIdMuestraVIH.Value != string.Empty ? Convert.ToInt32(this.hfIdMuestraVIH.Value) : 0;
            this.LoadDataSourceFileGrids(idMuestra, rgVih);
        }
        #endregion rgVih_NeedDataSource

        #region rgSero_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgSero_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            int idMuestra = this.hfIdMuestraSero.Value != string.Empty ? Convert.ToInt32(this.hfIdMuestraSero.Value) : 0;
            this.LoadDataSourceFileGrids(idMuestra, this.rgSero);
        }
        #endregion rgSero_NeedDataSource

        #region rgHepB_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgHepB_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            int idMuestra = this.hfIdMuestraHepB.Value != string.Empty ? Convert.ToInt32(this.hfIdMuestraHepB.Value) : 0;
            this.LoadDataSourceFileGrids(idMuestra, this.rgHepB);
        }
        #endregion rgHepB_NeedDataSource

        #region rgHepB_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgHepC_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            int idMuestra = this.hfIdMuestraHepC.Value != string.Empty ? Convert.ToInt32(this.hfIdMuestraHepC.Value) : 0;
            this.LoadDataSourceFileGrids(idMuestra, this.rgHepC);
        }
        #endregion rgHepB_NeedDataSource

        #region rgCH_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgCH_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            int idMuestra = this.hfIdMuestraCH.Value != string.Empty ? Convert.ToInt32(this.hfIdMuestraCH.Value) : 0;
            this.LoadDataSourceFileGrids(idMuestra, this.rgCH);
        }
        #endregion rgCH_NeedDataSource

        #region rgCrea_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgCrea_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            int idMuestra = this.hfIdMuestraCreatinina.Value != string.Empty ? Convert.ToInt32(this.hfIdMuestraCreatinina.Value) : 0;
            this.LoadDataSourceFileGrids(idMuestra, this.rgCrea);
        }
        #endregion rgCrea_NeedDataSource

        #region rgHemGli_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgHemGli_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            int idMuestra = this.hfIdMuestraHemGli.Value != string.Empty ? Convert.ToInt32(this.hfIdMuestraHemGli.Value) : 0;
            this.LoadDataSourceFileGrids(idMuestra, this.rgHemGli);
        }
        #endregion rgHemGli_NeedDataSource

        #region rgOtro_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgOtro_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            int idMuestra = this.hfIdMuestraHepB.Value != string.Empty ? Convert.ToInt32(this.hfIdMuestraOtro.Value) : 0;
            this.LoadDataSourceFileGrids(idMuestra, this.rgOtro);
        }
        #endregion rgOtro_NeedDataSource

        #region rgCultivos_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgCultivos_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            int idMuestra = this.hfIdMuestraCultivo.Value != string.Empty ? Convert.ToInt32(this.hfIdMuestraCultivo.Value) : 0;
            this.LoadDataSourceFileGrids(idMuestra, rgCultivos);
        }
        #endregion rgCultivos_NeedDataSource

        #region rgBacilo_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgBacilo_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            int idMuestra = this.hfIdMuestraBaciloscopia.Value != string.Empty ? Convert.ToInt32(this.hfIdMuestraBaciloscopia.Value) : 0;
            this.LoadDataSourceFileGrids(idMuestra, rgBacilo);
        }
        #endregion rgBacilo_NeedDataSource

        #endregion Carga Grillas Archivos

        #region Carga grillas muestras anteriores

        #region rgUroAnt_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgUroAnt_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            this.LoadDataSourceSampleGrids(Constants.ExamenLab.Uroanalisis, rgUroAnt);
        }
        #endregion rgUrol_NeedDataSource

        #region rgVihAnt_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgVihAnt_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            this.LoadDataSourceSampleGrids(Constants.ExamenLab.Vih, rgVihAnt);
        }
        #endregion rgVih_NeedDataSource

        #region rgSeroAnt_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgSeroAnt_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            this.LoadDataSourceSampleGrids(Constants.ExamenLab.SerologiaVdrl, rgSeroAnt);
        }
        #endregion rgSeroAnt_NeedDataSource

        #region rgHepB_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgHepBAnt_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            this.LoadDataSourceSampleGrids(Constants.ExamenLab.HbsAg, rgHepBAnt);
        }
        #endregion rgHepB_NeedDataSource


        #region rgHepCAnt_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgHepCAnt_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            this.LoadDataSourceSampleGrids(Constants.ExamenLab.HepatitisC, rgHepCAnt);
        }
        #endregion rgHepB_NeedDataSource

        #region rgCHAnt_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgCHAnt_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            this.LoadDataSourceSampleGrids(Constants.ExamenLab.CuadroHematico, rgCHAnt);
        }
        #endregion rgCH_NeedDataSource

        #region rgCreaAnt_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgCreaAnt_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            this.LoadDataSourceSampleGrids(Constants.ExamenLab.Creatinina, rgCreaAnt);
        }
        #endregion rgCrea_NeedDataSource

        #region rgHemGliAnt_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgHemGliAnt_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            this.LoadDataSourceSampleGrids(Constants.ExamenLab.HemoglobinaGlicosilada, rgHemGliAnt);
        }
        #endregion rgHemGli_NeedDataSource

        #region rgOtroAnt_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgOtroAnt_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            this.LoadDataSourceSampleGrids(Constants.ExamenLab.Otro, rgOtroAnt);
        }
        #endregion rgOtro_NeedDataSource

        #region rgCultivosAnt_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgCultivosAnt_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            this.LoadDataSourceSampleGrids(Constants.ExamenLab.Cultivo, rgCultivosAnt);
        }
        #endregion rgCultivos_NeedDataSource

        #region rgBaciloAnt_NeedDataSource
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rgBaciloAnt_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            this.LoadDataSourceSampleGrids(Constants.ExamenLab.Baciloscopia, rgBaciloAnt);
        }
        #endregion rgBacilo_NeedDataSource

        #endregion Carga grillas muestras anteriores

        #endregion Eventos

        #region Metodos

        private void LoadDataSourceSampleGrids(Constants.ExamenLab examenLab, RadGrid gridToFill)
        {
            MuestraLaboratorioBll objSrc = new MuestraLaboratorioBll();
            gridToFill.DataSource = objSrc.GetList(this.IdHist, examenLab, false, string.Empty, DateTime.MinValue, short.MinValue);
        }

        #region LoadDataSourceFileGrids
        private void LoadDataSourceFileGrids(int idMuestra, RadGrid gridToFill)
        {
            AnexoHistoriaBll objSrc = new AnexoHistoriaBll();
            gridToFill.DataSource = objSrc.GetList(this.IdHist, Constants.TipoRevision.Laboratorio, false, idMuestra, string.Empty);
        }
        #endregion LoadDataSourceFileGrids

        #region SaveMuestraExamen
        /// <summary>
        /// Metodo encargado de almacenar la información de la muestra tomada
        /// </summary>
        /// <param name="objEntML"></param>
        /// <param name="examen"></param>
        private void SaveMuestraExamen(MuestraLaboratorio objEntML, Constants.ExamenLab examen)
        {
            bool isCreacion = !(objEntML.Id != int.MinValue);
            MuestraLaboratorioBll objBllML = new MuestraLaboratorioBll();
            if (objEntML.Estado == Constants.EstadosMuestraLaboratorio.SinAplicar)
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "errValState", "alert('No se ha asignado el estado de la muestra');", true);
                return;
            }
            if (!objBllML.Save(objEntML))
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "errSavMue", "alert('Se ha presentado el siguiente inconveniente al intentar almacenar la informacion correspondiente a la muestra:\\n\\n" + Utilidades.AjustarMensajeError(objBllML.Error) + "');", true);
            }
            else
            {
                if (!(examen == Constants.ExamenLab.Baciloscopia || examen == Constants.ExamenLab.Cultivo))
                {
                    RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "okSavMue", "alert('La informacion de la muestra se ha almacenado correctamente');", true);
                }
                if (isCreacion)
                {
                    switch (examen)
                    {
                        case Constants.ExamenLab.Uroanalisis:
                            this.hfIdMuestraUrol.Value = objEntML.Id.ToString();
                            this.rbtnLoadFileUro.Visible = true;
                            this.chkUro.Enabled = false;
                            break;
                        case Constants.ExamenLab.Vih:
                            this.hfIdMuestraVIH.Value = objEntML.Id.ToString();
                            this.rbtnLoadFileVih.Visible = true;
                            this.chkVih.Enabled = false;
                            break;
                        case Constants.ExamenLab.SerologiaVdrl:
                            this.hfIdMuestraSero.Value = objEntML.Id.ToString();
                            this.rbtnLoadFileSero.Visible = true;
                            this.chkSero.Enabled = false;
                            break;
                        case Constants.ExamenLab.HbsAg:
                            this.hfIdMuestraHepB.Value = objEntML.Id.ToString();
                            this.rbtnLoadFileHepaB.Visible = true;
                            this.chkHepB.Enabled = false;
                            break;
                        case Constants.ExamenLab.HepatitisC:
                            this.hfIdMuestraHepC.Value = objEntML.Id.ToString();
                            this.rbtnLoadFileHepaC.Visible = true;
                            this.chkHepC.Enabled = false;
                            break;
                        case Constants.ExamenLab.CuadroHematico:
                            this.hfIdMuestraCH.Value = objEntML.Id.ToString();
                            this.rbtnLoadFileCH.Visible = true;
                            this.chkCH.Enabled = false;
                            break;
                        case Constants.ExamenLab.Creatinina:
                            this.hfIdMuestraCreatinina.Value = objEntML.Id.ToString();
                            this.rbtnLoadFileCre.Visible = true;
                            this.chkCrea.Enabled = false;
                            break;
                        case Constants.ExamenLab.HemoglobinaGlicosilada:
                            this.hfIdMuestraHemGli.Value = objEntML.Id.ToString();
                            this.rbtnLoadFileHemGli.Visible = true;
                            this.chkHemGli.Enabled = false;
                            break;
                        case Constants.ExamenLab.Otro:
                            this.hfIdMuestraOtro.Value = objEntML.Id.ToString();
                            this.rbtnLoadFileOtro.Visible = true;
                            this.chkOtro.Enabled = false;
                            break;
                        case Constants.ExamenLab.Cultivo:
                            this.hfIdMuestraCultivo.Value = objEntML.Id.ToString();
                            this.rbtnAddCultivo.Visible = false;
                            this.chkCultivo.Enabled = false;
                            this.rbtnAddFileCult.Visible = true;
                            RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "cultOkSav", "openFileupload(" + this.IdHist + ", " + objEntML.Id + ");", true);
                            break;
                        case Constants.ExamenLab.Baciloscopia:
                            this.hfIdMuestraBaciloscopia.Value = objEntML.Id.ToString();
                            this.rbtnAddBaciloscopia.Visible = false;
                            this.chkBaciloscopia.Enabled = false;
                            this.rbtnAddFileBacilo.Visible = true;
                            RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "bacOkSav", "openFileupload(" + this.IdHist + ", " + objEntML.Id + ");", true);
                            break;
                    }
                }
                HistoriaMedicaBll objhbll = new HistoriaMedicaBll();
                HistoriaMedica historia = objhbll.Load(objEntML.IdHistoria);
                UpdateBacteriologo(ref historia);
                objhbll.Save(historia, null);
            }
        }
        #endregion SaveMuestraExamen

        #region LoadInfoHist
        /// <summary>
        /// 
        /// </summary>
        /// <param name="idHistoria"></param>
        private void LoadInfoHist(int idHistoria)
        {
            HistoriaMedicaBll objHMBll = new HistoriaMedicaBll();
            HistoriaMedica objEntHm = objHMBll.Load(idHistoria);
            PacienteBll objPBll = new PacienteBll();
            Paciente objEntPac = objPBll.Load(objEntHm.IdPaciente);
            TipoVisaBll objTvBll = new TipoVisaBll();
            TipoVisa objTvEnt = objTvBll.Load(objEntHm.IdTipoVisa);

            #region Profesional_laboratorio
            if (objEntHm.Bacteriologo != null)
            {
                this.nombreBacteriologo.Value = string.Format("{0} {1}",
                    objEntHm.Bacteriologo.Nombres,
                    objEntHm.Bacteriologo.Apellidos);
                this.universidad.Value = objEntHm.Bacteriologo.FirmaProfesional.Universidad;
                this.correoElectBacteriologo.Value = objEntHm.Bacteriologo.FirmaProfesional.CorreoElectronico;
                this.registroProfesional.Value = objEntHm.Bacteriologo.FirmaProfesional.RegistroProfesional;
                this.firmaBase64.Value = objEntHm.Bacteriologo.FirmaProfesional.FirmaBase64;
            }
            #endregion


            this.hfIdHist.Value = idHistoria.ToString();
            this.rdpFecha.SelectedDate = objEntHm.FechaIngreso;
            this.rdpFecha.Enabled = false;
            this.rtxtNombres.Text = objEntPac.Nombres + " " + objEntPac.Apellidos;
            this.rtxtComentarioLab.Text = objEntHm.ComentarioLab;

            this.EmbajadaCurr = objTvEnt.IdEmbajada;
            this.LoadImgPerfilPaciente(idHistoria, this.imgPrePhoto);

            this.hfCodigo.Value = objEntHm.CodigoSolicitud;
            this.hfEdad.Value = objEntPac.FechaNacimiento.ToString("yyyy-MM-dd");

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

            this.LoadMuestras(idHistoria);

        }
        #endregion LoadInfoHist

        #region LoadMuestras
        /// <summary>
        /// 
        /// </summary>
        /// <param name="idHistoria"></param>
        private void LoadMuestras(int idHistoria)
        {
            MuestraLaboratorioBll objBll = new MuestraLaboratorioBll();
            List<MuestraLaboratorio> objList = objBll.GetMuestraLaboratorios(idHistoria, Constants.ExamenLab.Uroanalisis, false, string.Empty, DateTime.MinValue, short.MinValue);
            if (objList.Count > 0)
            {
                //Se habilita el tab
                this.rpvUrologia.Visible = true;
                RadTab tabUro = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Uroanalisis).ToString());
                tabUro.Visible = true;
                this.chkUro.Enabled = false;
                this.chkUro.Checked = true;
                this.rbtnLoadFileUro.Visible = true;

                this.hfIdMuestraUrol.Value = objList[0].Id.ToString();
                this.rblEstadoUro.SelectedValue = Convert.ToInt32(objList[0].Estado).ToString();
                this.rtxtCommentUrol.Text = objList[0].Observaciones;
                if (objList[0].Estado != Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    //Datos examen Fisico
                    this.rtxtOlor.Text = objList[0].Olor;
                    this.rtxtColor.Text = objList[0].Color;
                    this.rtxtAspecto.Text = objList[0].Aspecto;
                    this.rtxtCommentUrol.Text = objList[0].Observaciones;

                    //Datos Examen Microquimico
                    this.rtxtGLU.Text = objList[0].Glu;
                    this.rtxtBIL.Text = objList[0].Bil;
                    this.rtxtCET.Text = objList[0].Cet;
                    this.rtxtDEN.Text = objList[0].Deh;
                    this.rtxtPH.Text = objList[0].Ph;
                    this.rtxtPRO.Text = objList[0].Pro;
                    this.rtxtUro.Text = objList[0].Uro;
                    this.rtxtNIT.Text = objList[0].Nit;
                    this.rtxtSAN.Text = objList[0].San;
                    this.rtxtSAN.Text = objList[0].Leu;

                    //datos Examen Microscopico
                    this.rtxtLeucoCampo.Text = objList[0].LeucocitosCampo;
                    this.rtxtHematiesCampo.Text = objList[0].HematiesCampo;
                    this.rtxtCelAltasCampo.Text = objList[0].CelulasAltasCampo;
                    this.rtxtCelBajasCampo.Text = objList[0].CelulasBajasCampo;
                    this.rtxtMoco.Text = objList[0].Moco;
                    this.rtxtBacterias.Text = objList[0].Bacterias;
                    this.rtxtCilindros.Text = objList[0].Cilindros;
                    this.rtxtCristales.Text = objList[0].Cristales;
                    this.rtxtLevaduras.Text = objList[0].Levaduras;
                    this.rtxtOtros.Text = objList[0].Otros;
                }
            }
            else
            {
                this.rpvUrologia.Visible = false;
                RadTab tabUro = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Uroanalisis).ToString());
                tabUro.Visible = false;
                this.chkUro.Enabled = true;
                this.chkUro.Checked = false;
                this.rbtnLoadFileUro.Visible = false;

                this.hfIdMuestraUrol.Value = "";
                this.rblEstadoUro.SelectedValue = Convert.ToInt32(Constants.EstadosMuestraLaboratorio.SinAplicar).ToString();
                this.rtxtCommentUrol.Text = "";
            }

            objList = objBll.GetMuestraLaboratorios(idHistoria, Constants.ExamenLab.Vih, false, string.Empty, DateTime.MinValue, short.MinValue);
            if (objList.Count > 0)
            {
                //Se habilita el tab
                this.rpvHIV.Visible = true;
                RadTab tabVih = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Vih).ToString());
                tabVih.Visible = true;
                this.rbtnLoadFileVih.Visible = true;

                this.chkVih.Checked = true;
                this.chkVih.Enabled = false;

                this.hfIdMuestraVIH.Value = objList[0].Id.ToString();
                this.rblEstadoVih.SelectedValue = Convert.ToInt32(objList[0].Estado).ToString();
                this.rtxtComentVIH.Text = objList[0].Observaciones;
                if (objList[0].Estado != Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    this.rcbxVIHResult.SelectedValue = objList[0].Resultado;
                    this.rbtnLoadFileVih.Visible = true;
                }
            }
            else
            {
                this.rpvHIV.Visible = false;
                RadTab tabVih = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Vih).ToString());
                tabVih.Visible = false;
                this.rbtnLoadFileVih.Visible = false;

                this.chkVih.Checked = false;
                this.chkVih.Enabled = true;

                this.hfIdMuestraVIH.Value = "";
                this.rblEstadoVih.SelectedValue = Convert.ToInt32(Constants.EstadosMuestraLaboratorio.SinAplicar).ToString();
                this.rtxtComentVIH.Text = "";
            }

            objList = objBll.GetMuestraLaboratorios(idHistoria, Constants.ExamenLab.SerologiaVdrl, false, string.Empty, DateTime.MinValue, short.MinValue);
            if (objList.Count > 0)
            {
                //Se habilita el tab
                this.rpvVDRL.Visible = true;
                RadTab tabSero = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.SerologiaVdrl).ToString());
                tabSero.Visible = true;
                this.rbtnLoadFileSero.Visible = true;

                this.chkSero.Checked = true;
                this.chkSero.Enabled = false;

                this.hfIdMuestraSero.Value = objList[0].Id.ToString();
                this.rblEstadoSero.SelectedValue = Convert.ToInt32(objList[0].Estado).ToString();
                this.rtxtComentarioSerol.Text = objList[0].Observaciones;
                if (objList[0].Estado != Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    this.rcbxSero.SelectedValue = objList[0].Resultado;
                    //this.rcbxSero_SelectedIndexChanged(this.rcbxSero, null);
                    if (objList[0].Valor != decimal.MinValue)
                    {
                        this.rntValorSero.Value = Convert.ToDouble(objList[0].Valor);
                    }
                }
            }
            else
            {
                this.rpvVDRL.Visible = false;
                RadTab tabSero = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.SerologiaVdrl).ToString());
                tabSero.Visible = false;
                this.rbtnLoadFileSero.Visible = false;

                this.chkSero.Checked = false;
                this.chkSero.Enabled = true;

                this.hfIdMuestraSero.Value = "";
                this.rblEstadoSero.SelectedValue = Convert.ToInt32(Constants.EstadosMuestraLaboratorio.SinAplicar).ToString();
                this.rtxtComentarioSerol.Text = "";
            }

            objList = objBll.GetMuestraLaboratorios(idHistoria, Constants.ExamenLab.HbsAg, false, string.Empty, DateTime.MinValue, short.MinValue);
            if (objList.Count > 0)
            {
                //Se habilita el tab
                this.rpvHepatitisB.Visible = true;
                RadTab tabHepB = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.HbsAg).ToString());
                tabHepB.Visible = true;
                this.rbtnLoadFileHepaB.Visible = true;

                this.chkHepB.Checked = true;
                this.chkHepB.Enabled = false;

                this.hfIdMuestraHepB.Value = objList[0].Id.ToString();
                this.rblEstadoHepaB.SelectedValue = Convert.ToInt32(objList[0].Estado).ToString();
                this.rtxtCommentHepB.Text = objList[0].Observaciones;
                if (objList[0].Estado != Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    this.rcbxHepB.SelectedValue = objList[0].Resultado;
                }
            }
            else
            {
                this.rpvHepatitisB.Visible = false;
                RadTab tabHepB = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.HbsAg).ToString());
                tabHepB.Visible = false;
                this.rbtnLoadFileHepaB.Visible = false;

                this.chkHepB.Checked = false;
                this.chkHepB.Enabled = true;

                this.hfIdMuestraHepB.Value = "";
                this.rblEstadoHepaB.SelectedValue = Convert.ToInt32(Constants.EstadosMuestraLaboratorio.SinAplicar).ToString();
                this.rtxtCommentHepB.Text = "";
            }

            objList = objBll.GetMuestraLaboratorios(idHistoria, Constants.ExamenLab.HepatitisC, false, string.Empty, DateTime.MinValue, short.MinValue);
            if (objList.Count > 0)
            {

                //Se habilita el tab
                this.rpvHepC.Visible = true;
                RadTab tabHepC = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.HepatitisC).ToString());
                tabHepC.Visible = true;
                this.rbtnLoadFileHepaC.Visible = true;

                this.chkHepC.Checked = true;
                this.chkHepC.Enabled = false;

                this.hfIdMuestraHepC.Value = objList[0].Id.ToString();
                this.rblEstadoHepaC.SelectedValue = Convert.ToInt32(objList[0].Estado).ToString();
                this.rtxtCommentHepC.Text = objList[0].Observaciones;
                if (objList[0].Estado != Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    this.rcbxHepC.SelectedValue = objList[0].Resultado;
                }
            }
            else
            {
                this.rpvHepC.Visible = false;
                RadTab tabHepC = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.HepatitisC).ToString());
                tabHepC.Visible = false;
                this.rbtnLoadFileHepaC.Visible = false;

                this.chkHepC.Checked = false;
                this.chkHepC.Enabled = true;

                this.hfIdMuestraHepC.Value = "";
                this.rblEstadoHepaC.SelectedValue = Convert.ToInt32(Constants.EstadosMuestraLaboratorio.SinAplicar).ToString();
                this.rtxtCommentHepC.Text = "";
            }

            objList = objBll.GetMuestraLaboratorios(idHistoria, Constants.ExamenLab.CuadroHematico, false, string.Empty, DateTime.MinValue, short.MinValue);
            if (objList.Count > 0)
            {
                //Se habilita el tab
                this.rpvCuadroHematico.Visible = true;
                RadTab tabCh = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.CuadroHematico).ToString());
                tabCh.Visible = true;
                this.rbtnLoadFileCH.Visible = true;

                this.chkCH.Checked = true;
                this.chkCH.Enabled = false;

                this.hfIdMuestraCH.Value = objList[0].Id.ToString();
                this.rblEstadoCH.SelectedValue = Convert.ToInt32(objList[0].Estado).ToString();
                this.rtxtComentarioCH.Text = objList[0].Observaciones;
                if (objList[0].Estado != Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    this.rcbxCuadroHematico.SelectedValue = objList[0].Resultado;
                }
            }
            else
            {
                this.rpvCuadroHematico.Visible = false;
                RadTab tabCh = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.CuadroHematico).ToString());
                tabCh.Visible = false;
                this.rbtnLoadFileCH.Visible = true;

                this.chkCH.Checked = false;
                this.chkCH.Enabled = true;

                this.hfIdMuestraCH.Value = "";
                this.rblEstadoCH.SelectedValue = Convert.ToInt32(Constants.EstadosMuestraLaboratorio.SinAplicar).ToString();
                this.rtxtComentarioCH.Text = "";
            }

            objList = objBll.GetMuestraLaboratorios(idHistoria, Constants.ExamenLab.Creatinina, false, string.Empty, DateTime.MinValue, short.MinValue);
            if (objList.Count > 0)
            {
                //Se habilita el tab
                this.rpvCreatinina.Visible = true;
                RadTab tabCre = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Creatinina).ToString());
                tabCre.Visible = true;
                this.rbtnLoadFileCre.Visible = true;

                this.chkCrea.Checked = true;
                this.chkCrea.Enabled = false;

                this.hfIdMuestraCreatinina.Value = objList[0].Id.ToString();
                this.rblEstadoCreat.SelectedValue = Convert.ToInt32(objList[0].Estado).ToString();
                this.rtxtComentarioHemGli.Text = objList[0].Observaciones;
                if (objList[0].Estado != Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    this.rcbxCreatinina.SelectedValue = objList[0].Resultado;
                    this.rcbxCreatinina_SelectedIndexChanged(this.rcbxCreatinina, null);
                    if (objList[0].Valor != decimal.MinValue)
                    {
                        this.rntValorCrea.Value = Convert.ToDouble(objList[0].Valor);
                    }
                }
                else
                {
                    this.rcbxCreatinina_SelectedIndexChanged(this.rcbxCreatinina, null);
                    this.rntValorCrea.Value = 0;
                }
                this.rbtnLoadFileCre.Visible = true;
            }
            else
            {
                this.rpvCreatinina.Visible = false;
                RadTab tabCre = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Creatinina).ToString());
                tabCre.Visible = false;
                this.rbtnLoadFileCre.Visible = false;

                this.chkCrea.Checked = false;
                this.chkCrea.Enabled = true;

                this.hfIdMuestraCreatinina.Value = "";
                this.rblEstadoCreat.SelectedValue = Convert.ToInt32(Constants.EstadosMuestraLaboratorio.SinAplicar).ToString();
                this.rtxtComentarioHemGli.Text = "";
            }

            objList = objBll.GetMuestraLaboratorios(idHistoria, Constants.ExamenLab.HemoglobinaGlicosilada, false, string.Empty, DateTime.MinValue, short.MinValue);
            if (objList.Count > 0)
            {
                //Se habilita el tab
                this.rpvHemoGli.Visible = true;
                RadTab tabHemGli = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.HemoglobinaGlicosilada).ToString());
                tabHemGli.Visible = true;
                this.rbtnLoadFileHemGli.Visible = true;

                this.chkHemGli.Checked = true;
                this.chkHemGli.Enabled = false;

                this.hfIdMuestraHemGli.Value = objList[0].Id.ToString();
                this.rblEstadoHemGli.SelectedValue = Convert.ToInt32(objList[0].Estado).ToString();
                this.rtxtComentarioHemGli.Text = objList[0].Observaciones;
                if (objList[0].Estado != Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    if (objList[0].Valor != decimal.MinValue)
                    {
                        this.rntValorHemGli.Value = Convert.ToDouble(objList[0].Valor);
                    }
                }
            }
            else
            {
                this.rpvHemoGli.Visible = false;
                RadTab tabHemGli = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.HemoglobinaGlicosilada).ToString());
                tabHemGli.Visible = false;
                this.rbtnLoadFileHemGli.Visible = false;

                this.chkHemGli.Checked = false;
                this.chkHemGli.Enabled = true;

                this.hfIdMuestraHemGli.Value = "";
                this.rblEstadoHemGli.SelectedValue = Convert.ToInt32(Constants.EstadosMuestraLaboratorio.SinAplicar).ToString();
                this.rtxtComentarioHemGli.Text = "";
            }


            objList = objBll.GetMuestraLaboratorios(idHistoria, Constants.ExamenLab.Otro, false, string.Empty, DateTime.MinValue, short.MinValue);
            if (objList.Count > 0)
            {
                //Se habilita el tab
                this.rpvOtro.Visible = true;
                RadTab tabOtro = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Otro).ToString());
                tabOtro.Visible = true;
                this.rbtnLoadFileOtro.Visible = true;

                this.chkOtro.Checked = true;
                this.chkOtro.Enabled = false;

                this.hfIdMuestraOtro.Value = objList[0].Id.ToString();
                this.rblEstadoOtro.SelectedValue = Convert.ToInt32(objList[0].Estado).ToString();

                if (objList[0].Estado != Constants.EstadosMuestraLaboratorio.SinAplicar)
                {
                    this.rtxtOtroDesc.Text = objList[0].Descripcion;

                    this.rtxtOtroComentario.Text = objList[0].Observaciones;

                    this.rtxtOtroResultado.Text = objList[0].Resultado;
                }
            }
            else
            {
                this.rpvOtro.Visible = false;
                RadTab tabOtro = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Otro).ToString());
                tabOtro.Visible = false;
                this.rbtnLoadFileOtro.Visible = false;

                this.chkOtro.Checked = false;
                this.chkOtro.Enabled = true;

                this.hfIdMuestraOtro.Value = "";
                this.rblEstadoOtro.SelectedValue = Convert.ToInt32(Constants.EstadosMuestraLaboratorio.SinAplicar).ToString();
            }

            objList = objBll.GetMuestraLaboratorios(idHistoria, Constants.ExamenLab.Cultivo, false, string.Empty, DateTime.MinValue, short.MinValue);
            if (objList.Count > 0)
            {
                this.rpvCultivo.Visible = true;
                RadTab tabCult = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Cultivo).ToString());
                tabCult.Visible = true;
                this.rbtnAddFileCult.Visible = true;
                this.rbtnAddCultivo.Visible = false;

                chkCultivo.Checked = true;
                chkCultivo.Enabled = false;

                this.hfIdMuestraCultivo.Value = objList[0].Id.ToString();
            }
            else
            {
                this.rpvCultivo.Visible = false;
                RadTab tabCult = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Cultivo).ToString());
                tabCult.Visible = false;
                this.rbtnAddFileCult.Visible = false;
                this.rbtnAddCultivo.Visible = true;

                chkCultivo.Checked = false;
                chkCultivo.Enabled = true;

                this.hfIdMuestraCultivo.Value = "";
            }

            objList = objBll.GetMuestraLaboratorios(idHistoria, Constants.ExamenLab.Baciloscopia, false, string.Empty, DateTime.MinValue, short.MinValue);
            if (objList.Count > 0)
            {
                this.rpvBaciloscopia.Visible = true;
                RadTab tabCult = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Baciloscopia).ToString());
                tabCult.Visible = true;
                this.rbtnAddFileBacilo.Visible = true;
                this.rbtnAddBaciloscopia.Visible = false;

                chkBaciloscopia.Checked = true;
                chkBaciloscopia.Enabled = false;

                this.hfIdMuestraBaciloscopia.Value = objList[0].Id.ToString();
            }
            else
            {
                this.rpvBaciloscopia.Visible = false;
                RadTab tabCult = this.rtsPanelesExamenes.FindTabByValue(Convert.ToInt32(Constants.ExamenLab.Baciloscopia).ToString());
                tabCult.Visible = false;
                this.rbtnAddFileBacilo.Visible = false;
                this.rbtnAddBaciloscopia.Visible = true;

                chkBaciloscopia.Checked = false;
                chkBaciloscopia.Enabled = true;

                this.hfIdMuestraBaciloscopia.Value = "";
            }
        }
        #endregion LoadMuestras

        #region LoadInfoLab
        private void LoadInfoLab()
        {
            ParametroBll infoLab = new ParametroBll();
            DataTable valores = new DataTable();
            valores = infoLab.GetList(Constants.Parametros.Ciudad, true, string.Empty);

            foreach (DataRow fila in valores.Rows)
            {
                int id = 0;
                id = Convert.ToInt32(fila[0].ToString());

                switch (id)
                {
                    case 2:
                        this.nombreLaboratorio.Value = fila[3].ToString();
                        break;
                    case 6:
                        this.direccionLaboratorio.Value = fila[3].ToString();
                        break;
                    case 4:
                        this.ciudad.Value = fila[3].ToString();
                        break;
                    case 7:
                        this.telefonoLaboratorio.Value = fila[3].ToString();
                        break;
                    case 8:
                        this.faxLaboratorio.Value = fila[3].ToString();
                        break;
                    default:
                        break;
                }
            }
        }
        #endregion LoadInfoLab

        #region EliminarMuestra
        private void EliminarMuestra(MuestraLaboratorio objEntML)
        {
            objEntML.IdUltimaModificacion = this.IdUserCurrent;
            MuestraLaboratorioBll objBll = new MuestraLaboratorioBll();
            if (!objBll.Delete(objEntML, this.PathFilesToAttach))
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "delOk", "alert('Se ha presentado el siguiente erro al eliminar la muestra\\n\\n" + Utilidades.AjustarMensajeError(objBll.Error) + "');", true);
            }
            else
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "delOk", "alert('La muestra ha sido eliminada correctamente');", true);
            }
            this.LoadMuestras(this.IdHist);
        }
        #endregion EliminarMuestra

        protected void rbtnSendMail_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.rauFileToLoad.UploadedFiles.Count > 0)
                {
                    HistoriaMedicaBll objBllHisMed = new HistoriaMedicaBll();
                    HistoriaMedica objEntHisMed = objBllHisMed.Load(this.IdHist);
                    PacienteBll objBllPac = new PacienteBll();
                    Paciente objEntPac = objBllPac.Load(objEntHisMed.IdPaciente);

                    if (objEntPac.Correo != string.Empty)
                    {
                        Configuration webconfig = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
                        MailSettingsSectionGroup MailOpt = (MailSettingsSectionGroup)webconfig.GetSectionGroup("system.net/mailSettings");
                        SmtpSection smtpConfig = MailOpt.Smtp;

                        StreamReader srTemplate = new StreamReader(this.PathTemplateFiles + Constants.NombreArchivoPlantillaLabMail);
                        string mailContent = srTemplate.ReadToEnd();
                        srTemplate.Close();
                        mailContent = mailContent.Replace("[Paciente]", objEntPac.Nombres.Trim() + " " + objEntPac.Apellidos.Trim());

                        List<Attachment> adjuntos = new List<Attachment>();
                        //adjuntos.Add(new Attachment(fullDestinyFilePath));
                        adjuntos.Add(new Attachment(this.rauFileToLoad.UploadedFiles[0].InputStream, "ResLab_" + objEntPac.Nombres.Trim().Replace(" ", "") + objEntPac.Apellidos.Trim().Replace(" ", "") + ".pdf"));

                        Mailing objMail = new Mailing(smtpConfig.Network.Host, smtpConfig.Network.Port, "Resultados Laboratorio", mailContent, new MailAddress(smtpConfig.From), new MailAddress(objEntPac.Correo),
                            true, MailPriority.High, adjuntos, true, smtpConfig.Network.UserName, smtpConfig.Network.Password);


                        objMail.SendMailMessage();

                        RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "noEmailSend", "alert('Se ha enviado el correo al paciente " + objEntPac.Nombres + " " + objEntPac.Apellidos + " a la dirección de correo: " + objEntPac.Correo + "');", true);
                    }
                    else
                    {
                        RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "noEmailDet", "alert('El paciente no tiene registrado un correo electrónico, sin este dato no es posible enviar la información');", true);
                    }
                }
                else
                {
                    RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "noFileDet", "alert('No hay un archivo seleccionado, por favor verifique e intente nuevamente');", true);
                }
            }
            catch (Exception ex)
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "errSendMail", "alert('Se ha presentado un error al enviar el correo al usuario');", true);
            }
        }

        #endregion Metodos

    }
}