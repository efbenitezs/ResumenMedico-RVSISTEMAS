using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResumenMedico.Controls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico
{
	public partial class InfoPaciente : BasePage
	{
		protected int IdHist
		{
			get
			{
				return ViewState["IdH"] != null ? Convert.ToInt32(ViewState["IdH"]) : int.MinValue;
			}
			set
			{
				if (ViewState["IdH"] != null)
				{
					ViewState["IdH"] = value;
				}
				else
				{
					ViewState.Add("IdH", value);
				}
			}
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			if (this.IdUserCurrent != int.MinValue)
			{
				if (!IsPostBack)
				{
					this.LoadLists();
					this.IdHist = Convert.ToInt32(this.GetValueFromRequest("IdHist", int.MinValue.ToString()));
					if (IdHist != int.MinValue)
					{
						this.LoadInfoHist();
					}
				}
			}
			else
			{
				Response.Redirect(ResolveUrl("~/Login.aspx"), true);
			}
		}

		protected void rbtnValidate_Click(object sender, EventArgs e)
		{
			if (this.rcbxTipoDoc.SelectedValue != string.Empty && this.rtxtNumDoc.Text.Trim() != string.Empty)
			{
				List<Paciente> arr = new PacienteBll().GetPacientes(
				Convert.ToInt32(rcbxTipoDoc.SelectedValue),
				this.rtxtNumDoc.Text.Trim(),
				string.Empty,
				string.Empty,
				string.Empty,
				true,
				true,
				DateTime.MinValue);
				if (arr.Count > 0)
				{
					this.hdIdPaciente.Value = arr[0].Id.ToString();
					this.rtxtNombres.Text = arr[0].Nombres;
					this.rtxtApellidos.Text = arr[0].Apellidos;
					this.rtxtAcudiente.Text = arr[0].Acudiente;
					this.rtxtCorreo.Text = arr[0].Correo;
					this.rtxtDireccion.Text = arr[0].Direccion;
					this.rdpFecNac.SelectedDate = arr[0].FechaNacimiento;
					this.rblGenero.SelectedValue = Convert.ToByte(arr[0].Genero).ToString();
					this.rtxtGeneroValue.Text = rblGenero.SelectedValue;
					this.rtxtTelefono.Text = arr[0].Telefono;
				}
			}
		}

		protected void rcbxEmbajada_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
		{
			if (this.rcbxEmbajada.SelectedValue != string.Empty)
			{
				TipoVisaBll objBll = new TipoVisaBll();
				this.EmbajadaCurr = (Constants.Embajadas)Convert.ToInt32(this.rcbxEmbajada.SelectedValue);
				Utilidades.LlenarRC(this.rcbxTipoVisa, objBll.GetList(string.Empty, this.EmbajadaCurr, false, true, false), "ID", "NOMBRE", true);
			}
			else
			{
				Utilidades.LlenarRCEnBlanco(this.rcbxTipoVisa);
				this.EmbajadaCurr = Constants.Embajadas.Colombia;
			}
		}

		protected void rbtnGuardar_Click(object sender, EventArgs e)
		{
			Paciente objEntPac = new Paciente();
			HistoriaMedica objEntHisMed = new HistoriaMedica();
			objEntPac.Id = this.hdIdPaciente.Value != string.Empty ? Convert.ToInt32(this.hdIdPaciente.Value) : int.MinValue;
			objEntPac.IdTipoDocumento = Convert.ToInt32(this.rcbxTipoDoc.SelectedValue);
			objEntPac.NumeroDocumento = this.rtxtNumDoc.Text.Trim();
			objEntPac.Genero = Convert.ToBoolean(Convert.ToByte(this.rblGenero.SelectedValue));
			objEntPac.Nombres = this.rtxtNombres.Text.Trim();
			objEntPac.Apellidos = this.rtxtApellidos.Text.Trim();
			objEntPac.Correo = this.rtxtCorreo.Text.Trim();
			objEntPac.Acudiente = this.rtxtAcudiente.Text.Trim();
			objEntPac.Direccion = this.rtxtDireccion.Text.Trim();
			objEntPac.FechaNacimiento = (DateTime)this.rdpFecNac.SelectedDate;
			objEntPac.Telefono = this.rtxtTelefono.Text.Trim();

			if (this.hfIdHistoria.Value != string.Empty)
			{
				HistoriaMedicaBll objHmBll = new HistoriaMedicaBll();
				objEntHisMed = objHmBll.Load(Convert.ToInt32(this.hfIdHistoria.Value));
				objEntHisMed.IdUltimaModificacion = this.IdUserCurrent;
				objEntHisMed.FechaUltimaModificacion = DateTime.Now;
			}
			else
			{
				objEntHisMed.FechaIngreso = DateTime.Now;
				objEntHisMed.IdCreacion = objEntHisMed.IdUltimaModificacion = this.IdUserCurrent;
				objEntHisMed.FechaCreacion = objEntHisMed.FechaUltimaModificacion = DateTime.Now;
			}

			objEntHisMed.IdTipoVisa = Convert.ToInt32(this.rcbxTipoVisa.SelectedValue);
			objEntHisMed.CodigoSolicitud = this.rtxtNumVisa.Text.Trim();

			objEntHisMed.TieneRevisionMed = this.chckbxMed.Checked;
			objEntHisMed.EstadoRevisionLab = Constants.EstadoRevision.SinAplicar;

			objEntHisMed.TieneRevisionRad = this.chckbxRad.Checked;
			objEntHisMed.EstadoRevisionRad = Constants.EstadoRevision.SinAplicar;
			objEntHisMed.EstadoRevisionRadMed = Constants.EstadoRevision.SinAplicar;

			objEntHisMed.TieneRevisonLab = this.chckbxLab.Checked;
			objEntHisMed.EstadoRevisionMed = Constants.EstadoRevision.SinAplicar;

			objEntHisMed.RequiereNotificacion = this.chkRequiereNot.Checked;
			objEntHisMed.NotificacionEnviada = this.chkNotEnv.Checked;
			objEntHisMed.PacienteExterno = this.chkPacienteExterno.Checked;

			if (objEntPac.Id == int.MinValue)
			{
				objEntPac.IdCreacion = this.IdUserCurrent;
				objEntPac.FechaCreacion = DateTime.Now;
			}

			objEntPac.IdUltimaModificacion = this.IdUserCurrent;
			objEntPac.FechaUltimaModificacion = DateTime.Now;

			PacienteBll objSave = new PacienteBll();

			ArrayList examenes = new ArrayList();
			if (this.rlbExamenes.CheckedItems.Count > 0)
			{
				foreach (RadListBoxItem item in this.rlbExamenes.CheckedItems)
				{
					examenes.Add(Convert.ToInt32(item.Value));
				}
			}

			//UploadedFile fotoCargada = null;
			Stream dataFoto = null;
			//MemoryStream foto = new MemoryStream(this.imgPrePhoto.DataValue);
			//dataFoto = foto;
			if (this.ruTestFoto.UploadedFiles.Count > 0)
			{
				//fotoCargada = this.rauFoto.UploadedFiles[0];
				//dataFoto = fotoCargada.InputStream;
				dataFoto = this.ruTestFoto.UploadedFiles[0].InputStream;
			}

			if (!objSave.IngresarPaciente(objEntPac, objEntHisMed, examenes, dataFoto, this.PathFilesToAttach))
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ErrCreatePat", "alert('El paciente no ha podido ser ingresado al sistema a continuacion se indica la causa, si el problema persiste por favor contacte al administrador\\n\\n" + Utilidades.AjustarMensajeError(objSave.Error) + "');", true);
			}
			else
			{
				this.rbtnFirmar.Visible = true;
				this.hfIdHistoria.Value = objEntHisMed.Id.ToString();
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "savedOk", "alert('El paciente ha sido creado correctamente');", true);
				this.LoadImgPerfilPaciente(objEntHisMed.Id, this.imgPrePhoto);
			}
		}

		protected void rauFoto_FileUploaded(object sender, FileUploadedEventArgs e)
		{
			/*
            BinaryReader reader = new BinaryReader(e.File.InputStream);
            Byte[] data = reader.ReadBytes((int)e.File.InputStream.Length);
            imgPrePhoto.DataValue = data;
            imgPrePhoto.Width = new Unit(250, UnitType.Pixel);
            imgPrePhoto.Height = new Unit(300, UnitType.Pixel);
            */
		}

		protected void rdpFecNac_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
		{
			if (this.rdpFecNac.SelectedDate != null)
			{
				DateTime fechaActual = DateTime.Now;
				if (fechaActual.AddYears(-15) < Convert.ToDateTime(this.rdpFecNac.SelectedDate))
				{
					this.rfvAcudiente.Enabled = true;
				}
				else
				{
					this.rfvAcudiente.Enabled = false;
				}
			}
			else
			{
				this.rfvAcudiente.Enabled = false;
			}
		}

		protected void rblGenero_SelectedIndexChanged(object sender, EventArgs e)
		{
			this.rtxtGeneroValue.Text = rblGenero.SelectedValue;
		}

		protected void chkRequiereNot_CheckedChanged(object sender, EventArgs e)
		{
			this.chkNotEnv.Enabled = this.chkRequiereNot.Checked;
			this.chkNotEnv.Checked = false;
		}

		#region Metodos

		#region LoadLists

		private void LoadLists()
		{
			TipoDocumentoBll objTipDocBll = new TipoDocumentoBll();
			EmbajadaBll objEmbjBll = new EmbajadaBll();
			ExamenLaboratorioBll objExmLabBll = new ExamenLaboratorioBll();

			Utilidades.LlenarRC(this.rcbxTipoDoc, objTipDocBll.GetList(string.Empty, true, false), "ID", "NOMBRE", true);
			Utilidades.LlenarRC(this.rcbxEmbajada, objEmbjBll.GetList(string.Empty, true, false), "ID", "NOMBRE", true);
			Utilidades.LlenarRCEnBlanco(this.rcbxTipoVisa);

			Utilidades.LlenarLB(this.rlbExamenes, objExmLabBll.GetList(string.Empty, true, true, true, true, true, true, true, false), "ID", "NOMBRE");
		}

		#endregion LoadLists

		#region LoadInfoHist

		private void LoadInfoHist()
		{
			HistoriaMedicaBll objBllHm = new HistoriaMedicaBll();
			HistoriaMedica objEntHm = objBllHm.Load(this.IdHist);

			if (objEntHm.Id != int.MinValue)
			{
				this.hfIdHistoria.Value = objEntHm.Id.ToString();
				PacienteBll objBllPac = new PacienteBll();
				Paciente objEntPac = objBllPac.Load(objEntHm.IdPaciente);
				if (objEntPac.Id != int.MinValue)
				{
					TipoVisaBll objBllTv = new TipoVisaBll();
					TipoVisa objEntTv = objBllTv.Load(objEntHm.IdTipoVisa);
					MuestraLaboratorioBll resHistoria = new MuestraLaboratorioBll();
					AnexoHistoriaBll anexoHist = new AnexoHistoriaBll();
					DataTable examenes = new DataTable();
					DataTable anexos = new DataTable();

					this.EmbajadaCurr = objEntTv.IdEmbajada;

					Utilidades.PosicionarRC(this.rcbxTipoDoc, objEntPac.IdTipoDocumento.ToString());
					this.rtxtNumDoc.Text = objEntPac.NumeroDocumento;
					this.hdIdPaciente.Value = objEntPac.Id.ToString();
					this.rtxtNombres.Text = objEntPac.Nombres;
					this.rtxtApellidos.Text = objEntPac.Apellidos;
					this.rtxtAcudiente.Text = objEntPac.Acudiente;
					this.rtxtCorreo.Text = objEntPac.Correo;
					this.rtxtDireccion.Text = objEntPac.Direccion;
					this.rdpFecNac.SelectedDate = objEntPac.FechaNacimiento;
					this.rblGenero.SelectedValue = Convert.ToByte(objEntPac.Genero).ToString();
					this.rtxtGeneroValue.Text = rblGenero.SelectedValue;
					Utilidades.PosicionarRC(this.rcbxEmbajada, Convert.ToInt32(objEntTv.IdEmbajada).ToString());
					this.rcbxEmbajada_SelectedIndexChanged(rcbxEmbajada, null);
					Utilidades.PosicionarRC(this.rcbxTipoVisa, objEntHm.IdTipoVisa.ToString());
					this.rtxtNumVisa.Text = objEntHm.CodigoSolicitud;
					this.rtxtTelefono.Text = objEntPac.Telefono;
					this.chckbxMed.Checked = Convert.ToBoolean(objEntHm.TieneRevisionMed);
					this.chckbxRad.Checked = Convert.ToBoolean(objEntHm.TieneRevisionRad);
					this.chckbxLab.Checked = Convert.ToBoolean(objEntHm.TieneRevisonLab);
					this.chkRequiereNot.Checked = objEntHm.RequiereNotificacion;
					this.chkRequiereNot.Enabled = !objEntHm.RequiereNotificacion;
					this.chkNotEnv.Checked = objEntHm.NotificacionEnviada;
					this.chkNotEnv.Enabled = objEntHm.RequiereNotificacion;
					this.chkPacienteExterno.Checked = objEntHm.PacienteExterno;
					this.LoadImgPerfilPaciente(this.IdHist, this.imgPrePhoto);

					this.rbtnFirmar.Visible = true;

					examenes = resHistoria.GetList(objEntHm.Id, Constants.ExamenLab.Creatinina, true, string.Empty, DateTime.MinValue, short.MinValue);

					foreach (DataRow dr in examenes.Rows)
					{
						string idExamen = Convert.ToString(dr["ID_TIPO_EXAMEN"]);
						this.rlbExamenes.FindItemByValue(idExamen).Checked = true;
						this.rlbExamenes.FindItemByValue(idExamen).Enabled = false;
					}

					anexos = anexoHist.GetList(objEntHm.Id, Constants.TipoRevision.Laboratorio, true, int.MinValue, string.Empty);
					foreach (DataRow dr in anexos.Rows)
					{
						string fileName = Convert.ToString(dr["NOMBRE_ARCHIVO"]);
						switch (fileName)
						{
							case "ImgPaciente.png":
							case "ConsCan.pdf":
							case "ConsNZ.pdf":
							case "ConsVih.pdf":
							case "ConsVenPun.pdf":

								string txtBoton;
								txtBoton = fileName;
								fileName = fileName + "_" + objEntHm.Id;

								LinkButton link = new LinkButton();
								link.ID = fileName;
								link.OnClientClick = "abrir(this)";

								switch (txtBoton)
								{
									case "ImgPaciente.png":
										link.Text = "Imagen del paciente";
										break;

									case "ConsCan.pdf":
										link.Text = "Consentimiento embajada Canadá";
										break;

									case "ConsNZ.pdf":
										link.Text = "Consentimiento embajada Nueva Zelanda";
										break;

									case "ConsVih.pdf":
										link.Text = "Consentimiento examen VIH";
										break;

									case "ConsVenPun.pdf":
										link.Text = "Consentimiento de venopunción";
										break;
								}

								link.CssClass = "uriBtn";

								this.listaAnexos.Controls.Add(link);
								LiteralControl lcBr = new LiteralControl("<br />");
								this.listaAnexos.Controls.Add(lcBr);
								break;

							default:
								break;
						}
					}
				}
				else
				{
					//TODO: hay que mirar que se le presenta al usuario
				}
			}
			else
			{
				//TODO: hay que mirar que se le presenta al usuario
			}
		}

		#endregion LoadInfoHist

		#endregion Metodos
	}
}