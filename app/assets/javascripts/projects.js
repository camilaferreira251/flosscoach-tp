// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.






//Summernote
//= require plugin/summernote.min
//= require plugin/gridstack

//= require components/gridstack

//= require components/summernote
//= require js/editor-summernote
//= require plugin/zsummernote-iframe


//JQuery File Uploader

//= require js/tmpl
//= require js/canvas-to-blob
//= require js/load-image.all.min
//= require js/jquery.fileupload
//= require js/jquery.fileupload-process
//= require js/jquery.fileupload-image
//= require js/jquery.fileupload-audio
//= require js/jquery.fileupload-video

//= require js/jquery.fileupload-validate
//= require js/jquery.fileupload-ui

//= require js/dropify.min

//= require js/buttons

//= require js/dropify
//= require js/uploads
//= require js/jquery.webui-popover.min
//= require js/jquery.toolbar.min.js
//= require js/webui-popover.js
//= require js/toolbar.js


//GridStack




$(".page-title").on("summernote.change", function(e) {
salvar_alteracao("name", $(this).text());
});
$(".description").on("summernote.change", function(e) {
salvar_alteracao("description", $(this).text());
});

  function toggleGridEditable(obj){
    // clear any active button if set before
    $.each($(".wb-edit"), function(index, btn_obj){
        if (obj != btn_obj){
          btn_obj.className.includes("up") ? btn_obj.classList.remove("up") : null;
          btn_obj.style.color = "";
          finish($(btn_obj));
        }
      });
    // tag a new button
    $(obj).toggleClass("up");

    box = $(obj).parents(".grid-stack-item")
    $('.grid-stack').data('gridstack').movable(box, !obj.className.includes("up"));
    $('.grid-stack').data('gridstack').resizable(box, !obj.className.includes("up"));
    obj.style.color = obj.className.includes("up") ?  "green"  : "" ;

    if(obj.className.includes("up")){ // Se o botão tá ativo e o usuário clicou pra desativar
            edit($(obj)); 

    }else{
      finish($(obj)); // Salva (na realidade na implementação ele está apenas chamado o destroy())

    }
  }
  

  // POPOVER DA INSERÇÃO
  // ------------------------------------
  (function() {
  var defaults = $.components.getDefaults("webuiPopover");

  $(".grid-stack-item").each(function(){
      box = $(this).find('.insertBox').eq(0);
 

      box_html = box.html();
      button = $(this).find('.button-insert');
          settings = {
            content: box_html,
            width: 500,
            placement: "bottom"
          };

        button.webuiPopover($.extend({}, defaults, settings));

  });
  })();


function saveInsert(obj){
  alert("TODO");
}

function insertIframe(obj){
      box = $(obj).parents(".grid-stack-item")

  alert("TODO");
}

