// Decompiled with JetBrains decompiler
// Type: RMEntity.BaseEntity
// Assembly: RMEntity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F8D42C4-526A-4A7E-80CF-D7AFFD197C27
// Assembly location: C:\Users\Personal\source\RMEntity.dll

using System;

namespace RMEntity
{
  public abstract class BaseEntity
  {
    private int id = int.MinValue;
    private int idCreacion = int.MinValue;
    private DateTime fechaCreacion = DateTime.MinValue;
    private int idUltimaModificacion = int.MinValue;
    private DateTime fechaUltimaModificacion = DateTime.MinValue;

    public int Id
    {
      get => this.id;
      set => this.id = value;
    }

    public int IdCreacion
    {
      get => this.idCreacion;
      set => this.idCreacion = value;
    }

    public DateTime FechaCreacion
    {
      get => this.fechaCreacion;
      set => this.fechaCreacion = value;
    }

    public int IdUltimaModificacion
    {
      get => this.idUltimaModificacion;
      set => this.idUltimaModificacion = value;
    }

    public DateTime FechaUltimaModificacion
    {
      get => this.fechaUltimaModificacion;
      set => this.fechaUltimaModificacion = value;
    }
  }
}
