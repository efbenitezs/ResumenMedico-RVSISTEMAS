// Decompiled with JetBrains decompiler
// Type: RMEntity.MuestraLaboratorio
// Assembly: RMEntity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F8D42C4-526A-4A7E-80CF-D7AFFD197C27
// Assembly location: C:\Users\Personal\source\RMEntity.dll

using System;

namespace RMEntity
{
  public class MuestraLaboratorio : BaseEntity
  {
    private int idHistoria = int.MinValue;
    private Constants.ExamenLab idTipoExamen = Constants.ExamenLab.Otro;
    private string descripcion = string.Empty;
    private string resultado = string.Empty;
    private Decimal valor = Decimal.MinValue;
    private Constants.EstadosMuestraLaboratorio estado = Constants.EstadosMuestraLaboratorio.SinAplicar;
    private string observaciones = string.Empty;
    private DateTime fechaTomaMuestra = new DateTime();
    private short numeroMuestra = short.MinValue;
    private string olor = string.Empty;
    private string color = string.Empty;
    private string aspecto = string.Empty;
    private string glu = string.Empty;
    private string bil = string.Empty;
    private string cet = string.Empty;
    private string deh = string.Empty;
    private string ph = string.Empty;
    private string pro = string.Empty;
    private string uro = string.Empty;
    private string nit = string.Empty;
    private string san = string.Empty;
    private string leu = string.Empty;
    private string leucocitosCampo = string.Empty;
    private string hematiesCampo = string.Empty;
    private string celulasAltasCampo = string.Empty;
    private string celulasBajasCampo = string.Empty;
    private string moco = string.Empty;
    private string bacterias = string.Empty;
    private string cilindros = string.Empty;
    private string cristales = string.Empty;
    private string levaduras = string.Empty;
    private string otros = string.Empty;

    public int IdHistoria
    {
      get => this.idHistoria;
      set => this.idHistoria = value;
    }

    public Constants.ExamenLab IdTipoExamen
    {
      get => this.idTipoExamen;
      set => this.idTipoExamen = value;
    }

    public string Descripcion
    {
      get => this.descripcion;
      set => this.descripcion = value;
    }

    public string Resultado
    {
      get => this.resultado;
      set => this.resultado = value;
    }

    public Decimal Valor
    {
      get => this.valor;
      set => this.valor = value;
    }

    public Constants.EstadosMuestraLaboratorio Estado
    {
      get => this.estado;
      set => this.estado = value;
    }

    public string Observaciones
    {
      get => this.observaciones;
      set => this.observaciones = value;
    }

    public DateTime FechaTomaMuestra
    {
      get => this.fechaTomaMuestra;
      set => this.fechaTomaMuestra = value;
    }

    public short NumeroMuestra
    {
      get => this.numeroMuestra;
      set => this.numeroMuestra = value;
    }

    public string Olor
    {
      get => this.olor;
      set => this.olor = value;
    }

    public string Color
    {
      get => this.color;
      set => this.color = value;
    }

    public string Aspecto
    {
      get => this.aspecto;
      set => this.aspecto = value;
    }

    public string Glu
    {
      get => this.glu;
      set => this.glu = value;
    }

    public string Bil
    {
      get => this.bil;
      set => this.bil = value;
    }

    public string Cet
    {
      get => this.cet;
      set => this.cet = value;
    }

    public string Deh
    {
      get => this.deh;
      set => this.deh = value;
    }

    public string Ph
    {
      get => this.ph;
      set => this.ph = value;
    }

    public string Pro
    {
      get => this.pro;
      set => this.pro = value;
    }

    public string Uro
    {
      get => this.uro;
      set => this.uro = value;
    }

    public string Nit
    {
      get => this.nit;
      set => this.nit = value;
    }

    public string San
    {
      get => this.san;
      set => this.san = value;
    }

    public string Leu
    {
      get => this.leu;
      set => this.leu = value;
    }

    public string LeucocitosCampo
    {
      get => this.leucocitosCampo;
      set => this.leucocitosCampo = value;
    }

    public string HematiesCampo
    {
      get => this.hematiesCampo;
      set => this.hematiesCampo = value;
    }

    public string CelulasAltasCampo
    {
      get => this.celulasAltasCampo;
      set => this.celulasAltasCampo = value;
    }

    public string CelulasBajasCampo
    {
      get => this.celulasBajasCampo;
      set => this.celulasBajasCampo = value;
    }

    public string Moco
    {
      get => this.moco;
      set => this.moco = value;
    }

    public string Bacterias
    {
      get => this.bacterias;
      set => this.bacterias = value;
    }

    public string Cilindros
    {
      get => this.cilindros;
      set => this.cilindros = value;
    }

    public string Cristales
    {
      get => this.cristales;
      set => this.cristales = value;
    }

    public string Levaduras
    {
      get => this.levaduras;
      set => this.levaduras = value;
    }

    public string Otros
    {
      get => this.otros;
      set => this.otros = value;
    }
  }
}
