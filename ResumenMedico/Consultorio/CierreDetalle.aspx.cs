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
using System.IO;
using System.Collections;

namespace ResumenMedico.Consultorio
{
    public partial class CierreDetalle : BasePage
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
                if (this.IsAdmin || this.PerfilActual == Constants.Perfiles.MedicoGeneral || this.FinalizaHistora)
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
            lbRegList.PostBackUrl = "Cierre.aspx";
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

            EmbajadaBll objBllEmb = new EmbajadaBll();
            TipoDocumentoBll objBllTd = new TipoDocumentoBll();
            TipoVisaBll objTVBll = new TipoVisaBll();
            TipoVisa objEntTv = objTVBll.Load(objEntHm.IdTipoVisa);

            Utilidades.LlenarRC(this.rcbxEmbajada, objBllEmb.GetList(string.Empty, true, false), "ID", "NOMBRE", true);
            Utilidades.LlenarRC(this.rcbxTipoDoc, objBllTd.GetList(string.Empty, true, false), "ID", "NOMBRE", true);
            Utilidades.LlenarRCEnBlanco(this.rcbxTipoVisa);


            Utilidades.PosicionarRC(this.rcbxEmbajada, Convert.ToInt32(objEntTv.IdEmbajada).ToString());
            this.rcbxEmbajada_SelectedIndexChanged(this.rcbxEmbajada, null);
            Utilidades.PosicionarRC(this.rcbxTipoVisa, objEntHm.IdTipoVisa.ToString());

            Utilidades.PosicionarRC(rcbxTipoDoc, objEntPac.IdTipoDocumento.ToString());

            this.lblEdad.Text = objEntPac.EdadPaciente.ToString();

            this.rdpFecha.SelectedDate = objEntHm.FechaIngreso;
            this.rtxtNombres.Text = objEntPac.Nombres;
            this.rtxtApellidos.Text = objEntPac.Apellidos;
            this.rtxtNumDoc.Text = objEntPac.NumeroDocumento;

            this.rtxtCommentMedGen.Text = objEntHm.ComentarioMed;

            TipoVisaBll objTvBll = new TipoVisaBll();
            TipoVisa objTvEnt = objTvBll.Load(objEntHm.IdTipoVisa);           

            this.EmbajadaCurr = (Constants.Embajadas)objTvEnt.IdEmbajada;
            
            this.rtxtNumVisa.Text = objEntHm.CodigoSolicitud;
            this.rblGenero.SelectedValue = Convert.ToByte(objEntPac.Genero).ToString();
            this.rdpFecNac.SelectedDate = objEntPac.FechaNacimiento;
            this.rtxtCorreo.Text = objEntPac.Correo;
            this.rtxtDireccion.Text = objEntPac.Direccion;
            this.rtxtAcudiente.Text = objEntPac.Acudiente;
            this.rntPeso.Value = Convert.ToDouble(objEntHm.Peso);
            this.rntEstatura.Value = Convert.ToDouble(objEntHm.Estatura);
            this.rntBmi.Value = Convert.ToDouble(objEntHm.BMI);
            this.rntPC.Value = objEntHm.PerimetroCefalico != decimal.MinValue ? Convert.ToDouble(objEntHm.PerimetroCefalico) : 0d;
            this.rblEstado.SelectedValue = Convert.ToByte(objEntHm.EstadoRevisionMed).ToString();
            this.rtxtTelefono.Text = objEntPac.Telefono;

            this.rtxtCommentLab.Text = objEntHm.ComentarioLab;
            this.rblEstadoLab.SelectedValue = Convert.ToByte(objEntHm.EstadoRevisionLab).ToString();

            this.rtxtCommentRad.Text = objEntHm.ComentarioRad;
            this.rblEstadoRad.SelectedValue = Convert.ToByte(objEntHm.EstadoRevisionRad).ToString();

            this.rtxtCommentRadGen.Text = objEntHm.ComentarioRadMed;
            this.rblEstadoRadGen.SelectedValue = Convert.ToByte(objEntHm.EstadoRevisionRadMed).ToString();

