// Decompiled with JetBrains decompiler
// Type: RMDAL.CargoDao
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
  public class CargoDao : BaseConnection
  {
    public static DataTable DtEstructure
    {
      get
      {
        DataTable dataTable = new DataTable();
        DataColumn[] columns = new DataColumn[7]
        {
          new DataColumn("ID", typeof (int)),
          new DataColumn("NOMBRE_CARGO", typeof (string)),
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

    public CargoDao() => this.ObtainInstance();

    public DataTable GetList(string nombreCargo, bool activo, bool showAllActivo)
    {
      DataTable dtEstructure = CargoDao.DtEstructure;
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_CARGO_GET_LIST");
          storedProcCommand.Connection = connection;
          if (nombreCargo != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@NOMBRE_CARGO", DbType.String, (object) nombreCargo);
          else
            this.instance.AddInParameter(storedProcCommand, "@NOMBRE_CARGO", DbType.String, (object) DBNull.Value);
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

    public List<Cargo> GetCargos(string nombreCargo, bool activo, bool showAllActivo)
    {
      List<Cargo> cargoList = new List<Cargo>();
      try
      {
        foreach (DataRow row in (InternalDataCollectionBase) this.GetList(nombreCargo, activo, showAllActivo).Rows)
        {
          Cargo objToLoad = new Cargo();
          this.LoadFromDataRow(ref objToLoad, row);
          cargoList.Add(objToLoad);
        }
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return cargoList;
    }

    public Cargo Load(int id) => this.GetByPK(id);

    public bool Create(Cargo objToProcess)
    {
      bool flag = false;
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_CARGO_CREATE");
          storedProcCommand.Connection = connection;
          this.instance.AddOutParameter(storedProcCommand, "@ID", DbType.Int32, 4);
          this.instance.AddInParameter(storedProcCommand, "@NOMBRE_CARGO", DbType.String, (object) objToProcess.NombreCargo);
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

    public bool Update(Cargo objToProcess)
    {
      bool flag = false;
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_CARGO_UPDATE");
          storedProcCommand.Connection = connection;
          this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object) objToProcess.Id);
          this.instance.AddInParameter(storedProcCommand, "@NOMBRE_CARGO", DbType.String, (object) objToProcess.NombreCargo);
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

    public bool Delete(Cargo objToProcess)
    {
      bool flag = false;
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_CARGO_DELETE");
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

    private Cargo GetByPK(int id)
    {
      DbConnection connection = this.instance.CreateConnection();
      Cargo objToLoad = new Cargo();
      try
      {
        connection.Open();
        DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_GET_CARGO_BY_PK");
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

    private void LoadFromDataRow(ref Cargo objToLoad, DataRow drData)
    {
      try
      {
        objToLoad.Id = Convert.ToInt32(drData["ID"]);
        objToLoad.NombreCargo = drData["NOMBRE_CARGO"].ToString();
        objToLoad.Activo = Convert.ToBoolean(drData["ACTIVO"]);
        objToLoad.IdCreacion = Convert.ToInt32(drData["ID_CREACION"]);
        objToLoad.FechaCreacion = Convert.ToDateTime(drData["FECHA_CREACION"]);
        objToLoad.IdUltimaModificacion = Convert.ToInt32(drData["ID_ULTIMA_MODIFICACION"]);
        objToLoad.FechaUltimaModificacion = Convert.ToDateTime(drData["FECHA_ULTIMA_MODIFICACION"]);
      }
      catch (Exception ex)
      {
        objToLoad = new Cargo();
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
    }
  }
}
