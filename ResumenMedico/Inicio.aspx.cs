using System;
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