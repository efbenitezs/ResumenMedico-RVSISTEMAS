using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReportLibrary;
using Telerik.Reporting;
using RMBLL;
using ResumenMedico.Controls;

namespace ResumenMedico.Reportes
{
    public partial class ReporteExamenes : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IdUserCurrent != int.MinValue)
            {
                DateTime fechaIni = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                DateTime fechaFin = fechaIni.AddMonths(1).AddDays(-1);

                DesplegarReporte(fechaIni, fechaFin);
            }
            else
            {
                Response.Redirect(ResolveUrl("~/Login.aspx"));
            }
            LinkButton lnkSalir = (LinkButton)this.Master.Master.FindControl("lnkCerrarSesion");
            lnkSalir.Click += new EventHandler(lnkSalir_Click);

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

            Telerik.Reporting.ObjectDataSource ds = new Telerik.Reporting.ObjectDataSource();

            MuestraLaboratorioBll muestras = new MuestraLaboratorioBll();

            ds.DataSource = muestras.GetReportMonth(fecha1, fecha2);

            reporte.DataSource = ds;

            InstanceReportSource fuente = new InstanceReportSource();

            fuente.ReportDocument = reporte;

            examenesXFechas.ReportSource = fuente;
        }
    
    }

}