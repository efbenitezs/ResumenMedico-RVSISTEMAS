// Decompiled with JetBrains decompiler
// Type: RMEntity.Usuario
// Assembly: RMEntity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F8D42C4-526A-4A7E-80CF-D7AFFD197C27
// Assembly location: C:\Users\Personal\source\RMEntity.dll

namespace RMEntity
{
	public class Usuario : BaseEntityAdmin
	{
		private string cuenta = string.Empty;
		private string pwd = string.Empty;
		private string nombres = string.Empty;
		private string apellidos = string.Empty;
		private int idCargo = int.MinValue;
		private Constants.Perfiles perfil = Constants.Perfiles.Recepcion;
		private bool finalizaHistoria;
		private bool administrador;

		public string Cuenta
		{
			get => this.cuenta;
			set => this.cuenta = value;
		}

		public string Pwd
		{
			get => this.pwd;
			set => this.pwd = value;
		}

		public string Nombres
		{
			get => this.nombres;
			set => this.nombres = value;
		}

		public string Apellidos
		{
			get => this.apellidos;
			set => this.apellidos = value;
		}

		public int IdCargo
		{
			get => this.idCargo;
			set => this.idCargo = value;
		}

		public Constants.Perfiles Perfil
		{
			get => this.perfil;
			set => this.perfil = value;
		}

		public bool FinalizaHistoria
		{
			get => this.finalizaHistoria;
			set => this.finalizaHistoria = value;
		}

		public bool Administrador
		{
			get => this.administrador;
			set => this.administrador = value;
		}
		private FirmaProfesional _firmaProfesional;

		public FirmaProfesional FirmaProfesional
		{
			get => this._firmaProfesional;
			set => this._firmaProfesional = value;
		}
	}

	public class FirmaProfesional
	{
		private int _id_Usuario;

		public int Id_Usuario
		{
			get => this._id_Usuario;
			set => this._id_Usuario = value;
		}

		private string _registroProfesional;

		public string RegistroProfesional
		{
			get => _registroProfesional;
			set => _registroProfesional = value;
		}

		private string _universidad;

		public string Universidad
		{
			get => _universidad;
			set => _universidad = value;
		}

		private string _correoElectronico;

		public string CorreoElectronico
		{
			get => _correoElectronico; 
			set => _correoElectronico = value; 
		}

		private string _firmaBase64;

		public string FirmaBase64
		{
			get => _firmaBase64; 
			set => _firmaBase64 = value; 
		}
	}
}
