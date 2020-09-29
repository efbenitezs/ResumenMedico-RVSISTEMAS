// Decompiled with JetBrains decompiler
// Type: RMEntity.AnexoHistoria
// Assembly: RMEntity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F8D42C4-526A-4A7E-80CF-D7AFFD197C27
// Assembly location: C:\Users\Personal\source\RMEntity.dll

namespace RMEntity
{
  public class AnexoHistoria : BaseEntity
  {
    private int idHistoria = int.MinValue;
    private Constants.TipoRevision idTipoRevision = Constants.TipoRevision.Laboratorio;
    private int idMuestra = int.MinValue;
    private string nombreAdjunto = string.Empty;
    private string nombreArchivo = string.Empty;

    public int IdHistoria
    {
      get => this.idHistoria;
      set => this.idHistoria = value;
    }

    public Constants.TipoRevision IdTipoRevision
    {
      get => this.idTipoRevision;
      set => this.idTipoRevision = value;
    }

    public string NombreAdjunto
    {
      get => this.nombreAdjunto;
      set => this.nombreAdjunto = value;
    }

    public string NombreArchivo
    {
      get => this.nombreArchivo;
      set => this.nombreArchivo = value;
    }

    public int IdMuestra
    {
      get => this.idMuestra;
      set => this.idMuestra = value;
    }
  }
}