            this.LoadImgPerfilPaciente(idHistoria, this.imgPrePhoto);


            this.MedData.Attributes["class"] = objEntHm.TieneRevisionMed ? (objEntHm.EstadoRevisionMed == Constants.EstadoRevision.Normal ? "collapse" : "collapse in") : "collapse";
            this.spMedData1.Attributes["class"] = objEntHm.TieneRevisionMed ? (objEntHm.EstadoRevisionMed == Constants.EstadoRevision.Normal ? "glyphicon glyphicon-chevron-down" : "glyphicon glyphicon-chevron-up") : "glyphicon glyphicon-chevron-down";
            this.spMedData2.Attributes["class"] = objEntHm.TieneRevisionMed ? (objEntHm.EstadoRevisionMed == Constants.EstadoRevision.Normal ? "texto txtMostrar" : "texto txtOcultar") : "texto txtMostrar";

            this.LabData.Attributes["class"] = objEntHm.TieneRevisonLab ? (objEntHm.EstadoRevisionLab == Constants.EstadoRevision.Normal ? "collapse" : "collapse in") : "collapse";
            this.spLabData1.Attributes["class"] = objEntHm.TieneRevisonLab ? (objEntHm.EstadoRevisionLab == Constants.EstadoRevision.Normal ? "glyphicon glyphicon-chevron-down" : "glyphicon glyphicon-chevron-up") : "glyphicon glyphicon-chevron-down";
            this.spLabData2.Attributes["class"] = objEntHm.TieneRevisonLab ? (objEntHm.EstadoRevisionLab == Constants.EstadoRevision.Normal ? "texto txtMostrar" : "texto txtOcultar") : "texto txtMostrar";

