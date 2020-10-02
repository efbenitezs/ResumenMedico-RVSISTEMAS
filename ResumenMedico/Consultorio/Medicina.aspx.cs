using System;
using System.Collections;
using System.Web.UI.WebControls;
using ResumenMedico.Controls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico.Consultorio
{
	public partial class Medicina : BasePage
	{
		#region Atributos

		/// <summary>
		/// identificador de la historia que se esta procesando
		/// </summary>
		private int idHist = int.MinValue;

		#endregion Atributos

		#region Propiedades

		#region IdHist

		/// <summary>
		/// Asigna o retorna el identificador de la historia en proceso
		/// </summary>
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

		#endregion IdHist

		#endregion Propiedades

		#region Eventos

		#region Page_Load

		protected void Page_Load(object sender, EventArgs e)
		{
			if (this.IdUserCurrent != int.MinValue)
			{
				if (this.IsAdmin || this.PerfilActual == Constants.Perfiles.MedicoGeneral)
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
					LinkButton lbRegList = (LinkButton)Master.FindControl("lbRegList");
					lbRegList.PostBackUrl = ResolveUrl("~/Pendientes.aspx") + "?T=3";
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

		#region btnSaveInfo_Click

		protected void btnSaveInfo_Click(object sender, EventArgs e)
		{
			HistoriaMedicaBll objHmBll = new HistoriaMedicaBll();
			HistoriaMedica objHmEnt = objHmBll.Load(this.IdHist);

			PacienteBll objPacBll = new PacienteBll();
			Paciente objPacEnt = objPacBll.Load(objHmEnt.IdPaciente);

			//se cargan los datos del paciente
			objPacEnt.Nombres = this.rtxtNombres.Text.Trim();
			objPacEnt.Apellidos = this.rtxtApellidos.Text.Trim();
			objPacEnt.NumeroDocumento = this.rtxtNumDoc.Text.Trim();
			objPacEnt.Acudiente = this.rtxtAcudiente.Text.Trim();
			objPacEnt.Correo = this.rtxtCorreo.Text.Trim();
			objPacEnt.Direccion = this.rtxtDireccion.Text.Trim();
			objPacEnt.FechaNacimiento = Convert.ToDateTime(this.rdpFecNac.SelectedDate);
			objPacEnt.Genero = Convert.ToBoolean(Convert.ToByte(this.rblGenero.SelectedValue));
			objPacEnt.IdTipoDocumento = Convert.ToInt32(this.rcbxTipoDoc.SelectedValue);
			objPacEnt.Telefono = this.rtxtTelefono.Text.Trim();
			objPacEnt.IdUltimaModificacion = this.IdUserCurrent;
			objPacEnt.FechaUltimaModificacion = DateTime.Now;

			//Datos del cabecero de la pagina
			objHmEnt.IdTipoVisa = Convert.ToInt32(this.rcbxTipoVisa.SelectedValue);
			objHmEnt.PerimetroCefalico = this.rntPC.Value != null ? Convert.ToDecimal(this.rntPC.Value) : decimal.MinValue;
			objHmEnt.Peso = Convert.ToDecimal(this.rntPeso.Value);
			objHmEnt.Estatura = this.rntEstatura.Value != null ? Convert.ToDecimal(this.rntEstatura.Value) / 100M : decimal.MinValue;
			objHmEnt.CodigoSolicitud = this.rtxtNumVisa.Text.Trim();

			// Jun 12 2018 Abohorquez se adiciona el siguiente bloque
			/*para el momento que el usuario medico general guarde cambios para el paciente y si este no tiene asignado un medico se asignara el usuario actual
             */
			if (!(objHmEnt.IdMedico != int.MinValue))
			{
				objHmEnt.IdMedico = this.IdUserCurrent;
			}

			// si tiene revision de medicina
			if (objHmEnt.TieneRevisionMed)
			{
				objHmEnt.EstadoRevisionMed = this.rblEstado.SelectedValue != string.Empty ? (Constants.EstadoRevision)(Convert.ToByte(this.rblEstado.SelectedValue)) : Constants.EstadoRevision.SinAplicar;
				objHmEnt.ComentarioMed = this.rtxtCommentMedGen.Text.Trim();
			}
			//objHmEnt.TieneRevisionMed = true;
			objHmEnt.IdUltimaModificacion = this.IdUserCurrent;
			objHmEnt.FechaUltimaModificacion = DateTime.Now;

			if (objHmEnt.TieneRevisionRad)
			{
				//Datos correspondientes a la evaluacion Radiologia correspondiente al medico general
				objHmEnt.EstadoRevisionRadMed = this.rblEstadoRadGen.SelectedValue == "" ? Constants.EstadoRevision.SinAplicar : (Constants.EstadoRevision)(Convert.ToByte(this.rblEstadoRadGen.SelectedValue));
				objHmEnt.ComentarioRadMed = this.rtxtCommentRadGen.Text.Trim();
			}

			if (!objHmBll.Save(objHmEnt, objPacEnt))
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "savedFailHead", "alert('Se ha presentado el sisguiente inconveniente al almacenar la informacion:\\n\\n" + Utilidades.AjustarMensajeError(objHmBll.Error) + "');", true);
			}
			/*
            else
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "savedOKHead", "alert('Se ha almacenado la información');", true);
            }
            */
		}

		#endregion btnSaveInfo_Click

		#region rbtnCerrarRetorno_Click

		protected void rbtnCerrarRetorno_Click(object sender, EventArgs e)
		{
			HistoriaMedicaBll objHmBll = new HistoriaMedicaBll();
			HistoriaMedica objHmEnt = objHmBll.Load(this.IdHist);

			objHmEnt.RetornadoEmbajada = false;
			objHmEnt.Finalizada = false;
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

		#endregion rbtnCerrarRetorno_Click

		#region rbtnSaveInfoRadMedGen_Click

		protected void rbtnSaveInfoRadMedGen_Click(object sender, EventArgs e)
		{
			HistoriaMedicaBll objHmBll = new HistoriaMedicaBll();
			HistoriaMedica objHmEnt = objHmBll.Load(this.IdHist);
			objHmEnt.EstadoRevisionRadMed = (Constants.EstadoRevision)(Convert.ToByte(this.rblEstadoRadGen.SelectedValue));
			objHmEnt.ComentarioRadMed = this.rtxtCommentRadGen.Text.Trim();
			objHmEnt.IdUltimaModificacion = this.IdUserCurrent;
			objHmEnt.FechaUltimaModificacion = DateTime.Now;

			if (!objHmBll.Save(objHmEnt, null))
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "savedFailRadPart", "alert('Se ha presentado el sisguiente inconveniente al almacenar la informacion:\\n\\n" + Utilidades.AjustarMensajeError(objHmBll.Error) + "');", true);
			}
			else
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "savedOKRadPart", "alert('Se ha almacenado la información correspondiente a radiología correctamente');", true);
			}
		}

		#endregion rbtnSaveInfoRadMedGen_Click

		#region rgDataLab_NeedDataSource

		protected void rgDataLab_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
		{
			MuestraLaboratorioBll objBll = new MuestraLaboratorioBll();
			this.rgDataLab.DataSource = objBll.GetList(this.IdHist, Constants.ExamenLab.Uroanalisis, true, string.Empty, DateTime.MinValue, short.MinValue);
		}

		#endregion rgDataLab_NeedDataSource

		#region rgFilesAttached_NeedDataSource

		protected void rgFilesAttached_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
		{
			AnexoHistoriaBll objBll = new AnexoHistoriaBll();
			this.rgFilesAttached.DataSource = objBll.GetList(this.IdHist, Constants.TipoRevision.Laboratorio, true, int.MinValue, string.Empty);
		}

		#endregion rgFilesAttached_NeedDataSource

		#region rgOrdenes_NeedDataSource

		protected void rgOrdenes_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
		{
			OrdenesHistoriaBll objBll = new OrdenesHistoriaBll();
			this.rgOrdenes.DataSource = objBll.GetList(this.IdHist, string.Empty);
		}

		#endregion rgOrdenes_NeedDataSource

		#region rcbxEmbajada_SelectedIndexChanged

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

		#endregion rcbxEmbajada_SelectedIndexChanged

		#region rdpFecNac_SelectedDateChanged

		protected void rdpFecNac_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
		{
		}

		#endregion rdpFecNac_SelectedDateChanged

		#region rgOrdenes_InsertCommand

		protected void rgOrdenes_InsertCommand(object sender, GridCommandEventArgs e)
		{
			OrdenesHistoriaBll objBll = new OrdenesHistoriaBll();
			GridEditableItem editColumn = (GridEditableItem)e.Item;
			Hashtable newValues = new Hashtable();
			e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editColumn);

			OrdenesHistoria objEnt = new OrdenesHistoria();
			objEnt.Descripcion = newValues["DESCRIPCION"].ToString();
			objEnt.MedicoTratante = newValues["MEDICO_TRATANTE"].ToString();
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

		#endregion rgOrdenes_InsertCommand

		#region chkRequiereNot_CheckedChanged

		protected void chkRequiereNot_CheckedChanged(object sender, EventArgs e)
		{
			this.chkNotEnv.Enabled = this.chkRequiereNot.Checked;
			this.chkNotEnv.Checked = !this.chkRequiereNot.Checked;
		}

		#endregion chkRequiereNot_CheckedChanged

		#region rgOrdendes_ItemDataBound

		protected void rgOrdendes_ItemDataBound(object sender, GridItemEventArgs e)
		{
			if (e.Item is GridEditFormItem && e.Item.IsInEditMode)
			{
				GridEditFormItem item = (GridEditFormItem)e.Item;
				TextBox txt = (TextBox)item["Descripcion"].Controls[0];
				txt.TextMode = TextBoxMode.MultiLine;
				txt.Rows = 6;
				txt.Width = new Unit(100, UnitType.Percentage);
			}
		}

		#endregion rgOrdendes_ItemDataBound

		#region rblEstado_SelectedIndexChanged

		protected void rblEstado_SelectedIndexChanged(object sender, EventArgs e)
		{
			this.pnlComMed.Visible = this.rblEstado.SelectedValue == "1";
		}

		#endregion rblEstado_SelectedIndexChanged

		#region rblEstadoRadGen_SelectedIndexChanged

		protected void rblEstadoRadGen_SelectedIndexChanged(object sender, EventArgs e)
		{
			this.pnlComRadMed.Visible = this.rblEstadoRadGen.SelectedValue == "1";
		}

		#endregion rblEstadoRadGen_SelectedIndexChanged

		#region rbtnSolExamen_Click

		/// <summary>
		///
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void rbtnSolExamen_Click(object sender, EventArgs e)
		{
			MuestraLaboratorioBll objBllHisMed = new MuestraLaboratorioBll();
			ArrayList idExamenes = new ArrayList();
			foreach (RadListBoxItem itm in this.lstMuestras.Items)
			{
				if (itm.Checked)
				{
					idExamenes.Add(itm.Value);
				}
			}

			string medComment = this.rtxtComSolExm.Text.Trim();

			if (idExamenes.Count <= 0)
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "errSolMuVal1", "alert('No ha seleccionado el tipo de examen que requiere sea realizado');", true);
				return;
			}

			if (!objBllHisMed.SolicitarMuestrasMedicina(this.IdHist, idExamenes, this.IdUserCurrent, medComment))
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "errSolMu", "alert('Se ha presentado un error al procesar la información\\n\\n" + Utilidades.AjustarMensajeError(objBllHisMed.Error) + "');", true);
			}
		}

		#endregion rbtnSolExamen_Click

		#region rtxtComSolExm_TextChanged

		/// <summary>
		///
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void rtxtComSolExm_TextChanged(object sender, EventArgs e)
		{
			ArrayList arr = new ArrayList();

			foreach (RadListBoxItem itm in this.lstMuestras.CheckedItems)
			{
				arr.Add(itm.Value);
			}

			if (arr.Count <= 0)
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "err", "alert('No ha seleccionado ninguna muestra para solicitar al personal de laboratorio');", true);
				return;
			}

			MuestraLaboratorioBll objBll = new MuestraLaboratorioBll();
			if (!objBll.SolicitarMuestrasMedicina(this.IdHist, arr, this.IdUserCurrent, this.rtxtComSolExm.Text.Trim()))
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "errSav", "alert('Se ha presentado el siguiente error al solicitar la nueva muestra a laboratorio');", true);
			}
			else
			{
				this.LoadInfoHist(this.IdHist);
			}
		}

		#endregion rtxtComSolExm_TextChanged

		#endregion Eventos

		#region Metodos

		#region LoadInfoHist

		/// <summary>
		///
		/// </summary>
		/// <param name="idHistoria"></param>
		private void LoadInfoHist(int idHistoria)
		{
			this.hfIdHist.Value = idHistoria.ToString();
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

			ExamenLaboratorioBll objBllExLab = new ExamenLaboratorioBll();
			Utilidades.LlenarLB(this.lstMuestras, objBllExLab.GetList(string.Empty, true, true, true, true, true, true, true, false), "ID", "NOMBRE");

			this.lstMuestras.Items.Add(new RadListBoxItem("BACILOSCOPIA", Convert.ToInt32(Constants.ExamenLab.Baciloscopia).ToString()));
			this.lstMuestras.Items.Add(new RadListBoxItem("CULTIVO", Convert.ToInt32(Constants.ExamenLab.Cultivo).ToString()));

			this.lstMuestras.DataBind();

			Utilidades.PosicionarRC(this.rcbxEmbajada, Convert.ToInt32(objEntTv.IdEmbajada).ToString());
			this.rcbxEmbajada_SelectedIndexChanged(this.rcbxEmbajada, null);
			Utilidades.PosicionarRC(this.rcbxTipoVisa, objEntHm.IdTipoVisa.ToString());

			Utilidades.PosicionarRC(rcbxTipoDoc, objEntPac.IdTipoDocumento.ToString());

			this.rdpFecha.SelectedDate = objEntHm.FechaIngreso;
			this.rtxtNombres.Text = objEntPac.Nombres;
			this.rtxtApellidos.Text = objEntPac.Apellidos;
			this.rtxtNumDoc.Text = objEntPac.NumeroDocumento;
			this.rtxtPasaporte.Text = objEntPac.NumeroPasaporte;

			this.rtxtCommentMedGen.Text = objEntHm.ComentarioMed;

			TipoVisaBll objTvBll = new TipoVisaBll();
			TipoVisa objTvEnt = objTvBll.Load(objEntHm.IdTipoVisa);

			this.EmbajadaCurr = (Constants.Embajadas)objTvEnt.IdEmbajada;

			this.rtxtNumVisa.Text = objEntHm.CodigoSolicitud;
			this.rblGenero.SelectedValue = Convert.ToByte(objEntPac.Genero).ToString();
			//this.rdpFecNac.SelectedDate = Convert.ToDateTime(objEntPac.FechaNacimiento.ToString("yyyy-MM-dd"));
			this.rdpFecNac.SelectedDate = objEntPac.FechaNacimiento;

			this.lblEdad.Text = objEntPac.EdadPaciente.ToString();
			this.lblCodigo.Text = objEntHm.CodigoSolicitud;
			this.lblEstatura.Text = Convert.ToDouble(objEntHm.Estatura * 100M).ToString();
			this.lblNombrePaciente.Text = objEntPac.Apellidos + " " + objEntPac.Nombres;
			this.lblPeso.Text = objEntHm.Peso.ToString();
			this.lblTipoVisa.Text = this.rcbxTipoVisa.SelectedItem.Text;

			this.rtxtCorreo.Text = objEntPac.Correo;
			this.rtxtDireccion.Text = objEntPac.Direccion;
			this.rtxtAcudiente.Text = objEntPac.Acudiente;
			this.rntPeso.Value = Convert.ToDouble(objEntHm.Peso);
			this.rntEstatura.Value = Convert.ToDouble(objEntHm.Estatura * 100M);

			try
			{
				this.rntBmi.Value = Convert.ToDouble(objEntHm.BMI);
			}
			catch
			{
				this.rntBmi.Value = null;
			}

			this.rtxtTelefono.Text = objEntPac.Telefono;
			this.rntPC.Value = objEntHm.PerimetroCefalico != decimal.MinValue ? Convert.ToDouble(objEntHm.PerimetroCefalico) : 0d;
			this.rntPC.Enabled = this.rfvPC.Enabled = objEntPac.FechaNacimiento > DateTime.Now.AddYears(-2);

			this.rblEstado.SelectedValue = Convert.ToByte(objEntHm.EstadoRevisionMed).ToString();

			this.chkRadTomada.Checked = objEntHm.RadiografiaTomada;
			this.chkCargEMedical.Checked = objEntHm.RadiografiaCargadaEmedical;
			this.chkNotEnv.Checked = objEntHm.NotificacionEnviada;
			this.chkRequiereNot.Checked = objEntHm.RequiereNotificacion;

			this.ChkRequiereNotificacion.Enabled = false;
			this.ChkNotificado.Enabled = false;

			this.pnlComMed.Visible = objEntHm.EstadoRevisionMed == Constants.EstadoRevision.Anormal;

			this.rtxtCommentLab.Text = objEntHm.ComentarioLab;
			this.rblEstadoLab.SelectedValue = Convert.ToByte(objEntHm.EstadoRevisionLab).ToString();

			this.rtxtCommentRad.Text = objEntHm.ComentarioRad;
			this.rblEstadoRad.SelectedValue = Convert.ToByte(objEntHm.EstadoRevisionRad).ToString();

			this.pnlComRad.Visible = objEntHm.EstadoRevisionRad == Constants.EstadoRevision.Anormal;

			this.rtxtCommentRadGen.Text = objEntHm.ComentarioRadMed;
			this.rblEstadoRadGen.SelectedValue = Convert.ToByte(objEntHm.EstadoRevisionRadMed).ToString();

			this.pnlComRadMed.Visible = objEntHm.EstadoRevisionRadMed == Constants.EstadoRevision.Anormal;

			this.LoadImgPerfilPaciente(idHistoria, this.imgPrePhoto);

			this.rbtnCerrarRetorno.Enabled = this.rbtnCerrarRetorno.Visible = objEntHm.RetornadoEmbajada;
		}

		#endregion LoadInfoHist

		#endregion Metodos
	}
}