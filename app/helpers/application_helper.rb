module ApplicationHelper

  def submit_caption(model)
    creation = 'Create'
    updating = 'Update'
    caption  = creation
    unless model.nil?
      caption  = updating unless model.new_record?
    end
    caption
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + button_tag(type: 'button', class: 'btn btn-danger btn-sm', onclick: 'algieba.remove_fields(this);') do
      "<span class='glyphicon glyphicon-remove-sign'></span>".html_safe
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.simple_fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end
    button_tag(type: 'button', class: 'btn btn-default', onclick: "algieba.add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")") do
      "<span class='glyphicon glyphicon-plus'></span>".html_safe
    end
  end

end
