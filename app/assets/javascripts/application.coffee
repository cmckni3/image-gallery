# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require foundation-sites
#= require jquery-fileupload/basic
#= require_tree .

$ ->
  $(document).foundation
    orbit:
      swipe: true
      variable_height: false

  $('#fileupload').fileupload
    dataType: 'json'
    dropZone: $('#dropzone')
    add: (e, data) ->
      data.context = $('<button/>').text('Upload')
        .appendTo($("#upload"))
        .click( ->
          data.context = $('<p/>').text('Uploading...').replaceAll($(this))
          data.submit()
        );
    done: (e, data) ->
      file = data.result
      data.context.remove()
    fail: (e, data) ->
      alert 'Upload failed'

  $(document).bind "dragover", (e) ->
    dropZone = $("#dropzone")
    timeout = window.dropZoneTimeout
    unless timeout
      dropZone.addClass "in"
    else
      clearTimeout timeout
    found = false
    node = e.target
    loop
      if node is dropZone[0]
        found = true
        break
      node = node.parentNode
      break unless node?
    if found
      dropZone.addClass "hover"
    else
      dropZone.removeClass "hover"
    window.dropZoneTimeout = setTimeout(->
      window.dropZoneTimeout = null
      dropZone.removeClass "in hover"
      return
    , 100)
    return

  $(document).bind 'drop dragover', (e) ->
      e.preventDefault()
