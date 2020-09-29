// Decompiled with JetBrains decompiler
// Type: RMDAL.AnexoHistoriaDao
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
  public class AnexoHistoriaDao : BaseConnection
  {
    public static DataTable DtEstructure
    {
      get
      {
        DataTable dataTable = new DataTable();
        DataColumn[] columns = new DataColumn[10]
        {
          new DataColumn("ID", typeof (int)),
          new DataColumn("ID_HISTORIA", typeof (int)),
          new DataColumn("ID_TIPO_REVISION", typeof (short)),
          new DataColumn("ID_MUESTRA", typeof (int)),
          new DataColumn("NOMBRE_ADJUNTO", typeof (string)),
          new DataColumn("NOMBRE_ARCHIVO", typeof (string)),
          new DataColumn("ID_CREACION", typeof (int)),
          new DataColumn("FECHA_CREACION", typeof (DateTime)),
          new DataColumn("ID_ULTIMA_MODIFICACION", typeof (int)),
          new DataColumn("FECHA_ULTIMA_MODIFICACION", typeof (DateTime))
        };
        dataTable.Columns.AddRange(columns);
        return dataTable;
      }
    }

    public AnexoHistoriaDao() => this.ObtainInstance();

    public DataTable GetList(
      int idHistoria,
      Constants.TipoRevision idTipoRevision,
      bool showAllTipoRevision,
      int idMuestra,
      string nombreAdjunto,
      DbTransaction parentTrans)
    {
      DataTable dtEstructure = AnexoHistoriaDao.DtEstructure;
      try
      {
        DbConnection dbConnection = (DbConnection) null;
        try
        {
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_ANEXO_HISTORIA_GET_LIST");
          if (idHistoria != int.MinValue)
            this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object) idHistoria);
          else
            this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object) DBNull.Value);
          if (!showAllTipoRevision)
            this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_REVISION", DbType.Int16, (object) Convert.ToInt16((object) idTipoRevision));
          else
            this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_REVISION", DbType.Int16, (object) DBNull.Value);
          if (idMuestra != int.MinValue)
            this.instance.AddInParameter(storedProcCommand, "@ID_MUESTRA", DbType.Int32, (object) idMuestra);
          else
            this.instance.AddInParameter(storedProcCommand, "@ID_MUESTRA", DbType.Int32, (object) DBNull.Value);
          if (nombreAdjunto != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@NOMBRE_ADJUNTO", DbType.String, (object) nombreAdjunto);
          else
            this.instance.AddInParameter(storedProcCommand, "@NOMBRE_ADJUNTO", DbType.String, (object) DBNull.Value);
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
          if (parentTrans == null)
            dbConnection.Close();
        }
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return dtEstructure;
    }

    public List<AnexoHistoria> GetAnexoHistorias(
      int idHistoria,
      Constants.TipoRevision idTipoRevision,
      bool showAllTipoRevision,
      int idMuestra,
      string nombreAdjunto,
      DbTransaction parentTrans)
    {
      List<AnexoHistoria> anexoHistoriaList = new List<AnexoHistoria>();
      try
      {
        foreach (DataRow row in (InternalDataCollectionBase) this.GetList(idHistoria, idTipoRevision, showAllTipoRevision, idMuestra, nombreAdjunto, parentTrans).Rows)
        {
          AnexoHistoria objToLoad = new AnexoHistoria();
          this.LoadFromDataRow(ref objToLoad, row);
          anexoHistoriaList.Add(objToLoad);
        }
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return anexoHistoriaList;
    }

    public AnexoHistoria Load(int id) => this.GetByPK(id);

    public bool Create(AnexoHistoria objToProcess, DbTransaction parentTrans)
    {
      bool flag = false;
      try
      {
        DbConnection dbConnection = (DbConnection) null;
        try
        {
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_ANEXO_HISTORIA_CREATE");
          this.instance.AddOutParameter(storedProcCommand, "@ID", DbType.Int32, 4);
          this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object) objToProcess.IdHistoria);
          this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_REVISION", DbType.Int16, (object) Convert.ToInt16((object) objToProcess.IdTipoRevision));
          if (objToProcess.IdMuestra != int.MinValue)
            this.instance.AddInParameter(storedProcCommand, "@ID_MUESTRA", DbType.Int32, (object) objToProcess.IdMuestra);
          else
            this.instance.AddInParameter(storedProcCommand, "@ID_MUESTRA", DbType.Int32, (object) DBNull.Value);
          this.instance.AddInParameter(storedProcCommand, "@NOMBRE_ADJUNTO", DbType.String, (object) objToProcess.NombreAdjunto);
          this.instance.AddInParameter(storedProcCommand, "@NOMBRE_ARCHIVO", DbType.String, (object) objToProcess.NombreArchivo);
          this.instance.AddInParameter(storedProcCommand, "@ID_CREACION", DbType.Int32, (object) objToProcess.IdCreacion);
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
            dbConnection.Close();
        }
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return flag;
    }

    public bool Update(AnexoHistoria objToProcess, DbTransaction parentTrans)
    {
      bool flag = false;
      try
      {
        DbConnection dbConnection = (DbConnection) null;
        try
        {
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_ANEXO_HISTORIA_UPDATE");
          this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object) objToProcess.Id);
          this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object) objToProcess.IdHistoria);
          this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_REVISION", DbType.Int16, (object) Convert.ToInt16((object) objToProcess.IdTipoRevision));
          if (objToProcess.IdMuestra != int.MinValue)
            this.instance.AddInParameter(storedProcCommand, "@ID_MUESTRA", DbType.Int32, (object) objToProcess.IdMuestra);
          else
            this.instance.AddInParameter(storedProcCommand, "@ID_MUESTRA", DbType.Int32, (object) DBNull.Value);
          this.instance.AddInParameter(storedProcCommand, "@NOMBRE_ADJUNTO", DbType.String, (object) objToProcess.NombreAdjunto);
          this.instance.AddInParameter(storedProcCommand, "@NOMBRE_ARCHIVO", DbType.String, (object) objToProcess.NombreArchivo);
          this.instance.AddInParameter(storedProcCommand, "@ID_ULTIMA_MODIFICACION", DbType.Int32, (object) objToProcess.IdUltimaModificacion);
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
            dbConnection.Close();
        }
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return flag;
    }

    public bool Delete(AnexoHistoria objToProcess, DbTransaction parentTrans)
    {
      bool flag = false;
      try
      {
        DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_ANEXO_HISTORIA_DELETE");
        storedProcCommand.Connection = parentTrans.Connection;
        storedProcCommand.Transaction = parentTrans;
        this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object) objToProcess.Id);
        this.instance.ExecuteNonQuery(storedProcCommand, parentTrans);
        flag = true;
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return flag;
    }

    private AnexoHistoria GetByPK(int id)
    {
      DbConnection connection = this.instance.CreateConnection();
      AnexoHistoria objToLoad = new AnexoHistoria();
      try
      {
        connection.Open();
        DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_GET_ANEXO_HISTORIA_BY_PK");
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

    private void LoadFromDataRow(ref AnexoHistoria objToLoad, DataRow drData)
    {
      try
      {
        objToLoad.Id = Convert.ToInt32(drData["ID"]);
        objToLoad.IdHistoria = Convert.ToInt32(drData["ID_HISTORIA"]);
        objToLoad.IdTipoRevision = (Constants.TipoRevision) Convert.ToInt32(drData["ID_TIPO_REVISION"]);
        objToLoad.IdMuestra = Convert.IsDBNull(drData["ID_MUESTRA"]) ? int.MinValue : Convert.ToInt32(drData["ID_MUESTRA"]);
        objToLoad.NombreAdjunto = drData["NOMBRE_ADJUNTO"].ToString();
        objToLoad.NombreArchivo = drData["NOMBRE_ARCHIVO"].ToString();
        objToLoad.IdCreacion = Convert.ToInt32(drData["ID_CREACION"]);
        objToLoad.FechaCreacion = Convert.ToDateTime(drData["FECHA_CREACION"]);
        objToLoad.IdUltimaModificacion = Convert.ToInt32(drData["ID_ULTIMA_MODIFICACION"]);
        objToLoad.FechaUltimaModificacion = Convert.ToDateTime(drData["FECHA_ULTIMA_MODIFICACION"]);
      }
      catch (Exception ex)
      {
        objToLoad = new AnexoHistoria();
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
    }
  }
}
