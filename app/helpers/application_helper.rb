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
    f.hidden_field(:_destroy) + link_to(name, onclick: 'remove_fields(this);', class: 'alert-link') do
      "<span class='glyphicon glyphicon-remove-sign'></span>".html_safe
    end
  end


  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.simple_fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

end
