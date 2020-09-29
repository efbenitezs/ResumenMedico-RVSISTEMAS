// Decompiled with JetBrains decompiler
// Type: RMBLL.Mailing
// Assembly: RMBLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F2C48D5-ED72-4974-B910-3403631DD6A0
// Assembly location: C:\Users\Personal\source\RMBLL.dll

using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace RMBLL
{
  public class Mailing : BaseForm
  {
    private string _MailServer = string.Empty;
    private int _PortServer = int.MinValue;
    private string _Subject = string.Empty;
    private string _MailBody = string.Empty;
    private Encoding _MailEncod = Encoding.UTF8;
    private MailAddress _From;
    private MailPriority _Priority;
    private MailMessage _MailToSend = new MailMessage();
    private MailAddressCollection _TO = new MailAddressCollection();
    private MailAddressCollection _CC = new MailAddressCollection();
    private MailAddressCollection _BCC = new MailAddressCollection();
    private AttachmentCollection _Attachment;
    private bool _HasAttach;
    private string _UserMailServer = string.Empty;
    private string _PassMailServer = string.Empty;

    public MailAddress TO
    {
      set => this._TO.Add(value);
    }

    public MailAddress CC
    {
      set => this._CC.Add(value);
    }

    public MailAddress BCC
    {
      set => this._BCC.Add(value);
    }

    public Mailing(
      string MailServer,
      int PortServerMail,
      string Subject,
      string MailBody,
      MailAddress From,
      MailAddress To,
      bool IsHtmlBody,
      MailPriority PriorityMessage,
      List<Attachment> AttachList,
      bool HasAttach,
      string UserMailServer,
      string PassMailServer)
    {
      this._From = From;
      this._MailServer = MailServer;
      this._PortServer = PortServerMail;
      this._Subject = Subject;
      this._MailBody = MailBody;
      this._MailToSend.IsBodyHtml = IsHtmlBody;
      this._MailToSend.Subject = Subject;
      this._MailToSend.Sender = this._From;
      this._MailToSend.From = this._From;
      this._MailToSend.Body = MailBody;
      this._Priority = PriorityMessage;
      this._HasAttach = HasAttach;
      this._TO = this._MailToSend.To;
      this._TO.Add(To);
      this._CC = this._MailToSend.CC;
      this._BCC = this._MailToSend.Bcc;
      this._Attachment = this._MailToSend.Attachments;
      this._UserMailServer = UserMailServer;
      this._PassMailServer = PassMailServer;
      if (!this._HasAttach || AttachList.Count <= 0)
        return;
      foreach (Attachment attach in AttachList)
        this._MailToSend.Attachments.Add(attach);
    }

    public bool SendMailMessage()
    {
      bool flag = false;
      try
      {
        SmtpClient smtpClient = this._PortServer <= 0 ? new SmtpClient(this._MailServer) : new SmtpClient(this._MailServer, this._PortServer);
        smtpClient.Timeout = 20000;
        smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtpClient.EnableSsl = true;
        smtpClient.UseDefaultCredentials = false;
        if (this._UserMailServer != string.Empty && this._PassMailServer != string.Empty)
          smtpClient.Credentials = (ICredentialsByHost) new NetworkCredential(this._UserMailServer, this._PassMailServer);
        smtpClient.Send(this._MailToSend);
        flag = true;
      }
      catch (Exception ex)
      {
        this.error = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
      }
      return flag;
    }
  }
}
