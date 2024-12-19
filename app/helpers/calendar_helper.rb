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

  def classify_event(event)
    duration = event.end_time - event.start_time

    starts_at_midnight = event.start_time.strftime("%H:%M") == "00:00"
    ends_at_midnight = event.end_time.strftime("%H:%M") == "00:00"

    if starts_at_midnight && ends_at_midnight && duration == 1.day
      "All-Day Event"
    elsif duration > 1.day
      "Multi-Day Event"
    else
      "Regular Event"
    end
  end

  def ranged_events(events)
    ranged_events = []
    events.each do |event|
      if classify_event(event) == "Multi-Day Event"
        ranged_events << event
      end
    end
    ranged_events
  end

  def single_day_events(events)
    single_day_events = []
    events.each do |event|
      if classify_event(event) == "All-Day Event" || classify_event(event) == "Regular Event"
        single_day_events << event
      end
    end
    single_day_events
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
