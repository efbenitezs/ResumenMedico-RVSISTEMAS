using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ResumenMedico.Controls;
using Telerik.Web.UI;
using System.IO;

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
                    Response.Redirect(ResolveUrl("~/Default.aspx"), true);
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
            if (true)
            {
                //byte[] bytesContent = Convert.FromBase64String(this.sigImageData.Value.Trim());
                byte[] bytesContent = Convert.FromBase64String("");
                FileStream image = new FileStream(Server.MapPath("../Resources/") + "imgFirmaBacteriologo.png", FileMode.Create);
                image.Write(bytesContent, 0, bytesContent.Length);
                image.Flush();
                image.Close();
            }
            else
            {
                RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "NosignDetected", "alert('NO se ha encontrado firma por favor intentelo nuevamente');", true);
            }
        }
    }
}