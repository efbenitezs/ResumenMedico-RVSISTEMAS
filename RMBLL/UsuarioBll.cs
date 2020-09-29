// Decompiled with JetBrains decompiler
// Type: RMBLL.UsuarioBll
// Assembly: RMBLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F2C48D5-ED72-4974-B910-3403631DD6A0
// Assembly location: C:\Users\Personal\source\RMBLL.dll

using RMDAL;
using RMEntity;
using System.Collections.Generic;
using System.Data;

namespace RMBLL
{
  public class UsuarioBll : BaseForm
  {
    private const string CriptoKey = "RvS1st3m4s3U";

    public static DataTable Estructure => UsuarioDao.DtEstructure;

    public DataTable GetList(
      string cuenta,
      string nombres,
      string apellidos,
      int idCargo,
      Constants.Perfiles perfilToFind,
      bool showAllPerfiles,
      bool finalizaHistoria,
      bool showAllfinalizaHistoria,
      bool administrador,
      bool showAllAdministrador,
      bool activo,
      bool showAllActivo)
    {
      UsuarioDao usuarioDao = new UsuarioDao();
      DataTable list = usuarioDao.GetList(cuenta, nombres, apellidos, idCargo, perfilToFind, showAllPerfiles, finalizaHistoria, showAllfinalizaHistoria, administrador, showAllAdministrador, activo, showAllActivo);
      this.error = usuarioDao.Error;
      return list;
    }

    public List<Usuario> GetUsuarios(
      string cuenta,
      string nombres,
      string apellidos,
      int idCargo,
      Constants.Perfiles perfilToFind,
      bool showAllPerfiles,
      bool finalizaHistoria,
      bool showAllfinalizaHistoria,
      bool administrador,
      bool showAllAdministrador,
      bool activo,
      bool showAllActivo)
    {
      UsuarioDao usuarioDao = new UsuarioDao();
      List<Usuario> usuarios = usuarioDao.GetUsuarios(cuenta, nombres, apellidos, idCargo, perfilToFind, showAllPerfiles, finalizaHistoria, showAllfinalizaHistoria, administrador, showAllAdministrador, activo, showAllActivo);
      this.error = usuarioDao.Error;
      return usuarios;
    }

    public Usuario Load(int id)
    {
      UsuarioDao usuarioDao = new UsuarioDao();
      Usuario usuario = usuarioDao.Load(id);
      this.error = usuarioDao.Error;
      return usuario;
    }

    public Usuario Load(string cuenta)
    {
      UsuarioDao usuarioDao = new UsuarioDao();
      Usuario usuario = usuarioDao.Load(cuenta);
      this.error = usuarioDao.Error;
      return usuario;
    }

    public bool Save(Usuario objEnt, bool isChangePass)
    {
      UsuarioDao usuarioDao = new UsuarioDao();
      bool flag;
      if (objEnt.Id != int.MinValue)
      {
        Usuario usuario = usuarioDao.Load(objEnt.Id);
        objEnt.Pwd = !isChangePass ? usuario.Pwd : Cript.Encriptar(objEnt.Pwd, "RvS1st3m4s3U");
        flag = usuarioDao.Update(objEnt);
      }
      else
      {
        objEnt.Pwd = Cript.Encriptar(objEnt.Pwd, "RvS1st3m4s3U");
        flag = usuarioDao.Create(objEnt);
      }
      this.error = usuarioDao.Error;
      return flag;
    }

    public bool Delete(Usuario objToProcess)
    {
      UsuarioDao usuarioDao = new UsuarioDao();
      bool flag = usuarioDao.Delete(objToProcess);
      this.error = usuarioDao.Error;
      return flag;
    }

    public bool ValidateUser(string strUsr, string strPwd)
    {
      bool flag = false;
      UsuarioDao usuarioDao = new UsuarioDao();
      Usuario usuario = usuarioDao.Load(strUsr);
      if (usuario.Id != int.MinValue && usuarioDao.Error == string.Empty)
      {
        if (Cript.Comparar(usuario.Pwd, strPwd, "RvS1st3m4s3U"))
          flag = true;
        else
          this.error = "La contraseña que ingresó no es correcta. Si olvido su contraseña contacte al administrador del sistema";
      }
      else
        this.error = usuarioDao.Error != string.Empty ? usuarioDao.Error : "El usuario con el que intenta acceder no existe en el sistema. Pongase en contacto con el administrador.";
      return flag;
    }

    public bool CambioPwd(Usuario objEnt)
    {
      bool flag = false;
      if (objEnt.Id != int.MinValue)
      {
        objEnt.Pwd = Cript.Encriptar(objEnt.Pwd, "RvS1st3m4s3U");
        UsuarioDao usuarioDao = new UsuarioDao();
        flag = usuarioDao.Update(objEnt);
        this.error = usuarioDao.Error;
      }
      else
        this.error = "Las credenciales no coinciden";
      return flag;
    }
  }
}
