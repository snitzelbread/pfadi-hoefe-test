class Calendar < ApplicationRecord
  has_many :calendar_events

  CALENDAR_NAMES = [
    "Kurse",
    "Ferien Gemeinde Freienbach",
    "Leiter",
    "Abteilung",
    "AL",
    "Stufenleitung",
    "Pios",
    "Pfadi",
    "Wölfli",
    "Biber",
    "OK Chilbi Pfäffikon",
    "Feiertage",
    "Geburtstagsliste",
    "SoLa",
    "WoLa",
    "PfiLa",
    "Geburtstage von Kontakten",
    "pfadi-hoefe",
    "Privat"
  ]

  HOME_CALENDARS = [
    "Ferien Gemeinde Freienbach",
    "Abteilung",
    "Pios",
    "Pfadi",
    "Wölfli",
    "Biber",
    "Feiertage",
    "SoLa",
    "WoLa",
    "PfiLa",
  ]
end
