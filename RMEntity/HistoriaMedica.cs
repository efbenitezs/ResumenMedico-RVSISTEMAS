// Decompiled with JetBrains decompiler
// Type: RMEntity.HistoriaMedica
// Assembly: RMEntity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F8D42C4-526A-4A7E-80CF-D7AFFD197C27
// Assembly location: C:\Users\Personal\source\RMEntity.dll

using System;

namespace RMEntity
{
	public class HistoriaMedica : BaseEntity
	{
		private int idPaciente = int.MinValue;
		private DateTime fechaIngreso = new DateTime();
		private Decimal peso = Decimal.MinValue;
		private Decimal estatura = Decimal.MinValue;
		private Decimal perimetroCefalico = Decimal.MinValue;
		private int idTipoVisa = int.MinValue;
		private string codigoSolicitud = string.Empty;
		private bool pacienteExterno;
		private bool tieneRevisonLab;
		private Constants.EstadoRevision estadoRevisionLab = Constants.EstadoRevision.SinAplicar;
		private string comentarioLab = string.Empty;
		private bool tieneRevisionRad;
		private Constants.EstadoRevision estadoRevisionRad = Constants.EstadoRevision.SinAplicar;
		private bool radiografiaTomada;
		private bool radiografiaCargadaEmedical;
		private string comentarioRad = string.Empty;
		private Constants.EstadoRevision estadoRevisionRadMed = Constants.EstadoRevision.SinAplicar;
		private string comentarioRadMed = string.Empty;
		private bool tieneRevisionMed;
		private Constants.EstadoRevision estadoRevisionMed = Constants.EstadoRevision.SinAplicar;
		private string comentarioMed = string.Empty;
		private bool finalizada;
		private bool requiereNotificacion;
		private bool notificacionEnviada;
		private bool retornadoEmbajada;
		private bool esPrioritario;
		private string comentarioRecepcion = string.Empty;
		private int idMedico = int.MinValue;
		private bool eliminado;
		private bool liberado;
		private Usuario _bacteriologo;

		public int IdPaciente
		{
			get => this.idPaciente;
			set => this.idPaciente = value;
		}

		public DateTime FechaIngreso
		{
			get => this.fechaIngreso;
			set => this.fechaIngreso = value;
		}

		public Decimal Peso
		{
			get => this.peso;
			set => this.peso = value;
		}

		public Decimal Estatura
		{
			get => this.estatura;
			set => this.estatura = value;
		}

		public Decimal BMI => !(this.peso != Decimal.MinValue) || !(this.estatura != Decimal.MinValue) || !(this.estatura > 0M) ? 0M : this.peso / Convert.ToDecimal(Math.Pow((double)this.estatura, 2.0));

		public Decimal PerimetroCefalico
		{
			get => this.perimetroCefalico;
			set => this.perimetroCefalico = value;
		}

		public int IdTipoVisa
		{
			get => this.idTipoVisa;
			set => this.idTipoVisa = value;
		}

		public string CodigoSolicitud
		{
			get => this.codigoSolicitud;
			set => this.codigoSolicitud = value;
		}

		public bool PacienteExterno
		{
			get => this.pacienteExterno;
			set => this.pacienteExterno = value;
		}

		public bool TieneRevisonLab
		{
			get => this.tieneRevisonLab;
			set => this.tieneRevisonLab = value;
		}

		public Constants.EstadoRevision EstadoRevisionLab
		{
			get => this.estadoRevisionLab;
			set => this.estadoRevisionLab = value;
		}

		public string ComentarioLab
		{
			get => this.comentarioLab;
			set => this.comentarioLab = value;
		}

		public bool TieneRevisionRad
		{
			get => this.tieneRevisionRad;
			set => this.tieneRevisionRad = value;
		}

		public Constants.EstadoRevision EstadoRevisionRad
		{
			get => this.estadoRevisionRad;
			set => this.estadoRevisionRad = value;
		}

		public bool RadiografiaTomada
		{
			get => this.radiografiaTomada;
			set => this.radiografiaTomada = value;
		}

		public bool RadiografiaCargadaEmedical
		{
			get => this.radiografiaCargadaEmedical;
			set => this.radiografiaCargadaEmedical = value;
		}

		public string ComentarioRad
		{
			get => this.comentarioRad;
			set => this.comentarioRad = value;
		}

		public Constants.EstadoRevision EstadoRevisionRadMed
		{
			get => this.estadoRevisionRadMed;
			set => this.estadoRevisionRadMed = value;
		}

		public string ComentarioRadMed
		{
			get => this.comentarioRadMed;
			set => this.comentarioRadMed = value;
		}

		public bool TieneRevisionMed
		{
			get => this.tieneRevisionMed;
			set => this.tieneRevisionMed = value;
		}

		public Constants.EstadoRevision EstadoRevisionMed
		{
			get => this.estadoRevisionMed;
			set => this.estadoRevisionMed = value;
		}

		public string ComentarioMed
		{
			get => this.comentarioMed;
			set => this.comentarioMed = value;
		}

		public bool Finalizada
		{
			get => this.finalizada;
			set => this.finalizada = value;
		}

		public bool RequiereNotificacion
		{
			get => this.requiereNotificacion;
			set => this.requiereNotificacion = value;
		}

		public bool NotificacionEnviada
		{
			get => this.notificacionEnviada;
			set => this.notificacionEnviada = value;
		}

		public bool RetornadoEmbajada
		{
			get => this.retornadoEmbajada;
			set => this.retornadoEmbajada = value;
		}

		public bool EsPrioritario
		{
			get => this.esPrioritario;
			set => this.esPrioritario = value;
		}

		public string ComentarioRecepcion
		{
			get => this.comentarioRecepcion;
			set => this.comentarioRecepcion = value;
		}

		public int IdMedico
		{
			get => this.idMedico;
			set => this.idMedico = value;
		}

		public bool Eliminado
		{
			get => this.eliminado;
			set => this.eliminado = value;
		}

		public bool Liberado
		{
			get => this.liberado;
			set => this.liberado = value;
		}

		public Usuario Bacteriologo
		{
			get => _bacteriologo;
			set => _bacteriologo = value;
		}
	}
}
