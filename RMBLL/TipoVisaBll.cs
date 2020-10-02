// Decompiled with JetBrains decompiler
// Type: RMBLL.TipoVisaBll
// Assembly: RMBLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F2C48D5-ED72-4974-B910-3403631DD6A0
// Assembly location: C:\Users\Personal\source\RMBLL.dll

using System.Collections.Generic;
using System.Data;
using RMDAL;
using RMEntity;

namespace RMBLL
{
	public class TipoVisaBll : BaseForm
	{
		public static DataTable Estructure => TipoVisaDao.DtEstructure;

		public DataTable GetList(
		  string nombre,
		  Constants.Embajadas idEmbajada,
		  bool showAllEmbajadas,
		  bool activo,
		  bool showAllActivo)
		{
			TipoVisaDao tipoVisaDao = new TipoVisaDao();
			DataTable list = tipoVisaDao.GetList(nombre, idEmbajada, showAllEmbajadas, activo, showAllActivo);
			this.error = tipoVisaDao.Error;
			return list;
		}

		public List<TipoVisa> GetTipoVisas(
		  string nombre,
		  Constants.Embajadas idEmbajada,
		  bool showAllEmbajadas,
		  bool activo,
		  bool showAllActivo)
		{
			TipoVisaDao tipoVisaDao = new TipoVisaDao();
			List<TipoVisa> tipoVisas = tipoVisaDao.GetTipoVisas(nombre, idEmbajada, showAllEmbajadas, activo, showAllActivo);
			this.error = tipoVisaDao.Error;
			return tipoVisas;
		}

		public TipoVisa Load(int id)
		{
			TipoVisaDao tipoVisaDao = new TipoVisaDao();
			TipoVisa tipoVisa = tipoVisaDao.Load(id);
			this.error = tipoVisaDao.Error;
			return tipoVisa;
		}

		public bool Save(TipoVisa objEnt)
		{
			TipoVisaDao tipoVisaDao = new TipoVisaDao();
			bool flag = objEnt.Id == int.MinValue ? tipoVisaDao.Create(objEnt) : tipoVisaDao.Update(objEnt);
			this.error = tipoVisaDao.Error;
			return flag;
		}

		public bool Delete(TipoVisa objToProcess)
		{
			TipoVisaDao tipoVisaDao = new TipoVisaDao();
			bool flag = tipoVisaDao.Delete(objToProcess);
			this.error = tipoVisaDao.Error;
			return flag;
		}
	}
}