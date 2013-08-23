# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#assignment_0_due_date').datepicker({ dateFormat: 'yy-mm-dd' })
  count = 1
  optionsForSelect = ""
  if gon.day_classes != undefined
    optionsForSelect += "<option value='#{i.id}'>#{i.name}</option>" for i in gon.day_classes
  $('#add-assignment-form').on('click', ->
    $('#submit-button').before("<h4>Assignment</h4>")
    $('#submit-button').before("<input id='assignment_#{count}_name' type='text' placeholder='Enter Assignment Name' name='assignment[#{count}][name]'><br>")
    $('#submit-button').before("<select id='assignment_#{count}_day_class_id' name='assignment[#{count}][day_class_id]'>
                                <option value=''>Select Class</option>#{optionsForSelect}</select><br>")
    $('#submit-button').before("<input id='assignment_#{count}_due_date' type='text' placeholder='Enter Date' name='assignment[#{count}][due_date]'><br>")

    $("#assignment_#{count}_due_date").datepicker({ dateFormat: 'yy-mm-dd' })
    count++
    ) # end click
