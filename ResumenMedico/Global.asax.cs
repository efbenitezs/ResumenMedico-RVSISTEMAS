using System;
using System.Configuration;
using System.Globalization;
using System.Reflection;

namespace ResumenMedico
{
	public class Global : System.Web.HttpApplication
	{
		private static string _Version;
		private static string _LastTimeModified;

		public static string GetCurrentVersion()
		{
			return "Version Actual: " + _Version + "<br/>" + _LastTimeModified;
		}

		private void Application_Start(object sender, EventArgs e)
		{
			//Versionado
			Assembly myAssembly = typeof(Global).Assembly;//   Assembly.GetExecutingAssembly();
			AssemblyName myAssemblyName = myAssembly.GetName();
			System.IO.FileInfo fileInfo = new System.IO.FileInfo(myAssembly.Location);
			DateTime lastModified = fileInfo.LastWriteTime;

			_Version = myAssemblyName.Version.Major.ToString() + "." + myAssemblyName.Version.Minor.ToString();
			_LastTimeModified = fileInfo.LastWriteTime.ToString("dd-MM-yyyy", CultureInfo.CurrentUICulture);
		}

		private void Application_End(object sender, EventArgs e)
		{
			//  Code that runs on application shutdown
		}

		private void Application_Error(object sender, EventArgs e)
		{
			// Code that runs when an unhandled error occurs
		}

		private void Session_Start(object sender, EventArgs e)
		{
			// Code that runs when a new session is started

			Session.Add("IdUsCr", int.MinValue);
			Session.Add("NamUsrCur", string.Empty);
			string path = ConfigurationManager.AppSettings["pathFiles"].ToString();
			Session.Add("pathGlobalFiles", path);
			Session.Add("idPerfCurr", null);
			Session.Add("idEmbCurr", RMEntity.Constants.Embajadas.Colombia);
			Session.Add("FinHisMed", false);
			Session.Add("isAdmin", false);
			Session.Add("txtPdf", string.Empty);
			Session.Add("ShowMenu", false);
			Session.Add("ShowConsultorio", false);
		}

		private void Session_End(object sender, EventArgs e)
		{
			// Code that runs when a session ends.
			// Note: The Session_End event is raised only when the sessionstate mode
			// is set to InProc in the Web.config file. If session mode is set to StateServer
			// or SQLServer, the event is not raised.
		}
	}
}