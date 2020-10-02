using System;
using System.IO;
using System.Text;
using RMBLL;
using RMEntity;
using Telerik.Web.UI;

namespace ResumenMedico.Controls
{
	public partial class DwldFil : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (this.IdUserCurrent != int.MinValue)
			{
				int idAnexo = Convert.ToInt32(this.GetValueFromRequest("idFil", int.MinValue.ToString()));
				if (idAnexo != int.MinValue)
				{
					this.GetFile(idAnexo);
				}
				else
				{
					RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "sessLost", "FileNotFound();", true);
				}
			}
			else
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "sessLost", "CerrarVentana();", true);
			}
		}

		private void GetFile(int idAnexo)
		{
			AnexoHistoriaBll objBll = new AnexoHistoriaBll();
			AnexoHistoria objEnt = objBll.Load(idAnexo);
			if (objEnt.Id != int.MinValue)
			{
				if (Directory.Exists(this.PathFilesToAttach))
				{
					string pathHist = this.PathFilesToAttach + objEnt.IdHistoria + "\\";
					if (Directory.Exists(pathHist))
					{
						if (File.Exists(pathHist + objEnt.NombreArchivo))
						{
							/*
                            FileStream fileToGet = new FileStream(pathHist + objEnt.NombreArchivo, FileMode.Open, FileAccess.Read);
                            byte[] contetnFile = new byte[Convert.ToInt32(fileToGet.Length)];
                            fileToGet.Read(contetnFile, 0, contetnFile.Length);
                            */
							Response.Clear();
							Response.Buffer = true;
							Response.ContentType = "application/application/octet-stream";
							Response.AddHeader("Content-Disposition", "attachment;filename=" + objEnt.NombreArchivo);
							Response.Charset = "UTF-8";
							Response.ContentEncoding = Encoding.Default;
							Response.WriteFile(pathHist + objEnt.NombreArchivo);
							Response.Flush();
							Response.End();
						}
					}
					else
					{
						RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "dirHisNotFound", "FileNotFound();", true);
					}
				}
				else
				{
					RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "dirNotFound", "FileNotFound();", true);
				}
			}
			else
			{
				RadScriptManager.RegisterClientScriptBlock(this, this.GetType(), "filNotFound", "FileNotFound();", true);
			}
		}
	}
}