# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "log/cron.log" # Optional: Log cron output

every 1.day, at: '10:25 am' do
  runner "CalendarSyncJob.perform(['Abteilung', 'Geburtstagsliste', 'Pfadi', 'Wölfli', 'Biber', 'Kurse', 'Leiter', 'AL', 'Stufenleitung', 'Pios', 'OK Chilbi Pfäffikon', 'Feiertage', 'SoLa', 'WoLa', 'PfiLa', 'Geburtstage von Kontakten', 'pfadi-hoefe', 'Privat'])"
end

# We also need a job that deletes the every Calendar and its CalendarEvents at the end of the year.
#
# Learn more: http://github.com/javan/whenever
