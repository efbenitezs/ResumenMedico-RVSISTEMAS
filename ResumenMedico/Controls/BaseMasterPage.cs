using System;
using System.Linq;
using RMEntity;

namespace ResumenMedico.Controls
{

    /// <summary>
    /// 
    /// </summary>
    public class BaseMasterPage : System.Web.UI.MasterPage
    {

        /// <summary>
        /// 
        /// </summary>
        public int IdUserCurrent
        {
            get
            {
                return Session["IdUsCr"] != null ? Convert.ToInt32(Session["IdUsCr"]) : int.MinValue;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public string NameUserCurrent
        {
            get
            {
                return Session["NamUsrCur"] != null ? Session["NamUsrCur"].ToString() : string.Empty;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public bool IsAdmin
        {
            get
            {
                return Session["isAdmin"] != null ? Convert.ToBoolean(Convert.ToByte(Session["isAdmin"])) : false;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public string PathFilesToAttach
        {
            get
            {
                return Session["pathGlobalFiles"] != null ? Session["pathGlobalFiles"].ToString() : string.Empty;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public Constants.Perfiles PerfilActual
        {
            get
            {
                return Session["idPerfCurr"] != null ? (Constants.Perfiles)Convert.ToInt32(Session["idPerfCurr"]) : Constants.Perfiles.SinPerfil;

            }
        }

        /// <summary>
        /// 
        /// </summary>
        public Constants.Embajadas EmbajadaCurr
        {
            get
            {
                return Session["idEmbCurr"] != null ? (Constants.Embajadas)Convert.ToInt32(Session["idEmbCurr"]) : Constants.Embajadas.Colombia;
            }
            set
            {
                Session["idEmbCurr"] = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public string FlagToShow
        {
            get
            {
                string flagName = "~/Resources/";
                switch (EmbajadaCurr)
                {
                    case Constants.Embajadas.Australia:
                        flagName += "australia.jpg";
                        break;
                    case Constants.Embajadas.Canada:
                        flagName += "canada.jpg";
                        break;
                    case Constants.Embajadas.NuevaZelanda:
                        flagName += "nueva_zelanda.jpg";
                        break;
                    case Constants.Embajadas.Colombia:
                    default:
                        flagName += "colombia.jpg";
                        break;
                }
                return flagName;
            }
        }

        /// <summary>
        /// indica si el usuario tiene permisos para cerrar las historias medicas
        /// </summary>
        public bool FinalizaHistora
        {
            get
            {
                return Session["FinHisMed"] != null ? Convert.ToBoolean(Session["FinHisMed"]) : false;
            }
        }
    }
}