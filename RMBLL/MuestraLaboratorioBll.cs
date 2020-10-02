// Decompiled with JetBrains decompiler
// Type: RMBLL.MuestraLaboratorioBll
// Assembly: RMBLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F2C48D5-ED72-4974-B910-3403631DD6A0
// Assembly location: C:\Users\Personal\source\RMBLL.dll

using RMDAL;
using RMEntity;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.IO;

namespace RMBLL
{
	[DataObject]
	public class MuestraLaboratorioBll : BaseForm
	{
		public static DataTable Estructure => MuestraLaboratorioDao.DtEstructure;

		public DataTable GetList(
		  int idHistoria,
		  Constants.ExamenLab idTipoExamen,
		  bool showAllTipoExamen,
		  string resultado,
		  DateTime fechaTomaMuestra,
		  short numeroMuestra)
		{
			MuestraLaboratorioDao muestraLaboratorioDao = new MuestraLaboratorioDao();
			DataTable list = muestraLaboratorioDao.GetList(idHistoria, idTipoExamen, showAllTipoExamen, resultado, fechaTomaMuestra, numeroMuestra, (DbTransaction)null);
			this.error = muestraLaboratorioDao.Error;
			return list;
		}

		public List<MuestraLaboratorio> GetMuestraLaboratorios(
		  int idHistoria,
		  Constants.ExamenLab idTipoExamen,
		  bool showAllTipoExamen,
		  string resultado,
		  DateTime fechaTomaMuestra,
		  short numeroMuestra)
		{
			MuestraLaboratorioDao muestraLaboratorioDao = new MuestraLaboratorioDao();
			List<MuestraLaboratorio> muestraLaboratorios = muestraLaboratorioDao.GetMuestraLaboratorios(idHistoria, idTipoExamen, showAllTipoExamen, resultado, fechaTomaMuestra, numeroMuestra, (DbTransaction)null);
			this.error = muestraLaboratorioDao.Error;
			return muestraLaboratorios;
		}

		public DataTable GetReportMonth(DateTime fechaInicial, DateTime fechaFinal)
		{
			MuestraLaboratorioDao muestraLaboratorioDao = new MuestraLaboratorioDao();
			DataTable reportMonthData = muestraLaboratorioDao.GetReportMonthData(fechaInicial, fechaFinal);
			this.error = muestraLaboratorioDao.Error;
			return reportMonthData;
		}

		[DataObjectMethod(DataObjectMethodType.Select)]
		public DataTable GetReportDates(DateTime fechaInicial, DateTime fechaFinal)
		{
			DataTable dataTable = new DataTable();
			MuestraLaboratorioDao muestraLaboratorioDao = new MuestraLaboratorioDao();
			DataTable reportDatesData = muestraLaboratorioDao.GetReportDatesData(fechaInicial, fechaFinal);
			this.error = muestraLaboratorioDao.Error;
			return reportDatesData;
		}

		public MuestraLaboratorio Load(int id)
		{
			MuestraLaboratorioDao muestraLaboratorioDao = new MuestraLaboratorioDao();
			MuestraLaboratorio muestraLaboratorio = muestraLaboratorioDao.Load(id);
			this.error = muestraLaboratorioDao.Error;
			return muestraLaboratorio;
		}

