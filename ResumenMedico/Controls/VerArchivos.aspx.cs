using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReportLibrary;
using Telerik.Reporting;
using RMBLL;
using RMEntity;
using System.Configuration;
using System.IO;
using Telerik.Web.UI;
using System.Text;


namespace ResumenMedico.Controls
{
    public partial class VerArchivos : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string carpeta;
            carpeta = this.PathFilesToAttach.ToString();
            string idHistoria = this.GetValueFromRequest("idHistoria", string.Empty);
            int idHistCurrent = Convert.ToInt32(idHistoria);
            string nomArchivo = this.GetValueFromRequest("nomArchivo", string.Empty);
            string rutaAcceso = carpeta + idHistoria + "\\" + nomArchivo;



            if (Directory.Exists(carpeta))
            {
                if (Directory.Exists(carpeta + idHistoria + "\\"))
                {
                    if (File.Exists(rutaAcceso))
                    {
                        string extension;
                        string nameFile = string.Empty;
                        extension = nomArchivo.Substring((nomArchivo.LastIndexOf(".") + 1)).ToLower();
                        nameFile = nomArchivo.Substring(0, nomArchivo.LastIndexOf('.'));
                        HistoriaMedicaBll objBllHistMed = new HistoriaMedicaBll();
                        HistoriaMedica objEntHisMed = objBllHistMed.Load(idHistCurrent);

                        PacienteBll objBllPac = new PacienteBll();
                        Paciente objEntPac = objBllPac.Load(objEntHisMed.IdPaciente);

                        FileStream fileToGet = new FileStream(rutaAcceso, FileMode.Open, FileAccess.Read);
                        byte[] fileBuffer = new byte[Convert.ToInt32(fileToGet.Length)];
                        fileToGet.Read(fileBuffer, 0, fileBuffer.Length);

                        Response.Clear();
                        Response.Buffer = true;
                        string fileNameToClient = objEntPac.Nombres.Replace(" ", "_") + "_" + objEntPac.Apellidos.Replace(" ", "_") + "." + extension;
                        switch (extension)
                        {
                            case "pdf":
                                Response.ContentType = "application/pdf";
                                break;
                            case "png":
                                Response.ContentType = "image/png";
                                break;
                        }
                        Response.AddHeader("Content-Disposition", "filename=" + fileNameToClient + ";"); //Response.AddHeader("Content-Disposition", "attachment; filename=" + fileNameToClient + ";");
                        Response.OutputStream.Write(fileBuffer, 0, fileBuffer.Length);

                    }
                    else
                    {
                        Label1.Text = "No se encuentra el archivo";
                    }
                }
                else
                {
                    Label1.Text = "No se encuentra la carpeta con el Id de historia referenciado";
                }

            }
            else
            {
                Label1.Text = "Revise el Web config por la carpeta de acceso a los archivos";
            }



        }
    
    }
}