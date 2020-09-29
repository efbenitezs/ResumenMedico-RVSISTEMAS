﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RMBLL;
using RMEntity;
using ResumenMedico.Controls;
using Telerik.Web.UI;

namespace ResumenMedico
{
    public partial class Login2 : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strUsr = "Ebenitez";
            string strPwd = "zerodeveloper04";
            UsuarioBll objBll = new UsuarioBll();
            objBll.ValidateUser(strUsr, strPwd);
            Usuario objEnt = objBll.Load(strUsr);
            Session["IdUsCr"] = objEnt.Id;
            Session["NamUsrCur"] = objEnt.Nombres + " " + objEnt.Apellidos;
            Session["idPerfCurr"] = objEnt.Perfil;
            Session["FinHisMed"] = objEnt.FinalizaHistoria;
            Session["isAdmin"] = objEnt.Administrador;
            Response.Redirect(ResolveUrl("~/Inicio.aspx"), true);
        }
    }
}