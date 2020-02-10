# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ajax:success', '#createComme',(xhr, data, status) ->
    location.reload()
$(document).on 'ajax:error',  '#createComme',(xhr, data, status)->
    form=$('#new_comme .modal-body')
    div =$('<div id="createCommeErrors" class="alart alert-danger"></div>')
    ul=$('<ul></ul>')
    data.responseJSON.messages.forEach(message, i)->
        li=$('<li></li>').text(message)
        ul.append(li)
        
    if $('#createCommeErrors')[0]
        $('#createCommeErrors').html(ul)
    else
        div.append(ul)
        form.prepend(div)