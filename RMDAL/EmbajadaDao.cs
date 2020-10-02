// Decompiled with JetBrains decompiler
// Type: RMDAL.EmbajadaDao
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
	public class EmbajadaDao : BaseConnection
	{
		public static DataTable DtEstructure
		{
			get
			{
				DataTable dataTable = new DataTable();
				DataColumn[] columns = new DataColumn[7]
				{
		  new DataColumn("ID", typeof (int)),
		  new DataColumn("NOMBRE", typeof (string)),
		  new DataColumn("ACTIVO", typeof (bool)),
		  new DataColumn("ID_CREACION", typeof (int)),
		  new DataColumn("FECHA_CREACION", typeof (DateTime)),
		  new DataColumn("ID_ULTIMA_MODIFICACION", typeof (int)),
		  new DataColumn("FECHA_ULTIMA_MODIFICACION", typeof (DateTime))
				};
				dataTable.Columns.AddRange(columns);
				return dataTable;
			}
		}

		public EmbajadaDao() => this.ObtainInstance();

		public DataTable GetList(string nombre, bool activo, bool showAllActivo)
		{
			DataTable dtEstructure = EmbajadaDao.DtEstructure;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_EMBAJADA_GET_LIST");
					storedProcCommand.Connection = connection;
					if (nombre != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object)nombre);
					else
						this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object)DBNull.Value);
					if (!showAllActivo)
						this.instance.AddInParameter(storedProcCommand, "@ACTIVO", DbType.Boolean, (object)activo);
					else
						this.instance.AddInParameter(storedProcCommand, "@ACTIVO", DbType.Boolean, (object)DBNull.Value);
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

		public List<Embajada> GetEmbajadas(string nombre, bool activo, bool showAllActivo)
		{
			List<Embajada> embajadaList = new List<Embajada>();
			try
			{
				foreach (DataRow row in (InternalDataCollectionBase)this.GetList(nombre, activo, showAllActivo).Rows)
				{
					Embajada objToLoad = new Embajada();
					this.LoadFromDataRow(ref objToLoad, row);
					embajadaList.Add(objToLoad);
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return embajadaList;
		}

		public Embajada Load(int id) => this.GetByPK(id);

		public bool Create(Embajada objToProcess)
		{
			bool flag = false;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_EMBAJADA_CREATE");
					storedProcCommand.Connection = connection;
					this.instance.AddOutParameter(storedProcCommand, "@ID", DbType.Int32, 4);
					this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object)objToProcess.Nombre);
					this.instance.AddInParameter(storedProcCommand, "@ACTIVO", DbType.Boolean, (object)objToProcess.Activo);
					this.instance.AddInParameter(storedProcCommand, "@ID_CREACION", DbType.Int32, (object)objToProcess.IdCreacion);
					this.instance.ExecuteNonQuery(storedProcCommand);
					objToProcess.Id = Convert.ToInt32(storedProcCommand.Parameters["@ID"].Value);
					flag = true;
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
			return flag;
		}

		public bool Update(Embajada objToProcess)
		{
			bool flag = false;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_EMBAJADA_UPDATE");
					storedProcCommand.Connection = connection;
					this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object)objToProcess.Id);
					this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object)objToProcess.Nombre);
					this.instance.AddInParameter(storedProcCommand, "@ACTIVO", DbType.Boolean, (object)objToProcess.Activo);
					this.instance.AddInParameter(storedProcCommand, "@ID_ULTIMA_MODIFICACION", DbType.Int32, (object)objToProcess.IdUltimaModificacion);
					this.instance.ExecuteNonQuery(storedProcCommand);
					flag = true;
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
			return flag;
		}

		public bool Delete(Embajada objToProcess)
		{
			bool flag = false;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_EMBAJADA_DELETE");
					storedProcCommand.Connection = connection;
					this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object)objToProcess.Id);
					this.instance.AddInParameter(storedProcCommand, "@ID_USUARIO", DbType.Int32, (object)objToProcess.IdUltimaModificacion);
					this.instance.ExecuteNonQuery(storedProcCommand);
					flag = true;
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
			return flag;
		}

		private Embajada GetByPK(int id)
		{
			DbConnection connection = this.instance.CreateConnection();
			Embajada objToLoad = new Embajada();
			try
			{
				connection.Open();
				DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_GET_EMBAJADA_BY_PK");
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

		private void LoadFromDataRow(ref Embajada objToLoad, DataRow drData)
		{
			try
			{
				objToLoad.Id = Convert.ToInt32(drData["ID"]);
				objToLoad.Nombre = drData["NOMBRE"].ToString();
				objToLoad.Activo = Convert.ToBoolean(drData["ACTIVO"]);
				objToLoad.IdCreacion = Convert.ToInt32(drData["ID_CREACION"]);
				objToLoad.FechaCreacion = Convert.ToDateTime(drData["FECHA_CREACION"]);
				objToLoad.IdUltimaModificacion = Convert.ToInt32(drData["ID_ULTIMA_MODIFICACION"]);
				objToLoad.FechaUltimaModificacion = Convert.ToDateTime(drData["FECHA_ULTIMA_MODIFICACION"]);
			}
			catch (Exception ex)
			{
				objToLoad = new Embajada();
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
		}
	}
}