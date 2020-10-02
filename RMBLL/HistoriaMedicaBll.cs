// Decompiled with JetBrains decompiler
// Type: RMBLL.HistoriaMedicaBll
// Assembly: RMBLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F2C48D5-ED72-4974-B910-3403631DD6A0
// Assembly location: C:\Users\Personal\source\RMBLL.dll

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using RMDAL;
using RMEntity;

namespace RMBLL
{
	public class HistoriaMedicaBll : BaseForm
	{
		public static DataTable Estructure => HistoriaMedicaDao.DtEstructure;

		public DataTable GetList(
		  int idPaciente,
		  DateTime fechaIngreso,
		  int idTipoVisa,
		  string codigoSolicitud,
		  bool tieneRevisonLab,
		  bool showAllTieneRevisonLab,
		  Constants.EstadoRevision estadoRevisionLab,
		  bool showAllEstadoRevisionLab,
		  bool tieneRevisionRad,
		  bool showAllTieneRevisionRad,
		  Constants.EstadoRevision estadoRevisionRad,
		  bool showAllEstadoRevisionRad,
		  bool tieneRevisionMed,
		  bool showAllTieneRevisionMed,
		  Constants.EstadoRevision estadoRevisionMed,
		  bool showAllEstadoRevisionMed,
		  bool finalizada,
		  bool showAllFinalizada,
		  bool liberado,
		  bool showAllLiberado,
		  int idMedico)
		{
			HistoriaMedicaDao historiaMedicaDao = new HistoriaMedicaDao();
			DataTable list = historiaMedicaDao.GetList(idPaciente, fechaIngreso, idTipoVisa, codigoSolicitud, tieneRevisonLab, showAllTieneRevisonLab, estadoRevisionLab, showAllEstadoRevisionLab, tieneRevisionRad, showAllTieneRevisionRad, estadoRevisionRad, showAllEstadoRevisionRad, tieneRevisionMed, showAllTieneRevisionMed, estadoRevisionMed, showAllEstadoRevisionMed, finalizada, showAllFinalizada, liberado, showAllLiberado, idMedico);
			this.error = historiaMedicaDao.Error;
			return list;
		}

		public List<HistoriaMedica> GetHistoriasMedicas(
		  int idPaciente,
		  DateTime fechaIngreso,
		  int idTipoVisa,
		  string codigoSolicitud,
		  bool tieneRevisonLab,
		  bool showAllTieneRevisonLab,
		  Constants.EstadoRevision estadoRevisionLab,
		  bool showAllEstadoRevisionLab,
		  bool tieneRevisionRad,
		  bool showAllTieneRevisionRad,
		  Constants.EstadoRevision estadoRevisionRad,
		  bool showAllEstadoRevisionRad,
		  bool tieneRevisionMed,
		  bool showAllTieneRevisionMed,
		  Constants.EstadoRevision estadoRevisionMed,
		  bool showAllEstadoRevisionMed,
		  bool finalizada,
		  bool showAllFinalizada,
		  bool liberado,
		  bool showAllLiberado,
		  int idMedico)
		{
			HistoriaMedicaDao historiaMedicaDao = new HistoriaMedicaDao();
			List<HistoriaMedica> historiaMedicas = historiaMedicaDao.GetHistoriaMedicas(idPaciente, fechaIngreso, idTipoVisa, codigoSolicitud, tieneRevisonLab, showAllTieneRevisonLab, estadoRevisionLab, showAllEstadoRevisionLab, tieneRevisionRad, showAllTieneRevisionRad, estadoRevisionRad, showAllEstadoRevisionRad, tieneRevisionMed, showAllTieneRevisionMed, estadoRevisionMed, showAllEstadoRevisionMed, finalizada, showAllFinalizada, liberado, showAllLiberado, idMedico);
			this.error = historiaMedicaDao.Error;
			return historiaMedicas;
		}

		public HistoriaMedica Load(int id)
		{
			HistoriaMedicaDao historiaMedicaDao = new HistoriaMedicaDao();
			HistoriaMedica historiaMedica = historiaMedicaDao.Load(id, (DbTransaction)null);
			this.error = historiaMedicaDao.Error;
			return historiaMedica;
		}

