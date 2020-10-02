using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using RMBLL;
using RMEntity;

namespace ResumenMedico.Controls
{
	/// <summary>
	///
	/// </summary>
	public class BasePage : System.Web.UI.Page
	{
		/// <summary>
		///
		/// </summary>
		public int IdUserCurrent
		{
			get
			{
				return Session["IdUsCr"] != null ? Convert.ToInt32(Session["IdUsCr"]) : int.MinValue;
			}
		}

		/// <summary>
		///
		/// </summary>
		public string NameUserCurrent
		{
			get
			{
				return Session["NamUsrCur"] != null ? Session["NamUsrCur"].ToString() : string.Empty;
			}
		}

		/// <summary>
		///
		/// </summary>
		public bool IsAdmin
		{
			get
			{
				return Session["isAdmin"] != null ? Convert.ToBoolean(Convert.ToByte(Session["isAdmin"])) : false;
			}
		}

		/// <summary>
		///
		/// </summary>
		public string PathFilesToAttach
		{
			get
			{
				return Session["pathGlobalFiles"] != null ? Session["pathGlobalFiles"].ToString() : string.Empty;
			}
		}

		/// <summary>
		///
		/// </summary>
		public Constants.Perfiles PerfilActual
		{
			get
			{
				return Session["idPerfCurr"] != null ? (Constants.Perfiles)Convert.ToInt32(Session["idPerfCurr"]) : Constants.Perfiles.SinPerfil;
			}
		}

		/// <summary>
		///
		/// </summary>
		public Constants.Embajadas EmbajadaCurr
		{
			get
			{
				return Session["idEmbCurr"] != null ? (Constants.Embajadas)Convert.ToInt32(Session["idEmbCurr"]) : Constants.Embajadas.Colombia;
			}
			set
			{
				Session["idEmbCurr"] = value;
			}
		}

		public bool FinalizaHistora
		{
			get
			{
				return Session["FinHisMed"] != null ? Convert.ToBoolean(Session["FinHisMed"]) : false;
			}
		}

		public string TextPDFAtt
		{
			get
			{
				return Session["txtPdf"] != null ? Session["txtPdf"].ToString() : string.Empty;
			}
		}

		/// <summary>
		/// Metodo encargado de retornar un valor el cual se encuentre en el QueryString o en el Form
		/// </summary>
		/// <param name="key">identificador a buscar</param>
		/// <param name="defaultValue">valor a retornar en caso que no exista el identificador especificado</param>
		/// <returns>cadena con el valor encontrado relacionado a la llave o identificador suministrado</returns>
		public string GetValueFromRequest(string key, string defaultValue)
		{
			string valueFinded = string.Empty;
			if (Request.QueryString.Get(key) != null)
			{
				valueFinded = Request.QueryString.Get(key);
			}
			else if (Request.Form.Get(key) != null)
			{
				valueFinded = Request.Form.Get(key);
			}
			else
			{
				valueFinded = defaultValue;
			}
			return valueFinded;
		}

		public void LoadImgPerfilPaciente(int idHistoria, Telerik.Web.UI.RadBinaryImage imgPrePhoto)
		{
			AnexoHistoriaBll objAhBll = new AnexoHistoriaBll();
			List<AnexoHistoria> lst = objAhBll.GetAnexoHistorias(idHistoria, Constants.TipoRevision.MedicinaGeneral, false, int.MinValue, Constants.NombreArchivoImagenPaciente);
			if (lst.Count > 0)
			{
				AnexoHistoria objAhFileImage = lst[0];
				if (Directory.Exists(this.PathFilesToAttach + idHistoria + "\\"))
				{
					StreamReader srImg = new StreamReader(this.PathFilesToAttach + idHistoria + "\\" + objAhFileImage.NombreArchivo);
					BinaryReader reader = new BinaryReader(srImg.BaseStream);
					Byte[] data = reader.ReadBytes((int)srImg.BaseStream.Length);

					string contentFile = Convert.ToBase64String(data);
					imgPrePhoto.ImageUrl = String.Format("data:image/png;base64,{0}", contentFile);
				}
			}
		}

		public Image ScaleImage(Image image, int maxWidth, int maxHeight)
		{
			var ratioX = (double)maxWidth / image.Width;
			var ratioY = (double)maxHeight / image.Height;
			var ratio = Math.Min(ratioX, ratioY);

			var newWidth = (int)(image.Width * ratio);
			var newHeight = (int)(image.Height * ratio);

			var newImage = new Bitmap(newWidth, newHeight);

			using (var graphics = Graphics.FromImage(newImage))
				graphics.DrawImage(image, 0, 0, newWidth, newHeight);

			return newImage;
		}

		#region RemoveDuplicateRows

		/// <summary>
		///
		/// </summary>
		/// <param name="dTable"></param>
		/// <param name="colName"></param>
		/// <returns></returns>
		public DataTable RemoveDuplicateRows(DataTable dTable, string colName)
		{
			Hashtable hTable = new Hashtable();
			ArrayList duplicateList = new ArrayList();

			//Add list of all the unique item value to hashtable, which stores combination of key, value pair.
			//And add duplicate item value in arraylist.
			foreach (DataRow drow in dTable.Rows)
			{
				if (hTable.Contains(drow[colName].ToString().ToLower()))
					duplicateList.Add(drow);
				else
					hTable.Add(drow[colName].ToString().ToLower(), string.Empty);
			}

			//Removing a list of duplicate items from datatable.
			foreach (DataRow dRow in duplicateList)
				dTable.Rows.Remove(dRow);

			//Datatable which contains unique records will be return as output.
			return dTable;
		}

		#endregion RemoveDuplicateRows
	}
}