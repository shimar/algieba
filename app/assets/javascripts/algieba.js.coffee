window.algieba ||= {}

algieba.remove_fields = (link) ->
  $(link).prev('input[type=hidden]').val('1')
  $(link).closest('.form-inline').hide()
  return false

algieba.add_fields = (link, association, content) ->
  new_id = new Date().getTime()
  regexp = new RegExp('new_' + association, 'g')
  $(link).before(content.replace(regexp, new_id))
  return false
