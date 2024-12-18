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
      @calendar.url, from: Time.new(2024, 1, 1), to: Time.new(2025, 1, 1)
    )

    event_list.each do |e|
      event_data = e.calendar_data
      cals = Icalendar::Calendar.parse(event_data)
      cal = cals.first
      cal.events.each do |event|
        CalendarEvent.find_or_initialize_by(
          title: event.summary.to_s,
          description: event.description.to_s,
          location: event.location.to_s,
          start_time: event.dtstart.to_date,
          end_time: event.dtend.to_date,
          color: get_calendar_color(@calendar),
          calendar_id: @calendar.id
        ).save!
      end
    end
    @calendar.update!(last_synced_at: Time.current)
  end

  private

  def get_calendar_color(calendar)
    # Example: Return different colors based on calendar display_name
    case calendar.name
    when "Geburtstagsliste"
      "#DF7CFFFF"
    when "Kurse"
      "#7CF4FFFF"
    else
      "#7CF4FFFF"
    end
  end

  def initialize_client
    credentials = Calendav::Credentials::Standard.new(
      host: "https://cloud.linuxfabrik.io/remote.php/dav/",
      username: ENV["CALENDAR_USER"],
      password: ENV["CALENDAR_PASSWORD"],
      authentication: :basic_auth
    )
    Calendav.client(credentials)
  end
end
