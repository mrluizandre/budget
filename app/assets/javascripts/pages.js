$(document).on('turbolinks:load', function (){
    $("div[class^='table_scheduled_transactions_cat_']").hide();
});

function show_category_sidebar(id){
    $("div[class^='table_scheduled_transactions_cat_']").hide();
    $('.table_scheduled_transactions_cat_'+id).show();
}