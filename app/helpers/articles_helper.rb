module ArticlesHelper
  def remove_brackets(content)
    content.gsub(/\[.*?\]/, "")
  end

  def random_bg_color
    %w[bg-primary bg-secondary bg-danger bg-warning bg-info bg-dark].sample
  end
end
