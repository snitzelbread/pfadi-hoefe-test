module CalendarHelper

  def calendar_names = [
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
        events << event if event.start_time > Date.today
      end
    end
    events.sort_by(&:start_time).first(3)
  end

  def calendar_with_these_names(names)
    cals = []
    Calendar.all.each do |cal|
      cals << cal if names.include?(cal.name)
    end
    cals
  end

  def all_events_of_these_calendars(calendars)
    events = []
    calendars.each do |cal|
      cal.calendar_events.each do |event|
        events << event
      end
    end
    events
  end

  def start_middle_or_end(event, date)
    if event.start_time.month == date.month && event.start_time.day == date.day
      "start"
    elsif event.end_time.month == date.month && event.end_time.day == date.day
      "end"
    else
      "middle"
    end
  end

  def ranged_events(events)
    ranged_events = events.select { |event| event.start_time.month != event.end_time.month || event.start_time.day != event.end_time.day }
    ranged_events.each do |event|
      if event.end_time.hour == 0
        event.end_time -= 1.minute
      end
    end
  end

  def single_day_events(events)

    single_day_events = events.select { |event| event.start_time.month == event.end_time.month && (
      event.start_time.day == event.end_time.day || end_time(event)
    )

    }
  end

  def end_time(event)
    if event.end_time.hour == 0
      end_time = event.end_time
      end_time -= 1.minute
      if end_time.day == event.end_time.day
        return false
      else
        return true
      end
    end
  end

  def events_on_day_and_month(date, calendars)
    events = []
    calendars.each do |cal|
      cal.calendar_events.each do |event|
        events << event if event.start_time.month == date.month && event.start_time.day == date.day
      end
    end
    events
  end
end
