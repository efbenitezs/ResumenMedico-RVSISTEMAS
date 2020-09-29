// Decompiled with JetBrains decompiler
// Type: RMEntity.Cargo
// Assembly: RMEntity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F8D42C4-526A-4A7E-80CF-D7AFFD197C27
// Assembly location: C:\Users\Personal\source\RMEntity.dll

namespace RMEntity
{
  public class Cargo : BaseEntityAdmin
  {
    private string nombreCargo = string.Empty;

    public string NombreCargo
    {
      get => this.nombreCargo;
      set => this.nombreCargo = value;
    }
  }
}
