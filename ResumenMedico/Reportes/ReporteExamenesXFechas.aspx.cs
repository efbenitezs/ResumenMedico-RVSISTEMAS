using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReportLibrary;
using ResumenMedico.Controls;
using RMBLL;
using Telerik.Reporting;

namespace ResumenMedico.Reportes
{
	public partial class ReporteExamenesXFechas : BasePage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (this.IdUserCurrent != int.MinValue)
			{
				if (!Page.IsPostBack)
				{
					DateTime fechaIni = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
					DateTime fechaFin = fechaIni.AddMonths(1).AddDays(-1);

					FechaInicial.SelectedDate = fechaIni;
					FechaFinal.SelectedDate = fechaFin;

					DesplegarReporte(fechaIni, fechaFin);
				}
				LinkButton lnkSalir = (LinkButton)this.Master.Master.FindControl("lnkCerrarSesion");
				lnkSalir.Click += new EventHandler(lnkSalir_Click);
			}
			else
			{
				Response.Redirect(ResolveUrl("~/Login.aspx"));
			}
		}

		private void lnkSalir_Click(object sender, EventArgs e)
		{
			Response.Redirect(ResolveUrl("~/Login.aspx"), true);
		}

		protected void btnConsultar_Click(object sender, EventArgs e)
		{
			DateTime fechaIni = (DateTime)FechaInicial.SelectedDate;
			DateTime fechaFin = (DateTime)FechaFinal.SelectedDate;

			DesplegarReporte(fechaIni, fechaFin);
		}

		protected void DesplegarReporte(DateTime fecha1, DateTime fecha2)
		{
			ReporteExameneFechas reporte = new ReporteExameneFechas();
			reporte.ReportParameters[0].Value = fecha1;
			reporte.ReportParameters[1].Value = fecha2;

			Telerik.Reporting.ObjectDataSource ds = new Telerik.Reporting.ObjectDataSource();

			MuestraLaboratorioBll muestras = new MuestraLaboratorioBll();

			ds.DataSource = muestras.GetReportDates(fecha1, fecha2);

			reporte.DataSource = ds;

			InstanceReportSource fuente = new InstanceReportSource();

			fuente.ReportDocument = reporte;

			examenesXFechasXTipo.ReportSource = fuente;
		}
	}
}