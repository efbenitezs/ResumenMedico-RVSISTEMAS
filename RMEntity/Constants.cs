// Decompiled with JetBrains decompiler
// Type: RMEntity.Constants
// Assembly: RMEntity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F8D42C4-526A-4A7E-80CF-D7AFFD197C27
// Assembly location: C:\Users\Personal\source\RMEntity.dll

namespace RMEntity
{
  public class Constants
  {
    public const string NombreArchivoImagenPaciente = "Imagen Perfil Paciente";
    public const string NombreArchivoFirmaCanada = "FirmaConsentimientoCanada";
    public const string NombreArchivoFirmaNuevaZelanda = "FirmaConsentimientoNuevaZelanda";
    public const string NombreArchivoFirmaVih = "FirmaConsentimientoVih";
    public const string NombreArchivoFirmaVenopuncion = "FirmaConsentimientoVenopuncion";
    public const string NombreArchivoFirmaAustralia = "FirmaConsentimientoAustralia";
    public const string NombreArchivoPlantillaLabMail = "TemplateLabMail.txt";

    public enum Perfiles
    {
      SinPerfil,
      Recepcion,
      Laboratorio,
      Radiologia,
      MedicoGeneral,
    }

    public enum Parametros
    {
      NombreDoctor = 1,
      NombreLaboratorio = 2,
      NombreBacteriologo = 3,
      Ciudad = 4,
      NitLaboratorio = 5,
      DireccionLaboratorio = 6,
      TelefonoLaboratorio = 7,
      FaxLaboratorio = 8,
      UniversidadBacteriologo = 9,
      RegistroProfBact = 10, // 0x0000000A
      CorreoElectronicoBact = 11, // 0x0000000B
    }

    public enum ExamenLab
    {
      Uroanalisis = 1,
      Vih = 2,
      SerologiaVdrl = 3,
      HbsAg = 4,
      HepatitisC = 5,
      CuadroHematico = 6,
      Creatinina = 7,
      HemoglobinaGlicosilada = 8,
      Otro = 9,
      Cultivo = 10, // 0x0000000A
      Baciloscopia = 11, // 0x0000000B
    }

    public enum TipoDeclaracion
    {
      Canada = 1,
      NuevaZelanda = 2,
      Vih = 3,
      VenoPuncion = 4,
      Australia = 5,
    }

    public enum EstadosMuestraLaboratorio
    {
      Normal,
      Anormal,
      SinAplicar,
    }

    public enum TipoRevision
    {
      Laboratorio = 1,
      Radiologia = 2,
      MedicinaGeneral = 3,
    }

    public enum Embajadas
    {
      Australia = 1,
      Canada = 2,
      NuevaZelanda = 3,
      Colombia = 4,
    }

    public enum EstadoRevision
    {
      Normal,
      Anormal,
      SinAplicar,
    }
  }
}
