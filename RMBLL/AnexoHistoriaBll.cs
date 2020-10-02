// Decompiled with JetBrains decompiler
// Type: RMBLL.AnexoHistoriaBll
// Assembly: RMBLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F2C48D5-ED72-4974-B910-3403631DD6A0
// Assembly location: C:\Users\Personal\source\RMBLL.dll

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using RMDAL;
using RMEntity;

namespace RMBLL
{
	public class AnexoHistoriaBll : BaseForm
	{
		public static DataTable Estructure => AnexoHistoriaDao.DtEstructure;

		public DataTable GetList(
		  int idHistoria,
		  Constants.TipoRevision idTipoRevision,
		  bool showAllTipoRevision,
		  int idMuestra,
		  string nombreAdjunto)
		{
			AnexoHistoriaDao anexoHistoriaDao = new AnexoHistoriaDao();
			DataTable list = anexoHistoriaDao.GetList(idHistoria, idTipoRevision, showAllTipoRevision, idMuestra, nombreAdjunto, (DbTransaction)null);
			this.error = anexoHistoriaDao.Error;
			return list;
		}

		public List<AnexoHistoria> GetAnexoHistorias(
		  int idHistoria,
		  Constants.TipoRevision idTipoRevision,
		  bool showAllTipoRevision,
		  int idMuestra,
		  string nombreAdjunto)
		{
			AnexoHistoriaDao anexoHistoriaDao = new AnexoHistoriaDao();
			List<AnexoHistoria> anexoHistorias = anexoHistoriaDao.GetAnexoHistorias(idHistoria, idTipoRevision, showAllTipoRevision, idMuestra, nombreAdjunto, (DbTransaction)null);
			this.error = anexoHistoriaDao.Error;
			return anexoHistorias;
		}

		public AnexoHistoria Load(int id)
		{
			AnexoHistoriaDao anexoHistoriaDao = new AnexoHistoriaDao();
			AnexoHistoria anexoHistoria = anexoHistoriaDao.Load(id);
			this.error = anexoHistoriaDao.Error;
			return anexoHistoria;
		}

		public bool Save(AnexoHistoria objEnt, DbTransaction parentTrans)
		{
			AnexoHistoriaDao anexoHistoriaDao = new AnexoHistoriaDao();
			bool flag = objEnt.Id == int.MinValue ? anexoHistoriaDao.Create(objEnt, parentTrans) : anexoHistoriaDao.Update(objEnt, parentTrans);
			this.error = anexoHistoriaDao.Error;
			return flag;
		}

		public void GenerarDeclaracionPruebas(
		  string pathToLeaveFiles,
		  string pathFromTemplateFiles,
		  string fileNameTemplate)
		{
			Document objDoc = new Document(PageSize.LETTER);
			PdfWriter writter = PdfWriter.GetInstance(objDoc, new FileStream(pathToLeaveFiles + "pruebaejecucion.pdf", FileMode.Create));

			// Le colocamos el título y el autor
			// **Nota: Esto no será visible en el documento
			objDoc.AddTitle("Declaracion");
			objDoc.AddCreator("RV Sistemas E.U.");

			iTextSharp.text.Font fuenteGeneral = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 8, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);

			// Abrimos el archivo
			objDoc.Open();

			string line = System.IO.File.ReadAllText(pathFromTemplateFiles + fileNameTemplate);

			line = line.Replace("[NombrePaciente]", "{PACIENTE DE PRUEBAS PARA GENERACION}");
			line = line.Replace("[FechaElaboracion]", this.ObtenerTextoFecha(DateTime.Now));
			// Read the file and display it line by line.
			System.IO.StreamReader file = new System.IO.StreamReader(pathFromTemplateFiles + fileNameTemplate);
			while ((line = file.ReadLine()) != null)
			{
				objDoc.Add(new Phrase(line, fuenteGeneral));
				objDoc.Add(Chunk.NEWLINE);
			}
			file.Close();

			objDoc.Add(new Paragraph("Contenido archivo", fuenteGeneral));

			objDoc.Add(Chunk.NEWLINE);

			iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(pathFromTemplateFiles.Substring(0, pathFromTemplateFiles.Length - 6) + "imgFirmaBase.png");
			img.Border = 0;
			img.BorderWidth = 0;
			img.Alignment = Element.ALIGN_RIGHT;

			objDoc.Add(img);

			//se cierra el documento
			objDoc.Close();
			//se cierra el escritor
			writter.Close();
		}

		private string ObtenerTextoFecha(DateTime fechaProcesar)
		{
			string str = string.Empty;
			switch (fechaProcesar.Month)
			{
				case 1:
					str = "Enero";
					break;

				case 2:
					str = "Febrero";
					break;

				case 3:
					str = "Marzo";
					break;

				case 4:
					str = "Abril";
					break;

				case 5:
					str = "Mayo";
					break;

				case 6:
					str = "Junio";
					break;

				case 7:
					str = "Julio";
					break;

				case 8:
					str = "Agosto";
					break;

				case 9:
					str = "Septiembre";
					break;

				case 10:
					str = "Octubre";
					break;

				case 11:
					str = "Noviembre";
					break;

				case 12:
					str = "Diciembre";
					break;
			}
			return fechaProcesar.Day.ToString() + " " + str + " " + (object)fechaProcesar.Year;
		}

