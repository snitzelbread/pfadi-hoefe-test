class CalendarSyncJob < ApplicationJob
  queue_as :default

  def perform(calendar_names)
    calendar_names.each do |cal_name|
      calendar = Calendar.find_or_initialize_by(name: cal_name)
      CalendarService.new(calendar).sync_events
    end
  end
end
