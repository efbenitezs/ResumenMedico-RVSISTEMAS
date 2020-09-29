// Decompiled with JetBrains decompiler
// Type: RMBLL.EmbajadaBll
// Assembly: RMBLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F2C48D5-ED72-4974-B910-3403631DD6A0
// Assembly location: C:\Users\Personal\source\RMBLL.dll

using RMDAL;
using RMEntity;
using System.Collections.Generic;
using System.Data;

namespace RMBLL
{
  public class EmbajadaBll : BaseForm
  {
    public static DataTable Estructure => EmbajadaDao.DtEstructure;

    public DataTable GetList(string nombre, bool activo, bool showAllActivo)
    {
      EmbajadaDao embajadaDao = new EmbajadaDao();
      DataTable list = embajadaDao.GetList(nombre, activo, showAllActivo);
      this.error = embajadaDao.Error;
      return list;
    }

    public List<Embajada> GetEmbajadas(string nombre, bool activo, bool showAllActivo)
    {
      EmbajadaDao embajadaDao = new EmbajadaDao();
      List<Embajada> embajadas = embajadaDao.GetEmbajadas(nombre, activo, showAllActivo);
      this.error = embajadaDao.Error;
      return embajadas;
    }

    public Embajada Load(int id)
    {
      EmbajadaDao embajadaDao = new EmbajadaDao();
      Embajada embajada = embajadaDao.Load(id);
      this.error = embajadaDao.Error;
      return embajada;
    }

    public bool Save(Embajada objEnt)
    {
      EmbajadaDao embajadaDao = new EmbajadaDao();
      bool flag = objEnt.Id == int.MinValue ? embajadaDao.Create(objEnt) : embajadaDao.Update(objEnt);
      this.error = embajadaDao.Error;
      return flag;
    }

    public bool Delete(Embajada objToProcess)
    {
      EmbajadaDao embajadaDao = new EmbajadaDao();
      bool flag = embajadaDao.Delete(objToProcess);
      this.error = embajadaDao.Error;
      return flag;
    }
  }
}
