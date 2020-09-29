using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResumenMedico.Controls;

namespace ResumenMedico
{
	public partial class Inicio : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Session["ShowMenu"] = false;
			Session["ShowConsultorio"] = false;
		}
	}
}