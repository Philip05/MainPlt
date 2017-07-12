$(".textes").hide();
$("#divMachines").mouseover(function () {
    $(this).css("opacity", "1");
    $(this).css("cursor", "pointer")
    $(".textes").show();
});
$("#divMachines").mouseleave(function () {
    $(this).css("opacity", "0.5")
    $(".textes").hide();
});

$("#divProduits").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
    $(".textes").show();
});
$("#divProduits").mouseleave(function () {
    $(this).css("opacity", "0.5")
    $(".textes").hide();
});
$("#divAjout").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
    $(".textes").show();
});
$("#divAjout").mouseleave(function () {
    $(this).css("opacity", "0.5")
    $(".textes").hide();
});

$("#divDeconnexion").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
    $(".textes").show();
});
$("#divDeconnexion").mouseleave(function () {
    $(this).css("opacity", "0.5")
    $(".textes").hide();
});

$("#divProcedures1").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer");
    $(".textes").show();
});
$("#divProcedures1").mouseleave(function () {
    $(this).css("opacity", "0.5")
    $(".textes").hide();
});

$("#divEntretiens").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
    $(".textes").show();
});
$("#divEntretiens").mouseleave(function () {
    $(this).css("opacity", "0.5")
    $(".textes").hide();
});
$("#divMachines").click(function () {
    window.location.href = "ListeDesMachines.aspx";
});
$("#divProduits").click(function () {
    window.location.href = "ProduitSelectionne.aspx";
});
$("#divAjout").click(function () {
    window.location.href = "CentreDeControl.aspx";
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

function Test1() {
    $('#datetimepicker1').datetimepicker();
};

