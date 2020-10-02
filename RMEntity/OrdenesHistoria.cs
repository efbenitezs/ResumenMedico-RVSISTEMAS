// Decompiled with JetBrains decompiler
// Type: RMEntity.OrdenesHistoria
// Assembly: RMEntity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F8D42C4-526A-4A7E-80CF-D7AFFD197C27
// Assembly location: C:\Users\Personal\source\RMEntity.dll

namespace RMEntity
{
	public class OrdenesHistoria : BaseEntity
	{
		private int idHistoria = int.MinValue;
		private string descripcion = string.Empty;
		private string medicoTratante = string.Empty;

		public int IdHistoria
		{
			get => this.idHistoria;
			set => this.idHistoria = value;
		}

		public string Descripcion
		{
			get => this.descripcion;
			set => this.descripcion = value;
		}

		public string MedicoTratante
		{
			get => this.medicoTratante;
			set => this.medicoTratante = value;
		}
	}
}