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

$("#divTypesMachines").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
    $(".textes").show();
    $("#h2TypesMachines").hide();
});
$("#divTypesMachines").mouseleave(function () {
    $(this).css("opacity", "0.5")
    $(".textes").hide();
    $("#h2TypesMachines").show();
});

$("#divTypesProduits").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
    $(".textes").show();
    $("#h2TypesProduits").hide();
});
$("#divTypesProduits").mouseleave(function () {
    $(this).css("opacity", "0.5")
    $(".textes").hide();
    $("#h2TypesProduits").show();
});

$("#divProcedures").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer");
    $(".textes").show();
    $("#h2Procedures").hide();
});
$("#divProcedures").mouseleave(function () {
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

});
$("#divTypesMachines").click(function () {

});
$("#divTypesProduits").click(function () {

});
$("#divProcedures").click(function () {

});
$("#divDeconnexion").click(function () {

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