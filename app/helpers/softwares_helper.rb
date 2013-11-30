module SoftwaresHelper

  def software_description(software)
    if software.description.present?
      software.description
    else
      "<span class='text-muted'>no description.</span>".html_safe
    end
  end

  def render_measure_method(software)
    # FIXME to use i18n.
    text = Software.measure_methods.key(software.measure_method).to_s
    "<div><span class='label label-info'>#{text}</span></div>".html_safe
  end

  def vaf_select(builder, attr, collections = Vaf.degree_of_influences)
    builder.input(attr, collection: collections, include_blank: false)
  end

end
