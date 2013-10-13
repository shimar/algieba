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

end
