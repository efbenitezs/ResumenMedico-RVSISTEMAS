// Decompiled with JetBrains decompiler
// Type: RMDAL.ParametroDao
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
  public class ParametroDao : BaseConnection
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
          new DataColumn("DESCRIPCION", typeof (string)),
          new DataColumn("VALOR", typeof (string)),
          new DataColumn("ID_CREACION", typeof (int)),
          new DataColumn("FECHA_CREACION", typeof (DateTime)),
          new DataColumn("ID_ULTIMA_MODIFICACION", typeof (int)),
          new DataColumn("FECHA_ULTIMA_MODIFICACION", typeof (DateTime))
        };
        dataTable.Columns.AddRange(columns);
        return dataTable;
      }
    }

    public ParametroDao() => this.ObtainInstance();

    public DataTable GetList(Constants.Parametros id, bool showAllId, string nombre)
    {
      DataTable dtEstructure = ParametroDao.DtEstructure;
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_PARAMETRO_GET_LIST");
          storedProcCommand.Connection = connection;
          if (!showAllId)
            this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object) Convert.ToInt32((object) id));
          else
            this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object) DBNull.Value);
          if (nombre != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object) nombre);
          else
            this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object) DBNull.Value);
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

    public List<Parametro> GetParametros(
      Constants.Parametros id,
      bool showAllId,
      string nombre)
    {
      List<Parametro> parametroList = new List<Parametro>();
      try
      {
        foreach (DataRow row in (InternalDataCollectionBase) this.GetList(id, showAllId, nombre).Rows)
        {
          Parametro objToLoad = new Parametro();
          this.LoadFromDataRow(ref objToLoad, row);
          parametroList.Add(objToLoad);
        }
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return parametroList;
    }

    public Parametro Load(Constants.Parametros id) => this.GetByPK(id);

    public bool Update(Parametro objToProcess)
    {
      bool flag = false;
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_PARAMETRO_UPDATE");
          storedProcCommand.Connection = connection;
          this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object) Convert.ToInt32((object) objToProcess.Id));
          this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object) objToProcess.Nombre);
          if (objToProcess.Descripcion != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@DESCRIPCION", DbType.String, (object) objToProcess.Descripcion);
          else
            this.instance.AddInParameter(storedProcCommand, "@DESCRIPCION", DbType.String, (object) DBNull.Value);
          this.instance.AddInParameter(storedProcCommand, "@VALOR", DbType.String, (object) objToProcess.Valor);
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

    private Parametro GetByPK(Constants.Parametros id)
    {
      DbConnection connection = this.instance.CreateConnection();
      Parametro objToLoad = new Parametro();
      try
      {
        connection.Open();
        DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_GET_PARAMETRO_BY_PK");
        storedProcCommand.Connection = connection;
        this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object) Convert.ToInt32((object) id));
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

    private void LoadFromDataRow(ref Parametro objToLoad, DataRow drData)
    {
      try
      {
        objToLoad.Id = (Constants.Parametros) Convert.ToInt32(drData["ID"]);
        objToLoad.Nombre = drData["NOMBRE"].ToString();
        objToLoad.Descripcion = !Convert.IsDBNull(drData["DESCRIPCION"]) ? drData["DESCRIPCION"].ToString() : string.Empty;
        objToLoad.Valor = drData["VALOR"].ToString();
        objToLoad.IdCreacion = Convert.ToInt32(drData["ID_CREACION"]);
        objToLoad.FechaCreacion = Convert.ToDateTime(drData["FECHA_CREACION"]);
        objToLoad.IdUltimaModificacion = Convert.ToInt32(drData["ID_ULTIMA_MODIFICACION"]);
        objToLoad.FechaUltimaModificacion = Convert.ToDateTime(drData["FECHA_ULTIMA_MODIFICACION"]);
      }
      catch (Exception ex)
      {
        objToLoad = new Parametro();
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
    }
  }
}
