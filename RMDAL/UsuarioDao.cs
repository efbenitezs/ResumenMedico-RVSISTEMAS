// Decompiled with JetBrains decompiler
// Type: RMDAL.UsuarioDao
// Assembly: RMDAL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: BA8C66A3-8A06-4F3F-AEA9-08BB88600DCC
// Assembly location: C:\Users\Personal\source\RMDAL.dll

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using RMEntity;

namespace RMDAL
{
	public class UsuarioDao : BaseConnection
	{
		public static DataTable DtEstructure
		{
			get
			{
				DataTable dataTable = new DataTable();
				DataColumn[] columns = new DataColumn[14]
				{
		  new DataColumn("ID", typeof (int)),
		  new DataColumn("CUENTA", typeof (string)),
		  new DataColumn("PWD", typeof (string)),
		  new DataColumn("NOMBRES", typeof (string)),
		  new DataColumn("APELLIDOS", typeof (string)),
		  new DataColumn("ID_CARGO", typeof (int)),
		  new DataColumn("ID_PERFIL", typeof (int)),
		  new DataColumn("FINALIZA_HISTORIA", typeof (bool)),
		  new DataColumn("ADMINISTRADOR", typeof (bool)),
		  new DataColumn("ACTIVO", typeof (bool)),
		  new DataColumn("ID_CREACION", typeof (int)),
		  new DataColumn("FECHA_CREACION", typeof (DateTime)),
		  new DataColumn("ID_ULTIMA_MODIFICACION", typeof (int)),
		  new DataColumn("FECHA_ULTIMA_MODIFICACION", typeof (DateTime))
				};
				dataTable.Columns.AddRange(columns);
				return dataTable;
			}
		}

		public UsuarioDao() => this.ObtainInstance();

