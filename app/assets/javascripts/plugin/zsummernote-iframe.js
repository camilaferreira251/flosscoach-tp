(function (factory) {
  if (typeof define === 'function' && define.amd) {
    define(['jquery'], factory);
  } else {
    factory(window.jQuery);
  }
}(function ($) {
  var tmpl = $.summernote.renderer.getTemplate();

  var range = $.summernote.core.range;
  var dom = $.summernote.core.dom;


  var createIframeNode = function (url) {
    var $iframe;
      $iframe = $('<iframe>')
    .attr('frameborder', 0)
    .attr('src', url)
    .attr('class', 'embed-responsive-item').wrap("<div class='embed-responsive embed-responsive-16by9'></div>").parent().andSelf();


    return $iframe[0];
  };


  var getTextOnRange = function ($editable) {
    $editable.focus();

    var rng = range.create();

    // if range on anchor, expand range with anchor
    if (rng.isOnAnchor()) {
      var anchor = dom.ancestor(rng.sc, dom.isAnchor);
      rng = range.createFromNode(anchor);
    }

    return rng.toString();
  };

 
  var toggleBtn = function ($btn, isEnable) {
    $btn.toggleClass('disabled', !isEnable);
    $btn.attr('disabled', !isEnable);
  };


  var showIframeDialog = function ($editable, $dialog, text) {
    return $.Deferred(function (deferred) {
      var $videoDialog = $dialog.find('.note-video-dialog');

      var $videoUrl = $videoDialog.find('.note-video-url'),
          $videoBtn = $videoDialog.find('.note-video-btn');

      $videoDialog.one('shown.bs.modal', function () {
        $videoUrl.val(text).on('input', function () {
          toggleBtn($videoBtn, $videoUrl.val());
        }).trigger('focus');

        $videoBtn.click(function (event) {
          event.preventDefault();

          deferred.resolve($videoUrl.val());
          $videoDialog.modal('hide');
        });
      }).one('hidden.bs.modal', function () {
        $videoUrl.off('input');
        $videoBtn.off('click');

        if (deferred.state() === 'pending') {
          deferred.reject();
        }
      }).modal('show');
    });
  };

  /**
   *
   * Iframe Plugin
   *
   * Este plugin serve para acoplar uma tag iframe ao Summernote
   * Criado com base no template fornecido pelo próprio Summernote
   * ```
   * 
   * ```
   *
   * ### Use da seguinte forma:
   * ```
   *    $("#editor").summernote({
   *    ...
   *    toolbar : [
   *        ['group', [ 'iframe' ]]
   *    ]
   *    ...    
   *    });
   * ```
   */
  $.summernote.addPlugin({
    name: 'iframe',
    buttons: {
      iframe: function (lang, options) {
        return tmpl.iconButton(options.iconPrefix + 'youtube-play', {
          event: 'showIframeDialog',
          title: lang.iframe.iframe,
          hide: true
        });
      }
    },

    dialogs: {
      iframe: function (lang) {
        var body = '<div class="form-group row-fluid">' +
                     '<label>' + lang.iframe.url + '</label>' +
                     '<input class="note-video-url form-control span12" type="text" />' +
                   '</div>';
        var footer = '<button href="#" class="btn btn-primary note-video-btn disabled" disabled>' + lang.iframe.insert + '</button>';
        return tmpl.dialog('note-video-dialog', lang.iframe.insert, body, footer);
      }
    },

    events: {
      showIframeDialog: function (event, editor, layoutInfo) {
        var $dialog = layoutInfo.dialog(),
            $editable = layoutInfo.editable(),
            text = getTextOnRange($editable);

        editor.saveRange($editable);

        showIframeDialog($editable, $dialog, text).then(function (url) {

          editor.restoreRange($editable);
          
          var $node = createIframeNode(url);
          
          if ($node) {
            editor.insertNode($editable, $node);
          }
        }).fail(function () {
          editor.restoreRange($editable);
        });
      }
    },

    langs: {
      'en-US': {
        iframe: {
          iframe: 'Iframe',
          iframeLink: 'Iframe Link',
          insert: 'Insert Iframe',
          url: 'Iframe URL?'
        }
      }
    }
  });
}));