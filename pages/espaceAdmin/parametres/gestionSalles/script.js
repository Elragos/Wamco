// Fonction gérant la fermeture de la popin
function fermerPopinSalle(){
    $("#overlay").hide();
    $(".popin").hide();
}

// Fonction gérant l'ouverture de la popin
function ouvrirPopinSalle(){
    // Afficher l'overlay ainsi que la popin création membre
    $("#overlay").show();
    $(".popin").show();
    // On réinitialise le formulaire de création membre
    $("#admin-gestionSalle-popin form").get(0).reset();
    // Fix pour la checkbox
    $("#EnVenteSalle").removeAttr("checked");
}

// Calculer le TTC en fonction du HT
function calculerTTC(){
    var tva = $("#IdTvaSalle option:selected").attr("data-taux") || 0.0;
    var ht = $("#TarifHtSalle").val() || 0.0;
    var ttc = ht * (1 + (tva/100));

    $("#TarifTtcSalle").val(ttc.toFixed(2));
}

$(document).ready(function(){
    // Déplacer la popin de création d'un membre dans l'overlay
    $("#admin-gestionSalle-popin").detach().appendTo("#overlay");
    
    // Gestion du clic sur Ajouter un membre
    $("#AjouterSalle").click(ouvrirPopinSalle);
    
    // Gestion du clic sur Modifier un membre
    $(".admin-gestionSalle-modifier").click(function(event){
        // Ouvrir la popin
        ouvrirPopinSalle();
        
        // Ligne sur laquelle on a cliqué
        var ligne = $(event.target).parents("tr");
        // Données de la ligne
        var donneesLigne = {
            "IdSalle" : ligne.attr("data-salle-id"),
            "NomSalle" : ligne.attr("data-salle-nom"),
            "CapaciteSalle" : ligne.attr("data-salle-capacite"),
            "TarifHtSalle" : ligne.attr("data-salle-tarif"),
            "IdTvaSalle" : ligne.attr("data-salle-tva"),
            "TypeSalle" : ligne.attr("data-salle-type"),
            "EnVenteSalle" : ligne.attr("data-salle-enVente") == 1,
            "PosXSalle" : ligne.attr("data-salle-posX"),
            "PosYSalle" : ligne.attr("data-salle-posY"),
            "LongueurSalle" : ligne.attr("data-salle-longueur"),
            "LargeurSalle" : ligne.attr("data-salle-largeur"),
        };
        
        // Remplir le formulaire avec les données
        $('#admin-gestionSalle-popin form').find('input, select').val(function() {
            return donneesLigne[this.id];
        });
        
        // Fix pour la checkbox
        if (donneesLigne.EnVenteSalle){
            $("#EnVenteSalle").attr("checked", "checked");
        }
        else{
            $("#EnVenteSalle").removeAttr("checked");
        } 
        
        calculerTTC();
    });

    // Fermer la popin si l'on clique en dehors de la popin
    $("#overlay").click(function(event){  
        // Si le clic n'est pas dans la popin
        if($(event.target).closest('.popin').length === 0){
            // On ferme la popin
            fermerPopinSalle();
        }
        // Si le clic est dans la zone de fermeture
        if ($(event.target).closest('.popin-toolbar-close').length != 0){
            // On ferme la popin
            fermerPopinSalle();
        }
    });
     
    // Au changement du taux de TVA, recalculer le prix TTC
    $("#IdTvaSalle").change(calculerTTC);
    
    // Au changement du prix HT, recalculer le TTC
    $("#TarifHtSalle").change(calculerTTC);
    
    // Si on change le prix TTC, recalculer le prix HT
    $("#TarifTtcSalle").change(function(){
        var tva = $("#IdTvaSalle option:selected").attr("data-taux") || 0.0;
        var ttc = $("#TarifTtcSalle").val() || 0.0;
        var ht = ttc / (1 + (tva/100));

        $("#TarifHtSalle").val(ht.toFixed(3));
    });
});