		public bool Save(HistoriaMedica objEnt, Paciente objEntPaciente)
		{
			bool flag = false;
			try
			{
				DbTransaction transaction = BaseConnection.GetTransaction();
				try
				{
					HistoriaMedicaDao historiaMedicaDao = new HistoriaMedicaDao();
					PacienteDao pacienteDao = new PacienteDao();
					if (objEnt.Id != int.MinValue)
					{
						if (!historiaMedicaDao.Update(objEnt, transaction))
							throw new Exception(historiaMedicaDao.Error);
						if (objEntPaciente != null && !pacienteDao.Update(objEntPaciente, transaction))
							throw new Exception(pacienteDao.Error);
					}
					else if (!historiaMedicaDao.Create(objEnt, transaction))
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

		public DataTable GetHistoriasPendientesFinalizacion(int idUsuarioVisualiza)
		{
			DataTable dataTable = new DataTable();
			return new HistoriaMedicaDao().GetHistoriasPendientesFinalizacion(idUsuarioVisualiza);
		}

		public DataTable GetListaHistoriaReporte(
		  DateTime fechExmIni,
		  DateTime fechExmFin,
		  int idOpFecha,
		  string nombres,
		  int idOpNombr,
		  string apellidos,
		  int idOpApel,
		  int idEmbajada,
		  int idOpEmb,
		  string numDoc,
		  int idOpNumDoc,
		  byte historiaCerrada,
		  int idOpCieHis,
		  int idMedico,
		  int idOpMedico,
		  byte liberado,
		  int idOpLiberado,
		  string numPass,
		  int idOpPass)
		{
			DataTable dataTable = new DataTable();
			HistoriaMedicaDao historiaMedicaDao = new HistoriaMedicaDao();
			string str1 = string.Empty;
			if (fechExmIni != DateTime.MinValue)
			{
				switch (idOpFecha)
				{
					case 1:
						str1 = "AND FECHA_INGRESO = '" + fechExmIni.ToString("yyyyMMdd") + "'";
						break;

					case 2:
						str1 = "AND FECHA_INGRESO > '" + fechExmIni.ToString("yyyyMMdd") + "'";
						break;

					case 3:
						str1 = "AND FECHA_INGRESO >= '" + fechExmIni.ToString("yyyyMMdd") + "'";
						break;

					case 4:
						str1 = "AND FECHA_INGRESO < '" + fechExmIni.ToString("yyyyMMdd") + "'";
						break;

					case 5:
						str1 = "AND FECHA_INGRESO <= '" + fechExmIni.ToString("yyyyMMdd") + "'";
						break;

					case 6:
						str1 = "AND FECHA_INGRESO <> '" + fechExmIni.ToString("yyyyMMdd") + "'";
						break;

					case 7:
						str1 = "AND (FECHA_INGRESO >= '" + fechExmIni.ToString("yyyyMMdd") + "' AND FECHA_INGRESO <= '" + fechExmFin.ToString("yyyyMMdd") + "')";
						break;
				}
			}
			string str2 = str1;
			string str3;
			if (!(nombres.Trim() != string.Empty))
				str3 = "";
			else
				str3 = " AND NOMBRES " + (idOpNombr == 2 ? "<>" : "=") + " '" + nombres + "'";
			string str4 = str2 + str3;
			string str5;
			if (!(apellidos.Trim() != string.Empty))
				str5 = "";
			else
				str5 = " AND APELLIDOS " + (idOpApel == 2 ? "<>" : "=") + " '" + apellidos + "'";
			string str6 = str4 + str5;
			string str7;
			if (idEmbajada <= 0)
				str7 = "";
			else
				str7 = " AND ID_EMBAJADA " + (idOpEmb == 2 ? (object)"<>" : (object)"=") + " " + (object)idEmbajada;
			string str8 = str6 + str7;
			string str9;
			if (!(numDoc.Trim() != string.Empty))
				str9 = "";
			else
				str9 = " AND NUMERO_DOCUMENTO " + (idOpNumDoc == 2 ? "<>" : "=") + " '" + numDoc + "'";
			string str10 = str8 + str9 + (historiaCerrada != (byte)2 ? "AND FINALIZADA " + (idOpCieHis == 2 ? "<>" : "=") + historiaCerrada.ToString() : "") + (idMedico != int.MinValue ? "AND ID_MEDICO " + (idOpMedico == 2 ? "<>" : "=") + idMedico.ToString() : "") + (liberado != (byte)2 ? " AND LIBERADO " + (idOpLiberado == 2 ? "<>" : "=") + liberado.ToString() : "");
			string str11;
			if (!(numPass.Trim() != string.Empty))
				str11 = "";
			else
				str11 = "AND NUMERO_PASAPORTE " + (idOpPass == 2 ? "<>" : "=") + " '" + numPass + "'";
			string where = str10 + str11;
			return historiaMedicaDao.GetListaHistoriaReporte(where);
		}

		public bool Delete(int idHistToDel, int idUserProcess, string pathFilesToDelete)
		{
			bool flag = false;
			DbTransaction parentTrans = (DbTransaction)null;
			try
			{
				HistoriaMedicaDao historiaMedicaDao = new HistoriaMedicaDao();
				parentTrans = BaseConnection.GetTransaction();
				if (!historiaMedicaDao.Delete(idHistToDel, idUserProcess, parentTrans))
					throw new Exception(historiaMedicaDao.Error);
				parentTrans.Commit();
				flag = true;
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			finally
			{
				parentTrans?.Dispose();
			}
			return flag;
		}

		public bool LiberarHistoria(int idHist, int idUsuario)
		{
			bool flag = false;
			try
			{
				HistoriaMedicaDao historiaMedicaDao = new HistoriaMedicaDao();
				flag = historiaMedicaDao.LiberarHistoria(idHist, idUsuario);
				this.error = historiaMedicaDao.Error;
			}
			catch (Exception ex)
			{
				this.error = ex.Message;
			}
			return flag;
		}
	}
}