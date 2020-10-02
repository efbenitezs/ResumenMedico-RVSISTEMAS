// Decompiled with JetBrains decompiler
// Type: RMEntity.Parametro
// Assembly: RMEntity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F8D42C4-526A-4A7E-80CF-D7AFFD197C27
// Assembly location: C:\Users\Personal\source\RMEntity.dll

namespace RMEntity
{
	public class Parametro : BaseEntity
	{
		private Constants.Parametros id = Constants.Parametros.NombreDoctor;
		private string nombre = string.Empty;
		private string descripcion = string.Empty;
		private string valor = string.Empty;

		public Constants.Parametros Id
		{
			get => this.id;
			set => this.id = value;
		}

		public string Nombre
		{
			get => this.nombre;
			set => this.nombre = value;
		}

		public string Descripcion
		{
			get => this.descripcion;
			set => this.descripcion = value;
		}

		public string Valor
		{
			get => this.valor;
			set => this.valor = value;
		}
	}
}