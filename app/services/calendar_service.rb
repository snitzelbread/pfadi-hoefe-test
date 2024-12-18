class CalendarService
  def initialize(calendar)
    @calendar = calendar
    @client = initialize_client
  end

  def sync_events
    calendars = @client.calendars.list
    cal = calendars.find { |c| c.display_name == @calendar.name }
    return unless cal

    @calendar.update!(url: cal.url) unless @calendar.url == cal.url

    event_list = @client.events.list(
      @calendar.url, from: Time.new(Date.today.year, 1, 1), to: Time.new(Date.today.year + 1, 1, 1)
    )

    event_list.each do |e|
      event_data = e.calendar_data
      cals = Icalendar::Calendar.parse(event_data)
      cal = cals.first
      cal.events.each do |event|
        new_event = CalendarEvent.find_or_initialize_by(
          uid: event.uid.to_s,
        )

        new_event.update(
          title: event.summary.to_s,
          description: event.description.to_s,
          location: event.location.to_s,
          start_time: event.dtstart.to_date,
          end_time: event.dtend.to_date,
          calendar_id: @calendar.id,
        )
      end
    end
    @calendar.update!(last_synced_at: Time.current, color: get_calendar_color(@calendar))
  end

  private

  def initialize_client
    credentials = Calendav::Credentials::Standard.new(
      host: ENV["CALENDAR_HOST"],
      username: ENV["CALENDAR_USER"],
      password: ENV["CALENDAR_PASSWORD"],
      authentication: :basic_auth
    )
    Calendav.client(credentials)
  end

  def get_calendar_color(calendar)
    # Assign colors for each specific calendar name
    case calendar.name
    when "Kurse"
      "#7CF4FFFF" # Light teal
    when "Ferien Gemeinde Freienbach"
      "#72FFE5FF" # Light coral
    when "Leiter"
      "#FF6347FF" # Tomato red
    when "Abteilung"
      "#FF6464FF" # Steel blue
    when "AL"
      "#6A5ACDFF" # Slate blue
    when "Stufenleitung"
      "#32CD32FF" # Lime green
    when "Pios"
      "#FFD700FF" # Gold
    when "Pfadi"
      "#FF4500FF" # Orange red
    when "Wölfli"
      "#1A68FFFF" # Cornflower blue
    when "Biber"
      "#5AFF81FF" # Light green
    when "OK Chilbi Pfäffikon"
      "#FF69B4FF" # Hot pink
    when "Feiertage"
      "#8C8C8CFF" # Grey
    when "Geburtstagsliste"
      "#DF7CFFFF" # Purple-pink
    when "SoLa"
      "#FFA15DFF" # Orange
    when "WoLa"
      "#58AEEAFF" # light blue
    when "PfiLa"
      "#FF7EC5FF" # Spring green
    when "Geburtstage von Kontakten"
      "#FFDAB9FF" # Peach puff
    when "pfadi-hoefe"
      "#DC143CFF" # Crimson
    when "Privat"
      "#708090FF" # Slate gray
    else
      "#7CF4FFFF" # Default color (light teal)
    end
  end
end