		public DataTable GetList(
		  string cuenta,
		  string nombres,
		  string apellidos,
		  int idCargo,
		  Constants.Perfiles perfilToFind,
		  bool showAllPerfiles,
		  bool finalizaHistoria,
		  bool showAllFinalizaHistoria,
		  bool isAdministrador,
		  bool showAllAdministrador,
		  bool activo,
		  bool showAllActivo)
		{
			DataTable dtEstructure = UsuarioDao.DtEstructure;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_USUARIO_GET_LIST");
					storedProcCommand.Connection = connection;
					if (cuenta != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@CUENTA", DbType.String, (object)cuenta);
					else
						this.instance.AddInParameter(storedProcCommand, "@CUENTA", DbType.String, (object)DBNull.Value);
					if (nombres != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@NOMBRES", DbType.String, (object)nombres);
					else
						this.instance.AddInParameter(storedProcCommand, "@NOMBRES", DbType.String, (object)DBNull.Value);
					if (apellidos != string.Empty)
						this.instance.AddInParameter(storedProcCommand, "@APELLIDOS", DbType.String, (object)apellidos);
					else
						this.instance.AddInParameter(storedProcCommand, "@APELLIDOS", DbType.String, (object)DBNull.Value);
					if (idCargo != int.MinValue)
						this.instance.AddInParameter(storedProcCommand, "@ID_CARGO", DbType.Int32, (object)idCargo);
					else
						this.instance.AddInParameter(storedProcCommand, "@ID_CARGO", DbType.Int32, (object)DBNull.Value);
					if (!showAllPerfiles)
						this.instance.AddInParameter(storedProcCommand, "@ID_PERFIL", DbType.Int32, (object)Convert.ToInt32((object)perfilToFind));
					else
						this.instance.AddInParameter(storedProcCommand, "@ID_PERFIL", DbType.Int32, (object)DBNull.Value);
					if (!showAllFinalizaHistoria)
						this.instance.AddInParameter(storedProcCommand, "@FINALIZA_HISTORIA", DbType.Boolean, (object)finalizaHistoria);
					else
						this.instance.AddInParameter(storedProcCommand, "@FINALIZA_HISTORIA", DbType.Boolean, (object)DBNull.Value);
					if (!showAllAdministrador)
						this.instance.AddInParameter(storedProcCommand, "@ADMINISTRADOR", DbType.Boolean, (object)isAdministrador);
					else
						this.instance.AddInParameter(storedProcCommand, "@ADMINISTRADOR", DbType.Boolean, (object)DBNull.Value);
					if (!showAllActivo)
						this.instance.AddInParameter(storedProcCommand, "@ACTIVO", DbType.Boolean, (object)activo);
					else
						this.instance.AddInParameter(storedProcCommand, "@ACTIVO", DbType.Boolean, (object)DBNull.Value);
					DbDataAdapter dataAdapter = this.instance.GetDataAdapter();
					dataAdapter.SelectCommand = storedProcCommand;
					dataAdapter.Fill(dtEstructure);
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
				}
				finally
				{
					connection.Close();
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return dtEstructure;
		}

		public List<Usuario> GetUsuarios(
		  string cuenta,
		  string nombres,
		  string apellidos,
		  int idCargo,
		  Constants.Perfiles perfilToFind,
		  bool showAllPerfiles,
		  bool finalizaHistoria,
		  bool showAllFinalizaHistoria,
		  bool isAdministrador,
		  bool showAllAdministrador,
		  bool activo,
		  bool showAllActivo)
		{
			List<Usuario> usuarioList = new List<Usuario>();
			try
			{
				foreach (DataRow row in (InternalDataCollectionBase)this.GetList(cuenta, nombres, apellidos, idCargo, perfilToFind, showAllPerfiles, finalizaHistoria, showAllFinalizaHistoria, isAdministrador, showAllAdministrador, activo, showAllActivo).Rows)
				{
					Usuario objToLoad = new Usuario();
					this.LoadFromDataRow(ref objToLoad, row);
					usuarioList.Add(objToLoad);
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return usuarioList;
		}

		public Usuario Load(int id) => this.GetByPK(id);

		public Usuario Load(string cuenta) => this.GetByLogin(cuenta);

		public bool Create(Usuario objToProcess)
		{
			bool flag = false;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_USUARIO_CREATE");
					storedProcCommand.Connection = connection;
					this.instance.AddOutParameter(storedProcCommand, "@ID", DbType.Int32, 4);
					this.instance.AddInParameter(storedProcCommand, "@CUENTA", DbType.String, (object)objToProcess.Cuenta);
					this.instance.AddInParameter(storedProcCommand, "@PWD", DbType.String, (object)objToProcess.Pwd);
					this.instance.AddInParameter(storedProcCommand, "@NOMBRES", DbType.String, (object)objToProcess.Nombres);
					this.instance.AddInParameter(storedProcCommand, "@APELLIDOS", DbType.String, (object)objToProcess.Apellidos);
					this.instance.AddInParameter(storedProcCommand, "@ID_CARGO", DbType.Int32, (object)objToProcess.IdCargo);
					this.instance.AddInParameter(storedProcCommand, "@ID_PERFIL", DbType.Int32, (object)Convert.ToInt32((object)objToProcess.Perfil));
					this.instance.AddInParameter(storedProcCommand, "@FINALIZA_HISTORIA", DbType.Boolean, (object)objToProcess.FinalizaHistoria);
					this.instance.AddInParameter(storedProcCommand, "@ADMINISTRADOR", DbType.Boolean, (object)objToProcess.Administrador);
					this.instance.AddInParameter(storedProcCommand, "@ACTIVO", DbType.Boolean, (object)objToProcess.Activo);
					this.instance.AddInParameter(storedProcCommand, "@ID_CREACION", DbType.Int32, (object)objToProcess.IdCreacion);
					this.instance.ExecuteNonQuery(storedProcCommand);
					objToProcess.Id = Convert.ToInt32(storedProcCommand.Parameters["@ID"].Value);
					if (Convert.ToInt32(objToProcess.Perfil) == 2)
					{
						DbCommand cmdInsertFirma = this.instance.GetStoredProcCommand("PA_FIRMA_USUARIO_UPDATE");
						cmdInsertFirma.Connection = connection;
						this.instance.AddInParameter(cmdInsertFirma, "@ID_USUARIO", DbType.Int32, objToProcess.Id);
						this.instance.AddInParameter(cmdInsertFirma, "@UNIVERSIDAD", DbType.String, objToProcess.FirmaProfesional.Universidad);
						this.instance.AddInParameter(cmdInsertFirma, "@REGISTROMEDICO", DbType.String, objToProcess.FirmaProfesional.RegistroProfesional);
						this.instance.AddInParameter(cmdInsertFirma, "@FIRMA", DbType.String, objToProcess.FirmaProfesional.FirmaBase64);
						this.instance.ExecuteNonQuery(cmdInsertFirma);
					}
					flag = true;
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
				}
				finally
				{
					connection.Close();
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return flag;
		}

		public bool Update(Usuario objToProcess)
		{
			bool flag = false;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_USUARIO_UPDATE");
					storedProcCommand.Connection = connection;
					this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object)objToProcess.Id);
					this.instance.AddInParameter(storedProcCommand, "@CUENTA", DbType.String, (object)objToProcess.Cuenta);
					this.instance.AddInParameter(storedProcCommand, "@PWD", DbType.String, (object)objToProcess.Pwd);
					this.instance.AddInParameter(storedProcCommand, "@NOMBRES", DbType.String, (object)objToProcess.Nombres);
					this.instance.AddInParameter(storedProcCommand, "@APELLIDOS", DbType.String, (object)objToProcess.Apellidos);
					this.instance.AddInParameter(storedProcCommand, "@ID_CARGO", DbType.Int32, (object)objToProcess.IdCargo);
					this.instance.AddInParameter(storedProcCommand, "@ID_PERFIL", DbType.Int32, (object)Convert.ToInt32((object)objToProcess.Perfil));
					this.instance.AddInParameter(storedProcCommand, "@FINALIZA_HISTORIA", DbType.Boolean, (object)objToProcess.FinalizaHistoria);
					this.instance.AddInParameter(storedProcCommand, "@ADMINISTRADOR", DbType.Boolean, (object)objToProcess.Administrador);
					this.instance.AddInParameter(storedProcCommand, "@ACTIVO", DbType.Boolean, (object)objToProcess.Activo);
					this.instance.AddInParameter(storedProcCommand, "@ID_ULTIMA_MODIFICACION", DbType.Int32, (object)objToProcess.IdUltimaModificacion);
					this.instance.ExecuteNonQuery(storedProcCommand);
					if (Convert.ToInt32(objToProcess.Perfil) == 2)
					{
						DbCommand cmdInsertFirma = this.instance.GetStoredProcCommand("PA_FIRMA_USUARIO_UPDATE");
						cmdInsertFirma.Connection = connection;
						this.instance.AddInParameter(cmdInsertFirma, "@ID_USUARIO", DbType.Int32, objToProcess.Id);
						this.instance.AddInParameter(cmdInsertFirma, "@UNIVERSIDAD", DbType.String, objToProcess.FirmaProfesional.Universidad);
						this.instance.AddInParameter(cmdInsertFirma, "@REGISTROMEDICO", DbType.String, objToProcess.FirmaProfesional.RegistroProfesional);
						this.instance.AddInParameter(cmdInsertFirma, "@FIRMA", DbType.String, objToProcess.FirmaProfesional.FirmaBase64);
						this.instance.ExecuteNonQuery(cmdInsertFirma);
					}
					flag = true;
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
				}
				finally
				{
					connection.Close();
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return flag;
		}

		public bool Delete(Usuario objToProcess)
		{
			bool flag = false;
			try
			{
				DbConnection connection = this.instance.CreateConnection();
				try
				{
					connection.Open();
					DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_USUARIO_DELETE");
					storedProcCommand.Connection = connection;
					this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object)objToProcess.Id);
					this.instance.AddInParameter(storedProcCommand, "@ID_USUARIO", DbType.Int32, (object)objToProcess.IdUltimaModificacion);
					this.instance.ExecuteNonQuery(storedProcCommand);
					flag = true;
				}
				catch (Exception ex)
				{
					this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
				}
				finally
				{
					connection.Close();
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			return flag;
		}

		private Usuario GetByLogin(string cuenta)
		{
			DbConnection connection = this.instance.CreateConnection();
			Usuario objToLoad = new Usuario();
			try
			{
				connection.Open();
				DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_GET_USUARIO_BY_LOGIN");
				storedProcCommand.Connection = connection;
				this.instance.AddInParameter(storedProcCommand, "@CUENTA", DbType.String, (object)cuenta);
				DbDataAdapter dataAdapter = this.instance.GetDataAdapter();
				DataTable dataTable = new DataTable();
				dataAdapter.SelectCommand = storedProcCommand;
				dataAdapter.Fill(dataTable);
				if (dataTable.Rows.Count > 0)
					this.LoadFromDataRow(ref objToLoad, dataTable.Rows[0]);

				if (objToLoad.Perfil == Constants.Perfiles.Laboratorio)
				{
					objToLoad.FirmaProfesional = new FirmaProfesional();
					DbCommand cmdLoadfirma = this.instance.GetStoredProcCommand("PA_FIRMA_USUARIO_GET");
					cmdLoadfirma.Connection = connection;
					this.instance.AddInParameter(cmdLoadfirma, "@ID_USUARIO", DbType.String, objToLoad.Id);
					DbDataReader reader = cmdLoadfirma.ExecuteReader();
					while (reader.Read())
					{
						objToLoad.FirmaProfesional = new FirmaProfesional()
						{
							Id_Usuario = Convert.ToInt32(reader["ID_USUARIO"]),
							RegistroProfesional = reader["REGISTRO_MEDICO"].ToString(),
							Universidad = reader["UNIVERSIDAD"].ToString(),
							FirmaBase64 = reader["FIRMA"].ToString(),
							CorreoElectronico = reader["CORREO_ELECTRONICO"].ToString()
						};
					}
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			finally
			{
				connection.Close();
			}
			return objToLoad;
		}

		private Usuario GetByPK(int id)
		{
			DbConnection connection = this.instance.CreateConnection();
			Usuario objToLoad = new Usuario();
			try
			{
				connection.Open();
				DbCommand storedProcCommand = this.instance.GetStoredProcCommand("PA_GET_USUARIO_BY_PK");
				storedProcCommand.Connection = connection;
				this.instance.AddInParameter(storedProcCommand, "@ID", DbType.Int32, (object)id);
				DbDataAdapter dataAdapter = this.instance.GetDataAdapter();
				DataTable dataTable = new DataTable();
				dataAdapter.SelectCommand = storedProcCommand;
				dataAdapter.Fill(dataTable);
				if (dataTable.Rows.Count > 0)
					this.LoadFromDataRow(ref objToLoad, dataTable.Rows[0]);
				if (objToLoad.Perfil == Constants.Perfiles.Laboratorio)
				{
					objToLoad.FirmaProfesional = new FirmaProfesional();
					DbCommand cmdLoadfirma = this.instance.GetStoredProcCommand("PA_FIRMA_USUARIO_GET");
					cmdLoadfirma.Connection = connection;
					this.instance.AddInParameter(cmdLoadfirma, "@ID_USUARIO", DbType.String, objToLoad.Id);
					DbDataReader reader = cmdLoadfirma.ExecuteReader();
					while (reader.Read())
					{
						objToLoad.FirmaProfesional = new FirmaProfesional()
						{
							Id_Usuario = Convert.ToInt32(reader["ID_USUARIO"]),
							RegistroProfesional = reader["REGISTRO_MEDICO"].ToString(),
							Universidad = reader["UNIVERSIDAD"].ToString(),
							FirmaBase64 = reader["FIRMA"].ToString(),
							CorreoElectronico = reader["CORREO_ELECTRONICO"].ToString()
						};
					}
				}
			}
			catch (Exception ex)
			{
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
			finally
			{
				connection.Close();
			}
			return objToLoad;
		}

		private void LoadFromDataRow(ref Usuario objToLoad, DataRow drData)
		{
			try
			{
				objToLoad.Id = Convert.ToInt32(drData["ID"]);
				objToLoad.Cuenta = drData["CUENTA"].ToString();
				objToLoad.Pwd = drData["PWD"].ToString();
				objToLoad.Nombres = drData["NOMBRES"].ToString();
				objToLoad.Apellidos = drData["APELLIDOS"].ToString();
				objToLoad.IdCargo = Convert.ToInt32(drData["ID_CARGO"]);
				objToLoad.Perfil = (Constants.Perfiles)Convert.ToInt32(drData["ID_PERFIL"]);
				objToLoad.FinalizaHistoria = Convert.ToBoolean(drData["FINALIZA_HISTORIA"]);
				objToLoad.Administrador = Convert.ToBoolean(drData["ADMINISTRADOR"]);
				objToLoad.Activo = Convert.ToBoolean(drData["ACTIVO"]);
				objToLoad.IdCreacion = Convert.ToInt32(drData["ID_CREACION"]);
				objToLoad.FechaCreacion = Convert.ToDateTime(drData["FECHA_CREACION"]);
				objToLoad.IdUltimaModificacion = Convert.ToInt32(drData["ID_ULTIMA_MODIFICACION"]);
				objToLoad.FechaUltimaModificacion = Convert.ToDateTime(drData["FECHA_ULTIMA_MODIFICACION"]);
			}
			catch (Exception ex)
			{
				objToLoad = new Usuario();
				this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
			}
		}
	}
}