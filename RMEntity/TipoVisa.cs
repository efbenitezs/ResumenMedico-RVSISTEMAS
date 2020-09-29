// Decompiled with JetBrains decompiler
// Type: RMEntity.TipoVisa
// Assembly: RMEntity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F8D42C4-526A-4A7E-80CF-D7AFFD197C27
// Assembly location: C:\Users\Personal\source\RMEntity.dll

namespace RMEntity
{
  public class TipoVisa : BaseEntityAdmin
  {
    private string nombre = string.Empty;
    private Constants.Embajadas idEmbajada = Constants.Embajadas.Colombia;

    public string Nombre
    {
      get => this.nombre;
      set => this.nombre = value;
    }

    public Constants.Embajadas IdEmbajada
    {
      get => this.idEmbajada;
      set => this.idEmbajada = value;
    }
  }
}
