// Decompiled with JetBrains decompiler
// Type: RMBLL.PacienteBll
// Assembly: RMBLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F2C48D5-ED72-4974-B910-3403631DD6A0
// Assembly location: C:\Users\Personal\source\RMBLL.dll

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.IO;
using RMDAL;
using RMEntity;

namespace RMBLL
{
	public class PacienteBll : BaseForm
	{
		public static DataTable Estructure => PacienteDao.DtEstructure;

		public DataTable GetList(
		  int idTipoDocumento,
		  string numeroDocumento,
		  string numeroPasaporte,
		  string nombres,
		  string apellidos,
		  bool genero,
		  bool showAllGenero,
		  DateTime fechaNacimiento)
		{
			PacienteDao pacienteDao = new PacienteDao();
			DataTable list = pacienteDao.GetList(idTipoDocumento, numeroDocumento, numeroPasaporte, nombres, apellidos, genero, showAllGenero, fechaNacimiento);
			this.error = pacienteDao.Error;
			return list;
		}

		public List<Paciente> GetPacientes(
		  int idTipoDocumento,
		  string numeroDocumento,
		  string numeroPasaporte,
		  string nombres,
		  string apellidos,
		  bool genero,
		  bool showAllGenero,
		  DateTime fechaNacimiento)
		{
			PacienteDao pacienteDao = new PacienteDao();
			List<Paciente> pacientes = pacienteDao.GetPacientes(idTipoDocumento, numeroDocumento, numeroPasaporte, nombres, apellidos, genero, showAllGenero, fechaNacimiento);
			this.error = pacienteDao.Error;
			return pacientes;
		}

		public Paciente Load(int id)
		{
			PacienteDao pacienteDao = new PacienteDao();
			Paciente paciente = pacienteDao.Load(id);
			this.error = pacienteDao.Error;
			return paciente;
		}

		public bool Save(Paciente objEnt)
		{
			PacienteDao pacienteDao = new PacienteDao();
			bool flag = objEnt.Id == int.MinValue ? pacienteDao.Create(objEnt, (DbTransaction)null) : pacienteDao.Update(objEnt, (DbTransaction)null);
			this.error = pacienteDao.Error;
			return flag;
		}

		public object GetListaPacientesPendientes(
		  Constants.TipoRevision tipoRevision,
		  bool isDailyView,
		  bool retornadoDesdeEmbajada)
		{
			DataTable dataTable = new DataTable();
			PacienteDao pacienteDao = new PacienteDao();
			string where = "AND FECHA_INGRESO " + (isDailyView ? "=" : "<=") + "'" + DateTime.Now.ToString("yyyyMMdd") + "'";
			DataTable pacientesPendientes = pacienteDao.GetListaPacientesPendientes(where, tipoRevision, isDailyView, retornadoDesdeEmbajada);
			this.error = pacienteDao.Error;
			return (object)pacientesPendientes;
		}

