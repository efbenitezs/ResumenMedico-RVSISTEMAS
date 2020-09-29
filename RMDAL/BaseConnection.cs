// Decompiled with JetBrains decompiler
// Type: RMDAL.BaseConnection
// Assembly: RMDAL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: BA8C66A3-8A06-4F3F-AEA9-08BB88600DCC
// Assembly location: C:\Users\Personal\source\RMDAL.dll

using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;

namespace RMDAL
{
  public abstract class BaseConnection
  {
    protected Database instance;
    protected string error = string.Empty;

    public string Error => this.error;

    protected Database ObtainInstance()
    {
      this.instance = DatabaseFactory.CreateDatabase("rmConn");
      return this.instance;
    }

    protected static Database ObtainInstanceStatic() => DatabaseFactory.CreateDatabase("rmConn");

    public static DbTransaction GetTransaction()
    {
      DbConnection connection = DatabaseFactory.CreateDatabase("rmConn").CreateConnection();
      connection.Open();
      return connection.BeginTransaction();
    }
  }
}