            this.RadiologyData.Attributes["class"] = objEntHm.TieneRevisionRad ? (objEntHm.EstadoRevisionRad == Constants.EstadoRevision.Normal && objEntHm.EstadoRevisionRadMed == Constants.EstadoRevision.Normal ? "collapse" : "collapse in") : "collapse";
            this.spRadiologyData1.Attributes["class"] = objEntHm.TieneRevisionRad ? (objEntHm.EstadoRevisionRad == Constants.EstadoRevision.Normal && objEntHm.EstadoRevisionRadMed == Constants.EstadoRevision.Normal ? "glyphicon glyphicon-chevron-down" : "glyphicon glyphicon-chevron-up") : "glyphicon glyphicon-chevron-down";
            this.spRadiologyData2.Attributes["class"] = objEntHm.TieneRevisionRad ? (objEntHm.EstadoRevisionRad == Constants.EstadoRevision.Normal && objEntHm.EstadoRevisionRadMed == Constants.EstadoRevision.Normal ? "texto txtMostrar" : "texto txtOcultar") : "texto txtMostrar";
        }

        protected void btnSaveInfo_Click(object sender, EventArgs e)
        {
            HistoriaMedicaBll objHmBll = new HistoriaMedicaBll();
            HistoriaMedica objHmEnt = objHmBll.Load(this.IdHist);
            objHmEnt.EstadoRevisionMed = (Constants.EstadoRevision)(Convert.ToByte(this.rblEstado.SelectedValue));
            objHmEnt.ComentarioMed = this.rtxtCommentMedGen.Text.Trim();
            objHmEnt.TieneRevisionMed = true;
            objHmEnt.IdUltimaModificacion = this.IdUserCurrent;
            objHmEnt.FechaUltimaModificacion = DateTime.Now;


            if (!objHmBll.Save(objHmEnt, null))
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "savedFailHead", "alert('Se ha presentado el sisguiente inconveniente al almacenar la informacion:\\n\\n" + Utilidades.AjustarMensajeError(objHmBll.Error) + "');", true);
            }
            else
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "savedOKHead", "alert('Se ha almacenado la información');", true);
            }
        }

        protected void rgDataLab_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            MuestraLaboratorioBll objBll = new MuestraLaboratorioBll();
            this.rgDataLab.DataSource = objBll.GetList(this.IdHist, Constants.ExamenLab.Uroanalisis, true, string.Empty, DateTime.MinValue, short.MinValue);
        }

        protected void rgFilesAttached_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            AnexoHistoriaBll objBll = new AnexoHistoriaBll();
            this.rgFilesAttached.DataSource = objBll.GetList(this.IdHist, Constants.TipoRevision.Laboratorio, true, int.MinValue, string.Empty);
        }

        protected void rgOrdenes_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            OrdenesHistoriaBll objBll = new OrdenesHistoriaBll();
            this.rgOrdenes.DataSource = objBll.GetList(this.IdHist, string.Empty);
        }

        protected void rcbxEmbajada_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            if (this.rcbxEmbajada.SelectedValue != string.Empty)
            {
                TipoVisaBll objBllTV = new TipoVisaBll();
                this.EmbajadaCurr = (Constants.Embajadas)Convert.ToInt32(this.rcbxEmbajada.SelectedValue);
                Utilidades.LlenarRC(this.rcbxTipoVisa, objBllTV.GetList(string.Empty, this.EmbajadaCurr, false, true, false), "ID", "NOMBRE", true);
            }
            else
            {
                Utilidades.LlenarRCEnBlanco(this.rcbxTipoVisa);
            }
        }

        protected void rdpFecNac_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
        {

        }

        protected void rgOrdenes_InsertCommand(object sender, GridCommandEventArgs e)
        {
            OrdenesHistoriaBll objBll = new OrdenesHistoriaBll();
            GridEditableItem editColumn = (GridEditableItem)e.Item;
            Hashtable newValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editColumn);

            OrdenesHistoria objEnt = new OrdenesHistoria();
            objEnt.Descripcion = newValues["DESCRIPCION"].ToString();
            objEnt.IdHistoria = this.IdHist;
            objEnt.IdCreacion = objEnt.IdUltimaModificacion = this.IdUserCurrent;
            objEnt.FechaCreacion = objEnt.FechaUltimaModificacion = DateTime.Now;

            if (objBll.Save(objEnt))
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "okOrdSav", "alert('Se ha almacenado la orden correctamente');", true);
            }
            else
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "errOrdSav", "alert('Se ha presentado el siguiente error al cargar la nueva orden al sistema\\n\\n" + Utilidades.AjustarMensajeError(objBll.Error) + "');", true);
            }
        }

        protected void chkRequiereNot_CheckedChanged(object sender, EventArgs e)
        {
            this.chkNotEnv.Enabled = this.chkRequiereNot.Checked;
            this.chkNotEnv.Checked = !this.chkRequiereNot.Checked;
        }

        protected void rbtnFinalizar_Click(object sender, EventArgs e)
        {
            
            HistoriaMedicaBll objbll = new HistoriaMedicaBll();
            HistoriaMedica objEnt = objbll.Load(this.IdHist);
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
        }

        protected void rbtnSavePeso_Click(object sender, EventArgs e)
        {
            HistoriaMedicaBll objbll = new HistoriaMedicaBll();
            HistoriaMedica objEnt = objbll.Load(this.IdHist);

            objEnt.Peso = this.rntPeso.Value != null ? Convert.ToDecimal(this.rntPeso.Value) : 0;
            objEnt.Estatura = this.rntEstatura.Value != null ? Convert.ToDecimal(this.rntEstatura.Value) : 0;

            objEnt.IdUltimaModificacion = this.IdUserCurrent;
            objEnt.FechaUltimaModificacion = DateTime.Now;
            if (!objbll.Save(objEnt, null))
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ErrSaved", "alert('Se presento un error al actualizar los datos:\\n\\n" + Utilidades.AjustarMensajeError(objbll.Error) + "');", true);
            }
            else
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "OkSaved", "alert('Información actualizada correctamente');", true);
            }
        }
    }
}