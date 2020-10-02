// Decompiled with JetBrains decompiler
// Type: RMDAL.OrdenesHistoriaDao
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
	public class OrdenesHistoriaDao : BaseConnection
	{
		public static DataTable DtEstructure
		{
			get
			{
				DataTable dataTable = new DataTable();
				DataColumn[] columns = new DataColumn[8]
				{
		  new DataColumn("ID", typeof (int)),
		  new DataColumn("ID_HISTORIA", typeof (int)),
		  new DataColumn("DESCRIPCION", typeof (string)),
		  new DataColumn("MEDICO_TRATANTE", typeof (string)),
		  new DataColumn("ID_CREACION", typeof (int)),
		  new DataColumn("FECHA_CREACION", typeof (DateTime)),
		  new DataColumn("ID_ULTIMA_MODIFICACION", typeof (int)),
		  new DataColumn("FECHA_ULTIMA_MODIFICACION", typeof (DateTime))
				};
				dataTable.Columns.AddRange(columns);
				return dataTable;
			}
		}

		public OrdenesHistoriaDao() => this.ObtainInstance();

		public DataTable GetList(int idHistoria, string descripcion)
		{
			DataTable dtEstructure = OrdenesHistoriaDao.DtEstructure;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_ORDENES_HISTORIA_GET_LIST");
					storedProcCommand.Connection = connection;
					if (idHistoria != int.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object)idHistoria);
					else
						this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object)DBNull.Value);
					if (descripcion != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@DESCRIPCION", DbType.String, (object)descripcion);
					else
						this.instance.AddInParameter(storedProcCommand, "@DESCRIPCION", DbType.String, (object)DBNull.Value);
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

		public List<OrdenesHistoria> GetOrdenesHistorias(
		  int idHistoria,
		  string descripcion)
		{
			List<OrdenesHistoria> ordenesHistoriaList = new List<OrdenesHistoria>();
			try
			{
				foreach (DataRow row in (InternalDataCollectionBase)this.GetList(idHistoria, descripcion).Rows)
				{
					OrdenesHistoria objToLoad = new OrdenesHistoria();
					this.LoadFromDataRow(ref objToLoad, row);
					ordenesHistoriaList.Add(objToLoad);
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return ordenesHistoriaList;
		}

		public OrdenesHistoria Load(int id) => this.GetByPK(id);

		public bool Create(OrdenesHistoria objToProcess)
		{
			bool flag = false;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_ORDENES_HISTORIA_CREATE");
					storedProcCommand.Connection = connection;
					this.instance.AddOutParameter(storedProcCommand, "@ID", DbType.Int32, 4);
					this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object)objToProcess.IdHistoria);
					this.instance.AddInParameter(storedProcCommand, "@DESCRIPCION", DbType.String, (object)objToProcess.Descripcion);
					this.instance.AddInParameter(storedProcCommand, "@MEDICO_TRATANTE", DbType.String, (object)objToProcess.MedicoTratante);
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

		public bool Update(OrdenesHistoria objToProcess)
		{
			bool flag = false;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_ORDENES_HISTORIA_UPDATE");
					storedProcCommand.Connection = connection;
					this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object)objToProcess.Id);
					this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object)objToProcess.IdHistoria);
					this.instance.AddInParameter(storedProcCommand, "@DESCRIPCION", DbType.String, (object)objToProcess.Descripcion);
					this.instance.AddInParameter(storedProcCommand, "@MEDICO_TRATANTE", DbType.String, (object)objToProcess.MedicoTratante);
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

		public bool Delete(OrdenesHistoria objToProcess)
		{
			bool flag = false;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_ORDENES_HISTORIA_DELETE");
					storedProcCommand.Connection = connection;
					this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object)objToProcess.Id);
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

		private OrdenesHistoria GetByPK(int id)
		{
			DbConnection connection = this.instance.CreateConnection();
			OrdenesHistoria objToLoad = new OrdenesHistoria();
			try
			{
				connection.Open();
				DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_GET_ORDENES_HISTORIA_BY_PK");
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

		private void LoadFromDataRow(ref OrdenesHistoria objToLoad, DataRow drData)
		{
			try
			{
				objToLoad.Id = Convert.ToInt32(drData["ID"]);
				objToLoad.IdHistoria = Convert.ToInt32(drData["ID_HISTORIA"]);
				objToLoad.Descripcion = drData["DESCRIPCION"].ToString();
				objToLoad.MedicoTratante = drData["MEDICO_TRATANTE"].ToString();
				objToLoad.IdCreacion = Convert.ToInt32(drData["ID_CREACION"]);
				objToLoad.FechaCreacion = Convert.ToDateTime(drData["FECHA_CREACION"]);
				objToLoad.IdUltimaModificacion = Convert.ToInt32(drData["ID_ULTIMA_MODIFICACION"]);
				objToLoad.FechaUltimaModificacion = Convert.ToDateTime(drData["FECHA_ULTIMA_MODIFICACION"]);
			}
			catch (Exception ex)
			{
				objToLoad = new OrdenesHistoria();
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
		}
	}
}