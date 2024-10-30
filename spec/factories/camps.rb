FactoryBot.define do
  factory :camp do
    name { "Pfingstlager" }
    general_description { "Ein Lager für Pfadis" }
    quote { "Ein Zitat für das Lager" }
    template { "Lager ausgeschrieben" }
    this_camp_description { "Eine Beschreibung für das Lager" }
    leader
  end
end
