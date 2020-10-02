// Decompiled with JetBrains decompiler
// Type: RMDAL.HistoriaMedicaDao
// Assembly: RMDAL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: BA8C66A3-8A06-4F3F-AEA9-08BB88600DCC
// Assembly location: C:\Users\Personal\source\RMDAL.dll

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using RMEntity;

namespace RMDAL
{
	public class HistoriaMedicaDao : BaseConnection
	{
		public static DataTable DtEstructure
		{
			get
			{
				DataTable dataTable = new DataTable();
				DataColumn[] columns = new DataColumn[33]
				{
		  new DataColumn("ID", typeof (int)),
		  new DataColumn("ID_PACIENTE", typeof (int)),
		  new DataColumn("FECHA_INGRESO", typeof (object)),
		  new DataColumn("PESO", typeof (Decimal)),
		  new DataColumn("ESTATURA", typeof (Decimal)),
		  new DataColumn("PERIMETRO_CEFALICO", typeof (Decimal)),
		  new DataColumn("ID_TIPO_VISA", typeof (int)),
		  new DataColumn("CODIGO_SOLICITUD", typeof (string)),
		  new DataColumn("PACIENTE_EXTERNO", typeof (bool)),
		  new DataColumn("TIENE_REVISON_LAB", typeof (bool)),
		  new DataColumn("ESTADO_REVISION_LAB", typeof (short)),
		  new DataColumn("COMENTARIO_LAB", typeof (string)),
		  new DataColumn("TIENE_REVISION_RAD", typeof (bool)),
		  new DataColumn("ESTADO_REVISION_RAD", typeof (short)),
		  new DataColumn("RADIOGRAFIA_TOMADA", typeof (bool)),
		  new DataColumn("RADIOGRAFIA_CARGADA_EMEDICAL", typeof (short)),
		  new DataColumn("COMENTARIO_RAD", typeof (string)),
		  new DataColumn("ESTADO_REVISION_RAD_MED", typeof (short)),
		  new DataColumn("COMENTARIO_RAD_MED", typeof (string)),
		  new DataColumn("TIENE_REVISION_MED", typeof (bool)),
		  new DataColumn("ESTADO_REVISION_MED", typeof (short)),
		  new DataColumn("COMENTARIO_MED", typeof (string)),
		  new DataColumn("FINALIZADA", typeof (bool)),
		  new DataColumn("REQUIERE_NOTIFICACION", typeof (bool)),
		  new DataColumn("NOTIFICACION_ENVIADA", typeof (bool)),
		  new DataColumn("RETORNO_EMBAJADA", typeof (bool)),
		  new DataColumn("ES_PRIORITARIO", typeof (bool)),
		  new DataColumn("COMENTARIO_RECEPCION", typeof (string)),
		  new DataColumn("ID_MEDICO", typeof (int)),
		  new DataColumn("ID_CREACION", typeof (int)),
		  new DataColumn("FECHA_CREACION", typeof (DateTime)),
		  new DataColumn("ID_ULTIMA_MODIFICACION", typeof (int)),
		  new DataColumn("FECHA_ULTIMA_MODIFICACION", typeof (DateTime))
				};
				dataTable.Columns.AddRange(columns);
				return dataTable;
			}
		}

