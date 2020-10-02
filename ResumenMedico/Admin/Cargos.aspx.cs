using System;
using System.Collections;
using ResumenMedico.Controls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico.Admin
{
	public partial class Cargos : BasePage
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

		protected void gvCargos_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
		{
			CargoBll objBll = new CargoBll();
			gvCargos.DataSource = objBll.GetList(string.Empty, true, true);
		}

		protected void gvCargos_InsertCommand(object sender, GridCommandEventArgs e)
		{
			this.SaveInfo(true, e);
		}

		protected void gvCargos_UpdateCommand(object sender, GridCommandEventArgs e)
		{
			this.SaveInfo(false, e);
		}

		private void SaveInfo(bool isCreate, GridCommandEventArgs e)
		{
			//Capturar la fila que se va a editar

			GridEditableItem editColumn = (GridEditableItem)e.Item;
			Hashtable newValues = new Hashtable();
			e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editColumn);

			string nombreObj = newValues["NOMBRE_CARGO"].ToString();
			bool activoObj = Convert.ToBoolean(newValues["ACTIVO"]);

			CargoBll objBllSave = new CargoBll();
			Cargo objEntity = new Cargo();

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

			objEntity.NombreCargo = nombreObj;
			objEntity.Activo = activoObj;
			objEntity.IdUltimaModificacion = this.IdUserCurrent;
			objEntity.FechaUltimaModificacion = DateTime.Now;

			if (!objBllSave.Save(objEntity))
			{
				//objBllSave.Error;
				this.gvCargos.EditIndexes.Clear();
				this.gvCargos.Rebind();
				string mensaje = string.Format("{0}", objBllSave.Error);
				erroresCarga.Text = mensaje;
			}
			else
			{
				this.gvCargos.EditIndexes.Clear();
				this.gvCargos.Rebind();
			}
		}

		protected void gvCargos_DeleteCommand(object sender, GridCommandEventArgs e)
		{
			GridEditableItem editColumn = (GridEditableItem)e.Item;
			int idToDelete = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[editColumn.ItemIndex]["ID"]);

			CargoBll objBllSave = new CargoBll();
			Cargo objEntity = new Cargo();

			objEntity.Id = idToDelete;
			objEntity.IdUltimaModificacion = this.IdUserCurrent;

			if (!objBllSave.Delete(objEntity))
			{
			}
			else
			{
				this.gvCargos.Rebind();
			}
		}
	}
}