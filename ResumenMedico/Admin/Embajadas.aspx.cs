using System;
using System.Collections;
using ResumenMedico.Controls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico.Admin
{
	public partial class Embajadas : BasePage
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

		protected void gvEmbajadas_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
		{
			EmbajadaBll objBll = new EmbajadaBll();
			gvEmbajadas.DataSource = objBll.GetList(string.Empty, true, true);
		}

		protected void gvEmbajadas_InsertCommand(object sender, GridCommandEventArgs e)
		{
			this.SaveInfo(true, e);
		}

		protected void gvEmbajadas_UpdateCommand(object sender, GridCommandEventArgs e)
		{
			this.SaveInfo(false, e);
		}

		private void SaveInfo(bool isCreate, GridCommandEventArgs e)
		{
			GridEditableItem editColumn = (GridEditableItem)e.Item;
			Hashtable newValues = new Hashtable();
			e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editColumn);

			string nombreEmb = newValues["NOMBRE"].ToString();
			bool activo = Convert.ToBoolean(newValues["ACTIVO"]);

			EmbajadaBll objBllSave = new EmbajadaBll();
			Embajada objEntity = new Embajada();

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

			objEntity.Nombre = nombreEmb;
			objEntity.Activo = activo;
			objEntity.IdUltimaModificacion = this.IdUserCurrent;
			objEntity.FechaUltimaModificacion = DateTime.Now;

			if (!objBllSave.Save(objEntity))
			{
				//objBllSave.Error;
				this.gvEmbajadas.EditIndexes.Clear();
				this.gvEmbajadas.Rebind();
				string mensaje = string.Format("{0}", objBllSave.Error);
				erroresCarga.Text = mensaje;
			}
			else
			{
				this.gvEmbajadas.EditIndexes.Clear();
				this.gvEmbajadas.Rebind();
			}
		}

		protected void gvEmbajadas_DeleteCommand(object sender, GridCommandEventArgs e)
		{
			GridEditableItem editColumn = (GridEditableItem)e.Item;
			int idToDelete = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[editColumn.ItemIndex]["ID"]);

			EmbajadaBll objBllSave = new EmbajadaBll();
			Embajada objEntity = new Embajada();

			objEntity.Id = idToDelete;
			objEntity.IdUltimaModificacion = this.IdUserCurrent;

			if (!objBllSave.Delete(objEntity))
			{
			}
			else
			{
				this.gvEmbajadas.Rebind();
			}
		}
	}
}