// Decompiled with JetBrains decompiler
// Type: RMEntity.Paciente
// Assembly: RMEntity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F8D42C4-526A-4A7E-80CF-D7AFFD197C27
// Assembly location: C:\Users\Personal\source\RMEntity.dll

using System;

namespace RMEntity
{
	public class Paciente : BaseEntity
	{
		public int IdTipoDocumento { get; set; }

		public string NumeroDocumento { get; set; }

		public string NumeroPasaporte { get; set; }

		public string Nombres { get; set; }

		public string Apellidos { get; set; }

		public bool Genero { get; set; }

		public DateTime FechaNacimiento { get; set; }

		public string Correo { get; set; }

		public string Acudiente { get; set; }

		public string Direccion { get; set; }

		public string Foto { get; set; }

		public string Telefono { get; set; }

		public int EdadPaciente
		{
			get
			{
				int int32_1 = Convert.ToInt32(DateTime.Now.ToString("yyyyMMdd"));
				int int32_2 = Convert.ToInt32((this.FechaNacimiento != DateTime.MinValue ? this.FechaNacimiento : DateTime.Now).ToString("yyyyMMdd"));
				return (int32_1 - int32_2) / 10000;
			}
		}
	}
}