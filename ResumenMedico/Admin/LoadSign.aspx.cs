using System;
using System.IO;
using ResumenMedico.Controls;
using Telerik.Web.UI;

namespace ResumenMedico.Admin
{
	public partial class LoadSign : BasePage
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
			else
			{
				Response.Redirect(ResolveUrl("~/Login.aspx"), true);
			}
		}

		protected void rbtnGuardar_Click(object sender, EventArgs e)
		{
			//if (this.sigImageData.Value.Trim() != string.Empty)
			try
			{
				//byte[] bytesContent = Convert.FromBase64String(this.sigImageData.Value.Trim());
				byte[] bytesContent = Convert.FromBase64String("");
				FileStream image = new FileStream(Server.MapPath("~/Resources/") + "imgFirmaBacteriologo.png", FileMode.Create);
				image.Write(bytesContent, 0, bytesContent.Length);
				image.Flush();
				image.Close();
			}
			catch (Exception ex)
			{
				string script = string.Format("alert('{0}');", ex.ToString()); 
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "NosignDetected", script, true);
			}
		}
	}
}