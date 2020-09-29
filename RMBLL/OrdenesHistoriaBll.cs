// Decompiled with JetBrains decompiler
// Type: RMBLL.OrdenesHistoriaBll
// Assembly: RMBLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F2C48D5-ED72-4974-B910-3403631DD6A0
// Assembly location: C:\Users\Personal\source\RMBLL.dll

using RMDAL;
using RMEntity;
using System.Collections.Generic;
using System.Data;

namespace RMBLL
{
  public class OrdenesHistoriaBll : BaseForm
  {
    public static DataTable Estructure => OrdenesHistoriaDao.DtEstructure;

    public DataTable GetList(int idHistoria, string descripcion)
    {
      OrdenesHistoriaDao ordenesHistoriaDao = new OrdenesHistoriaDao();
      DataTable list = ordenesHistoriaDao.GetList(idHistoria, descripcion);
      this.error = ordenesHistoriaDao.Error;
      return list;
    }

    public List<OrdenesHistoria> GetOrdenesHistorias(
      int idHistoria,
      string descripcion)
    {
      OrdenesHistoriaDao ordenesHistoriaDao = new OrdenesHistoriaDao();
      List<OrdenesHistoria> ordenesHistorias = ordenesHistoriaDao.GetOrdenesHistorias(idHistoria, descripcion);
      this.error = ordenesHistoriaDao.Error;
      return ordenesHistorias;
    }

    public OrdenesHistoria Load(int id)
    {
      OrdenesHistoriaDao ordenesHistoriaDao = new OrdenesHistoriaDao();
      OrdenesHistoria ordenesHistoria = ordenesHistoriaDao.Load(id);
      this.error = ordenesHistoriaDao.Error;
      return ordenesHistoria;
    }

    public bool Save(OrdenesHistoria objEnt)
    {
      OrdenesHistoriaDao ordenesHistoriaDao = new OrdenesHistoriaDao();
      bool flag = objEnt.Id == int.MinValue ? ordenesHistoriaDao.Create(objEnt) : ordenesHistoriaDao.Update(objEnt);
      this.error = ordenesHistoriaDao.Error;
      return flag;
    }

    public bool Delete(OrdenesHistoria objToProcess)
    {
      OrdenesHistoriaDao ordenesHistoriaDao = new OrdenesHistoriaDao();
      bool flag = ordenesHistoriaDao.Delete(objToProcess);
      this.error = ordenesHistoriaDao.Error;
      return flag;
    }
  }
}
