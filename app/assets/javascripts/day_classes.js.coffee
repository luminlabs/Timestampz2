# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  count = 0
  $('.add-class-form').on('click', ->
    $(@).before("<select id='day_class_#{count}_period' name='day_class[#{count}][period]'>
                <option value=''>Select Period</option>
                <option value='1st'>1st</option>
                <option value='2nd'>2nd</option>
                <option value='3rd'>3rd</option>
                </select><br>")
    $(@).before("<select id='day_class_#{count}_subject' name='day_class[#{count}][subject]'>
                <option value=''>Select Subject</option>
                <option value='ELA'>ELA</option>
                <option value='Math'>Math</option>
                <option value='Science'>Science</option>
                <option value='Social Studies'>Social Studies</option>
                </select><br>")
    teacherId = $(@).data('teacher-id')
    $(@).before("<input id='day_class_#{count}_teacher_id' type='hidden' value=#{teacherId} name='day_class[#{count}][teacher_id]'>")
    count++
  )
