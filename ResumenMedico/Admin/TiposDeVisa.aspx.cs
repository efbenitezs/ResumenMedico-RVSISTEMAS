using System;
using System.Collections;
using ResumenMedico.Controls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico.Admin
{
	public partial class TiposDeVisa : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (this.IdUserCurrent != int.MinValue)
			{
				//si no es el perfil debe excluirlo
				if (!this.IsAdmin)
				{
					Response.Redirect(ResolveUrl("~/Inicio.aspx"), true);
				}
				Session["ShowMenu"] = true;
				Session["ShowConsultorio"] = false;
			}
		}

		protected void gvTipoVisa_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
		{
			TipoVisaBll objBll = new TipoVisaBll();
			gvTipoVisa.DataSource = objBll.GetList(string.Empty, Constants.Embajadas.Colombia, true, true, true);
		}

		protected void gvTipoVisa_InsertCommand(object sender, GridCommandEventArgs e)
		{
			this.SaveInfo(true, e);
		}

		protected void gvTipoVisa_UpdateCommand(object sender, GridCommandEventArgs e)
		{
			this.SaveInfo(false, e);
		}

		private void SaveInfo(bool isCreate, GridCommandEventArgs e)
		{
			//Capturar la fila que se va a editar

			GridEditableItem editColumn = (GridEditableItem)e.Item;
			Hashtable newValues = new Hashtable();
			e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editColumn);

			string nombre = newValues["NOMBRE"].ToString();
			Constants.Embajadas idEmbaj = (Constants.Embajadas)Convert.ToInt32(newValues["ID_EMBAJADA"]);
			bool activoObj = Convert.ToBoolean(newValues["ACTIVO"]);

			TipoVisaBll objBllSave = new TipoVisaBll();
			TipoVisa objEntity = new TipoVisa();

			if (isCreate)
			{
				objEntity.IdCreacion = this.IdUserCurrent;
				objEntity.FechaCreacion = DateTime.Now;
			}
			else
			{
				int idToUpdate = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[editColumn.ItemIndex]["ID"]);
				objEntity.Id = idToUpdate;
			}

			objEntity.Nombre = nombre;
			objEntity.IdEmbajada = idEmbaj;
			objEntity.Activo = activoObj;
			objEntity.IdUltimaModificacion = this.IdUserCurrent;
			objEntity.FechaUltimaModificacion = DateTime.Now;

			if (!objBllSave.Save(objEntity))
			{
				this.gvTipoVisa.EditIndexes.Clear();
				this.gvTipoVisa.Rebind();
				erroresCarga.Text = objBllSave.Error;
			}
			else
			{
				this.gvTipoVisa.EditIndexes.Clear();
				this.gvTipoVisa.Rebind();
			}
		}

		protected void gvTipoVisa_DeleteCommand(object sender, GridCommandEventArgs e)
		{
			GridEditableItem editColumn = (GridEditableItem)e.Item;
			int idToDelete = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[editColumn.ItemIndex]["ID"]);

			TipoVisaBll objBllSave = new TipoVisaBll();
			TipoVisa objEntity = new TipoVisa();

			objEntity.Id = idToDelete;
			objEntity.IdUltimaModificacion = this.IdUserCurrent;

			if (!objBllSave.Delete(objEntity))
			{
				this.gvTipoVisa.Rebind();
				string mensaje = string.Format("{0}", objBllSave.Error);
				erroresCarga.Text = mensaje;
			}
			else
			{
				this.gvTipoVisa.Rebind();
			}
		}
	}
}