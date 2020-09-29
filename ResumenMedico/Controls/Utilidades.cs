using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Telerik.Web.UI;

namespace ResumenMedico.Controls
{
    public class Utilidades
    {

        /// <summary>
        /// 
        /// </summary>
        /// <param name="rcObject"></param>
        /// <param name="sourceObject"></param>
        /// <param name="idColumn"></param>
        /// <param name="textColumn"></param>
        /// <param name="insertEmptyValue"></param>
        public static void LlenarRC(RadComboBox rcObject, DataTable sourceObject, string idColumn, string textColumn, bool insertEmptyValue)
        {
            rcObject.Items.Clear();
            rcObject.DataSource = sourceObject;
            rcObject.DataValueField = idColumn;
            rcObject.DataTextField = textColumn;
            rcObject.DataBind();
            if (insertEmptyValue)
            {
                rcObject.Items.Insert(0, new RadComboBoxItem("[Seleccione]", string.Empty));
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="rcObject"></param>
        /// <param name="insertEmptyValue"></param>
        public static void LlenarRcMes(RadComboBox rcObject, bool insertEmptyValue)
        {
            rcObject.Items.Clear();
            rcObject.Items.Add(new RadComboBoxItem("Enero", "01"));
            rcObject.Items.Add(new RadComboBoxItem("Febrero", "02"));
            rcObject.Items.Add(new RadComboBoxItem("Marzo", "03"));
            rcObject.Items.Add(new RadComboBoxItem("Abril", "04"));
            rcObject.Items.Add(new RadComboBoxItem("Mayo", "05"));
            rcObject.Items.Add(new RadComboBoxItem("Junio", "06"));
            rcObject.Items.Add(new RadComboBoxItem("Julio", "07"));
            rcObject.Items.Add(new RadComboBoxItem("Agosto", "08"));
            rcObject.Items.Add(new RadComboBoxItem("Septiembre", "09"));
            rcObject.Items.Add(new RadComboBoxItem("Octubre", "10"));
            rcObject.Items.Add(new RadComboBoxItem("Noviembre", "11"));
            rcObject.Items.Add(new RadComboBoxItem("Diciembre", "12"));
            rcObject.DataBind();
            if (insertEmptyValue)
            {
                rcObject.Items.Insert(0, new RadComboBoxItem("[Seleccione]", string.Empty));
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="rcObject"></param>
        /// <param name="insertEmptyValue"></param>
        /// <param name="dias"></param>
        public static void LlenarRcDiasParaElMes(RadComboBox rcObject, bool insertEmptyValue, int dias)
        {
            rcObject.Items.Clear();
            for (int i = 1; i <= dias; i++)
            {
                rcObject.Items.Add(new RadComboBoxItem(i.ToString(), i.ToString()));
            }

            rcObject.DataBind();
            if (insertEmptyValue)
            {
                rcObject.Items.Insert(0, new RadComboBoxItem("[Seleccione]", string.Empty));
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="rcObject"></param>
        /// <param name="yearsToShow"></param>
        /// <param name="insertEmptyValue"></param>
        /// <param name="isAscendant"></param>
        public static void LlenarRcAnio(RadComboBox rcObject, int yearsToShow, bool insertEmptyValue, bool isAscendant)
        {
            rcObject.Items.Clear();
            int yearCurrent = DateTime.Now.Year;

            for (int i = 0; i <= yearsToShow; i++)
            {
                rcObject.Items.Add(new RadComboBoxItem((isAscendant ? (yearCurrent + i).ToString() : (yearCurrent - i).ToString()), (isAscendant ? (yearCurrent + i).ToString() : (yearCurrent - i).ToString())));
            }
            if (insertEmptyValue)
            {
                rcObject.Items.Insert(0, new RadComboBoxItem("[Seleccione]", string.Empty));
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="rcObject"></param>
        public static void LlenarRCEnBlanco(RadComboBox rcObject)
        {
            rcObject.Items.Clear();
            rcObject.Items.Add(new RadComboBoxItem("[Seleccione]", string.Empty));
            rcObject.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="rcObject"></param>
        /// <param name="valorABuscar"></param>
        public static void PosicionarRC(RadComboBox rcObject, string valorABuscar)
        {
            if (rcObject.Items.Count > 0)
            {
                for (int i = 0; i < rcObject.Items.Count; i++)
                {
                    rcObject.Items[i].Selected = false;
                }
                int indexRcObject = 0;
                foreach (RadComboBoxItem item in rcObject.Items)
                {
                    if (item.Value == valorABuscar)
                    {
                        rcObject.Items[indexRcObject].Selected = true;
                        break;
                    }
                    indexRcObject++;
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="rlbObject"></param>
        /// <param name="objSource"></param>
        /// <param name="valueColumn"></param>
        /// <param name="textColumn"></param>
        internal static void LlenarLB(RadListBox rlbObject, DataTable objSource, string valueColumn, string textColumn)
        {
            rlbObject.Items.Clear();
            rlbObject.DataSource = objSource;
            rlbObject.DataValueField = valueColumn;
            rlbObject.DataTextField = textColumn;
            rlbObject.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="mes"></param>
        /// <returns></returns>
        internal static string GetTextoMes(int mes)
        {
            string mesDesc = string.Empty;
            switch (mes)
            {
                case 1:
                    mesDesc = "Enero";
                    break;
                case 2:
                    mesDesc = "Febrero";
                    break;
                case 3:
                    mesDesc = "Marzo";
                    break;
                case 4:
                    mesDesc = "Abril";
                    break;
                case 5:
                    mesDesc = "Mayo";
                    break;
                case 6:
                    mesDesc = "Junio";
                    break;
                case 7:
                    mesDesc = "Julio";
                    break;
                case 8:
                    mesDesc = "Agosto";
                    break;
                case 9:
                    mesDesc = "Septiembre";
                    break;
                case 10:
                    mesDesc = "Octubre";
                    break;
                case 11:
                    mesDesc = "Noviembre";
                    break;
                case 12:
                    mesDesc = "Diciembre";
                    break;

            }
            return mesDesc;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="texto"></param>
        /// <returns></returns>
        internal static string AjustarMensajeError(string texto)
        {
            return texto.Replace("\n", " ").Replace("\t", " ").Replace("\"", " ").Replace("'", " ").Replace("\r", " ");
        }

        public static string HtmlDecode(string str)
        {

            string retorno = str.Replace("&quot;", "\"");
            retorno = retorno.Replace("&#39;", "\'");
            retorno = retorno.Replace("&lt;", "<");
            retorno = retorno.Replace("&gt;", ">");
            retorno = retorno.Replace("&amp;", "&");

            return retorno;

        }

    }
}