// Decompiled with JetBrains decompiler
// Type: RMBLL.ParametroBll
// Assembly: RMBLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F2C48D5-ED72-4974-B910-3403631DD6A0
// Assembly location: C:\Users\Personal\source\RMBLL.dll

using System.Collections.Generic;
using System.Data;
using RMDAL;
using RMEntity;

namespace RMBLL
{
	public class ParametroBll : BaseForm
	{
		public static DataTable Estructure => ParametroDao.DtEstructure;

		public DataTable GetList(Constants.Parametros id, bool showAllId, string nombre)
		{
			ParametroDao parametroDao = new ParametroDao();
			DataTable list = parametroDao.GetList(id, showAllId, nombre);
			this.error = parametroDao.Error;
			return list;
		}

		public List<Parametro> GetParametros(
		  Constants.Parametros id,
		  bool showAllId,
		  string nombre)
		{
			ParametroDao parametroDao = new ParametroDao();
			List<Parametro> parametros = parametroDao.GetParametros(id, showAllId, nombre);
			this.error = parametroDao.Error;
			return parametros;
		}

		public Parametro Load(Constants.Parametros id)
		{
			ParametroDao parametroDao = new ParametroDao();
			Parametro parametro = parametroDao.Load(id);
			this.error = parametroDao.Error;
			return parametro;
		}

		public bool Update(Parametro objEnt)
		{
			ParametroDao parametroDao = new ParametroDao();
			bool flag = parametroDao.Update(objEnt);
			this.error = parametroDao.Error;
			return flag;
		}
	}
}