// Decompiled with JetBrains decompiler
// Type: RMDAL.ExamenLaboratorioDao
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
  public class ExamenLaboratorioDao : BaseConnection
  {
    public static DataTable DtEstructure
    {
      get
      {
        DataTable dataTable = new DataTable();
        DataColumn[] columns = new DataColumn[10]
        {
          new DataColumn("ID", typeof (int)),
          new DataColumn("NOMBRE", typeof (string)),
          new DataColumn("EXTERNO", typeof (bool)),
          new DataColumn("REQUIERE_VENOPUNCION", typeof (bool)),
          new DataColumn("REQUIERE_CONSENTIMIENTO", typeof (bool)),
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

    public ExamenLaboratorioDao() => this.ObtainInstance();

    public DataTable GetList(
      string nombre,
      bool esExterno,
      bool showAllExterno,
      bool requiereVenopuncion,
      bool showAllRequiereVenopuncion,
      bool requiereConsentimiento,
      bool showAllRequiereConsentimiento,
      bool activo,
      bool showAllActivo)
    {
      DataTable dtEstructure = ExamenLaboratorioDao.DtEstructure;
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_EXAMEN_LABORATORIO_GET_LIST");
          storedProcCommand.Connection = connection;
          if (nombre != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object) nombre);
          else
            this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object) DBNull.Value);
          if (!showAllExterno)
            this.instance.AddInParameter(storedProcCommand, "@EXTERNO", DbType.Boolean, (object) esExterno);
          else
            this.instance.AddInParameter(storedProcCommand, "@EXTERNO", DbType.Boolean, (object) DBNull.Value);
          if (!showAllRequiereVenopuncion)
            this.instance.AddInParameter(storedProcCommand, "@REQUIERE_VENOPUNCION", DbType.Boolean, (object) requiereVenopuncion);
          else
            this.instance.AddInParameter(storedProcCommand, "@REQUIERE_VENOPUNCION", DbType.Boolean, (object) DBNull.Value);
          if (!showAllRequiereConsentimiento)
            this.instance.AddInParameter(storedProcCommand, "@REQUIERE_CONSENTIMIENTO", DbType.Boolean, (object) requiereConsentimiento);
          else
            this.instance.AddInParameter(storedProcCommand, "@REQUIERE_CONSENTIMIENTO", DbType.Boolean, (object) DBNull.Value);
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

    public List<ExamenLaboratorio> GetExamenLaboratorios(
      string nombre,
      bool esExterno,
      bool showAllExterno,
      bool requiereVenopuncion,
      bool showAllRequiereVenopuncion,
      bool requiereConsentimiento,
      bool showAllRequiereConsentimiento,
      bool activo,
      bool showAllActivo)
    {
      List<ExamenLaboratorio> examenLaboratorioList = new List<ExamenLaboratorio>();
      try
      {
        foreach (DataRow row in (InternalDataCollectionBase) this.GetList(nombre, esExterno, showAllExterno, requiereVenopuncion, showAllRequiereVenopuncion, requiereConsentimiento, showAllRequiereConsentimiento, activo, showAllActivo).Rows)
        {
          ExamenLaboratorio objToLoad = new ExamenLaboratorio();
          this.LoadFromDataRow(ref objToLoad, row);
          examenLaboratorioList.Add(objToLoad);
        }
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return examenLaboratorioList;
    }

    public ExamenLaboratorio Load(int id) => this.GetByPK(id);

    public bool Create(ExamenLaboratorio objToProcess)
    {
      bool flag = false;
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_EXAMEN_LABORATORIO_CREATE");
          storedProcCommand.Connection = connection;
          this.instance.AddOutParameter(storedProcCommand, "@ID", DbType.Int32, 4);
          this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object) objToProcess.Nombre);
          this.instance.AddInParameter(storedProcCommand, "@EXTERNO", DbType.Boolean, (object) objToProcess.EsExterno);
          this.instance.AddInParameter(storedProcCommand, "@REQUIERE_VENOPUNCION", DbType.Boolean, (object) objToProcess.RequiereVenopuncion);
          this.instance.AddInParameter(storedProcCommand, "@REQUIERE_CONSENTIMIENTO", DbType.Boolean, (object) objToProcess.RequiereConsentimiento);
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

    public bool Update(ExamenLaboratorio objToProcess)
    {
      bool flag = false;
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_EXAMEN_LABORATORIO_UPDATE");
          storedProcCommand.Connection = connection;
          this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object) objToProcess.Id);
          this.instance.AddInParameter(storedProcCommand, "@NOMBRE", DbType.String, (object) objToProcess.Nombre);
          this.instance.AddInParameter(storedProcCommand, "@EXTERNO", DbType.Boolean, (object) objToProcess.EsExterno);
          this.instance.AddInParameter(storedProcCommand, "@REQUIERE_VENOPUNCION", DbType.Boolean, (object) objToProcess.RequiereVenopuncion);
          this.instance.AddInParameter(storedProcCommand, "@REQUIERE_CONSENTIMIENTO", DbType.Boolean, (object) objToProcess.RequiereConsentimiento);
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

    public bool Delete(ExamenLaboratorio objToProcess)
    {
      bool flag = false;
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_EXAMEN_LABORATORIO_DELETE");
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

    private ExamenLaboratorio GetByPK(int id)
    {
      DbConnection connection = this.instance.CreateConnection();
      ExamenLaboratorio objToLoad = new ExamenLaboratorio();
      try
      {
        connection.Open();
        DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_GET_EXAMEN_LABORATORIO_BY_PK");
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

    private void LoadFromDataRow(ref ExamenLaboratorio objToLoad, DataRow drData)
    {
      try
      {
        objToLoad.Id = Convert.ToInt32(drData["ID"]);
        objToLoad.Nombre = drData["NOMBRE"].ToString();
        objToLoad.EsExterno = Convert.ToBoolean(drData["EXTERNO"]);
        objToLoad.RequiereVenopuncion = Convert.ToBoolean(drData["REQUIERE_VENOPUNCION"]);
        objToLoad.RequiereConsentimiento = Convert.ToBoolean(drData["REQUIERE_CONSENTIMIENTO"]);
        objToLoad.Activo = Convert.ToBoolean(drData["ACTIVO"]);
        objToLoad.IdCreacion = Convert.ToInt32(drData["ID_CREACION"]);
        objToLoad.FechaCreacion = Convert.ToDateTime(drData["FECHA_CREACION"]);
        objToLoad.IdUltimaModificacion = Convert.ToInt32(drData["ID_ULTIMA_MODIFICACION"]);
        objToLoad.FechaUltimaModificacion = Convert.ToDateTime(drData["FECHA_ULTIMA_MODIFICACION"]);
      }
      catch (Exception ex)
      {
        objToLoad = new ExamenLaboratorio();
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
    }
  }
}
