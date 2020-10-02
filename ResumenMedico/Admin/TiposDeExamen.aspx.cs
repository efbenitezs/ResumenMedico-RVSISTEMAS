using System;
using System.Collections;
using ResumenMedico.Controls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico.Admin
{
	public partial class TiposDeExamen : BasePage
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

		protected void gvExamenLaboratorio_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
		{
			ExamenLaboratorioBll objBll = new ExamenLaboratorioBll();
			gvExamenLaboratorio.DataSource = objBll.GetList(string.Empty, false, false, false, false, false, false, true, true);
		}

		protected void gvExamenLaboratorio_InsertCommand(object sender, GridCommandEventArgs e)
		{
			this.SaveInfo(true, e);
		}

		protected void gvExamenLaboratorio_UpdateCommand(object sender, GridCommandEventArgs e)
		{
			this.SaveInfo(false, e);
		}

		private void SaveInfo(bool isCreate, GridCommandEventArgs e)
		{
			//Capturar la fila que se va a editar

			GridEditableItem editColumn = (GridEditableItem)e.Item;
			Hashtable newValues = new Hashtable();
			e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editColumn);

			string nombreObj = newValues["NOMBRE"].ToString();
			bool activoObj = Convert.ToBoolean(newValues["ACTIVO"]);

			ExamenLaboratorioBll objBllSave = new ExamenLaboratorioBll();
			ExamenLaboratorio objEntity = new ExamenLaboratorio();

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

			objEntity.Nombre = nombreObj;
			objEntity.Activo = activoObj;
			objEntity.IdUltimaModificacion = this.IdUserCurrent;
			objEntity.FechaUltimaModificacion = DateTime.Now;

			if (!objBllSave.Save(objEntity))
			{
				//objBllSave.Error;
				string mensaje = string.Format("{0}", objBllSave.Error);
				erroresCarga.Text = mensaje;
			}
			else
			{
				this.gvExamenLaboratorio.EditIndexes.Clear();
				this.gvExamenLaboratorio.Rebind();
			}
		}

		protected void gvExamenLaboratorio_DeleteCommand(object sender, GridCommandEventArgs e)
		{
			GridEditableItem editColumn = (GridEditableItem)e.Item;
			int idToDelete = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[editColumn.ItemIndex]["ID"]);

			ExamenLaboratorioBll objBllSave = new ExamenLaboratorioBll();
			ExamenLaboratorio objEntity = new ExamenLaboratorio();

			objEntity.Id = idToDelete;
			objEntity.IdUltimaModificacion = this.IdUserCurrent;

			if (!objBllSave.Delete(objEntity))
			{
				this.gvExamenLaboratorio.Rebind();
				string mensaje = string.Format("{0}", objBllSave.Error);
				erroresCarga.Text = mensaje;
			}
			else
			{
				this.gvExamenLaboratorio.Rebind();
			}
		}
	}
}