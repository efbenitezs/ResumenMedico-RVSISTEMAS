// Decompiled with JetBrains decompiler
// Type: RMBLL.TipoDocumentoBll
// Assembly: RMBLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F2C48D5-ED72-4974-B910-3403631DD6A0
// Assembly location: C:\Users\Personal\source\RMBLL.dll

using System.Collections.Generic;
using System.Data;
using RMDAL;
using RMEntity;

namespace RMBLL
{
	public class TipoDocumentoBll : BaseForm
	{
		public static DataTable Estructure => TipoDocumentoDao.DtEstructure;

		public DataTable GetList(string nombre, bool activo, bool showAllActivo)
		{
			TipoDocumentoDao tipoDocumentoDao = new TipoDocumentoDao();
			DataTable list = tipoDocumentoDao.GetList(nombre, activo, showAllActivo);
			this.error = tipoDocumentoDao.Error;
			return list;
		}

		public List<TipoDocumento> GetTipoDocumentos(
		  string nombre,
		  bool activo,
		  bool showAllActivo)
		{
			TipoDocumentoDao tipoDocumentoDao = new TipoDocumentoDao();
			List<TipoDocumento> tipoDocumentos = tipoDocumentoDao.GetTipoDocumentos(nombre, activo, showAllActivo);
			this.error = tipoDocumentoDao.Error;
			return tipoDocumentos;
		}

		public TipoDocumento Load(int id)
		{
			TipoDocumentoDao tipoDocumentoDao = new TipoDocumentoDao();
			TipoDocumento tipoDocumento = tipoDocumentoDao.Load(id);
			this.error = tipoDocumentoDao.Error;
			return tipoDocumento;
		}

		public bool Save(TipoDocumento objEnt)
		{
			TipoDocumentoDao tipoDocumentoDao = new TipoDocumentoDao();
			bool flag = objEnt.Id == int.MinValue ? tipoDocumentoDao.Create(objEnt) : tipoDocumentoDao.Update(objEnt);
			this.error = tipoDocumentoDao.Error;
			return flag;
		}

		public bool Delete(TipoDocumento objToProcess)
		{
			TipoDocumentoDao tipoDocumentoDao = new TipoDocumentoDao();
			bool flag = tipoDocumentoDao.Delete(objToProcess);
			this.error = tipoDocumentoDao.Error;
			return flag;
		}
	}
}