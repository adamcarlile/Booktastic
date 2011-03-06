module ApplicationHelper
  
  def render_flash
    raw(flash.to_a.map { |v| content_tag(:div, v[1], :class => v[0], :id => "flash") }.join(''))
  end
  
end