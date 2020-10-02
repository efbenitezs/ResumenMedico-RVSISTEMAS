using System;
using ResumenMedico.Controls;

namespace ResumenMedico
{
	public partial class SiteMaster : BaseMasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["IdUsCr"] is null || (int)Session["IdUsCr"] == int.MinValue)
			{
				Response.Redirect(ResolveUrl("~/Login.aspx"), true);
			}
			lblVersion.Text = Global.GetCurrentVersion();
			this.imgFlag.ImageUrl = this.FlagToShow;
		}

		protected void lnkCerrarSesion_Click(object sender, EventArgs e)
		{
			Session["IdUsCr"] = int.MinValue;
			Response.Redirect(ResolveUrl("~/Login.aspx"), true);
		}
	}
}