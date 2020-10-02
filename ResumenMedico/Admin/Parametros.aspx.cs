using System;
using System.Collections;
using ResumenMedico.Controls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico.Admin
{
	public partial class Parametros : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (this.IdUserCurrent != int.MinValue)
			{
				if (!this.IsAdmin)
				{
					Response.Redirect(ResolveUrl("~/Inicio.aspx"), true);
				}
				Session["ShowMenu"] = true;
				Session["ShowConsultorio"] = false;
			}
		}

		protected void rgData_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
		{
			ParametroBll objDataSource = new ParametroBll();
			this.rgData.DataSource = objDataSource.GetList(Constants.Parametros.NombreDoctor, true, string.Empty);
		}

		protected void rgData_UpdateCommand(object sender, GridCommandEventArgs e)
		{
			Parametro objEntity = new Parametro();
			ParametroBll objBll = new ParametroBll();

			Constants.Parametros idParametro = (Constants.Parametros)Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ID"]);

			objEntity = objBll.Load(idParametro);

			GridEditableItem editItem = (GridEditableItem)e.Item;
			Hashtable updatedValues = new Hashtable();
			e.Item.OwnerTableView.ExtractValuesFromItem(updatedValues, editItem);

			objEntity.Valor = updatedValues["VALOR"].ToString();
			objEntity.IdUltimaModificacion = this.IdUserCurrent;
			objEntity.FechaUltimaModificacion = DateTime.Now;

			if (!objBll.Update(objEntity))
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "errUpd", "alert('Se ha presentado el siguiente error al actualizar la variable:\\n\\n" + Utilidades.AjustarMensajeError(objBll.Error) + "');", true);
			}
			else
			{
				this.rgData.EditIndexes.Clear();
				this.rgData.Rebind();
			}
		}
	}
}