using System;
using ResumenMedico.Controls;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico
{
	public partial class Login : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				this.rtxtUser.Focus();
				Session.Abandon();
			}
		}

		protected void rbtnIngresar_Click(object sender, EventArgs e)
		{
			string strUsr = this.rtxtUser.Text.Trim();
			string strPwd = this.rtxtPwd.Text.Trim();

			UsuarioBll objBll = new UsuarioBll();
			if (objBll.ValidateUser(strUsr, strPwd))
			{
				Usuario objEnt = objBll.Load(strUsr);
				if (objEnt.Activo)
				{
					Session["IdUsCr"] = objEnt.Id;
					Session["NamUsrCur"] = objEnt.Nombres + " " + objEnt.Apellidos;
					Session["idPerfCurr"] = objEnt.Perfil;
					Session["FinHisMed"] = objEnt.FinalizaHistoria;
					Session["isAdmin"] = objEnt.Administrador;
					Response.Redirect(ResolveUrl("~/Inicio.aspx"), true);
				}
				else
				{
					RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Error", "alert('El usuario no es un usuario valido');", true);
				}
			}
			else
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Error", "alert('Se ha presentado el siguiente Error:\\n\\n" + objBll.Error + "');", true);
			}
		}
	}
}