		public bool GenerarDeclaracion(
		  string pathToLeaveFiles,
		  string pathTemplateFiles,
		  string fileNameTemplate,
		  byte[] imgageSign,
		  int idHistoriaPaciente,
		  Constants.TipoDeclaracion tipoDec,
		  int idUsuarioGenera)
		{
			bool isGenereatedFileOk = false;
			string fileName = string.Empty;
			string fileNameSign = string.Empty;
			DbTransaction parentTrans = null;
			try
			{
				parentTrans = AnexoHistoriaDao.GetTransaction();
				string fileDescription = string.Empty;
				string fileDescSign = string.Empty;
				//Objeto Entity para el archivo .pdf
				AnexoHistoria objEntAh = new AnexoHistoria();
				//objeto entity para el archivo firma
				AnexoHistoria objentAhSign = new AnexoHistoria();
				HistoriaMedicaBll objBllHm = new HistoriaMedicaBll();
				HistoriaMedica objEntHm = objBllHm.Load(idHistoriaPaciente);
				if (objEntHm.Id != int.MinValue)
				{
					PacienteBll objBllPac = new PacienteBll();
					Paciente objEntPac = objBllPac.Load(objEntHm.IdPaciente);
					AnexoHistoriaDao objDaoAh = new AnexoHistoriaDao();
					if (!Directory.Exists(pathToLeaveFiles + objEntHm.Id))
					{
						Directory.CreateDirectory(pathToLeaveFiles + objEntHm.Id);
					}
					pathToLeaveFiles = pathToLeaveFiles + objEntHm.Id + "/";
					switch (tipoDec)
					{
						case Constants.TipoDeclaracion.Canada:
							fileName = "ConsCan.pdf";
							fileNameSign = "FirmaConsCan.png";
							fileDescription = "ConsentimientoExamenCan.pdf";
							fileDescSign = Constants.NombreArchivoFirmaCanada;
							break;

						case Constants.TipoDeclaracion.NuevaZelanda:
							fileName = "ConsNZ.pdf";
							fileNameSign = "FirmaConsNueZel.png";
							fileDescription = "ConsentimientoExamenNZ.pdf";
							fileDescSign = Constants.NombreArchivoFirmaNuevaZelanda;
							break;

						case Constants.TipoDeclaracion.Vih:
							fileName = "ConsVih.pdf";
							fileNameSign = "FirmaConsVih.png";
							fileDescription = "ConsentimientoPruebaVIH.pdf";
							fileDescSign = Constants.NombreArchivoFirmaVih;
							break;

						case Constants.TipoDeclaracion.VenoPuncion:
							fileName = "ConsVenPun.pdf";
							fileNameSign = "FirmaConsVenPun.png";
							fileDescription = "ConsentimientoVenoPuncion.pdf";
							fileDescSign = Constants.NombreArchivoFirmaVenopuncion;
							break;
					}
					objEntAh.IdHistoria = objEntHm.Id;
					objEntAh.IdTipoRevision = Constants.TipoRevision.MedicinaGeneral;
					objEntAh.NombreAdjunto = fileDescription;
					objEntAh.NombreArchivo = fileName;
					objEntAh.IdCreacion = objEntAh.IdUltimaModificacion = idUsuarioGenera;
					objentAhSign.IdHistoria = objEntHm.Id;
					objentAhSign.IdTipoRevision = Constants.TipoRevision.MedicinaGeneral;
					objentAhSign.NombreAdjunto = fileDescSign;
					objentAhSign.NombreArchivo = fileNameSign;
					objentAhSign.IdCreacion = objentAhSign.IdUltimaModificacion = idUsuarioGenera;
					Document objDoc = new Document(PageSize.LETTER);
					PdfWriter writter = PdfWriter.GetInstance(objDoc, new FileStream(pathToLeaveFiles + fileName, FileMode.Create));
					// Le colocamos el título y el autor
					// **Nota: Esto no será visible en el documento
					objDoc.AddTitle("Declaracion");
					objDoc.AddCreator("RV Sistemas E.U.");
					iTextSharp.text.Font fuenteGeneral = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 8, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);
					// Abrimos el archivo
					objDoc.Open();
					string line = System.IO.File.ReadAllText(pathTemplateFiles + fileNameTemplate);
					line = line.Replace("[NombrePaciente]", objEntPac.Nombres + " " + objEntPac.Apellidos);
					line = line.Replace("[FechaElaboracion]", this.ObtenerTextoFecha(DateTime.Now));
					switch (tipoDec)
					{
						case Constants.TipoDeclaracion.Canada:
							break;

						case Constants.TipoDeclaracion.NuevaZelanda:
							break;

						case Constants.TipoDeclaracion.Vih:
							TipoDocumentoBll objBlltipDoc = new TipoDocumentoBll();
							TipoDocumento objEntTipDoc = objBlltipDoc.Load(objEntPac.IdTipoDocumento);
							line = line.Replace("[TipoDocumento]", objEntTipDoc.Nombre);
							line = line.Replace("[NumeroDocumento]", objEntPac.NumeroDocumento);
							line = line.Replace("[NombreLaboratorio]", "Laboratorio Clinico");
							break;

						case Constants.TipoDeclaracion.VenoPuncion:
							break;
					}
					objDoc.Add(new Phrase(line, fuenteGeneral));
					objDoc.Add(Chunk.NEWLINE);
					iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(imgageSign);
					img.Border = 0;
					img.BorderWidth = 0;
					img.Alignment = Element.ALIGN_RIGHT;
					objDoc.Add(img);
					//se cierra el documento
					objDoc.Close();
					//se cierra el escritor
					writter.Close();
					if (!objDaoAh.Create(objEntAh, parentTrans))
					{
						throw new Exception(objDaoAh.Error);
					}
					FileStream imgPac = new FileStream(pathToLeaveFiles + fileNameSign, FileMode.Create, FileAccess.ReadWrite);
					imgPac.Write(imgageSign, 0, imgageSign.Length);
					imgPac.Flush();
					imgPac.Close();
					if (!objDaoAh.Create(objentAhSign, parentTrans))
					{
						throw new Exception(objDaoAh.Error);
					}
					parentTrans.Commit();
					isGenereatedFileOk = true;
				}
				else
				{
					this.error = "No se encontro la historia del paciente";
				}
			}
			catch (Exception exc)
			{
				if (parentTrans != null)
				{
					parentTrans.Rollback();
				}
				this.error = exc.InnerException != null ? exc.InnerException.Message : exc.Message;
				if (File.Exists(pathToLeaveFiles + fileName))
				{
					File.Delete(pathToLeaveFiles + fileName);
				}
			}
			return isGenereatedFileOk;
		}

		public bool GenerarDeclaracion2(
	  string pathToLeaveFiles,
	  string pathTemplateFiles,
	  string fileNameTemplate,
	  byte[] imageSign,
	  byte[] imgSigWit,
	  int idHistoriaPaciente,
	  Constants.TipoDeclaracion tipoDec,
	  int idUsuarioGenera,
	  string pathImagesLogos)
		{
			bool isGenereatedFileOk = false;
			string fileName = string.Empty;
			string fileNameSign = string.Empty;
			DbTransaction parentTrans = null;
			try
			{
				parentTrans = AnexoHistoriaDao.GetTransaction();
				string fileDescription = string.Empty;
				string fileDescSign = string.Empty;
				UsuarioBll objUserBll = new UsuarioBll();
				Usuario userProcess = objUserBll.Load(idUsuarioGenera);
				//Objeto Entity para el archivo .pdf
				AnexoHistoria objEntAh = new AnexoHistoria();
				//objeto entity para el archivo firma
				AnexoHistoria objentAhSign = new AnexoHistoria();
				HistoriaMedicaBll objBllHm = new HistoriaMedicaBll();
				HistoriaMedica objEntHm = objBllHm.Load(idHistoriaPaciente);
				if (objEntHm.Id != int.MinValue)
				{
					PacienteBll objBllPac = new PacienteBll();
					Paciente objEntPac = objBllPac.Load(objEntHm.IdPaciente);
					AnexoHistoriaDao objDaoAh = new AnexoHistoriaDao();
					if (!Directory.Exists(pathToLeaveFiles + objEntHm.Id))
					{
						Directory.CreateDirectory(pathToLeaveFiles + objEntHm.Id);
					}
					pathToLeaveFiles = pathToLeaveFiles + objEntHm.Id + "\\";
					switch (tipoDec)
					{
						case Constants.TipoDeclaracion.Canada:
							fileName = "ConsCan.pdf";
							fileNameSign = "FirmaConsCan.png";
							fileDescription = "ConsentimientoExamenCan.pdf";
							fileDescSign = Constants.NombreArchivoFirmaCanada;
							break;

						case Constants.TipoDeclaracion.NuevaZelanda:
							fileName = "ConsNZ.pdf";
							fileNameSign = "FirmaConsNueZel.png";
							fileDescription = "ConsentimientoExamenNZ.pdf";
							fileDescSign = Constants.NombreArchivoFirmaNuevaZelanda;
							break;

						case Constants.TipoDeclaracion.Vih:
							fileName = "ConsVih.pdf";
							fileNameSign = "FirmaConsVih.png";
							fileDescription = "ConsentimientoPruebaVIH.pdf";
							fileDescSign = Constants.NombreArchivoFirmaVih;
							break;

						case Constants.TipoDeclaracion.VenoPuncion:
							fileName = "ConsVenPun.pdf";
							fileNameSign = "FirmaConsVenPun.png";
							fileDescription = "ConsentimientoVenoPuncion.pdf";
							fileDescSign = Constants.NombreArchivoFirmaVenopuncion;
							break;

						case Constants.TipoDeclaracion.Australia:
							fileName = "ConsAus.pdf";
							fileNameSign = "FirmaConsAus.png";
							fileDescription = "ConsentimientoAustralia.pdf";
							fileDescSign = Constants.NombreArchivoFirmaAustralia;
							break;
					}
					objEntAh.IdHistoria = objEntHm.Id;
					objEntAh.IdTipoRevision = Constants.TipoRevision.MedicinaGeneral;
					objEntAh.NombreAdjunto = fileDescription;
					objEntAh.NombreArchivo = fileName;
					objEntAh.IdCreacion = objEntAh.IdUltimaModificacion = idUsuarioGenera;
					objentAhSign.IdHistoria = objEntHm.Id;
					objentAhSign.IdTipoRevision = Constants.TipoRevision.MedicinaGeneral;
					objentAhSign.NombreAdjunto = fileDescSign;
					objentAhSign.NombreArchivo = fileNameSign;
					objentAhSign.IdCreacion = objentAhSign.IdUltimaModificacion = idUsuarioGenera;
					using (FileStream fs = new FileStream(pathToLeaveFiles + fileName, FileMode.Create))
					{
						Document objDoc = new Document(PageSize.LETTER);
						PdfWriter writter = PdfWriter.GetInstance(objDoc, fs);
						// Le colocamos el título y el autor
						// **Nota: Esto no será visible en el documento
						objDoc.AddTitle("Declaracion");
						objDoc.AddCreator("RV Sistemas E.U.");
						iTextSharp.text.Font fuenteGeneral = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 8, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);
						// Abrimos el archivo
						objDoc.Open();
						string line = System.IO.File.ReadAllText(pathTemplateFiles + fileNameTemplate);
						line = line.Replace("[NombrePaciente]", objEntPac.Nombres + " " + objEntPac.Apellidos);
						line = line.Replace("[FechaElaboracion]", this.ObtenerTextoFecha(DateTime.Now));
						bool isWrite = false;
						switch (tipoDec)
						{
							case Constants.TipoDeclaracion.Canada:
								this.ConstruirDeclCanada(objDoc, objEntHm, objEntPac, imageSign, imgSigWit, userProcess.Nombres + " " + userProcess.Apellidos);
								break;

							case Constants.TipoDeclaracion.NuevaZelanda:
								isWrite = true;
								break;

							case Constants.TipoDeclaracion.Vih:
								isWrite = true;
								TipoDocumentoBll objBlltipDoc = new TipoDocumentoBll();
								TipoDocumento objEntTipDoc = objBlltipDoc.Load(objEntPac.IdTipoDocumento);
								line = line.Replace("[TipoDocumento]", objEntTipDoc.Nombre);
								line = line.Replace("[NumeroDocumento]", objEntPac.NumeroDocumento);
								line = line.Replace("[NombreLaboratorio]", "Laboratorio Clinico");
								break;

							case Constants.TipoDeclaracion.VenoPuncion:
								isWrite = true;
								break;

							case Constants.TipoDeclaracion.Australia:
								this.ConstruirDeclaracionAustralia(objDoc, objEntHm, objEntPac, imageSign, pathImagesLogos);
								break;
						}
						if (isWrite)
						{
							objDoc.Add(new Phrase(line, fuenteGeneral));
							objDoc.Add(Chunk.NEWLINE);
							iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(imageSign);
							img.Border = 0;
							img.BorderWidth = 0;
							img.Alignment = Element.ALIGN_RIGHT;
							objDoc.Add(img);
						}
						//se cierra el documento
						objDoc.Close();
						//se cierra el escritor
						writter.Close();
						if (!objDaoAh.Create(objEntAh, parentTrans))
						{
							throw new Exception(objDaoAh.Error);
						}
						FileStream imgPac = new FileStream(pathToLeaveFiles + fileNameSign, FileMode.Create, FileAccess.ReadWrite);
						imgPac.Write(imageSign, 0, imageSign.Length);
						imgPac.Flush();
						imgPac.Close();
						if (!objDaoAh.Create(objentAhSign, parentTrans))
						{
							throw new Exception(objDaoAh.Error);
						}
						parentTrans.Commit();
						isGenereatedFileOk = true;
					}
				}
				else
				{
					this.error = "No se encontro la historia del paciente";
				}
			}
			catch (Exception exc)
			{
				if (parentTrans != null)
				{
					parentTrans.Rollback();
				}
				this.error = exc.InnerException != null ? exc.InnerException.Message : exc.Message;
				if (File.Exists(pathToLeaveFiles + fileName))
				{
					File.Delete(pathToLeaveFiles + fileName);
				}
			}
			return isGenereatedFileOk;
		}

		private void ConstruirDeclCanada(
	  Document objDoc,
	  HistoriaMedica objEntHm,
	  Paciente objEntPac,
	  byte[] imageSign,
	  byte[] imgSigWit,
	  string nombreUsuarioTestigo)
		{
			try
			{
				PdfPTable generalBody = new PdfPTable(1);
				generalBody.DefaultCell.Border = iTextSharp.text.Rectangle.NO_BORDER;
				generalBody.DefaultCell.BorderColor = new BaseColor(System.Drawing.Color.Transparent);
				generalBody.WidthPercentage = 100;

				iTextSharp.text.Font fuente = new Font(iTextSharp.text.Font.FontFamily.HELVETICA, 14f, 1, new iTextSharp.text.BaseColor(System.Drawing.Color.Black));
				iTextSharp.text.Font fuenteNorm = new Font(iTextSharp.text.Font.FontFamily.HELVETICA, 12f, 0, new iTextSharp.text.BaseColor(System.Drawing.Color.Black));

				string nombreComPac = objEntPac.Nombres + " " + objEntPac.Apellidos;
				string nombreTutor = objEntPac.Acudiente;
				bool isUnderAgePerson = objEntPac.FechaNacimiento >= DateTime.Now.AddYears(-15);

				PdfPCell cellTitle = new PdfPCell(new Phrase("Client Declaration and Notice (eMedical)", fuente))
				{
					Border = Rectangle.NO_BORDER,
					BorderColor = new BaseColor(System.Drawing.Color.Transparent),
					HorizontalAlignment = 1 //0=Left 1=Center 2=Right
				};

				generalBody.AddCell(cellTitle);

				PdfPCell cellParr1 = new PdfPCell(new Phrase("I, " + (isUnderAgePerson ? nombreTutor : nombreComPac) + " declare that all information provided by me during the Immigration Medical Examination(IME) of " + nombreComPac
					+ " in support of my application to Immigration, Refugees and Citizenship Canada (IRCC)is true and complete.", fuenteNorm))
				{
					Border = Rectangle.NO_BORDER,
					BorderColor = new BaseColor(System.Drawing.Color.Transparent)
				};

				generalBody.AddCell(cellParr1);

				generalBody.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				generalBody.Rows[2].GetCells()[0].Border = Rectangle.NO_BORDER;

				PdfPCell cellParr2 = new PdfPCell(new Phrase("I understand that a panel physician and affiliated health professionals and institutions will conduct the IME and relatedtests for the purpose of determining my admissibility or inadmissibility on health grounds pursuant to the Immigration andRefugees Protection Act (IRPA), and will enter the results into the eMedical system which will then be transferred to IRCCby the Australian Department of Immigration and Border Protection (DIBP). The IME includes (but is not limited to) a fullphysical examination, a questionnaire related to my past and current health condition(s), a chest x-ray, HIV and Syphilisblood tests, and a urine test.", fuenteNorm))
				{
					Border = Rectangle.NO_BORDER,
					BorderColor = new BaseColor(System.Drawing.Color.Transparent)
				};
				generalBody.AddCell(cellParr2);

				generalBody.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				generalBody.Rows[4].GetCells()[0].Border = Rectangle.NO_BORDER;

				PdfPCell cellBorder = new PdfPCell
				{
					Border = Rectangle.BOX,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black)
				};

				PdfPTable tableBorder = new PdfPTable(1)
				{
					WidthPercentage = 100
				};

				tableBorder.AddCell(new PdfPCell(new Phrase("Storage of Immigration Medical Information in the eMedical System", fuente)));
				tableBorder.Rows[0].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableBorder.Rows[0].GetCells()[0].HorizontalAlignment = 1;

				tableBorder.AddCell(new PdfPCell(new Phrase("I understand that the information collected and stored related to my immigration medical examination, including adigital facial photograph, will be electronically processed in the eMedical system. The eMedical system is an electronicsystem, which is hosted, operated and maintained by DIBP. The information collected which relates to my IME will betemporarily stored in the eMedical system and electronically transferred to IRCC in Canada. DIBP and IRCC may sharethis information for purposes related to the operation and maintenance of the eMedical system. DIBP will preserve andkeep confidential any information in relation to my IME that is collected or stored within eMedical and will not use ordisclose the information for any other purposes unless authorized by law.", fuenteNorm)));
				tableBorder.Rows[1].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableBorder.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				tableBorder.Rows[2].GetCells()[0].Border = Rectangle.NO_BORDER;

				tableBorder.AddCell(new PdfPCell(new Phrase("I also Understand that:", fuenteNorm)));
				tableBorder.Rows[3].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableBorder.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				tableBorder.Rows[4].GetCells()[0].Border = Rectangle.NO_BORDER;

				tableBorder.AddCell(new PdfPCell(new Phrase("•  If the information collected in relation to my IME is not stored within the eMedical system, then the processing of myapplication will be delayed;", fuenteNorm)));
				tableBorder.Rows[5].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableBorder.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				tableBorder.Rows[6].GetCells()[0].Border = Rectangle.NO_BORDER;

				tableBorder.AddCell(new PdfPCell(new Phrase("•  DIBP and IRCC have privacy policies that contain information about how I can access the information collected andstored in eMedical, seek the correction of such information, submit a complaint regarding a breach of privacy laws orcodes of practice that apply to DIBP or IRCC, and how DIBP and IRCC deal with such complaints.", fuenteNorm)));
				tableBorder.Rows[7].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableBorder.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				tableBorder.Rows[8].GetCells()[0].Border = Rectangle.NO_BORDER;

				tableBorder.AddCell(new PdfPCell(new Phrase("•  Clients to Canada seeking access to the information collected and stored in eMedical should contact IRCC whichwill liaise with DIBP as required.", fuenteNorm)));
				tableBorder.Rows[9].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableBorder.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				tableBorder.Rows[10].GetCells()[0].Border = Rectangle.NO_BORDER;

				tableBorder.AddCell(new PdfPCell(new Phrase("•  DIBP’s privacy policy is available at: https://www.border.gov.au/about/access-accountability/plans-policies-charters/policies/privacy", fuenteNorm)));
				tableBorder.Rows[11].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableBorder.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				tableBorder.Rows[12].GetCells()[0].Border = Rectangle.NO_BORDER;

				tableBorder.AddCell(new PdfPCell(new Phrase("•  IRCC’s privacy policy is available at: http://www.cic.gc.ca/english/department/atip/index.asp", fuenteNorm)));
				tableBorder.Rows[13].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableBorder.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				tableBorder.Rows[14].GetCells()[0].Border = Rectangle.NO_BORDER;

				cellBorder.AddElement(tableBorder);
				generalBody.AddCell(cellBorder);

				generalBody.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				generalBody.Rows[6].GetCells()[0].Border = Rectangle.BOX;
				generalBody.Rows[6].GetCells()[0].BorderWidth = 1;
				generalBody.Rows[6].GetCells()[0].BackgroundColor = new BaseColor(System.Drawing.Color.Gray);

				PdfPCell cellBorder2 = new PdfPCell
				{
					Border = Rectangle.BOX,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black)
				};

				PdfPTable tableNotice = new PdfPTable(1)
				{
					WidthPercentage = 100
				};

				tableNotice.AddCell(new PdfPCell(new Phrase("Notice of Subsequent Sharing of Medical and Personal Information", fuente)));
				tableNotice.Rows[0].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableNotice.Rows[0].GetCells()[0].HorizontalAlignment = 1;

				tableNotice.AddCell(new PdfPCell(new Phrase("If the results of this IME indicate that I have a medical condition related to a danger to public health, I understand thata condition of my admissibility to Canada will be a requirement to report to a provincial/territorial or local public healthauthority for a medical follow-up (medical surveillance) upon my arrival in Canada.", fuenteNorm)));
				tableNotice.Rows[1].GetCells()[0].Border = Rectangle.NO_BORDER;

				tableNotice.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				tableNotice.Rows[2].GetCells()[0].Border = Rectangle.NO_BORDER;

				tableNotice.AddCell(new PdfPCell(new Phrase("I understand that IRCC will:", fuenteNorm)));
				tableNotice.Rows[3].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableNotice.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				tableNotice.Rows[4].GetCells()[0].Border = Rectangle.NO_BORDER;

				tableNotice.AddCell(new PdfPCell(new Phrase("•  Notify the appropriate public health authority of these results, and the requirement for medical follow-up (medicalsurveillance) for purposes related to the administration of IRPA and to protect the health and safety of Canadians;", fuenteNorm)));
				tableNotice.Rows[5].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableNotice.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				tableNotice.Rows[6].GetCells()[0].Border = Rectangle.NO_BORDER;

				tableNotice.AddCell(new PdfPCell(new Phrase("•  Share the information contained in my IME with the public health authority;", fuenteNorm)));
				tableNotice.Rows[7].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableNotice.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				tableNotice.Rows[8].GetCells()[0].Border = Rectangle.NO_BORDER;

				tableNotice.AddCell(new PdfPCell(new Phrase("•  Collect information from the public health authority regarding compliance with the medical follow-up (medicalsurveillance) requirement in Canada;", fuenteNorm)));
				tableNotice.Rows[9].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableNotice.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				tableNotice.Rows[10].GetCells()[0].Border = Rectangle.NO_BORDER;

				tableNotice.AddCell(new PdfPCell(new Phrase("•  Update my immigration file condition upon receipt of the compliance information.", fuenteNorm)));
				tableNotice.Rows[11].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableNotice.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				tableNotice.Rows[12].GetCells()[0].Border = Rectangle.NO_BORDER;

				tableNotice.AddCell(new PdfPCell(new Phrase("I also understand that any change of residential address in Canada within 3 months of arrival in Canada must be providedto IRCC.", fuenteNorm)));
				tableNotice.Rows[13].GetCells()[0].Border = Rectangle.NO_BORDER;
				tableNotice.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				tableNotice.Rows[14].GetCells()[0].Border = Rectangle.NO_BORDER;

				cellBorder2.AddElement(tableNotice);
				generalBody.AddCell(cellBorder2);

				generalBody.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				generalBody.Rows[8].GetCells()[0].Border = Rectangle.NO_BORDER;

				generalBody.AddCell(new PdfPCell(new Phrase("I understand that misrepresentation by an applicant providing false information is an offence under section 127 of IRPAand may result in finding of inadmissibility to Canada or removal from Canada.", fuenteNorm)));
				generalBody.Rows[9].GetCells()[0].Border = Rectangle.NO_BORDER;

				generalBody.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				generalBody.Rows[10].GetCells()[0].Border = Rectangle.NO_BORDER;

				generalBody.AddCell(new PdfPCell(new Phrase("I understand that I have a right to refuse (in full or in part) to have the IME but accept that such a refusal will have anegative impact on my application for immigration to Canada.", fuenteNorm)));
				generalBody.Rows[11].GetCells()[0].Border = Rectangle.NO_BORDER;

				generalBody.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				generalBody.Rows[12].GetCells()[0].Border = Rectangle.NO_BORDER;

				generalBody.AddCell(new PdfPCell(new Phrase("I, " + (isUnderAgePerson ? nombreTutor : nombreComPac) + " have read and understand this declaration and notice.", fuenteNorm)));
				generalBody.Rows[13].GetCells()[0].Border = Rectangle.NO_BORDER;

				generalBody.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				generalBody.Rows[14].GetCells()[0].Border = Rectangle.NO_BORDER;

				#region Bloque firmas

				PdfPCell cellBorder3 = new PdfPCell
				{
					Border = Rectangle.NO_BORDER
				};
				/*
                cellBorder3.BorderWidth = 1;
                cellBorder3.BorderColor = new BaseColor(System.Drawing.Color.Black);
                */

				PdfPTable tableFirmas = new PdfPTable(6)
				{
					WidthPercentage = 100
				};

				PdfPCell celLstNamePac = new PdfPCell(new Phrase(objEntPac.Apellidos, fuenteNorm))
				{
					Border = Rectangle.BOX,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					Colspan = 2
				};

				tableFirmas.AddCell(celLstNamePac);

				PdfPCell cellNomPac = new PdfPCell(new Phrase(objEntPac.Nombres, fuenteNorm))
				{
					Border = Rectangle.BOX,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					Colspan = 2
				};
				tableFirmas.AddCell(cellNomPac);

				PdfPCell cellFechNacPac = new PdfPCell(new Phrase(objEntPac.FechaNacimiento.ToString("yyyy-MM-dd"), fuenteNorm))
				{
					Border = Rectangle.BOX,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					Colspan = 2
				};
				tableFirmas.AddCell(cellFechNacPac);

				PdfPCell cellFirmaPac = new PdfPCell(new Phrase(" ", fuenteNorm))
				{
					Border = Rectangle.LEFT_BORDER,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					HorizontalAlignment = 1,
					Colspan = 4
				};
				tableFirmas.AddCell(cellFirmaPac);

				PdfPCell cellFecFirmaPac = new PdfPCell(new Phrase(" ", fuenteNorm))
				{
					Border = Rectangle.RIGHT_BORDER,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					HorizontalAlignment = 1,
					Colspan = 2
				};
				tableFirmas.AddCell(cellFecFirmaPac);

				PdfPCell cellWitheSpc1 = new PdfPCell(new Phrase(" ", fuenteNorm))
				{
					Border = Rectangle.LEFT_BORDER,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					HorizontalAlignment = 1,
					Colspan = 4
				};
				tableFirmas.AddCell(cellWitheSpc1);

				PdfPCell cellWitheSpc2 = new PdfPCell(new Phrase(" ", fuenteNorm))
				{
					Border = Rectangle.RIGHT_BORDER,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					HorizontalAlignment = 1,
					Colspan = 2
				};
				tableFirmas.AddCell(cellWitheSpc2);

				PdfPCell celltxtSigCli = new PdfPCell(new Phrase("Signature of client", fuenteNorm))
				{
					Border = Rectangle.LEFT_BORDER,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					HorizontalAlignment = 1,
					Colspan = 4
				};
				tableFirmas.AddCell(celltxtSigCli);

				PdfPCell celltxtDateSig = new PdfPCell(new Phrase("Date (YYYY-MM-DD)", fuenteNorm))
				{
					Border = Rectangle.RIGHT_BORDER,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					HorizontalAlignment = 1,
					Colspan = 2
				};
				tableFirmas.AddCell(celltxtDateSig);

				PdfPCell clTituloTutor = new PdfPCell(new Phrase("DECLARATION OF PARENT/LEGAL GUARDIAN (client under 16 years of age)", fuente))
				{
					Border = Rectangle.BOX,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					HorizontalAlignment = 1,
					Colspan = 6
				};
				tableFirmas.AddCell(clTituloTutor);

				PdfPCell cltxtDeclBeh = new PdfPCell(new Phrase("This declaration was made on behalf of:" + (isUnderAgePerson ? nombreComPac : ""), fuenteNorm))
				{
					Border = Rectangle.LEFT_BORDER,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					HorizontalAlignment = 1,
					Colspan = 3
				};
				tableFirmas.AddCell(cltxtDeclBeh);

				PdfPCell clBy = new PdfPCell(new Phrase("By:" + (isUnderAgePerson ? nombreTutor : ""), fuenteNorm))
				{
					Border = Rectangle.RIGHT_BORDER,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					HorizontalAlignment = 1,
					Colspan = 3
				};
				tableFirmas.AddCell(clBy);

				PdfPCell clWhiteSpace3 = new PdfPCell(new Phrase(" ", fuenteNorm))
				{
					Border = Rectangle.LEFT_BORDER,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					HorizontalAlignment = 1,
					Colspan = 4
				};
				tableFirmas.AddCell(clWhiteSpace3);

				PdfPCell clWhiteSpace4 = new PdfPCell(new Phrase(" ", fuenteNorm))
				{
					Border = Rectangle.RIGHT_BORDER,
					BorderWidth = 1,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					HorizontalAlignment = 1,
					Colspan = 2
				};
				tableFirmas.AddCell(clWhiteSpace4);

				//se carga el objeto con la imagen del paciente
				iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(imageSign);
				img.Border = 0;
				img.BorderWidth = 0;
				img.Alignment = Element.RECTANGLE;

				// si no es menor debe ir la firma en esta sección
				if (!isUnderAgePerson)
				{
					tableFirmas.Rows[1].GetCells()[0].AddElement(img);
					tableFirmas.Rows[1].GetCells()[4].AddElement(new Phrase(DateTime.Now.ToString("yyyy-MM-dd"), fuenteNorm));
				}
				else
				{
					tableFirmas.Rows[6].GetCells()[0].AddElement(img);
					tableFirmas.Rows[6].GetCells()[4].AddElement(new Phrase(DateTime.Now.ToString("yyyy-MM-dd"), fuenteNorm));
				}

				cellBorder3.AddElement(tableFirmas);
				generalBody.AddCell(cellBorder3);

				#endregion Bloque firmas

				generalBody.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				generalBody.Rows[16].GetCells()[0].Border = Rectangle.NO_BORDER;

				generalBody.AddCell(new PdfPCell(new Phrase("Name of witness: " + nombreUsuarioTestigo, fuenteNorm)));
				generalBody.Rows[17].GetCells()[0].Border = Rectangle.NO_BORDER;

				PdfPTable tblSignWitn = new PdfPTable(4);

				PdfPCell clTblSignWit1 = new PdfPCell(new Phrase("Signature of witness:", fuenteNorm))
				{
					Border = Rectangle.NO_BORDER
				};
				tblSignWitn.AddCell(clTblSignWit1);

				PdfPCell clTblSignWit = new PdfPCell(new Phrase(" ", fuenteNorm));
				if (imgSigWit.Length > 0)
				{
					iTextSharp.text.Image imgWit = iTextSharp.text.Image.GetInstance(imgSigWit);
					imgWit.Border = 0;
					imgWit.BorderWidth = 0;
					imgWit.Alignment = Element.RECTANGLE;
					clTblSignWit.AddElement(imgWit);
					clTblSignWit.Border = Rectangle.NO_BORDER;
				}
				tblSignWitn.AddCell(clTblSignWit);

				PdfPCell clTblSignFechFirm = new PdfPCell(new Phrase("Date: ", fuenteNorm))
				{
					Border = Rectangle.NO_BORDER
				};
				tblSignWitn.AddCell(clTblSignFechFirm);

				PdfPCell cltblsigDate = new PdfPCell(new Phrase(DateTime.Now.ToString("yyyy-MM-dd"), fuenteNorm))
				{
					Border = Rectangle.NO_BORDER
				};
				tblSignWitn.AddCell(cltblsigDate);
				generalBody.AddCell(tblSignWitn);

				generalBody.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				generalBody.Rows[19].GetCells()[0].Border = Rectangle.NO_BORDER;
				generalBody.AddCell(new PdfPCell(new Phrase(" ", fuenteNorm)));
				generalBody.Rows[20].GetCells()[0].Border = Rectangle.NO_BORDER;

				PdfPCell cellFinal = new PdfPCell(new Phrase("This information is provided in support of my application to IRCC and is collected under the authority of IRPA and its Regulations. It will be used to render adecision regarding this application and may be used for future applications. It is retained to maintain a record of my application for the purpose of the administrationof IRPA. It will be stored in the Personal Information Bank IRCC PPU 052 related to Medical Records. It may be shared with other organizations under the consistentuse provision of the Privacy Act, pursuant to federal/provincial/territorial or local information exchange agreements or as required by law. Under the PrivacyAct and the Access to Information Act individuals have the right to protection of an access to their personal information. Details on these matters are available atwww.infosource.gc.ca . Info Source is also available at Public Libraries in Canada.", fuenteNorm))
				{
					Border = Rectangle.BOX,
					BorderColor = new BaseColor(System.Drawing.Color.Black),
					BorderWidth = 1
				};

				generalBody.AddCell(cellFinal);

				objDoc.Add(generalBody);
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
		}

		private void ConstruirDeclaracionAustralia(
	  Document objDoc,
	  HistoriaMedica objEntHm,
	  Paciente objEntPac,
	  byte[] imageSign,
	  string pathLogos)
		{
			try
			{
				string nombreComPac = objEntPac.Nombres + " " + objEntPac.Apellidos;
				string nombreTutor = objEntPac.Acudiente;
				bool isUnderAgePerson = objEntPac.FechaNacimiento >= DateTime.Now.AddYears(-15);

				iTextSharp.text.Font fuente = new Font(iTextSharp.text.Font.FontFamily.HELVETICA, 14f, 1, new iTextSharp.text.BaseColor(System.Drawing.Color.Black));
				iTextSharp.text.Font fuenteNorm = new Font(iTextSharp.text.Font.FontFamily.HELVETICA, 12f, 0, new iTextSharp.text.BaseColor(System.Drawing.Color.Black));

				Paragraph parrafoImg = new Paragraph(1);
				iTextSharp.text.Image imgGovAus = iTextSharp.text.Image.GetInstance(pathLogos + "AusInmLogo.png");
				parrafoImg.Add(imgGovAus);

				objDoc.Add(parrafoImg);

				Paragraph parrafoTexto1 = new Paragraph
				{
					new Phrase("Client declaration\n", fuente),

					new Phrase("I, " + nombreComPac + ", declare that the information that I have provided in terms of my medical history and during my immigration health examinations as recorded in eMedical "
										+ "is true and correct.\n", fuenteNorm),

					new Phrase("I understand that:\n\n", fuenteNorm),

					new Phrase("• my personal details and health information are being collected in the eMedical system to enable to the Department of Immigration and Border Protection (DIBP) officers to determine whether or not they are "
										 + "satisfied that I meet the health criteria for an Australia visa(s);\n\n", fuenteNorm),

					new Phrase("• DIBP can collect and use personal and sensitive information entered into eMedical in accordance with the PrivacyAct 1988 (the Privacy Act);\n\n", fuenteNorm),

					new Phrase("• as required health examinations must be completed and assessed prior to a visa decision being made, if the information I have provided is not stored within the eMedical System, the processing of my visa "
												+ "application will be delayed, and my visa application may be refused if I fail to complete the required health examinations;\n\n", fuenteNorm),

					new Phrase("• if I have provided any false or misleading information to DIBP as part of my immigration health examination, my visa application(s) may be refused and/or any visa subsequently issued cancelled;\n\n", fuenteNorm),

					new Phrase("• DIBP has a privacy policy that contains information about how I can access the information stored in eMedical,seek the correction of such information, complain about a breach of any Australian privacy "
											+ "laws or codes of practice that apply to DIBP, and how DIBP deals with such complaints. This privacy policy is available at: http://www.border.gov.au/AccessandAccountability/Pages/Privacy.aspx; \n\n", fuenteNorm),

					new Phrase("• a DIBP privacy notice is available at: http://www.border.gov.au/forms/Documents/1442i.pdf. Important information about the collection, use and disclosure (to other agencies and third parties, "
											+ "including overseas entities) of your personal information, including sensitive information, is contained in this notice.\n\n", fuenteNorm),

					new Phrase("• further information about eMedical and arrangements in place to protect your personal information where stored in eMedical is available on the DIBP website at "
											+ "http://www.border.gov.au/Trav/Visa/Heal/Meeting-the-health-requirement/electronic-health-processing;" + " and\n\n", fuenteNorm),

					new Phrase("• DIBP's contact details are outlined on its website at: http://www.border.gov.au/Lega/Lega/Help/help \n\n", fuenteNorm)
				};
				objDoc.Add(parrafoTexto1);

				Paragraph parrafoTexto2 = new Paragraph
				{
					new Phrase("In accordance with the Privacy Act, I consent to:\n", fuenteNorm),
					new Phrase("•	my personal and sensitive information (such as my medical information) being collected and stored in the eMedical system that is hosted by DIBP, and automatically submitted to DIBP for the "
									+ "purposes of assessing my health for current or future Australian visa applications;\n\n", fuenteNorm),

					new Phrase("•	DIBP storing my digital photograph(s) which may be used by DIBP for client identification purposes in addition to the health examination process;\n\n", fuenteNorm),

					new Phrase("•	DIBP retaining my medical information, including any x-ray images uploaded to eMedical, beyond the finalisation of my visa application, for the purposes of considering future applications "
									+ "I may make for a visa to Australia;\n\n", fuenteNorm),

					new Phrase("•	the Commonwealth of Australia becoming the owner of the information entered into eMedical and that this information will be passed to DIBP;\n\n", fuenteNorm),

					new Phrase("•	DIBP may destroy my personal data (including digital x-ray images and photographs) stored in eMedical after a certain period of time where consistent with DIBP’s archiving obligations and "
									+ "any current disposal authorities.Consequently, if I do not request a copy of this data from the clinic I attend when undergoing my immigration health examinations, it may not be available for me "
									+ "to retrieve at a later date;\n\n", fuenteNorm),

					new Phrase("•	DIBP disclosing my personal information, including information about my health and any complaint I may lodge, to the radiologists/panel doctors and clinic administrative staff. The reasons for "
									+ "this disclosure will be to investigate and resolve inconsistencies, complaints or audit recommendations; and\n\n", fuenteNorm),

					new Phrase("•	my personal information (including my sensitive information) stored in eMedical (including medical results, biodetails and digital photographs) to be disclosed to:\n", fuenteNorm),

					new Phrase(" −	Australian Government health agencies, the Department of Social Services for the purposes of administering and delivering Humanitarian Settlement Services (HSS) support to me, health and settlement "
									+ "service providers and examining doctor(s) – this may include eMedical clinics of my choice involved in the processing of my case outside Australia, DIBP’s migration medical service provider, as well as State "
									+ "and Territory health agencies;\n\n", fuenteNorm),

					new Phrase(" −	Australian Government agencies authorised to receive information relating to adoption, border control, business skills, citizenship, education, health assessment, health insurance, health services, "
									+ "law enforcement, payment of pensions and benefits, taxation, superannuation, review of decisions, child protection and registration of migration agents;\n\n", fuenteNorm),

					new Phrase(" −	Australian law enforcement, health agencies and international agencies, including overseas recipients in the United Kingdom, the United States of America, Canada and New Zealand, for the purposes of "
									+ "identity checking and panel management, including complaint investigation. [Note: if you are applying for a refugee or humanitarian visa, the department will only disclose this information to another country "
									+ "if it is reasonably satisfied that this information will not be disclosed to your country of claimed persecution]\n\n.", fuenteNorm)
				};

				objDoc.Add(parrafoTexto2);

				Paragraph parrafoTexto3 = new Paragraph();

				if (isUnderAgePerson)
				{
					parrafoTexto3.Add(new Phrase("This declaration was made by " + nombreTutor + " on behalf of " + nombreComPac + "\n\nRelationship: Guardian\n\n", fuenteNorm));
				}
				else
				{
					parrafoTexto3.Add(new Phrase(nombreComPac, fuenteNorm));
				}
				parrafoTexto3.Add(new Phrase(Environment.NewLine, fuenteNorm));
				parrafoTexto3.Add(new Phrase(DateTime.Now.ToString("dd-MMM-yyyy"), fuenteNorm));

				objDoc.Add(parrafoTexto3);

				//se carga el objeto con la imagen del paciente
				iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(imageSign);
				img.Border = 0;
				img.BorderWidth = 0;
				img.Alignment = Element.RECTANGLE;

				objDoc.Add(img);
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
		}

		public bool GuardarNuevoArchivo(
	  AnexoHistoria objEntity,
	  Stream dataArchivo,
	  string pathToLeaveFilesBase,
	  string fileExtension)
		{
			bool flag = false;
			try
			{
				DbTransaction transaction = BaseConnection.GetTransaction();
				DateTime now = DateTime.Now;
				string str = "Adjunto_" + now.Year.ToString() + (now.Month < 10 ? "0" : string.Empty) + now.Month.ToString() + (now.Day < 10 ? "0" : string.Empty) + now.Day.ToString() + (now.Hour < 10 ? "0" : string.Empty) + now.Hour.ToString() + (now.Minute < 10 ? "0" : string.Empty) + now.Minute.ToString() + "." + fileExtension;
				string path = pathToLeaveFilesBase + objEntity.IdHistoria.ToString() + "\\";
				try
				{
					if (!Directory.Exists(pathToLeaveFilesBase))
					{
						Directory.CreateDirectory(pathToLeaveFilesBase);
						Directory.CreateDirectory(path);
					}
					byte[] buffer = new byte[dataArchivo.Length];
					dataArchivo.Read(buffer, 0, buffer.Length);
					FileStream fileStream = new FileStream(path + str, FileMode.Create, FileAccess.ReadWrite);
					fileStream.Write(buffer, 0, buffer.Length);
					fileStream.Flush();
					fileStream.Close();
					objEntity.NombreArchivo = str;
					if (!this.Save(objEntity, transaction))
						throw new Exception(this.error);
					transaction.Commit();
					flag = true;
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
					transaction.Rollback();
					if (File.Exists(path + str))
						File.Delete(path + str);
				}
				finally
				{
					transaction.Dispose();
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return flag;
		}
	}
}