		public bool Save(MuestraLaboratorio objEnt)
		{
			bool flag = false;
			try
			{
				DbTransaction transaction = BaseConnection.GetTransaction();
				try
				{
					MuestraLaboratorioDao muestraLaboratorioDao = new MuestraLaboratorioDao();
					if (objEnt.Id != int.MinValue)
					{
						flag = muestraLaboratorioDao.Update(objEnt, (DbTransaction)null);
						this.error = muestraLaboratorioDao.Error;
					}
					else
					{
						flag = muestraLaboratorioDao.Create(objEnt, transaction);
						if (!flag)
							throw new Exception(muestraLaboratorioDao.Error);
						HistoriaMedica objHmEnt = new HistoriaMedicaDao().Load(objEnt.IdHistoria, transaction);
						objHmEnt.IdUltimaModificacion = objEnt.IdUltimaModificacion;
						if (!muestraLaboratorioDao.UpdateStatus(objHmEnt, transaction))
							throw new Exception(muestraLaboratorioDao.Error);
					}
					if (flag)
						transaction.Commit();
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
					transaction.Rollback();
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return flag;
		}

		public bool UpdateComments(HistoriaMedica objHmEnt)
		{
			bool flag = false;
			try
			{
				DbTransaction transaction = BaseConnection.GetTransaction();
				try
				{
					MuestraLaboratorioDao muestraLaboratorioDao = new MuestraLaboratorioDao();
					HistoriaMedicaDao historiaMedicaDao = new HistoriaMedicaDao();
					if (!historiaMedicaDao.Update(objHmEnt, transaction))
						throw new Exception(historiaMedicaDao.Error);
					if (!muestraLaboratorioDao.UpdateStatus(objHmEnt, transaction))
						throw new Exception(muestraLaboratorioDao.Error);
					transaction.Commit();
					flag = true;
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
					transaction.Rollback();
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return flag;
		}

		public bool Delete(MuestraLaboratorio objEntML, string pathFilesAnnex)
		{
			bool flag = false;
			DbTransaction transaction = BaseConnection.GetTransaction();
			try
			{
				MuestraLaboratorioDao muestraLaboratorioDao = new MuestraLaboratorioDao();
				if (!muestraLaboratorioDao.Delete(objEntML, transaction))
					throw new Exception(muestraLaboratorioDao.Error);
				AnexoHistoriaDao anexoHistoriaDao = new AnexoHistoriaDao();
				List<AnexoHistoria> anexoHistorias = anexoHistoriaDao.GetAnexoHistorias(objEntML.IdHistoria, Constants.TipoRevision.Laboratorio, false, objEntML.Id, string.Empty, transaction);
				if (anexoHistorias.Count > 0)
				{
					string path = pathFilesAnnex + "\\" + (object)objEntML.IdHistoria + "\\";
					if (Directory.Exists(path))
					{
						foreach (AnexoHistoria objToProcess in anexoHistorias)
						{
							if (File.Exists(path + objToProcess.NombreArchivo))
								File.Delete(path + objToProcess.NombreArchivo);
							if (!anexoHistoriaDao.Delete(objToProcess, transaction))
								throw new Exception(anexoHistoriaDao.Error);
						}
					}
				}
				transaction.Commit();
				flag = true;
			}
			catch (Exception ex)
			{
				transaction.Rollback();
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			finally
			{
				transaction.Dispose();
			}
			return flag;
		}

		public bool SolicitarMuestrasMedicina(
		  int idHistoria,
		  ArrayList arr,
		  int idUsuario,
		  string commentUser)
		{
			bool flag = false;
			try
			{
				DbTransaction transaction = BaseConnection.GetTransaction();
				try
				{
					MuestraLaboratorioDao muestraLaboratorioDao = new MuestraLaboratorioDao();
					HistoriaMedicaDao historiaMedicaDao = new HistoriaMedicaDao();
					HistoriaMedica objToProcess1 = historiaMedicaDao.Load(idHistoria, transaction);
					DataTable dtEstructure = MuestraLaboratorioDao.DtEstructure;
					foreach (string str in arr)
					{
						MuestraLaboratorio objToProcess2 = new MuestraLaboratorio();
						Constants.ExamenLab int32 = (Constants.ExamenLab)Convert.ToInt32(str);
						List<MuestraLaboratorio> muestraLaboratorios = muestraLaboratorioDao.GetMuestraLaboratorios(idHistoria, int32, false, string.Empty, DateTime.MinValue, short.MinValue, transaction);
						if (muestraLaboratorios.Count > 0)
						{
							objToProcess2.NumeroMuestra = muestraLaboratorios[0].NumeroMuestra;
							++objToProcess2.NumeroMuestra;
						}
						else
							objToProcess2.NumeroMuestra = (short)1;
						MuestraLaboratorio muestraLaboratorio = muestraLaboratorios.Count > 0 ? muestraLaboratorios[0] : new MuestraLaboratorio();
						objToProcess2.Estado = Constants.EstadosMuestraLaboratorio.SinAplicar;
						objToProcess2.IdHistoria = idHistoria;
						objToProcess2.IdTipoExamen = int32;
						objToProcess2.Resultado = "SIN APLICAR";
						objToProcess2.FechaTomaMuestra = DateTime.Now;
						objToProcess2.IdCreacion = muestraLaboratorio.IdUltimaModificacion = idUsuario;
						objToProcess2.FechaCreacion = muestraLaboratorio.FechaUltimaModificacion = DateTime.Now;
						if (!muestraLaboratorioDao.Create(objToProcess2, transaction))
							throw new Exception(muestraLaboratorioDao.Error);
					}
					objToProcess1.ComentarioLab += commentUser;
					objToProcess1.IdUltimaModificacion = idUsuario;
					objToProcess1.Finalizada = false;
					objToProcess1.EstadoRevisionLab = Constants.EstadoRevision.SinAplicar;
					objToProcess1.EstadoRevisionMed = Constants.EstadoRevision.SinAplicar;
					if (!historiaMedicaDao.Update(objToProcess1, transaction))
						throw new Exception(historiaMedicaDao.Error);
					transaction.Commit();
					flag = true;
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
					transaction.Rollback();
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
