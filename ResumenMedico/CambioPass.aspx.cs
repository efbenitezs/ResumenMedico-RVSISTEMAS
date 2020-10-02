using System;
using ResumenMedico.Controls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico
{
	public partial class CambioPass : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
			}
		}

		protected void rbtnIngresar_Click(object sender, EventArgs e)
		{
			if (this.rtxtUser.Text.Trim() != string.Empty)
			{
				if (this.rtxtPwd.Text.Trim() != string.Empty && this.rtxtPwd2.Text.Trim() != string.Empty)
				{
					if (this.rtxtPwd.Text.Trim() == this.rtxtPwd2.Text.Trim())
					{
						UsuarioBll objBllUsr = new UsuarioBll();
						Usuario objEntUsr = objBllUsr.Load(this.rtxtUser.Text.Trim());
						objEntUsr.Pwd = this.rtxtPwd2.Text.Trim();

						if (!objBllUsr.CambioPwd(objEntUsr))
						{
							RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Error", "alert('Se ha presentado un inconveniete al procesar el cambio \\n\\n" + objBllUsr.Error + "');", true);
						}
						else
						{
							RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Error", "alert('El cambio de contraseña ha sido existoso');", true);
						}
					}
					else
					{
						RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Error", "alert('El texto entre las contraseñas no coincide');", true);
					}
				}
				else
				{
					RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Error", "alert('Debe indicar la nueva contraseña y confirmarla');", true);
				}
			}
			else
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Error", "alert('El usuario no es un usuario valido');", true);
			}
		}
	}
}