$(document).on 'page:load', ->
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

  return
