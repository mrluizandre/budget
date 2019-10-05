$(document).on('turbolinks:load', function (){
    $("div[class^='side_options_cat_']").hide();
});

function show_category_sidebar(id){
    $("div[class^='side_options_cat_']").hide();
    $('.side_options_cat_'+id).show();
}