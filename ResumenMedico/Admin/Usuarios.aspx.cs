using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;
using System.Collections;
using ResumenMedico.Controls;
using System.Data;
using System.Web.UI.HtmlControls;

namespace ResumenMedico.Admin
{
    public partial class Usuarios : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IdUserCurrent != int.MinValue)
            {
                //si no es el perfil debe excluirlo
                if (!this.IsAdmin)
                {
                    Response.Redirect(ResolveUrl("~/Default.aspx"), true);
                }
                Session["ShowMenu"] = true;
                Session["ShowConsultorio"] = false;
            }
        }

        protected void gvUsuarios_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            UsuarioBll objBll = new UsuarioBll();
            gvUsuarios.DataSource = objBll.GetList(string.Empty, string.Empty, string.Empty, int.MinValue, Constants.Perfiles.SinPerfil, true, true, true, true, true, true, true);
        }

        protected void gvUsuarios_InsertCommand(object sender, GridCommandEventArgs e)
        {
            this.SaveInfo(true, e);
        }

        protected void gvUsuarios_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            this.SaveInfo(false, e);
        }

        private void SaveInfo(bool isCreate, GridCommandEventArgs e)
        {
            UsuarioBll objBllSave = new UsuarioBll();
            Usuario objEntity = new Usuario();

            GridEditableItem editColumn = (GridEditableItem)e.Item;
    
            if (isCreate)
            {
                objEntity.Cuenta = ((RadTextBox)e.Item.FindControl("tbxCuenta")).Text.Trim();
                objEntity.IdCreacion = this.IdUserCurrent;
                objEntity.FechaCreacion = DateTime.Now;
            }
            else
            {
                objEntity = objBllSave.Load(Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[editColumn.ItemIndex]["ID"]));
            }

            objEntity.Nombres = ((RadTextBox)e.Item.FindControl("tbxNombres")).Text.Trim();
            objEntity.Apellidos = ((RadTextBox)e.Item.FindControl("tbxApellidos")).Text.Trim();
            objEntity.Pwd = ((RadTextBox)e.Item.FindControl("tbxPassword12")).Text.Trim();
            objEntity.Perfil = (Constants.Perfiles)Enum.Parse(typeof(Constants.Perfiles), ((RadComboBox)e.Item.FindControl("rcbPerfil")).SelectedValue);
            objEntity.IdCargo = Convert.ToInt32(((RadComboBox)e.Item.FindControl("rcbCargo")).SelectedValue);
            objEntity.Activo = ((CheckBox)e.Item.FindControl("chkbxActivo")).Checked;
            objEntity.FinalizaHistoria = ((CheckBox)e.Item.FindControl("chkFinHis")).Checked;
            objEntity.Administrador = ((CheckBox)e.Item.FindControl("chkAdmin")).Checked;

            if (objEntity.Perfil == Constants.Perfiles.Laboratorio)
            {
                objEntity.FirmaProfesional = new FirmaProfesional()
                {
                    Id_Usuario = objEntity.Id,
                    Universidad = ((RadTextBox)e.Item.FindControl("tbxUniversidad")).Text.Trim(),
                    RegistroProfesional = ((RadTextBox)e.Item.FindControl("tbxRegistroProfesional")).Text.Trim(),
                    FirmaBase64 = ((HiddenField)e.Item.FindControl("hidBase64ImageData")).Value,
                    CorreoElectronico = ((RadTextBox)e.Item.FindControl("tbxCorreoElectronico")).Text.Trim()
                };
            }

            objEntity.IdUltimaModificacion = this.IdUserCurrent;
            objEntity.FechaUltimaModificacion = DateTime.Now;

            if (!objBllSave.Save(objEntity, ((CheckBox)e.Item.FindControl("chkChangePass")).Checked))
            {
                erroresCarga.Text = objBllSave.Error;
            }
            else
            {
                this.gvUsuarios.EditIndexes.Clear();
                this.gvUsuarios.Rebind();
            }
        }

        protected void gvUsuarios_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem editColumn = (GridEditableItem)e.Item;
            int idToDelete = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[editColumn.ItemIndex]["ID"]);

            UsuarioBll objBllSave = new UsuarioBll();
            Usuario objEntity = new Usuario();

            objEntity.Id = idToDelete;
            objEntity.IdUltimaModificacion = this.IdUserCurrent;

            if (!objBllSave.Delete(objEntity))
            {
                this.gvUsuarios.Rebind();
                string mensaje = string.Format("{0}", objBllSave.Error);
                erroresCarga.Text = mensaje;
            }
            else
            {
                this.gvUsuarios.Rebind();
            }
        }

        protected void gvUsuarios_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {

                Array itemNames = System.Enum.GetNames(typeof(Constants.Perfiles));

                DataTable origen = new DataTable("Origen");
                DataColumn workCol = origen.Columns.Add("ID_PERFIL", typeof(Int32));
                workCol.AllowDBNull = false;
                workCol.Unique = true;
                origen.Columns.Add("PERFIL", typeof(String));

                for (int i = 0; i <= itemNames.Length - 1; i++)
                {
                    DataRow workRow = origen.NewRow();
                    workRow["ID_PERFIL"] = i;
                    workRow["PERFIL"] = itemNames.GetValue(i).ToString();

                    origen.Rows.Add(workRow);
                }
                RadComboBox cmbPerfil = (RadComboBox)e.Item.FindControl("rcbPerfil");

                RadComboBox cmbCargo = (RadComboBox)e.Item.FindControl("rcbCargo");
                cmbCargo.Items.Insert(0, new RadComboBoxItem("[Seleccione]", string.Empty));

                Utilidades.LlenarRC(cmbPerfil, origen, "ID_PERFIL", "PERFIL", true);

                if (!(e.Item is GridEditFormInsertItem))
                {
                    DataRowView drData = (DataRowView)e.Item.DataItem;

                    Utilidades.PosicionarRC(cmbPerfil, drData["ID_PERFIL"].ToString());
                    Utilidades.PosicionarRC(cmbCargo, drData["ID_CARGO"].ToString());

                    GridEditableItem editRow = (GridEditableItem)e.Item;
                    Usuario objEntity = (new UsuarioBll()).Load(Convert.ToInt32(editRow.OwnerTableView.DataKeyValues[editRow.ItemIndex]["ID"]));
                    if (objEntity.FirmaProfesional != null)
                    {
                        RadTextBox regprof = (RadTextBox)e.Item.FindControl("tbxRegistroProfesional");
                        RadTextBox univ = (RadTextBox)e.Item.FindControl("tbxUniversidad");
                        HiddenField firmaBase64 = (HiddenField)e.Item.FindControl("hidBase64ImageData");

                        regprof.Text = objEntity.FirmaProfesional.RegistroProfesional;
                        univ.Text = objEntity.FirmaProfesional.Universidad;
                        firmaBase64.Value = objEntity.FirmaProfesional.FirmaBase64;

                    }

                }
                else
                {
                    CheckBox chkbxActivo = (CheckBox)e.Item.FindControl("chkbxActivo");
                    chkbxActivo.Checked = true;
                    chkbxActivo.Enabled = false;
                }
            }
        }

        
    }
}