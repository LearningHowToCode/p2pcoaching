ready = ->
  $("#undergraduate-institution").change ->
    $other = $("#other-undergraduate-institution")
    if $(this).val() is "Other"
      $other.removeClass "hide"
      $other.find("input").val ""
    else
      $other.addClass "hide"
    return

  $("#graduate-institution").change ->
    $other = $("#other-graduate-institution")
    if $(this).val() is "Other"
      $other.removeClass "hide"
      $other.find("input").val ""
    else
      $other.addClass "hide"
    return

  $('#tutor_subjects_Other').change ->
    $other = $("#other-subject")
    $other.find("input").val ""
    if $(this).is(':checked')
      $other.removeClass "hide"
    else
      $other.addClass "hide"
    return
  return

$(document).ready(ready)
$(document).on('page:load', ready)