﻿using System;
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
    protected string numeroMachine;
    protected string sourceFichierPdf;
    public ButtonNumeroMachine()
    {
        
    }

    public string NumeroMachine
    {
        get
        {
            return numeroMachine;
        }
        set
        {
            numeroMachine = value;
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
}