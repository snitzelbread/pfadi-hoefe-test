module ArticlesHelper
  def remove_brackets(content)
    content.gsub(/\[.*?\]/, "")
  end
end
