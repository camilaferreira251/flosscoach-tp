// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require plugin/summernote.min
//= require plugin/gridstack

//= require components/gridstack

//= require components/summernote
//= require js/editor-summernote
$(".name").on("summernote.change", function(e) {
salvar_alteracao("name", $(this).text());
});
$(".description").on("summernote.change", function(e) {
salvar_alteracao("description", $(this).text());
});
