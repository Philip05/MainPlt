﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
    public static CategorieListeProduit categorieListeProduits;
    public enum CommandeEntretien
    {
        selectionnerTousLesEntretiens,
        selectionnerLesEntretiensMachine
    }

    public static int quantiteProduitEntretien;

    public static bool remarqueSansEntretien;

    public enum CommandeProduit
    {
        selectionnerTousLesProduits,
        selectionnerLesProduitsEntretien,
        selectionnerLesProduitsMachine
    }

    public enum CategorieListeProduit
    {
        tout,
        vehicules,
        usinage,
        airMakeUp,
        soudeuse,
        remorque,
        pontRoulant,
        batisse
    }

    public static bool isCheck;

    public static int IdModifierCodeUsager;
    /// <summary>
    /// Numéro de la machine relié au bouton cliqué dans la liste des notifications dans la page Accueil.aspx.
    /// </summary>
    public static string numeroMachineBoutonCliqueAccueil;

    /// <summary>
    /// Permet de débogguer en mode programmeur ou non.
    /// </summary>
    public static bool debug = false;

    /// <summary>
    /// Permet de débogguer le programme de façon sécuitaire.
    /// </summary>
    /// <param name="e">Exception.</param>
    /// <param name="page">This.</param>
    /// <param name="type">GetType().</param>
    public static void Debug(Exception e, Page page, Type type)
    {
        if(Cmds.debug == true)
        {
            throw e;
        }
        else
        {
            Cmds.Alerte("Une erreur s'est produite. Veuillez fermer la page et réessayer de nouveau. Contacter Philip Drouin si le problème presiste.", page, type);
        }
    }

    /// <summary>
    /// Produit sélectionée pour le commander.
    /// </summary>
    public static int idProduitSelectionne;

    /// <summary>
    /// Affiches les entretiens ou les remarques de la page d'accueil.
    /// </summary>
    public static bool choixEntretiens = true;

    /// <summary>
    /// Enregistre le nom de l'administrateur connecte;
    /// </summary>
    public static string nomUsagerConnecte;

    /// <summary>
    /// Enregistre le prenom de l'administrateur connecte;
    /// </summary>
    public static string prenomUsagerConnecte;

    /// <summary>
    /// Enregistre le Id de l'administrateur connecte;
    /// </summary>
    public static int IdUsagerConnecte;

    /// <summary>
    /// Enregistre le numéro de la machine sélectionnée dans le gridView de la page ListeDesMachines.aspx.
    /// </summary>
    public static string numeroMachineSelectionne;

    /// <summary>
    /// Enregistre le ID de la machine sélectionnée dans le gridView de la page ListeDesMachines.aspx.
    /// </summary>
    public static int idMachineSelectionne;

    /// <summary>
    /// Enregistre le ID de la machine sélectionnée dans la liste des notifications pour ajouter un entretien précedant.
    /// </summary>
    public static int idMachineSelectionneEntretienPrecedant;

    /// <summary>
    /// Enregistre le ID de l'entretien précedant qui vient juste d'être enregistré afin d'associer la remarque à cet entretien.
    /// </summary>
    public static int idEntretienPrecedantAjoute;

    /// <summary>
    /// Enregistre le ID de l'entretien sélectionnée dans la liste des notifications pour ajouter un entretien précedant.
    /// </summary>
    public static int idEntretienSelectionneEntretienPrecedant;

    /// <summary>
    /// Enregistre le nom de la machine sélectionnée dans le gridView de la page ListeDesMachines.aspx.
    /// </summary>
    public static string nomMachineSelectionne;

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
        remarqueSansEntretien = false;
    }
    
    /// <summary>
    /// Retient si l'utilisateur est un administrateur.
    /// </summary>
    public static bool admin;

    /// <summary>
    /// Hasher le mot de passe de l'usager.
    /// </summary>
    /// <param name="value"></param>
    /// <returns></returns>
    public static string HashSHA1(string value)
    {
        var sha1 = System.Security.Cryptography.SHA1.Create();
        var inputBytes = Encoding.ASCII.GetBytes(value);
        var hash = sha1.ComputeHash(inputBytes);

        var sb = new StringBuilder();
        for (var i = 0; i < hash.Length; i++)
        {
            sb.Append(hash[i].ToString("X2"));
        }
        return sb.ToString();
    }


    /// <summary>
    /// Connection string de la base de données MainPltDataBase.
    /// </summary>
    public static string connectionString = "SERVER=188.121.44.214;DATABASE=mainplt_SqlDatabase;UID=mainplt;PASSWORD=MainPlt2210;";


    public static void Alerte(string message, Page page, Type type)
    {
        ScriptManager.RegisterStartupScript(page, type, "showalert", "alert('" + message + "');", true);
    }

    public static void Deconnexion()
    {
        nomUsagerConnecte = null;
        prenomUsagerConnecte = null;
        usagerConnecte = false;
        Cmds.categorieListeProduits = CategorieListeProduit.tout;
    }

    public static int IdProduitAssocie;

    public static void InitialiserBoutonDeconnexion()
    {

    }

    public static string NomEntretienAssocierProduit;

    public Cmds()
    {

    }
}