$(".textes").hide();
$("#divMachines").mouseover(function () {
    $(this).css("opacity", "1");
    $(this).css("cursor", "pointer")
    $(".textes").show();
    $("#h2Machines").hide();
});
$("#divMachines").mouseleave(function () {
    $(this).css("opacity", "0.5")
    $(".textes").hide();
    $("#h2Machines").show();
});

$("#divProduits").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
    $(".textes").show();
    $("#h2Produits").hide();
});
$("#divProduits").mouseleave(function () {
    $(this).css("opacity", "0.5")
    $(".textes").hide();
    $("#h2Produits").show();
});
$("#divAjout").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
    $(".textes").show();
    $("#h2TypesMachines").hide();
});
$("#divAjout").mouseleave(function () {
    $(this).css("opacity", "0.5")
    $(".textes").hide();
    $("#h2TypesMachines").show();
});

$("#divDeconnexion").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
    $(".textes").show();
    $("#h2TypesProduits").hide();
});
$("#divDeconnexion").mouseleave(function () {
    $(this).css("opacity", "0.5")
    $(".textes").hide();
    $("#h2TypesProduits").show();
});

$("#divProcedures1").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer");
    $(".textes").show();
    $("#h2Procedures").hide();
});
$("#divProcedures1").mouseleave(function () {
    $(this).css("opacity", "0.5")
    $(".textes").hide();
    $("#h2Procedures").show();
});

$("#divEntretiens").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
    $(".textes").show();
    $("#h2Entretiens").hide();
});
$("#divEntretiens").mouseleave(function () {
    $(this).css("opacity", "0.5")
    $(".textes").hide();
    $("#h2Entretiens").show();
});
$("#divMachines").click(function () {
    window.location.href = "ListeDesMachines.aspx";
});
$("#divProduits").click(function () {
    window.location.href = "ProduitSelectionne.aspx";
});
$("#divAjout").click(function () {
    window.location.href = "AjouterElements.aspx";
});
$("#divDeconnexion").click(function () {
    window.location.href = "PageAccueilConnexion.aspx";
});
$("#divProcedures1").click(function () {
    window.location.href = "Procedures.aspx";
});
$("#divEntretiens").click(function () {
    window.location.href = "ImprimerEntretien.aspx";
});
$("#labelEntretiensMachine").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
});
$("#labelEntretiensMachine").mouseleave(function () {
    $(this).css("opacity", "0.7")
});
$("#labelEntretiensRecents").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
});
$("#labelEntretiensRecents").mouseleave(function () {
    $(this).css("opacity", "0.7")
});
$("#labelProduitsMachine").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
});
$("#labelProduitsMachine").mouseleave(function () {
    $(this).css("opacity", "0.7")
});
$("#labelProceduresMachine").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
});
$("#labelProceduresMachine").mouseleave(function () {
    $(this).css("opacity", "0.7")
});
$("#labelRemarquesMachine").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
});
$("#labelRemarquesMachine").mouseleave(function () {
    $(this).css("opacity", "0.7")
});

$("#labelNavbarDeconnexion").click(function () {
    document.getElementById('<% =Cmds.nomUsagerConnecte.ClientID %>') = 'null';
    document.getElementById('<% =prenomUsagerConnecte.ClientID %>') = 'null';
    document.getElementById('<% = usagerConnecte.ClientID %>') = 'false';
    window.location.href = "PageAccueilConnexion.aspx"
});

$("#labelNavbarDeconnexion").mouseover(function () {
    $("#labelNavbarDeconnexion").css("cursor","pointer")
});

function ChangeValue() {
    window.location.href = "PageAccueilConnexion.aspx"
};

function Click() {
    
};
