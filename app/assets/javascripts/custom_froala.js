var plus_font = -1;
var minus_font = -1;
function custom_froala(selector) {
  custom_froala_real(selector);
  setInterval(function(){ 
    if ($(selector + ' .fr-box').length == 0) { custom_froala_real(selector); }
  }, 500);
}

function custom_froala_real(selector) {
  $.FroalaEditor.VIDEO_PROVIDERS = [
      {
        test_regex: /^.*((youtu.be)|(youtube.com))\/((v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))?\??v?=?([^#\&\?]*).*/,
        url_regex: /(?:https?:\/\/)?(?:www\.)?(?:m\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=|embed\/)?([0-9a-zA-Z_\-]+)(.+)?/g,
        url_text: 'https://www.youtube.com/embed/$1',
        html: '<iframe width="640" height="360" src="{url}?wmode=opaque" frameborder="0" allowfullscreen></iframe>',
        provider: 'youtube'
      },
      {
        test_regex: /^.*(?:vimeo.com)\/(?:channels(\/\w+\/)?|groups\/*\/videos\/​\d+\/|video\/|)(\d+)(?:$|\/|\?)/,
        url_regex: /(?:www\.|player\.)?vimeo.com\/(?:channels\/(?:\w+\/)?|groups\/(?:[^\/]*)\/videos\/|album\/(?:\d+)\/video\/|video\/|)(\d+)(?:[a-zA-Z0-9_\-]+)?/i,
        url_text: 'https://player.vimeo.com/video/$1',
        html: '<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>',
        provider: 'vimeo'
      },
      {
        test_regex: /^.+(dailymotion.com|dai.ly)\/(video|hub)?\/?([^_]+)[^#]*(#video=([^_&]+))?/,
        url_regex: /(?:https?:\/\/)?(?:www\.)?(?:dailymotion\.com|dai\.ly)\/(?:video|hub)?\/?(.+)/g,
        url_text: 'https://dailymotion.com/embed/video/$1',
        html: '<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>',
        provider: 'dailymotion'
      },
      {
        test_regex: /^.+(screen.yahoo.com)\/[^_&]+/,
        url_regex: '',
        url_text: '',
        html: '<iframe width="640" height="360" src="{url}?format=embed" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" allowtransparency="true"></iframe>',
        provider: 'yahoo'
      },
      {
        test_regex: /^.+(rutube.ru)\/[^_&]+/,
        url_regex: /(?:https?:\/\/)?(?:www\.)?(?:rutube\.ru)\/(?:video)?\/?(.+)/g,
        url_text: 'https://rutube.ru/play/embed/$1',
        html: '<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" allowtransparency="true"></iframe>',
        provider: 'rutube'
      },
      {
        test_regex: /^(?:.+)vidyard.com\/(?:watch)?\/?([^.&/]+)\/?(?:[^_.&]+)?/,
        url_regex: /^(?:.+)vidyard.com\/(?:watch)?\/?([^.&/]+)\/?(?:[^_.&]+)?/g,
        url_text: 'https://play.vidyard.com/$1',
        html: '<iframe width="640" height="360" src="{url}" frameborder="0" allowfullscreen></iframe>',
        provider: 'vidyard'
      }
  ];

  $.FroalaEditor.DefineIcon('plus_font', {NAME: 'plus'});
  $.FroalaEditor.RegisterCommand('plus_font', {
    title: 'Font Size +',
    focus: false,
    undo: false,
    refreshAfterCallback: false,
    callback: function (event) {
      plus_font = plus_font == -1 ? parseInt($("#fontSize-1",this.$el.parents()[1]).text()) : plus_font
      $('#article_description').froalaEditor('fontSize.apply', plus_font + 1 + "px");
      plus_font = plus_font + 1;
    },
    refresh: function ($btn) {
      plus_font = -1
    }  
  });

  $.FroalaEditor.DefineIcon('minus_font', {NAME: 'minus'});
  $.FroalaEditor.RegisterCommand('minus_font', {
    title: 'Font Size -',
    focus: false,
    undo: false,
    refreshAfterCallback: false,
    callback: function (event) {
      minus_font = minus_font == -1 ? parseInt($("#fontSize-1",this.$el.parents()[1]).text()) : minus_font
      $('#article_description').froalaEditor('fontSize.apply', minus_font - 1 + "px");
      minus_font = minus_font - 1;

    },
    refresh: function ($btn) {
      minus_font = -1
    }  
  });

  $(selector).froalaEditor({
    toolbarButtons: ['plus_font','minus_font'].concat($.FroalaEditor.DEFAULTS['toolbarButtons']),
    fontSizeSelection: true,
    heightMin: 250,
    fileMaxSize: 100 * 1024 * 1024,    
    imageUploadURL: '/upload_image',
    fileUploadURL: '/upload_file',
    videoUploadURL: '/upload_video',
    emoticonsUseImage: false,
    videoMaxSize: (300 * 1024 * 1024),
    videoAllowedTypes: ['mp4', 'avi', 'webm', 'ogg'],
    fontSizeSelection: true,
    imageEditButtons: ['imageReplace', 'imageAlign', 'imageCaption', 'imageRemove', '|', 'imageLink', 'linkOpen', 'linkEdit', 'linkRemove', '-', 'imageStyle', 'imageAlt', 'imageSize'],
  });
}
