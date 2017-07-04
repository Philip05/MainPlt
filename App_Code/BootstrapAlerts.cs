using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Description résumée de BootstrapAlerts
/// </summary>
public class BootstrapAlerts
{
    public BootstrapAlerts()
    {
        //
        // TODO: ajoutez ici la logique du constructeur
        //
    }

    public enum TypeAlertes
    {
        Danger,
        Reussi,
        Info,
        Avertissement
    }

    public void ShowNotification(string message, TypeAlertes type)
    {
        
        Panel notificationPanel = new Panel();
        {
            LiteralControl closeButton = new LiteralControl();
            closeButton.Text = "<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>";

            Label notificationMessage = new Label() { Text = message };

            notificationPanel.Controls.Add(closeButton);
            notificationPanel.Controls.Add(notificationMessage);
        }
        notificationPanel.CssClass = string.Format("alert alert-{0} alert-dismissable", type.ToString().ToLower());
        notificationPanel.Attributes.Add("role", "alert");
       
    }
}