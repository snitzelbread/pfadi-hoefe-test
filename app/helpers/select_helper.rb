module SelectHelper
  def stufen
    %w[Biber Wölfli Pfadi Pios Rover]
  end
  def funktionen_categories
    ["Stufen", "Abteilung", "Extra"]
  end


  def funktionen_subcategories
    {
      "Stufen" => %w[Leitperson Stufenleitung],
      "Abteilung" => ["Abteilungsleitung", "Stv. Abteilungsleitung"],
      "Extra" => ["Website-Verantwortlicher"]
    }
  end
end
