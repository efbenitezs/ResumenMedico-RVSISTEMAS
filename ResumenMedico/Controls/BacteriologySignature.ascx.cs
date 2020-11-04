using System;
using System.Web.UI;

namespace ResumenMedico.Controls
{
	public partial class BacteriologySignature : UserControl
	{

		public string NombreBacteriologo
		{
			get => _NombreBacteriologo.Value;
			set => _NombreBacteriologo.Value = value;
		}
		public string Universidad
		{
			get => _Universidad.Value;
			set => _Universidad.Value = value;
		}
		public string FirmaBase64
		{
			get => _FirmaBase64.Value;
			set => _FirmaBase64.Value = value;
		}
		public string CorreoElectBacteriologo
		{
			get => _CorreoElectBacteriologo.Value;
			set => _CorreoElectBacteriologo.Value = value;
		}
		public string RegistroProfesional
		{
			get => _RegistroProfesional.Value;
			set => _RegistroProfesional.Value = value;
		}

		protected void Page_Load(object sender, EventArgs e)
		{

		}
	}
}