		public HistoriaMedicaDao() => this.ObtainInstance();

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
		  bool showAllfinalizada,
		  bool liberado,
		  bool showAllLiberado,
		  int idMedico)
		{
			DataTable dtEstructure = HistoriaMedicaDao.DtEstructure;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_HISTORIA_MEDICA_GET_LIST");
					storedProcCommand.Connection = connection;
					if (idPaciente != int.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@ID_PACIENTE", DbType.Int32, (object)idPaciente);
					else
						this.instance.AddInParameter(storedProcCommand, "@ID_PACIENTE", DbType.Int32, (object)DBNull.Value);
					if (fechaIngreso != DateTime.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@FECHA_INGRESO", DbType.DateTime, (object)fechaIngreso);
					else
						this.instance.AddInParameter(storedProcCommand, "@FECHA_INGRESO", DbType.DateTime, (object)DBNull.Value);
					if (idTipoVisa != int.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_VISA", DbType.Int32, (object)idTipoVisa);
					else
						this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_VISA", DbType.Int32, (object)DBNull.Value);
					if (codigoSolicitud != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@CODIGO_SOLICITUD", DbType.String, (object)codigoSolicitud);
					else
						this.instance.AddInParameter(storedProcCommand, "@CODIGO_SOLICITUD", DbType.String, (object)DBNull.Value);
					if (!showAllTieneRevisonLab)
						this.instance.AddInParameter(storedProcCommand, "@TIENE_REVISON_LAB", DbType.Boolean, (object)tieneRevisonLab);
					else
						this.instance.AddInParameter(storedProcCommand, "@TIENE_REVISON_LAB", DbType.Boolean, (object)DBNull.Value);
					if (!showAllEstadoRevisionLab)
						this.instance.AddInParameter(storedProcCommand, "@ESTADO_REVISION_LAB", DbType.Int16, (object)Convert.ToInt16((object)estadoRevisionLab));
					else
						this.instance.AddInParameter(storedProcCommand, "@ESTADO_REVISION_LAB", DbType.Int16, (object)DBNull.Value);
					if (!showAllTieneRevisionRad)
						this.instance.AddInParameter(storedProcCommand, "@TIENE_REVISION_RAD", DbType.Boolean, (object)tieneRevisionRad);
					else
						this.instance.AddInParameter(storedProcCommand, "@TIENE_REVISION_RAD", DbType.Boolean, (object)DBNull.Value);
					if (!showAllEstadoRevisionRad)
						this.instance.AddInParameter(storedProcCommand, "@ESTADO_REVISION_RAD", DbType.Int16, (object)Convert.ToInt16((object)estadoRevisionRad));
					else
						this.instance.AddInParameter(storedProcCommand, "@ESTADO_REVISION_RAD", DbType.Int16, (object)DBNull.Value);
					if (!showAllTieneRevisionMed)
						this.instance.AddInParameter(storedProcCommand, "@TIENE_REVISION_MED", DbType.Boolean, (object)tieneRevisionMed);
					else
						this.instance.AddInParameter(storedProcCommand, "@TIENE_REVISION_MED", DbType.Boolean, (object)DBNull.Value);
					if (!showAllEstadoRevisionMed)
						this.instance.AddInParameter(storedProcCommand, "@ESTADO_REVISION_MED", DbType.Int16, (object)Convert.ToInt16((object)estadoRevisionMed));
					else
						this.instance.AddInParameter(storedProcCommand, "@ESTADO_REVISION_MED", DbType.Int16, (object)DBNull.Value);
					if (!showAllfinalizada)
						this.instance.AddInParameter(storedProcCommand, "@FINALIZADA", DbType.Boolean, (object)finalizada);
					else
						this.instance.AddInParameter(storedProcCommand, "@FINALIZADA", DbType.Boolean, (object)DBNull.Value);
					if (!showAllLiberado)
						this.instance.AddInParameter(storedProcCommand, "@LIBERADO", DbType.Boolean, (object)liberado);
					else
						this.instance.AddInParameter(storedProcCommand, "@LIBERADO", DbType.Boolean, (object)DBNull.Value);
					if (idMedico != int.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@ID_MEDICO ", DbType.Int32, (object)idMedico);
					else
						this.instance.AddInParameter(storedProcCommand, "@ID_MEDICO ", DbType.Int32, (object)DBNull.Value);
					DbDataAdapter dataAdapter = this.instance.GetDataAdapter();
					dataAdapter.SelectCommand = storedProcCommand;
					dataAdapter.Fill(dtEstructure);
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
				}
				finally
				{
					connection.Close();
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return dtEstructure;
		}

		public List<HistoriaMedica> GetHistoriaMedicas(
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
			List<HistoriaMedica> historiaMedicaList = new List<HistoriaMedica>();
			try
			{
				foreach (DataRow row in (InternalDataCollectionBase)this.GetList(idPaciente, fechaIngreso, idTipoVisa, codigoSolicitud, tieneRevisonLab, showAllTieneRevisonLab, estadoRevisionLab, showAllEstadoRevisionLab, tieneRevisionRad, showAllTieneRevisionRad, estadoRevisionRad, showAllEstadoRevisionRad, tieneRevisionMed, showAllTieneRevisionMed, estadoRevisionMed, showAllEstadoRevisionMed, finalizada, showAllFinalizada, liberado, showAllLiberado, idMedico).Rows)
				{
					HistoriaMedica objToLoad = new HistoriaMedica();
					this.LoadFromDataRow(ref objToLoad, row);
					historiaMedicaList.Add(objToLoad);
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return historiaMedicaList;
		}

		public DataTable GetHistoriasPendientesFinalizacion(int idUsuarioVisualiza)
		{
			DataTable dataTable = new DataTable();
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_HISTORIA_MEDICA_PENDING_TO_FINISH");
					storedProcCommand.Connection = connection;
					this.instance.AddInParameter(storedProcCommand, "@ID_USUARIO", DbType.Int32, (object)idUsuarioVisualiza);
					DbDataAdapter dataAdapter = this.instance.GetDataAdapter();
					dataAdapter.SelectCommand = storedProcCommand;
					dataAdapter.Fill(dataTable);
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
				}
				finally
				{
					connection.Close();
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return dataTable;
		}

		public DataTable GetListaHistoriaReporte(string where)
		{
			DataTable dtEstructure = HistoriaMedicaDao.DtEstructure;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_HISTORIA_MEDICA_GET_LIST_REPORT");
					storedProcCommand.Connection = connection;
					this.instance.AddInParameter(storedProcCommand, "@STR_WHERE", DbType.String, (object)where);
					DbDataAdapter dataAdapter = this.instance.GetDataAdapter();
					dataAdapter.SelectCommand = storedProcCommand;
					dataAdapter.Fill(dtEstructure);
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
				}
				finally
				{
					connection.Close();
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return dtEstructure;
		}

		public HistoriaMedica Load(int id, DbTransaction parentTrans) => this.GetByPK(id, parentTrans);

		public bool Create(HistoriaMedica objToProcess, DbTransaction parentTransaction)
		{
			bool flag = false;
			try
			{
				DbConnection dbConnection = (DbConnection)null;
				try
				{
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_HISTORIA_MEDICA_CREATE");
					this.instance.AddOutParameter(storedProcCommand, "@ID", DbType.Int32, 4);
					this.instance.AddInParameter(storedProcCommand, "@ID_PACIENTE", DbType.Int32, (object)objToProcess.IdPaciente);
					this.instance.AddInParameter(storedProcCommand, "@FECHA_INGRESO", DbType.Date, (object)objToProcess.FechaIngreso);
					if (objToProcess.Peso != Decimal.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@PESO", DbType.Decimal, (object)objToProcess.Peso);
					else
						this.instance.AddInParameter(storedProcCommand, "@PESO", DbType.Decimal, (object)0);
					if (objToProcess.Estatura != Decimal.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@ESTATURA", DbType.Decimal, (object)objToProcess.Estatura);
					else
						this.instance.AddInParameter(storedProcCommand, "@ESTATURA", DbType.Decimal, (object)0);
					if (objToProcess.PerimetroCefalico != Decimal.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@PERIMETRO_CEFALICO", DbType.Decimal, (object)objToProcess.PerimetroCefalico);
					else
						this.instance.AddInParameter(storedProcCommand, "@PERIMETRO_CEFALICO", DbType.Decimal, (object)DBNull.Value);
					if (objToProcess.IdTipoVisa != int.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_VISA", DbType.Int32, (object)objToProcess.IdTipoVisa);
					else
						this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_VISA", DbType.Int32, (object)DBNull.Value);
					if (objToProcess.CodigoSolicitud != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@CODIGO_SOLICITUD", DbType.String, (object)objToProcess.CodigoSolicitud);
					else
						this.instance.AddInParameter(storedProcCommand, "@CODIGO_SOLICITUD", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@PACIENTE_EXTERNO", DbType.Boolean, (object)objToProcess.PacienteExterno);
					this.instance.AddInParameter(storedProcCommand, "@TIENE_REVISON_LAB", DbType.Boolean, (object)objToProcess.TieneRevisonLab);
					this.instance.AddInParameter(storedProcCommand, "@ESTADO_REVISION_LAB", DbType.Int16, (object)objToProcess.EstadoRevisionLab);
					if (objToProcess.ComentarioLab != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_LAB", DbType.String, (object)objToProcess.ComentarioLab);
					else
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_LAB", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@TIENE_REVISION_RAD", DbType.Boolean, (object)objToProcess.TieneRevisionRad);
					this.instance.AddInParameter(storedProcCommand, "@ESTADO_REVISION_RAD", DbType.Int16, (object)objToProcess.EstadoRevisionRad);
					if (objToProcess.ComentarioRad != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_RAD", DbType.String, (object)objToProcess.ComentarioRad);
					else
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_RAD", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@RADIOGRAFIA_TOMADA", DbType.Boolean, (object)objToProcess.RadiografiaTomada);
					this.instance.AddInParameter(storedProcCommand, "@RADIOGRAFIA_CARGADA_EMEDICAL", DbType.Boolean, (object)objToProcess.RadiografiaCargadaEmedical);
					this.instance.AddInParameter(storedProcCommand, "@ESTADO_REVISION_RAD_MED", DbType.Int16, (object)objToProcess.EstadoRevisionRadMed);
					if (objToProcess.ComentarioRadMed != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_RAD_MED", DbType.String, (object)objToProcess.ComentarioRadMed);
					else
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_RAD_MED", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@TIENE_REVISION_MED", DbType.Boolean, (object)objToProcess.TieneRevisionMed);
					this.instance.AddInParameter(storedProcCommand, "@ESTADO_REVISION_MED", DbType.Int16, (object)objToProcess.EstadoRevisionMed);
					if (objToProcess.ComentarioMed != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_MED", DbType.String, (object)objToProcess.ComentarioMed);
					else
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_MED", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@FINALIZADA", DbType.Boolean, (object)objToProcess.Finalizada);
					this.instance.AddInParameter(storedProcCommand, "@REQUIERE_NOTIFICACION", DbType.Boolean, (object)objToProcess.RequiereNotificacion);
					this.instance.AddInParameter(storedProcCommand, "@NOTIFICACION_ENVIADA", DbType.Boolean, (object)objToProcess.NotificacionEnviada);
					this.instance.AddInParameter(storedProcCommand, "@RETORNADO_EMBAJADA", DbType.Boolean, (object)objToProcess.RetornadoEmbajada);
					this.instance.AddInParameter(storedProcCommand, "@ES_PRIORITARIO", DbType.Boolean, (object)objToProcess.EsPrioritario);
					if (objToProcess.ComentarioRecepcion != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_RECEPCION", DbType.String, (object)objToProcess.ComentarioRecepcion);
					else
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_RECEPCION", DbType.String, (object)DBNull.Value);
					if (objToProcess.IdMedico != int.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@ID_MEDICO", DbType.Int32, (object)objToProcess.IdMedico);
					else
						this.instance.AddInParameter(storedProcCommand, "@ID_MEDICO", DbType.Int32, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@ID_CREACION", DbType.Int32, (object)objToProcess.IdCreacion);
					if (parentTransaction != null)
					{
						storedProcCommand.Connection = parentTransaction.Connection;
						storedProcCommand.Transaction = parentTransaction;
						this.instance.ExecuteNonQuery(storedProcCommand, parentTransaction);
					}
					else
					{
						dbConnection = this.instance.CreateConnection();
						dbConnection.Open();
						storedProcCommand.Connection = dbConnection;
						this.instance.ExecuteNonQuery(storedProcCommand);
					}
					objToProcess.Id = Convert.ToInt32(storedProcCommand.Parameters["@ID"].Value);
					flag = true;
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
				}
				finally
				{
					if (parentTransaction == null)
						if (dbConnection != null) dbConnection.Close();
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return flag;
		}

		public bool Update(HistoriaMedica objToProcess, DbTransaction parentTrans)
		{
			bool flag = false;
			try
			{
				DbConnection dbConnection = (DbConnection)null;
				try
				{
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_HISTORIA_MEDICA_UPDATE");
					this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object)objToProcess.Id);
					this.instance.AddInParameter(storedProcCommand, "@ID_PACIENTE", DbType.Int32, (object)objToProcess.IdPaciente);
					this.instance.AddInParameter(storedProcCommand, "@FECHA_INGRESO", DbType.Date, (object)objToProcess.FechaIngreso);
					if (objToProcess.Peso != Decimal.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@PESO", DbType.Decimal, (object)objToProcess.Peso);
					else
						this.instance.AddInParameter(storedProcCommand, "@PESO", DbType.Decimal, (object)0);
					if (objToProcess.Estatura != Decimal.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@ESTATURA", DbType.Decimal, (object)objToProcess.Estatura);
					else
						this.instance.AddInParameter(storedProcCommand, "@ESTATURA", DbType.Decimal, (object)0);
					if (objToProcess.PerimetroCefalico != Decimal.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@PERIMETRO_CEFALICO", DbType.Decimal, (object)objToProcess.PerimetroCefalico);
					else
						this.instance.AddInParameter(storedProcCommand, "@PERIMETRO_CEFALICO", DbType.Decimal, (object)DBNull.Value);
					if (objToProcess.IdTipoVisa != int.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_VISA", DbType.Int32, (object)objToProcess.IdTipoVisa);
					else
						this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_VISA", DbType.Int32, (object)DBNull.Value);
					if (objToProcess.CodigoSolicitud != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@CODIGO_SOLICITUD", DbType.String, (object)objToProcess.CodigoSolicitud);
					else
						this.instance.AddInParameter(storedProcCommand, "@CODIGO_SOLICITUD", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@PACIENTE_EXTERNO", DbType.Boolean, (object)objToProcess.PacienteExterno);
					this.instance.AddInParameter(storedProcCommand, "@TIENE_REVISON_LAB", DbType.Boolean, (object)objToProcess.TieneRevisonLab);
					this.instance.AddInParameter(storedProcCommand, "@ESTADO_REVISION_LAB", DbType.Int16, (object)objToProcess.EstadoRevisionLab);
					if (objToProcess.ComentarioLab != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_LAB", DbType.String, (object)objToProcess.ComentarioLab);
					else
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_LAB", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@TIENE_REVISION_RAD", DbType.Boolean, (object)objToProcess.TieneRevisionRad);
					this.instance.AddInParameter(storedProcCommand, "@ESTADO_REVISION_RAD", DbType.Int16, (object)objToProcess.EstadoRevisionRad);
					if (objToProcess.ComentarioRad != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_RAD", DbType.String, (object)objToProcess.ComentarioRad);
					else
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_RAD", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@RADIOGRAFIA_TOMADA", DbType.Boolean, (object)objToProcess.RadiografiaTomada);
					this.instance.AddInParameter(storedProcCommand, "@RADIOGRAFIA_CARGADA_EMEDICAL", DbType.Boolean, (object)objToProcess.RadiografiaCargadaEmedical);
					this.instance.AddInParameter(storedProcCommand, "@ESTADO_REVISION_RAD_MED", DbType.Int16, (object)objToProcess.EstadoRevisionRadMed);
					if (objToProcess.ComentarioRadMed != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_RAD_MED", DbType.String, (object)objToProcess.ComentarioRadMed);
					else
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_RAD_MED", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@TIENE_REVISION_MED", DbType.Boolean, (object)objToProcess.TieneRevisionMed);
					this.instance.AddInParameter(storedProcCommand, "@ESTADO_REVISION_MED", DbType.Int16, (object)objToProcess.EstadoRevisionMed);
					if (objToProcess.ComentarioMed != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_MED", DbType.String, (object)objToProcess.ComentarioMed);
					else
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_MED", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@FINALIZADA", DbType.Boolean, (object)objToProcess.Finalizada);
					this.instance.AddInParameter(storedProcCommand, "@REQUIERE_NOTIFICACION", DbType.Boolean, (object)objToProcess.RequiereNotificacion);
					this.instance.AddInParameter(storedProcCommand, "@NOTIFICACION_ENVIADA", DbType.Boolean, (object)objToProcess.NotificacionEnviada);
					this.instance.AddInParameter(storedProcCommand, "@RETORNADO_EMBAJADA", DbType.Boolean, (object)objToProcess.RetornadoEmbajada);
					this.instance.AddInParameter(storedProcCommand, "@ES_PRIORITARIO", DbType.Boolean, (object)objToProcess.EsPrioritario);
					if (objToProcess.ComentarioRecepcion != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_RECEPCION", DbType.String, (object)objToProcess.ComentarioRecepcion);
					else
						this.instance.AddInParameter(storedProcCommand, "@COMENTARIO_RECEPCION", DbType.String, (object)DBNull.Value);
					if (objToProcess.IdMedico != int.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@ID_MEDICO", DbType.Int32, (object)objToProcess.IdMedico);
					else
						this.instance.AddInParameter(storedProcCommand, "@ID_MEDICO", DbType.Int32, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@ID_ULTIMA_MODIFICACION", DbType.Int32, (object)objToProcess.IdUltimaModificacion);
					if (parentTrans != null)
					{
						storedProcCommand.Connection = parentTrans.Connection;
						storedProcCommand.Transaction = parentTrans;
						this.instance.ExecuteNonQuery(storedProcCommand, parentTrans);
					}
					else
					{
						dbConnection = this.instance.CreateConnection();
						dbConnection.Open();
						storedProcCommand.Connection = dbConnection;
						this.instance.ExecuteNonQuery(storedProcCommand);
					}
					flag = true;
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
				}
				finally
				{
					if (parentTrans == null)
						if (dbConnection != null) dbConnection.Close();
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return flag;
		}

		public bool Delete(int idHistToDel, int idUserProcess, DbTransaction parentTrans)
		{
			bool flag = false;
			try
			{
				DbConnection dbConnection = (DbConnection)null;
				try
				{
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_HISTORIA_MEDICA_DELETE");
					this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object)idHistToDel);
					this.instance.AddInParameter(storedProcCommand, "@ID_USUARIO", DbType.Int32, (object)idUserProcess);
					if (parentTrans != null)
					{
						storedProcCommand.Connection = parentTrans.Connection;
						storedProcCommand.Transaction = parentTrans;
						this.instance.ExecuteNonQuery(storedProcCommand, parentTrans);
					}
					else
					{
						dbConnection = this.instance.CreateConnection();
						dbConnection.Open();
						storedProcCommand.Connection = dbConnection;
						this.instance.ExecuteNonQuery(storedProcCommand);
					}
					flag = true;
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
				}
				finally
				{
					if (parentTrans == null)
						if (dbConnection != null) dbConnection.Close();
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return flag;
		}

		public bool LiberarHistoria(int idHist, int idUsuario)
		{
			bool flag = false;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_HISTORIA_MEDICA_LIBERAR_HISTORIA");
					this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object)idHist);
					this.instance.AddInParameter(storedProcCommand, "@ID_USUARIO", DbType.Int32, (object)idUsuario);
					storedProcCommand.Connection = connection;
					this.instance.ExecuteNonQuery(storedProcCommand);
					flag = true;
				}
				catch (Exception ex)
				{
				}
			}
			catch (Exception ex)
			{
			}
			return flag;
		}

		private HistoriaMedica GetByPK(int id, DbTransaction parentTrans)
		{
			HistoriaMedica objToLoad = new HistoriaMedica();
			try
			{
				DbConnection dbConnection = (DbConnection)null;
				try
				{
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_GET_HISTORIA_MEDICA_BY_PK");
					this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object)id);
					DbDataAdapter dataAdapter = this.instance.GetDataAdapter();
					DataTable dataTable = new DataTable();
					if (parentTrans != null)
					{
						storedProcCommand.Connection = parentTrans.Connection;
						storedProcCommand.Transaction = parentTrans;
					}
					else
					{
						dbConnection = this.instance.CreateConnection();
						dbConnection.Open();
						storedProcCommand.Connection = dbConnection;
					}
					dataAdapter.SelectCommand = storedProcCommand;
					dataAdapter.Fill(dataTable);
					if (dataTable.Rows.Count > 0)
					{
						this.LoadFromDataRow(ref objToLoad, dataTable.Rows[0]);
						if (objToLoad.TieneRevisonLab && objToLoad.EstadoRevisionLab != Constants.EstadoRevision.SinAplicar)
						{
							objToLoad.Bacteriologo = (new UsuarioDao()).Load(dataTable.Rows[0].Field<int>("ID_USUARIO_LABORATORIO"));
						}
					}
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
				}
				finally
				{
					if (dbConnection != null) dbConnection.Close();
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return objToLoad;
		}

		private void LoadFromDataRow(ref HistoriaMedica objToLoad, DataRow drData)
		{
			try
			{
				objToLoad.Id = Convert.ToInt32(drData["ID"]);
				objToLoad.IdPaciente = Convert.ToInt32(drData["ID_PACIENTE"]);
				objToLoad.FechaIngreso = Convert.ToDateTime(drData["FECHA_INGRESO"]);
				objToLoad.Peso = Convert.ToDecimal(drData["PESO"]);
				objToLoad.Estatura = Convert.ToDecimal(drData["ESTATURA"]);
				objToLoad.PerimetroCefalico = !Convert.IsDBNull(drData["PERIMETRO_CEFALICO"]) ? Convert.ToDecimal(drData["PERIMETRO_CEFALICO"]) : Decimal.MinValue;
				objToLoad.IdTipoVisa = !Convert.IsDBNull(drData["ID_TIPO_VISA"]) ? Convert.ToInt32(drData["ID_TIPO_VISA"]) : int.MinValue;
				objToLoad.CodigoSolicitud = !Convert.IsDBNull(drData["CODIGO_SOLICITUD"]) ? drData["CODIGO_SOLICITUD"].ToString() : string.Empty;
				objToLoad.PacienteExterno = Convert.ToBoolean(drData["PACIENTE_EXTERNO"]);
				objToLoad.TieneRevisonLab = Convert.ToBoolean(drData["TIENE_REVISON_LAB"]);
				objToLoad.EstadoRevisionLab = (Constants.EstadoRevision)Convert.ToInt32(drData["ESTADO_REVISION_LAB"]);
				objToLoad.ComentarioLab = Convert.IsDBNull(drData["COMENTARIO_LAB"]) ? string.Empty : drData["COMENTARIO_LAB"].ToString();
				objToLoad.TieneRevisionRad = Convert.ToBoolean(drData["TIENE_REVISION_RAD"]);
				objToLoad.EstadoRevisionRad = (Constants.EstadoRevision)Convert.ToInt32(drData["ESTADO_REVISION_RAD"]);
				objToLoad.RadiografiaTomada = Convert.ToBoolean(drData["RADIOGRAFIA_TOMADA"]);
				objToLoad.RadiografiaCargadaEmedical = Convert.ToBoolean(drData["RADIOGRAFIA_CARGADA_EMEDICAL"]);
				objToLoad.ComentarioRad = Convert.IsDBNull(drData["COMENTARIO_RAD"]) ? string.Empty : drData["COMENTARIO_RAD"].ToString();
				objToLoad.EstadoRevisionRadMed = (Constants.EstadoRevision)Convert.ToInt32(drData["ESTADO_REVISION_RAD_MED"]);
				objToLoad.ComentarioRadMed = Convert.IsDBNull(drData["COMENTARIO_RAD_MED"]) ? string.Empty : drData["COMENTARIO_RAD_MED"].ToString();
				objToLoad.TieneRevisionMed = Convert.ToBoolean(drData["TIENE_REVISION_MED"]);
				objToLoad.EstadoRevisionMed = (Constants.EstadoRevision)Convert.ToInt32(drData["ESTADO_REVISION_MED"]);
				objToLoad.ComentarioMed = Convert.IsDBNull(drData["COMENTARIO_MED"]) ? string.Empty : drData["COMENTARIO_MED"].ToString();
				objToLoad.Finalizada = Convert.ToBoolean(drData["FINALIZADA"]);
				objToLoad.RequiereNotificacion = Convert.ToBoolean(drData["REQUIERE_NOTIFICACION"]);
				objToLoad.NotificacionEnviada = Convert.ToBoolean(drData["NOTIFICACION_ENVIADA"]);
				objToLoad.RetornadoEmbajada = Convert.ToBoolean(drData["RETORNADO_EMBAJADA"]);
				objToLoad.EsPrioritario = Convert.ToBoolean(drData["ES_PRIORITARIO"]);
				objToLoad.ComentarioRecepcion = Convert.IsDBNull(drData["COMENTARIO_RECEPCION"]) ? string.Empty : drData["COMENTARIO_RECEPCION"].ToString();
				objToLoad.IdMedico = Convert.IsDBNull(drData["ID_MEDICO"]) ? int.MinValue : Convert.ToInt32(drData["ID_MEDICO"]);
				objToLoad.Eliminado = Convert.ToBoolean(drData["ELIMINADO"]);
				objToLoad.IdCreacion = Convert.ToInt32(drData["ID_CREACION"]);
				objToLoad.FechaCreacion = Convert.ToDateTime(drData["FECHA_CREACION"]);
				objToLoad.IdUltimaModificacion = Convert.ToInt32(drData["ID_ULTIMA_MODIFICACION"]);
				objToLoad.FechaUltimaModificacion = Convert.ToDateTime(drData["FECHA_ULTIMA_MODIFICACION"]);
			}
			catch (Exception ex)
			{
				objToLoad = new HistoriaMedica();
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
		}
	}
}
