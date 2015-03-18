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
    $other.attr('value', '')
    if $(this).is(':checked')
      $other.removeClass "hide"
    else
      $other.addClass "hide"
    return

  $('#price-buttons .btn').click ->
    $form = $(@).closest('form')
    $form.find('[name*=price_gteq]').val($(@).data('from'))
    $form.find('[name*=price_lteq]').val($(@).data('to'))
    $form.submit()

$(document).ready(ready)
$(document).on('page:load', ready)
