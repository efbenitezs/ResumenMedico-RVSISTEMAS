// Decompiled with JetBrains decompiler
// Type: RMBLL.CargoBll
// Assembly: RMBLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F2C48D5-ED72-4974-B910-3403631DD6A0
// Assembly location: C:\Users\Personal\source\RMBLL.dll

using RMDAL;
using RMEntity;
using System.Collections.Generic;
using System.Data;

namespace RMBLL
{
  public class CargoBll : BaseForm
  {
    public static DataTable Estructure => CargoDao.DtEstructure;

    public DataTable GetList(string nombreCargo, bool activo, bool showAllActivo)
    {
      CargoDao cargoDao = new CargoDao();
      DataTable list = cargoDao.GetList(nombreCargo, activo, showAllActivo);
      this.error = cargoDao.Error;
      return list;
    }

    public List<Cargo> GetCargos(string nombreCargo, bool activo, bool showAllActivo)
    {
      CargoDao cargoDao = new CargoDao();
      List<Cargo> cargos = cargoDao.GetCargos(nombreCargo, activo, showAllActivo);
      this.error = cargoDao.Error;
      return cargos;
    }

    public Cargo Load(int id)
    {
      CargoDao cargoDao = new CargoDao();
      Cargo cargo = cargoDao.Load(id);
      this.error = cargoDao.Error;
      return cargo;
    }

    public bool Save(Cargo objEnt)
    {
      CargoDao cargoDao = new CargoDao();
      bool flag = objEnt.Id == int.MinValue ? cargoDao.Create(objEnt) : cargoDao.Update(objEnt);
      this.error = cargoDao.Error;
      return flag;
    }

    public bool Delete(Cargo objToProcess)
    {
      CargoDao cargoDao = new CargoDao();
      bool flag = cargoDao.Delete(objToProcess);
      this.error = cargoDao.Error;
      return flag;
    }
  }
}
