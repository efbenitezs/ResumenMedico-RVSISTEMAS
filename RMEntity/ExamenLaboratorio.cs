// Decompiled with JetBrains decompiler
// Type: RMEntity.ExamenLaboratorio
// Assembly: RMEntity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F8D42C4-526A-4A7E-80CF-D7AFFD197C27
// Assembly location: C:\Users\Personal\source\RMEntity.dll

namespace RMEntity
{
	public class ExamenLaboratorio : BaseEntityAdmin
	{
		private string nombre = string.Empty;
		private bool esExterno;
		private bool requiereVenopuncion;
		private bool requiereConsentimiento;

		public string Nombre
		{
			get => this.nombre;
			set => this.nombre = value;
		}

		public bool EsExterno
		{
			get => this.esExterno;
			set => this.esExterno = value;
		}

		public bool RequiereVenopuncion
		{
			get => this.requiereVenopuncion;
			set => this.requiereVenopuncion = value;
		}

		public bool RequiereConsentimiento
		{
			get => this.requiereConsentimiento;
			set => this.requiereConsentimiento = value;
		}
	}
}