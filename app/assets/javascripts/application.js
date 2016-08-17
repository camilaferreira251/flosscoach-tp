// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require plugin/jquery
//= require plugin/bootstrap
//= require plugin/animsition
//= require plugin/jquery-asScroll
//= require plugin/jquery.mousewheel
//= require plugin/jquery.asScrollable.all
//= require plugin/jquery-asHoverScroll

//= require plugin/switchery.min
//= require plugin/intro
//= require plugin/screenfull
//= require plugin/jquery-slidePanel
//= require plugin/jquery.placeholder

//= require plugin/isotope.pkgd.min.js
//= require plugin/lodash.js
//= require plugin/jquery-ui.min
//= require plugin/jquery-asProgress.js
//= require plugin/draggabilly.pkgd



//= require js/core
//= require js/site
//= require js/menu
//= require js/menubar
//= require js/gridmenu
//= require js/sidebar
//= require js/config-colors
//= require js/config-tour
//= require js/asscrollable
//= require js/animsition
//= require js/slidepanel
//= require js/switchery
//= require js/jquery-placeholder

//= require js/jquery.asPaginator.min
//= require components/tabs

//= require components/responsive-tabs
//= require components/asprogress
//= require components/panel

//= require components/aspaginator
//= require components/slidepanel

//= require components/asscrollable



  function salvar_alteracao(campoid,campocod){
    var obj={}
    obj[campoid] = campocod
    obj['_method']="put"
    $.ajax({
    type: "PUT",
    dataType: "script",
    url: window.location.href,
    contentType: 'application/json',
    data: JSON.stringify(obj)
    }).done(function( msg )
    {
        alert( "Data Saved: ", msg );
    });

    //save()

  }       
