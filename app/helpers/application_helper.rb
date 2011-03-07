module ApplicationHelper
  
  def render_flash
    raw(flash.to_a.map { |v| content_tag(:div, v[1], :class => v[0], :id => "flash") }.join(''))
  end
  
  def render_tag_list(tags, options={})
    default_options = { :class => 'tag-list' }
    options = default_options.update(options)
    xhtml = Builder::XmlMarkup.new :target => out=(''), :indent => 2
    xhtml.ul(:class => options[:class]) do |x|
      tags.each do|tag|
        x.li(:class => tag.parameterize) do |l|
          l << h(tag)
        end
      end
    end
  end
  
end