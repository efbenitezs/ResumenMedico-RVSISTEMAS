// Decompiled with JetBrains decompiler
// Type: RMEntity.BaseEntityAdmin
// Assembly: RMEntity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F8D42C4-526A-4A7E-80CF-D7AFFD197C27
// Assembly location: C:\Users\Personal\source\RMEntity.dll

namespace RMEntity
{
  public abstract class BaseEntityAdmin : BaseEntity
  {
    private bool activo;

    public bool Activo
    {
      get => this.activo;
      set => this.activo = value;
    }
  }
}
