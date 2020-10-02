// Decompiled with JetBrains decompiler
// Type: RMBLL.Cript
// Assembly: RMBLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 1F2C48D5-ED72-4974-B910-3403631DD6A0
// Assembly location: C:\Users\Personal\source\RMBLL.dll

using System;
using System.Security.Cryptography;
using System.Text;

namespace RMBLL
{
	internal class Cript
	{
		private static byte[] Encriptar(string strEncriptar, byte[] bytPK)
		{
			Rijndael rijndael = Rijndael.Create();
			byte[] numArray1 = (byte[])null;
			try
			{
				rijndael.Key = bytPK;
				rijndael.GenerateIV();
				byte[] bytes = Encoding.UTF8.GetBytes(strEncriptar);
				byte[] numArray2 = rijndael.CreateEncryptor().TransformFinalBlock(bytes, 0, bytes.Length);
				numArray1 = new byte[rijndael.IV.Length + numArray2.Length];
				rijndael.IV.CopyTo((Array)numArray1, 0);
				numArray2.CopyTo((Array)numArray1, rijndael.IV.Length);
			}
			catch
			{
			}
			finally
			{
				rijndael.Clear();
			}
			return numArray1;
		}

		private static string Desencriptar(byte[] bytDesEncriptar, byte[] bytPK)
		{
			Rijndael rijndael = Rijndael.Create();
			byte[] numArray = new byte[rijndael.IV.Length];
			byte[] inputBuffer = new byte[bytDesEncriptar.Length - rijndael.IV.Length];
			string empty = string.Empty;
			try
			{
				rijndael.Key = bytPK;
				Array.Copy((Array)bytDesEncriptar, (Array)numArray, numArray.Length);
				Array.Copy((Array)bytDesEncriptar, numArray.Length, (Array)inputBuffer, 0, inputBuffer.Length);
				rijndael.IV = numArray;
				empty = Encoding.UTF8.GetString(rijndael.CreateDecryptor().TransformFinalBlock(inputBuffer, 0, inputBuffer.Length));
			}
			catch
			{
			}
			finally
			{
				rijndael.Clear();
			}
			return empty;
		}

		public static string Encriptar(string strEncriptar, string strPK) => Convert.ToBase64String(Cript.Encriptar(strEncriptar, new PasswordDeriveBytes(strPK, (byte[])null).GetBytes(32)));

		public static string Desencriptar(string strToDesEncriptar, string strPK) => Cript.Desencriptar(Convert.FromBase64String(strToDesEncriptar), new PasswordDeriveBytes(strPK, (byte[])null).GetBytes(32));

		public static bool Comparar(string strEncriptado, string strA_Comparar, string strClave) => Cript.Desencriptar(strEncriptado, strClave).Equals(strA_Comparar);

		internal static bool ValidateString(string strOrg, string strNew) => throw new NotImplementedException();
	}
}