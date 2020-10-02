// Decompiled with JetBrains decompiler
// Type: RMDAL.PacienteDao
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
	public class PacienteDao : BaseConnection
	{
		public static DataTable DtEstructure
		{
			get
			{
				DataTable dataTable = new DataTable();
				DataColumn[] columns = new DataColumn[17]
				{
		  new DataColumn("ID", typeof (int)),
		  new DataColumn("ID_TIPO_DOCUMENTO", typeof (int)),
		  new DataColumn("NUMERO_DOCUMENTO", typeof (string)),
		  new DataColumn("NUMERO_PASAPORTE", typeof (string)),
		  new DataColumn("NOMBRES", typeof (string)),
		  new DataColumn("APELLIDOS", typeof (string)),
		  new DataColumn("GENERO", typeof (bool)),
		  new DataColumn("FECHA_NACIMIENTO", typeof (DateTime)),
		  new DataColumn("CORREO", typeof (string)),
		  new DataColumn("ACUDIENTE", typeof (string)),
		  new DataColumn("DIRECCION", typeof (string)),
		  new DataColumn("FOTO", typeof (string)),
		  new DataColumn("TELEFONO", typeof (string)),
		  new DataColumn("ID_CREACION", typeof (int)),
		  new DataColumn("FECHA_CREACION", typeof (DateTime)),
		  new DataColumn("ID_ULTIMA_MODIFICACION", typeof (int)),
		  new DataColumn("FECHA_ULTIMA_MODIFICACION", typeof (DateTime))
				};
				dataTable.Columns.AddRange(columns);
				return dataTable;
			}
		}

		public PacienteDao() => this.ObtainInstance();

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
			DataTable dtEstructure = PacienteDao.DtEstructure;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_PACIENTE_GET_LIST");
					storedProcCommand.Connection = connection;
					if (idTipoDocumento != int.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_DOCUMENTO", DbType.Int32, (object)idTipoDocumento);
					else
						this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_DOCUMENTO", DbType.Int32, (object)DBNull.Value);
					if (numeroDocumento != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@NUMERO_DOCUMENTO", DbType.String, (object)numeroDocumento);
					else
						this.instance.AddInParameter(storedProcCommand, "@NUMERO_DOCUMENTO", DbType.String, (object)DBNull.Value);
					if (numeroPasaporte != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@NUMERO_PASAPORTE", DbType.String, (object)numeroPasaporte);
					else
						this.instance.AddInParameter(storedProcCommand, "@NUMERO_PASAPORTE", DbType.String, (object)DBNull.Value);
					if (nombres != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@NOMBRES", DbType.String, (object)nombres);
					else
						this.instance.AddInParameter(storedProcCommand, "@NOMBRES", DbType.String, (object)DBNull.Value);
					if (apellidos != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@APELLIDOS", DbType.String, (object)apellidos);
					else
						this.instance.AddInParameter(storedProcCommand, "@APELLIDOS", DbType.String, (object)DBNull.Value);
					if (!showAllGenero)
						this.instance.AddInParameter(storedProcCommand, "@GENERO", DbType.Boolean, (object)genero);
					else
						this.instance.AddInParameter(storedProcCommand, "@GENERO", DbType.Boolean, (object)DBNull.Value);
					if (fechaNacimiento != DateTime.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@FECHA_NACIMIENTO", DbType.DateTime, (object)fechaNacimiento);
					else
						this.instance.AddInParameter(storedProcCommand, "@FECHA_NACIMIENTO", DbType.DateTime, (object)DBNull.Value);
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
			List<Paciente> pacienteList = new List<Paciente>();
			try
			{
				foreach (DataRow row in (InternalDataCollectionBase)this.GetList(idTipoDocumento, numeroDocumento, numeroPasaporte, nombres, apellidos, genero, showAllGenero, fechaNacimiento).Rows)
				{
					Paciente objToLoad = new Paciente();
					this.LoadFromDataRow(ref objToLoad, row);
					pacienteList.Add(objToLoad);
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return pacienteList;
		}

		public Paciente Load(int id) => this.GetByPK(id);

		public bool Create(Paciente objToProcess, DbTransaction parentTrans)
		{
			bool flag = false;
			try
			{
				DbConnection dbConnection = (DbConnection)null;
				try
				{
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_PACIENTE_CREATE");
					this.instance.AddOutParameter(storedProcCommand, "@ID", DbType.Int32, 4);
					this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_DOCUMENTO", DbType.Int32, (object)objToProcess.IdTipoDocumento);
					this.instance.AddInParameter(storedProcCommand, "@NUMERO_DOCUMENTO", DbType.String, (object)objToProcess.NumeroDocumento);
					if (objToProcess.NumeroPasaporte != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@NUMERO_PASAPORTE", DbType.String, (object)objToProcess.NumeroPasaporte);
					else
						this.instance.AddInParameter(storedProcCommand, "@NUMERO_PASAPORTE", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@NOMBRES", DbType.String, (object)objToProcess.Nombres);
					this.instance.AddInParameter(storedProcCommand, "@APELLIDOS", DbType.String, (object)objToProcess.Apellidos);
					this.instance.AddInParameter(storedProcCommand, "@GENERO", DbType.Boolean, (object)objToProcess.Genero);
					this.instance.AddInParameter(storedProcCommand, "@FECHA_NACIMIENTO", DbType.DateTime, (object)objToProcess.FechaNacimiento);
					if (objToProcess.Correo != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@CORREO", DbType.String, (object)objToProcess.Correo);
					else
						this.instance.AddInParameter(storedProcCommand, "@CORREO", DbType.String, (object)DBNull.Value);
					if (objToProcess.Acudiente != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@ACUDIENTE", DbType.String, (object)objToProcess.Acudiente);
					else
						this.instance.AddInParameter(storedProcCommand, "@ACUDIENTE", DbType.String, (object)DBNull.Value);
					if (objToProcess.Direccion != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@DIRECCION", DbType.String, (object)objToProcess.Direccion);
					else
						this.instance.AddInParameter(storedProcCommand, "@DIRECCION", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@FOTO", DbType.String, (object)objToProcess.Foto);
					if (objToProcess.Telefono != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@TELEFONO", DbType.String, (object)objToProcess.Telefono);
					else
						this.instance.AddInParameter(storedProcCommand, "@TELEFONO", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@ID_CREACION", DbType.Int32, (object)objToProcess.IdCreacion);
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
					objToProcess.Id = Convert.ToInt32(storedProcCommand.Parameters["@ID"].Value);
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

		public bool Update(Paciente objToProcess, DbTransaction parentTrans)
		{
			bool flag = false;
			try
			{
				DbConnection dbConnection = (DbConnection)null;
				try
				{
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_PACIENTE_UPDATE");
					this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object)objToProcess.Id);
					this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_DOCUMENTO", DbType.Int32, (object)objToProcess.IdTipoDocumento);
					this.instance.AddInParameter(storedProcCommand, "@NUMERO_DOCUMENTO", DbType.String, (object)objToProcess.NumeroDocumento);
					if (objToProcess.NumeroPasaporte != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@NUMERO_PASAPORTE", DbType.String, (object)objToProcess.NumeroPasaporte);
					else
						this.instance.AddInParameter(storedProcCommand, "@NUMERO_PASAPORTE", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@NOMBRES", DbType.String, (object)objToProcess.Nombres);
					this.instance.AddInParameter(storedProcCommand, "@APELLIDOS", DbType.String, (object)objToProcess.Apellidos);
					this.instance.AddInParameter(storedProcCommand, "@GENERO", DbType.Boolean, (object)objToProcess.Genero);
					this.instance.AddInParameter(storedProcCommand, "@FECHA_NACIMIENTO", DbType.DateTime, (object)objToProcess.FechaNacimiento);
					if (objToProcess.Correo != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@CORREO", DbType.String, (object)objToProcess.Correo);
					else
						this.instance.AddInParameter(storedProcCommand, "@CORREO", DbType.String, (object)DBNull.Value);
					if (objToProcess.Acudiente != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@ACUDIENTE", DbType.String, (object)objToProcess.Acudiente);
					else
						this.instance.AddInParameter(storedProcCommand, "@ACUDIENTE", DbType.String, (object)DBNull.Value);
					if (objToProcess.Direccion != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@DIRECCION", DbType.String, (object)objToProcess.Direccion);
					else
						this.instance.AddInParameter(storedProcCommand, "@DIRECCION", DbType.String, (object)DBNull.Value);
					this.instance.AddInParameter(storedProcCommand, "@FOTO", DbType.String, (object)objToProcess.Foto);
					if (objToProcess.Telefono != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@TELEFONO", DbType.String, (object)objToProcess.Telefono);
					else
						this.instance.AddInParameter(storedProcCommand, "@TELEFONO", DbType.String, (object)DBNull.Value);
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

		public DataTable GetListaPacientesPendientes(
		  string where,
		  Constants.TipoRevision tipoRevision,
		  bool isDailyView,
		  bool retornadoDesdeEmbajada)
		{
			DataTable dtEstructure = PacienteDao.DtEstructure;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_PACIENTE_GET_LIST_PENDIENT_ATENTION");
					storedProcCommand.Connection = connection;
					this.instance.AddInParameter(storedProcCommand, "@STR_FILTRO", DbType.String, (object)where);
					this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_REVISION", DbType.Int32, (object)Convert.ToInt32((object)tipoRevision));
					this.instance.AddInParameter(storedProcCommand, "@IS_DAILY_VIEW", DbType.Boolean, (object)isDailyView);
					this.instance.AddInParameter(storedProcCommand, "@RETORNO_EMBAJADA", DbType.Boolean, (object)retornadoDesdeEmbajada);
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

		private Paciente GetByPK(int id)
		{
			DbConnection connection = this.instance.CreateConnection();
			Paciente objToLoad = new Paciente();
			try
			{
				connection.Open();
				DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_GET_PACIENTE_BY_PK");
				storedProcCommand.Connection = connection;
				this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object)id);
				DbDataAdapter dataAdapter = this.instance.GetDataAdapter();
				DataTable dataTable = new DataTable();
				dataAdapter.SelectCommand = storedProcCommand;
				dataAdapter.Fill(dataTable);
				if (dataTable.Rows.Count > 0)
					this.LoadFromDataRow(ref objToLoad, dataTable.Rows[0]);
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			finally
			{
				connection.Close();
			}
			return objToLoad;
		}

		private void LoadFromDataRow(ref Paciente objToLoad, DataRow drData)
		{
			try
			{
				objToLoad.Id = Convert.ToInt32(drData["ID"]);
				objToLoad.IdTipoDocumento = Convert.ToInt32(drData["ID_TIPO_DOCUMENTO"]);
				objToLoad.NumeroDocumento = drData["NUMERO_DOCUMENTO"].ToString();
				objToLoad.NumeroPasaporte = !Convert.IsDBNull(drData["NUMERO_PASAPORTE"]) ? drData["NUMERO_PASAPORTE"].ToString() : string.Empty;
				objToLoad.Nombres = drData["NOMBRES"].ToString();
				objToLoad.Apellidos = drData["APELLIDOS"].ToString();
				objToLoad.Genero = Convert.ToBoolean(drData["GENERO"]);
				objToLoad.FechaNacimiento = Convert.ToDateTime(drData["FECHA_NACIMIENTO"]);
				objToLoad.Correo = !Convert.IsDBNull(drData["CORREO"]) ? drData["CORREO"].ToString() : string.Empty;
				objToLoad.Acudiente = !Convert.IsDBNull(drData["ACUDIENTE"]) ? drData["ACUDIENTE"].ToString() : string.Empty;
				objToLoad.Direccion = !Convert.IsDBNull(drData["DIRECCION"]) ? drData["DIRECCION"].ToString() : string.Empty;
				objToLoad.Foto = drData["FOTO"].ToString();
				objToLoad.Telefono = !Convert.IsDBNull(drData["TELEFONO"]) ? drData["TELEFONO"].ToString() : string.Empty;
				objToLoad.IdCreacion = Convert.ToInt32(drData["ID_CREACION"]);
				objToLoad.FechaCreacion = Convert.ToDateTime(drData["FECHA_CREACION"]);
				objToLoad.IdUltimaModificacion = Convert.ToInt32(drData["ID_ULTIMA_MODIFICACION"]);
				objToLoad.FechaUltimaModificacion = Convert.ToDateTime(drData["FECHA_ULTIMA_MODIFICACION"]);
			}
			catch (Exception ex)
			{
				objToLoad = new Paciente();
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
		}
	}
}