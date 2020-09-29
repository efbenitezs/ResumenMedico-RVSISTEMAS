// Decompiled with JetBrains decompiler
// Type: RMBLL.ExamenLaboratorioBll
// Assembly: RMBLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F2C48D5-ED72-4974-B910-3403631DD6A0
// Assembly location: C:\Users\Personal\source\RMBLL.dll

using RMDAL;
using RMEntity;
using System.Collections.Generic;
using System.Data;

namespace RMBLL
{
  public class ExamenLaboratorioBll : BaseForm
  {
    public static DataTable Estructure => ExamenLaboratorioDao.DtEstructure;

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
      ExamenLaboratorioDao examenLaboratorioDao = new ExamenLaboratorioDao();
      DataTable list = examenLaboratorioDao.GetList(nombre, esExterno, showAllExterno, requiereVenopuncion, showAllRequiereVenopuncion, requiereConsentimiento, showAllRequiereConsentimiento, activo, showAllActivo);
      this.error = examenLaboratorioDao.Error;
      return list;
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
      ExamenLaboratorioDao examenLaboratorioDao = new ExamenLaboratorioDao();
      List<ExamenLaboratorio> examenLaboratorios = examenLaboratorioDao.GetExamenLaboratorios(nombre, esExterno, showAllExterno, requiereVenopuncion, showAllRequiereVenopuncion, requiereConsentimiento, showAllRequiereConsentimiento, activo, showAllActivo);
      this.error = examenLaboratorioDao.Error;
      return examenLaboratorios;
    }

    public ExamenLaboratorio Load(int id)
    {
      ExamenLaboratorioDao examenLaboratorioDao = new ExamenLaboratorioDao();
      ExamenLaboratorio examenLaboratorio = examenLaboratorioDao.Load(id);
      this.error = examenLaboratorioDao.Error;
      return examenLaboratorio;
    }

    public bool Save(ExamenLaboratorio objEnt)
    {
      ExamenLaboratorioDao examenLaboratorioDao = new ExamenLaboratorioDao();
      bool flag = objEnt.Id == int.MinValue ? examenLaboratorioDao.Create(objEnt) : examenLaboratorioDao.Update(objEnt);
      this.error = examenLaboratorioDao.Error;
      return flag;
    }

    public bool Delete(ExamenLaboratorio objToProcess)
    {
      ExamenLaboratorioDao examenLaboratorioDao = new ExamenLaboratorioDao();
      bool flag = examenLaboratorioDao.Delete(objToProcess);
      this.error = examenLaboratorioDao.Error;
      return flag;
    }
  }
}
