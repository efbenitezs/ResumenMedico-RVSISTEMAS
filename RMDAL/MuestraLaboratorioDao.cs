// Decompiled with JetBrains decompiler
// Type: RMDAL.MuestraLaboratorioDao
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
  public class MuestraLaboratorioDao : BaseConnection
  {
    public static DataTable DtEstructure
    {
      get
      {
        DataTable dataTable = new DataTable();
        DataColumn[] columns = new DataColumn[37]
        {
          new DataColumn("ID", typeof (int)),
          new DataColumn("ID_HISTORIA", typeof (int)),
          new DataColumn("ID_TIPO_EXAMEN", typeof (int)),
          new DataColumn("DESCRIPCION", typeof (string)),
          new DataColumn("RESULTADO", typeof (string)),
          new DataColumn("VALOR", typeof (Decimal)),
          new DataColumn("ESTADO", typeof (short)),
          new DataColumn("OBSERVACIONES", typeof (string)),
          new DataColumn("FECHA_TOMA_MUESTRA", typeof (DateTime)),
          new DataColumn("NUMERO_MUESTRA", typeof (short)),
          new DataColumn("OLOR", typeof (string)),
          new DataColumn("COLOR", typeof (string)),
          new DataColumn("ASPECTO", typeof (string)),
          new DataColumn("GLU", typeof (string)),
          new DataColumn("BIL", typeof (string)),
          new DataColumn("CET", typeof (string)),
          new DataColumn("DEH", typeof (string)),
          new DataColumn("PH", typeof (string)),
          new DataColumn("PRO", typeof (string)),
          new DataColumn("URO", typeof (string)),
          new DataColumn("NIT", typeof (string)),
          new DataColumn("SAN", typeof (string)),
          new DataColumn("LEU", typeof (string)),
          new DataColumn("LEUCOCITOS_CAMPO", typeof (string)),
          new DataColumn("HEMATIES_CAMPO", typeof (string)),
          new DataColumn("CELULAS_ALTAS_CAMPO", typeof (string)),
          new DataColumn("CELULAS_BAJAS_CAMPO", typeof (string)),
          new DataColumn("MOCO", typeof (string)),
          new DataColumn("BACTERIAS", typeof (string)),
          new DataColumn("CILINDROS", typeof (string)),
          new DataColumn("CRISTALES", typeof (string)),
          new DataColumn("LEVADURAS", typeof (string)),
          new DataColumn("OTROS", typeof (string)),
          new DataColumn("ID_CREACION", typeof (int)),
          new DataColumn("FECHA_CREACION", typeof (DateTime)),
          new DataColumn("ID_ULTIMA_MODIFICACION", typeof (int)),
          new DataColumn("FECHA_ULTIMA_MODIFICACION", typeof (DateTime))
        };
        dataTable.Columns.AddRange(columns);
        return dataTable;
      }
    }

    public MuestraLaboratorioDao() => this.ObtainInstance();

    public DataTable GetList(
      int idHistoria,
      Constants.ExamenLab idTipoExamen,
      bool showAllTipoExamen,
      string resultado,
      DateTime fechaTomaMuestra,
      short numeroMuestra,
      DbTransaction parentTrans)
    {
      DataTable dtEstructure = MuestraLaboratorioDao.DtEstructure;
      try
      {
        DbConnection dbConnection = (DbConnection) null;
        try
        {
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_MUESTRA_LABORATORIO_GET_LIST");
          if (idHistoria != int.MinValue)
            this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object) idHistoria);
          else
            this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object) DBNull.Value);
          if (!showAllTipoExamen)
            this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_EXAMEN", DbType.Int32, (object) Convert.ToInt32((object) idTipoExamen));
          else
            this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_EXAMEN", DbType.Int32, (object) DBNull.Value);
          if (resultado != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@RESULTADO", DbType.String, (object) resultado);
          else
            this.instance.AddInParameter(storedProcCommand, "@RESULTADO", DbType.String, (object) DBNull.Value);
          if (fechaTomaMuestra != DateTime.MinValue)
            this.instance.AddInParameter(storedProcCommand, "@FECHA_TOMA_MUESTRA", DbType.DateTime, (object) fechaTomaMuestra);
          else
            this.instance.AddInParameter(storedProcCommand, "@FECHA_TOMA_MUESTRA", DbType.DateTime, (object) DBNull.Value);
          if (numeroMuestra != short.MinValue)
            this.instance.AddInParameter(storedProcCommand, "@NUMERO_MUESTRA", DbType.Int16, (object) numeroMuestra);
          else
            this.instance.AddInParameter(storedProcCommand, "@NUMERO_MUESTRA", DbType.Int16, (object) DBNull.Value);
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
          if (dbConnection != null) dbConnection.Close();
        }
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return dtEstructure;
    }

    public DataTable GetReportMonthData(DateTime fechaInicial, DateTime fechaFinal)
    {
      DataTable dataTable = new DataTable();
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_MUESTRA_LABORATORIO_REPORT_MES");
          storedProcCommand.Connection = connection;
          this.instance.AddInParameter(storedProcCommand, "@FECHA_INI_INTERVAL", DbType.Date, (object) fechaInicial);
          this.instance.AddInParameter(storedProcCommand, "@FECHA_FIN_INTERVAL", DbType.Date, (object) fechaFinal);
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

    public List<MuestraLaboratorio> GetMuestraLaboratorios(
      int idHistoria,
      Constants.ExamenLab idTipoExamen,
      bool showAllTipoExamen,
      string resultado,
      DateTime fechaTomaMuestra,
      short numeroMuestra,
      DbTransaction parentTrans)
    {
      List<MuestraLaboratorio> muestraLaboratorioList = new List<MuestraLaboratorio>();
      try
      {
        foreach (DataRow row in (InternalDataCollectionBase) this.GetList(idHistoria, idTipoExamen, showAllTipoExamen, resultado, fechaTomaMuestra, numeroMuestra, parentTrans).Rows)
        {
          MuestraLaboratorio objToLoad = new MuestraLaboratorio();
          this.LoadFromDataRow(ref objToLoad, row);
          muestraLaboratorioList.Add(objToLoad);
        }
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return muestraLaboratorioList;
    }

    public MuestraLaboratorio Load(int id) => this.GetByPK(id);

    public bool Create(MuestraLaboratorio objToProcess, DbTransaction parentTrans)
    {
      bool flag = false;
      try
      {
        DbConnection dbConnection = (DbConnection) null;
        try
        {
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_MUESTRA_LABORATORIO_CREATE");
          this.instance.AddOutParameter(storedProcCommand, "@ID", DbType.Int32, 4);
          this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object) objToProcess.IdHistoria);
          this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_EXAMEN", DbType.Int32, (object) Convert.ToInt32((object) objToProcess.IdTipoExamen));
          if (objToProcess.Descripcion != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@DESCRIPCION", DbType.String, (object) objToProcess.Descripcion);
          else
            this.instance.AddInParameter(storedProcCommand, "@DESCRIPCION", DbType.String, (object) DBNull.Value);
          this.instance.AddInParameter(storedProcCommand, "@RESULTADO", DbType.String, (object) objToProcess.Resultado);
          if (objToProcess.Valor != Decimal.MinValue)
            this.instance.AddInParameter(storedProcCommand, "@VALOR", DbType.Decimal, (object) objToProcess.Valor);
          else
            this.instance.AddInParameter(storedProcCommand, "@VALOR", DbType.Decimal, (object) DBNull.Value);
          this.instance.AddInParameter(storedProcCommand, "@ESTADO", DbType.Byte, (object) Convert.ToByte((object) objToProcess.Estado));
          if (objToProcess.Observaciones != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@OBSERVACIONES", DbType.String, (object) objToProcess.Observaciones);
          else
            this.instance.AddInParameter(storedProcCommand, "@OBSERVACIONES", DbType.String, (object) DBNull.Value);
          this.instance.AddInParameter(storedProcCommand, "@FECHA_TOMA_MUESTRA", DbType.Date, (object) objToProcess.FechaTomaMuestra);
          this.instance.AddInParameter(storedProcCommand, "@NUMERO_MUESTRA", DbType.Int16, (object) objToProcess.NumeroMuestra);
          if (objToProcess.Olor != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@OLOR", DbType.String, (object) objToProcess.Olor);
          else
            this.instance.AddInParameter(storedProcCommand, "@OLOR", DbType.String, (object) DBNull.Value);
          if (objToProcess.Color != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@COLOR", DbType.String, (object) objToProcess.Color);
          else
            this.instance.AddInParameter(storedProcCommand, "@COLOR", DbType.String, (object) DBNull.Value);
          if (objToProcess.Aspecto != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@ASPECTO", DbType.String, (object) objToProcess.Aspecto);
          else
            this.instance.AddInParameter(storedProcCommand, "@ASPECTO", DbType.String, (object) DBNull.Value);
          if (objToProcess.Glu != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@GLU", DbType.String, (object) objToProcess.Glu);
          else
            this.instance.AddInParameter(storedProcCommand, "@GLU", DbType.String, (object) DBNull.Value);
          if (objToProcess.Bil != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@BIL", DbType.String, (object) objToProcess.Bil);
          else
            this.instance.AddInParameter(storedProcCommand, "@BIL", DbType.String, (object) DBNull.Value);
          if (objToProcess.Cet != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@CET", DbType.String, (object) objToProcess.Cet);
          else
            this.instance.AddInParameter(storedProcCommand, "@CET", DbType.String, (object) DBNull.Value);
          if (objToProcess.Deh != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@DEH", DbType.String, (object) objToProcess.Deh);
          else
            this.instance.AddInParameter(storedProcCommand, "@DEH", DbType.String, (object) DBNull.Value);
          if (objToProcess.Ph != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@PH", DbType.String, (object) objToProcess.Ph);
          else
            this.instance.AddInParameter(storedProcCommand, "@PH", DbType.String, (object) DBNull.Value);
          if (objToProcess.Pro != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@PRO", DbType.String, (object) objToProcess.Pro);
          else
            this.instance.AddInParameter(storedProcCommand, "@PRO", DbType.String, (object) DBNull.Value);
          if (objToProcess.Uro != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@URO", DbType.String, (object) objToProcess.Uro);
          else
            this.instance.AddInParameter(storedProcCommand, "@URO", DbType.String, (object) DBNull.Value);
          if (objToProcess.Nit != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@NIT", DbType.String, (object) objToProcess.Nit);
          else
            this.instance.AddInParameter(storedProcCommand, "@NIT", DbType.String, (object) DBNull.Value);
          if (objToProcess.San != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@SAN", DbType.String, (object) objToProcess.San);
          else
            this.instance.AddInParameter(storedProcCommand, "@SAN", DbType.String, (object) DBNull.Value);
          if (objToProcess.Leu != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@LEU", DbType.String, (object) objToProcess.Leu);
          else
            this.instance.AddInParameter(storedProcCommand, "@LEU", DbType.String, (object) DBNull.Value);
          if (objToProcess.LeucocitosCampo != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@LEUCOCITOS_CAMPO", DbType.String, (object) objToProcess.LeucocitosCampo);
          else
            this.instance.AddInParameter(storedProcCommand, "@LEUCOCITOS_CAMPO", DbType.String, (object) DBNull.Value);
          if (objToProcess.HematiesCampo != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@HEMATIES_CAMPO", DbType.String, (object) objToProcess.HematiesCampo);
          else
            this.instance.AddInParameter(storedProcCommand, "@HEMATIES_CAMPO", DbType.String, (object) DBNull.Value);
          if (objToProcess.CelulasAltasCampo != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@CELULAS_ALTAS_CAMPO", DbType.String, (object) objToProcess.CelulasAltasCampo);
          else
            this.instance.AddInParameter(storedProcCommand, "@CELULAS_ALTAS_CAMPO", DbType.String, (object) DBNull.Value);
          if (objToProcess.CelulasBajasCampo != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@CELULAS_BAJAS_CAMPO", DbType.String, (object) objToProcess.CelulasBajasCampo);
          else
            this.instance.AddInParameter(storedProcCommand, "@CELULAS_BAJAS_CAMPO", DbType.String, (object) DBNull.Value);
          if (objToProcess.Moco != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@MOCO", DbType.String, (object) objToProcess.Moco);
          else
            this.instance.AddInParameter(storedProcCommand, "@MOCO", DbType.String, (object) DBNull.Value);
          if (objToProcess.Bacterias != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@BACTERIAS", DbType.String, (object) objToProcess.Bacterias);
          else
            this.instance.AddInParameter(storedProcCommand, "@BACTERIAS", DbType.String, (object) DBNull.Value);
          if (objToProcess.Cilindros != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@CILINDROS", DbType.String, (object) objToProcess.Cilindros);
          else
            this.instance.AddInParameter(storedProcCommand, "@CILINDROS", DbType.String, (object) DBNull.Value);
          if (objToProcess.Cristales != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@CRISTALES", DbType.String, (object) objToProcess.Cristales);
          else
            this.instance.AddInParameter(storedProcCommand, "@CRISTALES", DbType.String, (object) DBNull.Value);
          if (objToProcess.Levaduras != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@LEVADURAS", DbType.String, (object) objToProcess.Levaduras);
          else
            this.instance.AddInParameter(storedProcCommand, "@LEVADURAS", DbType.String, (object) DBNull.Value);
          if (objToProcess.Otros != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@OTROS", DbType.String, (object) objToProcess.Otros);
          else
            this.instance.AddInParameter(storedProcCommand, "@OTROS", DbType.String, (object) DBNull.Value);
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
            if (dbConnection != null) dbConnection.Close();
        }
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return flag;
    }

    public bool CreateFromDt(DataTable dtExamens, DbTransaction parentTrans)
    {
      bool flag = false;
      try
      {
        DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_MUESTRA_LABORATORIO_CREATE_MASS");
        this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, "ID_HISTORIA", DataRowVersion.Current);
        this.instance.AddInParameter(storedProcCommand, "@ESTADO", DbType.Int16, "ESTADO", DataRowVersion.Current);
        this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_EXAMEN", DbType.Int32, "ID_TIPO_EXAMEN", DataRowVersion.Current);
        this.instance.AddInParameter(storedProcCommand, "@RESULTADO", DbType.String, "RESULTADO", DataRowVersion.Current);
        this.instance.AddInParameter(storedProcCommand, "@NUMERO_MUESTRA", DbType.Int16, "NUMERO_MUESTRA", DataRowVersion.Current);
        this.instance.AddInParameter(storedProcCommand, "@ID_CREACION", DbType.Int32, "ID_CREACION", DataRowVersion.Current);
        storedProcCommand.Connection = parentTrans.Connection;
        storedProcCommand.Transaction = parentTrans;
        DbDataAdapter dataAdapter = this.instance.GetDataAdapter();
        dataAdapter.InsertCommand = storedProcCommand;
        dataAdapter.Update(dtExamens);
        flag = true;
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return flag;
    }

    public bool Update(MuestraLaboratorio objToProcess, DbTransaction parentTrans)
    {
      bool flag = false;
      try
      {
        DbConnection dbConnection = (DbConnection) null;
        try
        {
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_MUESTRA_LABORATORIO_UPDATE");
          this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object) objToProcess.Id);
          this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object) objToProcess.IdHistoria);
          this.instance.AddInParameter(storedProcCommand, "@ID_TIPO_EXAMEN", DbType.Int32, (object) Convert.ToInt32((object) objToProcess.IdTipoExamen));
          if (objToProcess.Descripcion != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@DESCRIPCION", DbType.String, (object) objToProcess.Descripcion);
          else
            this.instance.AddInParameter(storedProcCommand, "@DESCRIPCION", DbType.String, (object) DBNull.Value);
          this.instance.AddInParameter(storedProcCommand, "@RESULTADO", DbType.String, (object) objToProcess.Resultado);
          if (objToProcess.Valor != Decimal.MinValue)
            this.instance.AddInParameter(storedProcCommand, "@VALOR", DbType.Decimal, (object) objToProcess.Valor);
          else
            this.instance.AddInParameter(storedProcCommand, "@VALOR", DbType.Decimal, (object) DBNull.Value);
          this.instance.AddInParameter(storedProcCommand, "@ESTADO", DbType.Byte, (object) Convert.ToByte((object) objToProcess.Estado));
          if (objToProcess.Observaciones != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@OBSERVACIONES", DbType.String, (object) objToProcess.Observaciones);
          else
            this.instance.AddInParameter(storedProcCommand, "@OBSERVACIONES", DbType.String, (object) DBNull.Value);
          this.instance.AddInParameter(storedProcCommand, "@FECHA_TOMA_MUESTRA", DbType.Date, (object) objToProcess.FechaTomaMuestra);
          this.instance.AddInParameter(storedProcCommand, "@NUMERO_MUESTRA", DbType.Int16, (object) objToProcess.NumeroMuestra);
          if (objToProcess.Olor != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@OLOR", DbType.String, (object) objToProcess.Olor);
          else
            this.instance.AddInParameter(storedProcCommand, "@OLOR", DbType.String, (object) DBNull.Value);
          if (objToProcess.Color != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@COLOR", DbType.String, (object) objToProcess.Color);
          else
            this.instance.AddInParameter(storedProcCommand, "@COLOR", DbType.String, (object) DBNull.Value);
          if (objToProcess.Aspecto != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@ASPECTO", DbType.String, (object) objToProcess.Aspecto);
          else
            this.instance.AddInParameter(storedProcCommand, "@ASPECTO", DbType.String, (object) DBNull.Value);
          if (objToProcess.Glu != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@GLU", DbType.String, (object) objToProcess.Glu);
          else
            this.instance.AddInParameter(storedProcCommand, "@GLU", DbType.String, (object) DBNull.Value);
          if (objToProcess.Bil != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@BIL", DbType.String, (object) objToProcess.Bil);
          else
            this.instance.AddInParameter(storedProcCommand, "@BIL", DbType.String, (object) DBNull.Value);
          if (objToProcess.Cet != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@CET", DbType.String, (object) objToProcess.Cet);
          else
            this.instance.AddInParameter(storedProcCommand, "@CET", DbType.String, (object) DBNull.Value);
          if (objToProcess.Deh != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@DEH", DbType.String, (object) objToProcess.Deh);
          else
            this.instance.AddInParameter(storedProcCommand, "@DEH", DbType.String, (object) DBNull.Value);
          if (objToProcess.Ph != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@PH", DbType.String, (object) objToProcess.Ph);
          else
            this.instance.AddInParameter(storedProcCommand, "@PH", DbType.String, (object) DBNull.Value);
          if (objToProcess.Pro != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@PRO", DbType.String, (object) objToProcess.Pro);
          else
            this.instance.AddInParameter(storedProcCommand, "@PRO", DbType.String, (object) DBNull.Value);
          if (objToProcess.Uro != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@URO", DbType.String, (object) objToProcess.Uro);
          else
            this.instance.AddInParameter(storedProcCommand, "@URO", DbType.String, (object) DBNull.Value);
          if (objToProcess.Nit != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@NIT", DbType.String, (object) objToProcess.Nit);
          else
            this.instance.AddInParameter(storedProcCommand, "@NIT", DbType.String, (object) DBNull.Value);
          if (objToProcess.San != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@SAN", DbType.String, (object) objToProcess.San);
          else
            this.instance.AddInParameter(storedProcCommand, "@SAN", DbType.String, (object) DBNull.Value);
          if (objToProcess.Leu != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@LEU", DbType.String, (object) objToProcess.Leu);
          else
            this.instance.AddInParameter(storedProcCommand, "@LEU", DbType.String, (object) DBNull.Value);
          if (objToProcess.LeucocitosCampo != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@LEUCOCITOS_CAMPO", DbType.String, (object) objToProcess.LeucocitosCampo);
          else
            this.instance.AddInParameter(storedProcCommand, "@LEUCOCITOS_CAMPO", DbType.String, (object) DBNull.Value);
          if (objToProcess.HematiesCampo != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@HEMATIES_CAMPO", DbType.String, (object) objToProcess.HematiesCampo);
          else
            this.instance.AddInParameter(storedProcCommand, "@HEMATIES_CAMPO", DbType.String, (object) DBNull.Value);
          if (objToProcess.CelulasAltasCampo != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@CELULAS_ALTAS_CAMPO", DbType.String, (object) objToProcess.CelulasAltasCampo);
          else
            this.instance.AddInParameter(storedProcCommand, "@CELULAS_ALTAS_CAMPO", DbType.String, (object) DBNull.Value);
          if (objToProcess.CelulasBajasCampo != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@CELULAS_BAJAS_CAMPO", DbType.String, (object) objToProcess.CelulasBajasCampo);
          else
            this.instance.AddInParameter(storedProcCommand, "@CELULAS_BAJAS_CAMPO", DbType.String, (object) DBNull.Value);
          if (objToProcess.Moco != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@MOCO", DbType.String, (object) objToProcess.Moco);
          else
            this.instance.AddInParameter(storedProcCommand, "@MOCO", DbType.String, (object) DBNull.Value);
          if (objToProcess.Bacterias != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@BACTERIAS", DbType.String, (object) objToProcess.Bacterias);
          else
            this.instance.AddInParameter(storedProcCommand, "@BACTERIAS", DbType.String, (object) DBNull.Value);
          if (objToProcess.Cilindros != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@CILINDROS", DbType.String, (object) objToProcess.Cilindros);
          else
            this.instance.AddInParameter(storedProcCommand, "@CILINDROS", DbType.String, (object) DBNull.Value);
          if (objToProcess.Cristales != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@CRISTALES", DbType.String, (object) objToProcess.Cristales);
          else
            this.instance.AddInParameter(storedProcCommand, "@CRISTALES", DbType.String, (object) DBNull.Value);
          if (objToProcess.Levaduras != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@LEVADURAS", DbType.String, (object) objToProcess.Levaduras);
          else
            this.instance.AddInParameter(storedProcCommand, "@LEVADURAS", DbType.String, (object) DBNull.Value);
          if (objToProcess.Otros != string.Empty)
            this.instance.AddInParameter(storedProcCommand, "@OTROS", DbType.String, (object) objToProcess.Otros);
          else
            this.instance.AddInParameter(storedProcCommand, "@OTROS", DbType.String, (object) DBNull.Value);
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
            if (dbConnection != null) dbConnection.Close();
        }
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return flag;
    }

    public DataTable GetReportDatesData(DateTime fechaInicial, DateTime fechaFinal)
    {
      DataTable dataTable = new DataTable();
      try
      {
        DbConnection connection = this.instance.CreateConnection();
        try
        {
          connection.Open();
          DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_MUESTRA_LABORATORIO_REPORT_DATES");
          storedProcCommand.Connection = connection;
          this.instance.AddInParameter(storedProcCommand, "@FEC_INI", DbType.Date, (object) fechaInicial);
          this.instance.AddInParameter(storedProcCommand, "@FEC_FIN", DbType.Date, (object) fechaFinal);
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

    public bool UpdateStatus(HistoriaMedica objHmEnt, DbTransaction parentTrans)
    {
      bool flag = false;
      try
      {
        DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_MUESTRA_LABORATORIO_UPDATE_STATUS");
        storedProcCommand.Connection = parentTrans.Connection;
        storedProcCommand.Transaction = parentTrans;
        this.instance.AddInParameter(storedProcCommand, "@ID_HISTORIA", DbType.Int32, (object) objHmEnt.Id);
        this.instance.AddInParameter(storedProcCommand, "@ID_USUARIO", DbType.Int32, (object) objHmEnt.IdUltimaModificacion);
        this.instance.ExecuteNonQuery(storedProcCommand, parentTrans);
        flag = true;
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return flag;
    }

    public bool Delete(MuestraLaboratorio objEntML, DbTransaction parentTrans)
    {
      bool flag = false;
      try
      {
        DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_MUESTRA_LABORATORIO_DELETE");
        storedProcCommand.Connection = parentTrans.Connection;
        storedProcCommand.Transaction = parentTrans;
        this.instance.AddInParameter(storedProcCommand, "@ID_MUESTRA", DbType.Int32, (object) objEntML.Id);
        this.instance.ExecuteNonQuery(storedProcCommand, parentTrans);
        flag = true;
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return flag;
    }

    private MuestraLaboratorio GetByPK(int id)
    {
      DbConnection connection = this.instance.CreateConnection();
      MuestraLaboratorio objToLoad = new MuestraLaboratorio();
      try
      {
        connection.Open();
        DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_GET_MUESTRA_LABORATORIO_BY_PK");
        storedProcCommand.Connection = connection;
        this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object) Convert.ToInt32(id));
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

    private void LoadFromDataRow(ref MuestraLaboratorio objToLoad, DataRow drData)
    {
      try
      {
        objToLoad.Id = Convert.ToInt32(drData["ID"]);
        objToLoad.IdHistoria = Convert.ToInt32(drData["ID_HISTORIA"]);
        objToLoad.IdTipoExamen = (Constants.ExamenLab) Convert.ToInt32(drData["ID_TIPO_EXAMEN"]);
        objToLoad.Descripcion = !Convert.IsDBNull(drData["DESCRIPCION"]) ? drData["DESCRIPCION"].ToString() : string.Empty;
        objToLoad.Resultado = drData["RESULTADO"].ToString();
        objToLoad.Valor = !Convert.IsDBNull(drData["VALOR"]) ? Convert.ToDecimal(drData["VALOR"]) : Decimal.MinValue;
        objToLoad.Estado = !Convert.IsDBNull(drData["ESTADO"]) ? (Constants.EstadosMuestraLaboratorio) Convert.ToInt32(drData["ESTADO"]) : Constants.EstadosMuestraLaboratorio.SinAplicar;
        objToLoad.Observaciones = !Convert.IsDBNull(drData["OBSERVACIONES"]) ? drData["OBSERVACIONES"].ToString() : string.Empty;
        objToLoad.FechaTomaMuestra = !Convert.IsDBNull(drData["FECHA_TOMA_MUESTRA"]) ? Convert.ToDateTime(drData["FECHA_TOMA_MUESTRA"]) : DateTime.MinValue;
        objToLoad.NumeroMuestra = Convert.ToInt16(drData["NUMERO_MUESTRA"]);
        objToLoad.Olor = !Convert.IsDBNull(drData["OLOR"]) ? drData["OLOR"].ToString() : string.Empty;
        objToLoad.Color = !Convert.IsDBNull(drData["COLOR"]) ? drData["COLOR"].ToString() : string.Empty;
        objToLoad.Aspecto = !Convert.IsDBNull(drData["ASPECTO"]) ? drData["ASPECTO"].ToString() : string.Empty;
        objToLoad.Glu = !Convert.IsDBNull(drData["GLU"]) ? drData["GLU"].ToString() : string.Empty;
        objToLoad.Bil = !Convert.IsDBNull(drData["BIL"]) ? drData["BIL"].ToString() : string.Empty;
        objToLoad.Cet = !Convert.IsDBNull(drData["CET"]) ? drData["CET"].ToString() : string.Empty;
        objToLoad.Deh = !Convert.IsDBNull(drData["DEH"]) ? drData["DEH"].ToString() : string.Empty;
        objToLoad.Ph = !Convert.IsDBNull(drData["PH"]) ? drData["PH"].ToString() : string.Empty;
        objToLoad.Pro = !Convert.IsDBNull(drData["PRO"]) ? drData["PRO"].ToString() : string.Empty;
        objToLoad.Uro = !Convert.IsDBNull(drData["URO"]) ? drData["URO"].ToString() : string.Empty;
        objToLoad.Nit = !Convert.IsDBNull(drData["NIT"]) ? drData["NIT"].ToString() : string.Empty;
        objToLoad.San = !Convert.IsDBNull(drData["SAN"]) ? drData["SAN"].ToString() : string.Empty;
        objToLoad.Leu = !Convert.IsDBNull(drData["LEU"]) ? drData["LEU"].ToString() : string.Empty;
        objToLoad.LeucocitosCampo = !Convert.IsDBNull(drData["LEUCOCITOS_CAMPO"]) ? drData["LEUCOCITOS_CAMPO"].ToString() : string.Empty;
        objToLoad.HematiesCampo = !Convert.IsDBNull(drData["HEMATIES_CAMPO"]) ? drData["HEMATIES_CAMPO"].ToString() : string.Empty;
        objToLoad.CelulasAltasCampo = !Convert.IsDBNull(drData["CELULAS_ALTAS_CAMPO"]) ? drData["CELULAS_ALTAS_CAMPO"].ToString() : string.Empty;
        objToLoad.CelulasBajasCampo = !Convert.IsDBNull(drData["CELULAS_BAJAS_CAMPO"]) ? drData["CELULAS_BAJAS_CAMPO"].ToString() : string.Empty;
        objToLoad.Moco = !Convert.IsDBNull(drData["MOCO"]) ? drData["MOCO"].ToString() : string.Empty;
        objToLoad.Bacterias = !Convert.IsDBNull(drData["BACTERIAS"]) ? drData["BACTERIAS"].ToString() : string.Empty;
        objToLoad.Cilindros = !Convert.IsDBNull(drData["CILINDROS"]) ? drData["CILINDROS"].ToString() : string.Empty;
        objToLoad.Cristales = !Convert.IsDBNull(drData["CRISTALES"]) ? drData["CRISTALES"].ToString() : string.Empty;
        objToLoad.Levaduras = !Convert.IsDBNull(drData["LEVADURAS"]) ? drData["LEVADURAS"].ToString() : string.Empty;
        objToLoad.Otros = !Convert.IsDBNull(drData["OTROS"]) ? drData["OTROS"].ToString() : string.Empty;
        objToLoad.IdCreacion = Convert.ToInt32(drData["ID_CREACION"]);
        objToLoad.FechaCreacion = Convert.ToDateTime(drData["FECHA_CREACION"]);
        objToLoad.IdUltimaModificacion = Convert.ToInt32(drData["ID_ULTIMA_MODIFICACION"]);
        objToLoad.FechaUltimaModificacion = Convert.ToDateTime(drData["FECHA_ULTIMA_MODIFICACION"]);
      }
      catch (Exception ex)
      {
        objToLoad = new MuestraLaboratorio();
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
    }
  }
}
