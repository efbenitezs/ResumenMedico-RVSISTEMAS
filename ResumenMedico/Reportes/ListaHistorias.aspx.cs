using System;
using System.Data;
using ResumenMedico.Controls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico.Reportes
{
	public partial class ListaHistorias : BasePage
	{
		private bool IsFilterLoad
		{
			get
			{
				return ViewState["IsFl"] != null ? Convert.ToBoolean(ViewState["IsFl"]) : true;
			}
			set
			{
				if (ViewState["IsFl"] != null)
				{
					ViewState["IsFl"] = value;
				}
				else
				{
					ViewState.Add("IsFl", value);
				}
			}
		}

		private DataTable dtSource
		{
			get
			{
				return ViewState["dtSrc"] != null ? (DataTable)ViewState["dtSrc"] : new DataTable();
			}
			set
			{
				if (ViewState["dtSrc"] != null)
				{
					ViewState["dtSrc"] = value;
				}
				else
				{
					ViewState.Add("dtSrc", value);
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
			this.EmbajadaCurr = RMEntity.Constants.Embajadas.Colombia;
		}

		private void LoadLists()
		{
			EmbajadaBll objEmbBll = new EmbajadaBll();
			TipoDocumentoBll objTDBll = new TipoDocumentoBll();
			PacienteBll objBllPac = new PacienteBll();
			UsuarioBll objBllUser = new UsuarioBll();

			DataTable dtEmb = objEmbBll.GetList(string.Empty, true, false);
			DataTable dtTipDoc = objTDBll.GetList(string.Empty, true, false);
			/*
            Utilidades.LlenarRC(this.rcbxEmbajada, objEmbBll.GetList(string.Empty, true, false), "ID", "NOMBRE", true);
            Utilidades.LlenarRC(this.rcbxTipoDoc, objTDBll.GetList(string.Empty, true, false), "ID", "NOMBRE", true);
            */

			Utilidades.LlenarRC(rcFiltroEmb, dtEmb, "ID", "NOMBRE", true);

			Utilidades.LlenarRC(this.rcMedico, objBllUser.GetList(string.Empty, string.Empty, string.Empty, int.MinValue, Constants.Perfiles.MedicoGeneral, false, true, true, true, true, true, false), "ID", "NOMBRE_COMPLETO", true);

			DataTable dtSingle = this.RemoveDuplicateRows(objBllPac.GetList(int.MinValue, string.Empty, string.Empty, string.Empty, string.Empty, true, true, DateTime.MinValue), "NOMBRES");
			dtSingle.DefaultView.Sort = "NOMBRES ASC";

			/*
            DataTable dtSingleNums = RemoveDuplicateRows(objBllPac.GetList(int.MinValue, string.Empty, string.Empty, string.Empty, true, true, DateTime.MinValue), "NUMERO_DOCUMENTO");
            dtSingleNums.DefaultView.Sort = "NOMBRES ASC";
            */

			Utilidades.LlenarRC(rcFiltroNombre, dtSingle, "NOMBRES", "NOMBRES", true);

			//Utilidades.LlenarRC(rcNumId, dtSingleNums, "NUMERO_DOCUMENTO", "NUMERO_DOCUMENTO", true);

			dtSingle = this.RemoveDuplicateRows(objBllPac.GetList(int.MinValue, string.Empty, string.Empty, string.Empty, string.Empty, true, true, DateTime.MinValue), "APELLIDOS");
			dtSingle.DefaultView.Sort = "APELLIDOS ASC";

			Utilidades.LlenarRC(rcFiltroApellido, dtSingle, "APELLIDOS", "APELLIDOS", true);
		}

		private void lnkSalir_Click(object sender, EventArgs e)
		{
			Response.Redirect(ResolveUrl("~/Login.aspx"), true);
		}

		protected void rgData_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
		{
			this.rgData.DataSource = this.dtSource;
		}

		protected void rbtnFiltrarLista_Click(object sender, EventArgs e)
		{
			this.dtSource = new HistoriaMedicaBll().GetListaHistoriaReporte(
				this.rdpFechaIngIni.SelectedDate.HasValue ? Convert.ToDateTime((object)this.rdpFechaIngIni.SelectedDate) : DateTime.MinValue,
				this.rdpFechaIngFin.SelectedDate.HasValue ? Convert.ToDateTime((object)this.rdpFechaIngFin.SelectedDate) : DateTime.MinValue,
				this.rcOperFecha.SelectedValue != string.Empty ? Convert.ToInt32(this.rcOperFecha.SelectedValue) : 0,
				this.rcFiltroNombre.SelectedValue,
				this.rcOperNombre.SelectedValue != string.Empty ? Convert.ToInt32(this.rcOperNombre.SelectedValue) : 0,
				this.rcFiltroApellido.SelectedValue,
				this.rcOperApellido.SelectedValue != string.Empty ? Convert.ToInt32(this.rcOperApellido.SelectedValue) : 0,
				this.rcFiltroEmb.SelectedValue != string.Empty ? Convert.ToInt32(this.rcFiltroEmb.SelectedValue) : 0,
				this.rcOperEmbajada.SelectedValue != string.Empty ? Convert.ToInt32(this.rcOperEmbajada.SelectedValue) : 0,
				this.rtxtNumDoc.Text.Trim(),
				this.rcOperNumDoc.SelectedValue != string.Empty ? Convert.ToInt32(this.rcOperNumDoc.SelectedValue) : 0,
				Convert.ToByte(this.rcCierreHis.SelectedValue),
				this.rcOperCierre.SelectedValue != string.Empty ? Convert.ToInt32(this.rcOperCierre.SelectedValue) : 0,
				this.rcMedico.SelectedValue != string.Empty ? Convert.ToInt32(this.rcMedico.SelectedValue) : int.MinValue,
				this.rcOperMedico.SelectedValue != string.Empty ? Convert.ToInt32(this.rcOperMedico.SelectedValue) : 0,
				Convert.ToByte(this.rcLiberado.SelectedValue),
				this.rcOperLiberado.SelectedValue != string.Empty ? Convert.ToInt32(this.rcOperLiberado.SelectedValue) : 0,
				((RadInputControl)this.rtxtPasaporte).Text.Trim(),
				this.rcOperPasaporte.SelectedValue != string.Empty ? Convert.ToInt32(this.rcOperPasaporte.SelectedValue) : 0);
			this.rgData.Rebind();
		}

		protected void rbtnLimpiar_Click(object sender, EventArgs e)
		{
			DateTime fechaIn = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
			DateTime fechaFin = fechaIn.AddDays(1);
			this.rdpFechaIngIni.SelectedDate = fechaIn;
			this.rdpFechaIngFin.SelectedDate = fechaFin;
			Utilidades.PosicionarRC(this.rcOperFecha, "1");
			Utilidades.PosicionarRC(this.rcOperNombre, "1");
			Utilidades.PosicionarRC(this.rcOperApellido, "1");
			Utilidades.PosicionarRC(this.rcOperEmbajada, "1");
			Utilidades.PosicionarRC(this.rcOperNumDoc, "1");
			Utilidades.PosicionarRC(this.rcOperCierre, "1");
			Utilidades.PosicionarRC(this.rcOperMedico, "1");
			Utilidades.PosicionarRC(this.rcOperLiberado, "1");

			Utilidades.PosicionarRC(this.rcFiltroNombre, "");
			Utilidades.PosicionarRC(this.rcFiltroApellido, "");
			Utilidades.PosicionarRC(this.rcFiltroEmb, "");
			Utilidades.PosicionarRC(this.rcCierreHis, "2");
			Utilidades.PosicionarRC(this.rcMedico, "");
			Utilidades.PosicionarRC(this.rcLiberado, "2");
			this.rtxtNumDoc.Text = string.Empty;
		}

		protected void rbtnVerTodos_Click(object sender, EventArgs e)
		{
			this.dtSource = new HistoriaMedicaBll().GetListaHistoriaReporte(DateTime.MinValue, DateTime.MinValue, 1, "", 1, "", 1, int.MinValue, 1, "", 1, 2, 1, int.MinValue, 1, 2, 1, "", 1);
			this.rgData.Rebind();
		}

		protected void rgData_ItemDataBound(object sender, GridItemEventArgs e)
		{
			if (e.Item.ItemType == GridItemType.AlternatingItem || e.Item.ItemType == GridItemType.Item)
			{
				GridDataItem gdItem = (GridDataItem)e.Item;
				DataRowView drData = (DataRowView)e.Item.DataItem;
				bool isElim = Convert.ToBoolean(Convert.ToByte(drData["FINALIZADA"]));
				gdItem["EliminarHistoria"].Visible = !isElim;
			}
		}

		protected void rgData_ItemCommand(object sender, GridCommandEventArgs e)
		{
			if (e.CommandName == "DelHist")
			{
				HistoriaMedicaBll objHmBll = new HistoriaMedicaBll();
				int idHistToDel = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ID"]);

				if (!objHmBll.Delete(idHistToDel, this.IdUserCurrent, this.PathFilesToAttach))
				{
					RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "erDelHist", "alert('Se ha presentado un inconveniente al eliminar \\n\\n" + Utilidades.AjustarMensajeError(objHmBll.Error) + "');", true);
				}
				else
				{
					this.rgData.Rebind();
				}
			}
		}
	}
}