module ArticlesHelper
  def remove_brackets(content)
    content.gsub(/\[.*?\]/, "")
  end

  def determine_bg_color(article)
    case
    when article.tag_list.include?("Biber")
      return "bg-success"
    when article.tag_list.include?("Wölfli")
      return "bg-primary"
    when article.tag_list.include?("Pfadi")
      return "bg-danger"
    when article.tag_list.include?("Verein")
      return "bg-warning"
    else
      return %w[bg-info]
    end
  end
end
