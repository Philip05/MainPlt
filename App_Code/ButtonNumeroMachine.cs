using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Description résumée de ButtonNumeroMachine
/// </summary>
public partial class ButtonNumeroMachine:Button
{
    protected int idMachine;
    protected string sourceFichierPdf;
    protected int idEntretien;
    public ButtonNumeroMachine()
    {
        
    }

    public int IDMachine
    {
        get
        {
            return idMachine;
        }
        set
        {
            idMachine = value;
        }
    }
    public string SourceFichierPdf
    {
        get
        {
            return sourceFichierPdf;
        }
        set
        {
            sourceFichierPdf = value;
        }
    }

    public int IDEntretien
    {
        get
        {
            return idEntretien;
        }
        set
        {
            idEntretien = value;
        }
    }
}