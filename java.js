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
    $("#h2Deconnexion").show();
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
$("#h2EntretiensMachine").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
}); 
$("#h2EntretiensMachine").mouseleave(function () {
    $(this).css("opacity", "0.7")
});
$("#h2EntretiensRecents").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
});
$("#h2EntretiensRecents").mouseleave(function () {
    $(this).css("opacity", "0.7")
});
$("#h2ProduitsMachine").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
});
$("#h2ProduitsMachine").mouseleave(function () {
    $(this).css("opacity", "0.7")
});
$("#h2ProceduresMachine").mouseover(function () {
    $(this).css("opacity", "1")
    $(this).css("cursor", "pointer")
});
$("#h2ProceduresMachine").mouseleave(function () {
    $(this).css("opacity", "0.7")
});