		public bool IngresarPaciente(
		  Paciente objEntPac,
		  HistoriaMedica objEntHisMed,
		  ArrayList examenes,
		  Stream fotoCargada,
		  string pathFilesPac)
		{
			bool flag1 = false;
			try
			{
				DbTransaction transaction = BaseConnection.GetTransaction();
				string path = string.Empty;
				try
				{
					PacienteDao pacienteDao = new PacienteDao();
					HistoriaMedicaDao historiaMedicaDao = new HistoriaMedicaDao();
					if (!(objEntPac.Id == int.MinValue ? pacienteDao.Create(objEntPac, transaction) : pacienteDao.Update(objEntPac, transaction)))
						throw new Exception(pacienteDao.Error);
					objEntHisMed.IdPaciente = objEntPac.Id;
					bool flag2 = false;
					bool flag3;
					if (objEntHisMed.Id != int.MinValue)
					{
						flag3 = historiaMedicaDao.Update(objEntHisMed, transaction);
						flag2 = true;
					}
					else
						flag3 = historiaMedicaDao.Create(objEntHisMed, transaction);
					if (!flag3)
						throw new Exception(historiaMedicaDao.Error);
					if (examenes.Count > 0)
					{
						DataTable dtEstructure = MuestraLaboratorioDao.DtEstructure;
						foreach (int examene in examenes)
						{
							if (flag2)
							{
								if (new MuestraLaboratorioDao().GetList(objEntHisMed.Id, (Constants.ExamenLab)examene, false, string.Empty, DateTime.MinValue, short.MinValue, transaction).Rows.Count <= 0)
								{
									DataRow row = dtEstructure.NewRow();
									row["ID_HISTORIA"] = (object)objEntHisMed.Id;
									row["ESTADO"] = (object)Convert.ToInt16((object)Constants.EstadosMuestraLaboratorio.SinAplicar);
									row["ID_TIPO_EXAMEN"] = (object)examene;
									row["RESULTADO"] = (object)"SIN REALIZAR";
									row["NUMERO_MUESTRA"] = (object)1;
									row["ID_CREACION"] = (object)objEntPac.IdUltimaModificacion;
									row["FECHA_CREACION"] = (object)DateTime.Now;
									row["ID_ULTIMA_MODIFICACION"] = (object)objEntPac.IdUltimaModificacion;
									row["FECHA_ULTIMA_MODIFICACION"] = (object)DateTime.Now;
									dtEstructure.Rows.Add(row);
								}
							}
							else
							{
								DataRow row = dtEstructure.NewRow();
								row["ID_HISTORIA"] = (object)objEntHisMed.Id;
								row["ESTADO"] = (object)Convert.ToInt16((object)Constants.EstadosMuestraLaboratorio.SinAplicar);
								row["ID_TIPO_EXAMEN"] = (object)examene;
								row["RESULTADO"] = (object)"SIN REALIZAR";
								row["NUMERO_MUESTRA"] = (object)1;
								row["ID_CREACION"] = (object)objEntPac.IdUltimaModificacion;
								row["FECHA_CREACION"] = (object)DateTime.Now;
								row["ID_ULTIMA_MODIFICACION"] = (object)objEntPac.IdUltimaModificacion;
								row["FECHA_ULTIMA_MODIFICACION"] = (object)DateTime.Now;
								dtEstructure.Rows.Add(row);
							}
						}
						if (dtEstructure.Rows.Count > 0)
						{
							MuestraLaboratorioDao muestraLaboratorioDao = new MuestraLaboratorioDao();
							if (!muestraLaboratorioDao.CreateFromDt(dtEstructure, transaction))
								throw new Exception(muestraLaboratorioDao.Error);
						}
					}
					if (fotoCargada != null)
					{
						if (!Directory.Exists(pathFilesPac))
							throw new Exception("La ruta " + pathFilesPac + " no existe o no es accesible desde el servidor.");
						path = pathFilesPac + (object)objEntHisMed.Id + "/";
						string str = "ImgPaciente.png";
						if (!Directory.Exists(path))
							Directory.CreateDirectory(path);
						byte[] buffer = new byte[fotoCargada.Length];
						fotoCargada.Read(buffer, 0, buffer.Length);
						FileStream fileStream = new FileStream(path + str, FileMode.Create, FileAccess.ReadWrite);
						fileStream.Write(buffer, 0, buffer.Length);
						fileStream.Flush();
						fileStream.Close();
						AnexoHistoriaBll anexoHistoriaBll = new AnexoHistoriaBll();
						List<AnexoHistoria> anexoHistorias = anexoHistoriaBll.GetAnexoHistorias(objEntHisMed.Id, Constants.TipoRevision.MedicinaGeneral, false, int.MinValue, "Imagen Perfil Paciente");
						AnexoHistoria objEnt;
						if (anexoHistorias.Count > 0)
						{
							objEnt = anexoHistorias[0];
						}
						else
						{
							objEnt = new AnexoHistoria();
							objEnt.IdCreacion = objEntHisMed.IdUltimaModificacion;
							objEnt.FechaCreacion = DateTime.Now;
						}
						objEnt.IdHistoria = objEntHisMed.Id;
						objEnt.NombreAdjunto = "Imagen Perfil Paciente";
						objEnt.IdTipoRevision = Constants.TipoRevision.MedicinaGeneral;
						objEnt.NombreArchivo = str;
						objEnt.IdUltimaModificacion = objEntHisMed.IdUltimaModificacion;
						objEnt.FechaUltimaModificacion = DateTime.Now;
						if (!anexoHistoriaBll.Save(objEnt, transaction))
							throw new Exception(anexoHistoriaBll.Error);
					}
					transaction.Commit();
					flag1 = true;
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
					transaction.Rollback();
					if (path != null)
					{
						if (path != string.Empty)
						{
							if (Directory.Exists(path))
								Directory.Delete(path, true);
						}
					}
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
			return flag1;
		}
	}
}