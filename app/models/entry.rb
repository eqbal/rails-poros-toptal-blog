class Entry < ActiveRecord::Base

  belongs_to :user

  def week
    date = date_time.split(' ')[0]
    Date.strptime(date, '%m/%d/%Y').strftime('%W')
  end

  def speed
    distance / (time_period.to_f / 60)
  end

  def status
    @status ||= EntryStatus.new(status_weather, status_landform)
  end

  def status=(status)
    self[:status_weather]  = status.weather
    self[:status_landform] = status.landform

    @status = status
  end
end
