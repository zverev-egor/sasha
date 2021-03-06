module ApplicationHelper

  def error_messages_for(object)
    render 'layouts/error_messages_for', object: object
  end

  def awesom(klass, hash = {})
    content_tag(:i, "", class: klass, data: hash[:data],
                title: hash[:title]).html_safe + hash[:text]
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
end
