﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Description résumée de Cmds
/// </summary>
public class Cmds
{
    public static CommandeEntretien commandeEntretien;
    public static CommandeProduit commandeProduit;
    public enum CommandeEntretien
    {
        selectionnerTousLesEntretiens,
        selectionnerLesEntretiensMachine
    }

    public enum CommandeProduit
    {
        selectionnerTousLesProduits,
        selectionnerLesProduitsEntretien,
        selectionnerLesProduitsMachine
    }
    /// <summary>
    /// Numéro de la machine relié au bouton cliqué dans la liste des notifications dans la page Accueil.aspx.
    /// </summary>
    public static string numeroMachineBoutonCliqueAccueil;

    /// <summary>
    /// Enregistre le nom de l'administrateur connecte;
    /// </summary>
    public static string nomUsagerConnecte;

    /// <summary>
    /// Enregistre le prenom de l'administrateur connecte;
    /// </summary>
    public static string prenomUsagerConnecte;

    /// <summary>
    /// Enregistre le numéro de la machine sélectionnée dans le gridView de la page ListeDesMachines.aspx.
    /// </summary>
    public static string numeroMachineSelectionne;

    /// <summary>
    /// Enregistre le ID de la machine sélectionnée dans le gridView de la page ListeDesMachines.aspx.
    /// </summary>
    public static int idMachineSelectionne;

    /// <summary>
    /// Enregistre si un utilisateur est connecté.
    /// </summary>
    public static bool usagerConnecte;

    /// <summary>
    /// Initialise les valeurs statiques.
    /// </summary>
    public static void InitialiserLesValeurs()
    {
        nomUsagerConnecte = null;
        prenomUsagerConnecte = null;
        usagerConnecte = false;
    }


    public static void Deconnexion()
    {
        nomUsagerConnecte = null;
        prenomUsagerConnecte = null;
        usagerConnecte = false;
    }

    public static void InitialiserBoutonDeconnexion()
    {

    }

    public Cmds()
    {

    }
}