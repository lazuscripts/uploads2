import Widget from require "lapis.html"
import registry from require "locator"

class extends Widget
  content: =>
    a id: "uploadButton", "Choose file..." -- lame
    div id: "dropTarget" -- completely unusable without some styling
    script -> raw "
      var r = new Resumable({
        target: '/upload',
        query: { token: '#{registry.get_upload_token!}' }
      });
      r.assignBrowse(document.getElementById('uploadButton'));
      r.assignDrop(document.getElementById('dropTarget'));
    "
