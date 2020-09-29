// Decompiled with JetBrains decompiler
// Type: RMDAL.TipoVisaDao
// Assembly: RMDAL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: BA8C66A3-8A06-4F3F-AEA9-08BB88600DCC
// Assembly location: C:\Users\Personal\source\RMDAL.dll

using RMEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;

namespace RMDAL
{
  public class TipoVisaDao : BaseConnection
  {
    public static DataTable DtEstructure
    {
      get
      {
        DataTable dataTable = new DataTable();
        DataColumn[] columns = new DataColumn[8]
        {
          new DataColumn("ID", typeof (int)),
          new DataColumn("NOMBRE", typeof (string)),
          new DataColumn("ID_EMBAJADA", typeof (int)),
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

    public TipoVisaDao() => this.ObtainInstance();

    public DataTable GetList(
      string nombre,
      Constants.Embajadas idEmbajada,
      bool showAllEmbajadas,
      bool activo,
      bool showAllActivo)
    {
      DataTable dtEstructure = TipoVisaDao.DtEstructure;
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_TIPO_VISA_GET_LIST");
          storedProcCommand.Connection = connection;
          if (nombre != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object) nombre);
          else
            this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object) DBNull.Value);
          if (!showAllEmbajadas)
            this.instance.AddInParameter(storedProcCommand, "@ID_EMBAJADA", DbType.Int32, (object) Convert.ToInt32((object) idEmbajada));
          else
            this.instance.AddInParameter(storedProcCommand, "@ID_EMBAJADA", DbType.Int32, (object) DBNull.Value);
          if (!showAllActivo)
            this.instance.AddInParameter(storedProcCommand, "@ACTIVO", DbType.Boolean, (object) activo);
          else
            this.instance.AddInParameter(storedProcCommand, "@ACTIVO", DbType.Boolean, (object) DBNull.Value);
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

    public List<TipoVisa> GetTipoVisas(
      string nombre,
      Constants.Embajadas idEmbajada,
      bool showAllEmbajada,
      bool activo,
      bool showAllActivo)
    {
      List<TipoVisa> tipoVisaList = new List<TipoVisa>();
      try
      {
        foreach (DataRow row in (InternalDataCollectionBase) this.GetList(nombre, idEmbajada, showAllEmbajada, activo, showAllActivo).Rows)
        {
          TipoVisa objToLoad = new TipoVisa();
          this.LoadFromDataRow(ref objToLoad, row);
          tipoVisaList.Add(objToLoad);
        }
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return tipoVisaList;
    }

    public TipoVisa Load(int id) => this.GetByPK(id);

    public bool Create(TipoVisa objToProcess)
    {
      bool flag = false;
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_TIPO_VISA_CREATE");
          storedProcCommand.Connection = connection;
          this.instance.AddOutParameter(storedProcCommand, "@ID", DbType.Int32, 4);
          this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object) objToProcess.Nombre);
          this.instance.AddInParameter(storedProcCommand, "@ID_EMBAJADA", DbType.Int32, (object) Convert.ToInt32((object) objToProcess.IdEmbajada));
          this.instance.AddInParameter(storedProcCommand, "@ACTIVO", DbType.Boolean, (object) objToProcess.Activo);
          this.instance.AddInParameter(storedProcCommand, "@ID_CREACION", DbType.Int32, (object) objToProcess.IdCreacion);
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

    public bool Update(TipoVisa objToProcess)
    {
      bool flag = false;
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_TIPO_VISA_UPDATE");
          storedProcCommand.Connection = connection;
          this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object) objToProcess.Id);
          this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object) objToProcess.Nombre);
          this.instance.AddInParameter(storedProcCommand, "@ID_EMBAJADA", DbType.Int32, (object) Convert.ToInt32((object) objToProcess.IdEmbajada));
          this.instance.AddInParameter(storedProcCommand, "@ACTIVO", DbType.Boolean, (object) objToProcess.Activo);
          this.instance.AddInParameter(storedProcCommand, "@ID_ULTIMA_MODIFICACION", DbType.Int32, (object) objToProcess.IdUltimaModificacion);
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

    public bool Delete(TipoVisa objToProcess)
    {
      bool flag = false;
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_TIPO_VISA_DELETE");
          storedProcCommand.Connection = connection;
          this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object) objToProcess.Id);
          this.instance.AddInParameter(storedProcCommand, "@ID_USUARIO", DbType.Int32, (object) objToProcess.IdUltimaModificacion);
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

    private TipoVisa GetByPK(int id)
    {
      DbConnection connection = this.instance.CreateConnection();
      TipoVisa objToLoad = new TipoVisa();
      try
      {
        connection.Open();
        DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_GET_TIPO_VISA_BY_PK");
        storedProcCommand.Connection = connection;
        this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object) id);
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

    private void LoadFromDataRow(ref TipoVisa objToLoad, DataRow drData)
    {
      try
      {
        objToLoad.Id = Convert.ToInt32(drData["ID"]);
        objToLoad.Nombre = drData["NOMBRE"].ToString();
        objToLoad.IdEmbajada = (Constants.Embajadas) Convert.ToInt32(drData["ID_EMBAJADA"]);
        objToLoad.Activo = Convert.ToBoolean(drData["ACTIVO"]);
        objToLoad.IdCreacion = Convert.ToInt32(drData["ID_CREACION"]);
        objToLoad.FechaCreacion = Convert.ToDateTime(drData["FECHA_CREACION"]);
        objToLoad.IdUltimaModificacion = Convert.ToInt32(drData["ID_ULTIMA_MODIFICACION"]);
        objToLoad.FechaUltimaModificacion = Convert.ToDateTime(drData["FECHA_ULTIMA_MODIFICACION"]);
      }
      catch (Exception ex)
      {
        objToLoad = new TipoVisa();
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
    }
  }
}
