$ ->
  ($ '#country_based').click ->
    show_country()

  ($ '#state_based').click ->
    show_state()

  ($ '#zip_code_based').click ->
    show_zip_code()

  detect_zone_type()

detect_zone_type = ->
  zone_type = $("#zone-type").val()
  switch zone_type
    when 'zip_code'
      show_zip_code()
      ($ '#zip_code_based').click()
    when 'country'
      show_country()
      ($ '#country_based').click()
    when 'state'
      show_state()
      ($ '#state_based').click()
    else
      show_state()
      ($ '#state_based').click()

show_zip_code = ->
  ($ '#state_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#state_members').hide()
  ($ '#country_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#country_members').hide()
  ($ '#zone_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#zone_members').hide()
  ($ '#zip_code_members :input').each ->
    ($ this).prop 'disabled', false

  ($ '#zip_code_members').show()

show_country = ->
  ($ '#zip_code_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#zip_code_members').hide()

  ($ '#state_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#state_members').hide()
  ($ '#zone_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#zone_members').hide()
  ($ '#country_members :input').each ->
    ($ this).prop 'disabled', false

  ($ '#country_members').show()

show_state = ->
  ($ '#zip_code_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#zip_code_members').hide()

  ($ '#country_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#country_members').hide()
  ($ '#zone_members :input').each ->
    ($ this).prop 'disabled', true

  ($ '#zone_members').hide()
  ($ '#state_members :input').each ->
    ($ this).prop 'disabled', false

  ($ '#state_members').show()