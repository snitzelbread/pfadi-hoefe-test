every 1.day, at: '00:00' do
  runner "CalendarSyncJob.perform_later(['Abteilung', 'Geburtstagsliste', 'Kurse'])"
end
