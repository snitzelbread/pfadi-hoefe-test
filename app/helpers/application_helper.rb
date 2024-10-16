module ApplicationHelper
  def nav_link_to(*args)
    active_class = current_page?(args[1]) ? "active" : ""
    case args.size
    when 2
      link_to args[0], args[1], class: "nav-link #{active_class}"
    when 3
      link_to args[0], args[1], class: "nav-link #{active_class}", method: args[2]
    else
      # type code here
    end
  end

  def markdown(text)
    options = %i[
      hard_wrap autolink no_intra_emphasis tables fenced_code_blocks
      disable_indented_code_blocks strikethrough lax_spacing space_after_headers
      quote footnotes highlight underline
    ]
    Markdown.new(text, *options).to_html.html_safe
  end

end
