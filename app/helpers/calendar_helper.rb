module CalendarHelper
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

  def next_three_events
    events = []
    Calendar.all.each do |cal|
      cal.calendar_events.each do |event|
        events << event if event.start_time > Time.current
      end
    end
    events.sort_by(&:start_time).first(3)
  end

  def events_on_day_and_month(date)
    events = []
    Calendar.all.each do |cal|
      cal.calendar_events.each do |event|
        events << event if event.start_time.month == date.month && event.start_time.day == date.day
      end
    end
    events
  end
end
