module EntriesHelper
  def readable_time_period(entry)
    mins = entry.time_period
    return Time.at(60 * mins).utc.strftime('%M <small>Mins</small>').html_safe if mins < 60
    Time.at(60 * mins).utc.strftime('%H <small>Hour</small> %M <small>Mins</small>').html_safe
  end

  def readable_speed(entry)
    "#{sprintf('%0.2f', entry.speed)} <small>Km/H</small>".html_safe
  end
end