class Entry < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :distance, :time_period, :date_time
  validates_numericality_of :distance, :time_period

  after_create :compare_speed_and_notify_user

  def week
    date = date_time.split(' ')[0]
    Date.strptime(date, '%m/%d/%Y').strftime('%W')
  end

  def speed
    distance / (time_period.to_f / 60)
  end

  private

  def compare_speed_and_notify_user
    entries_avg_speed = (Entry.all.map(&:speed).sum / Entry.count).round(2)

    if speed > entries_avg_speed
      msg = 'You are doing great. Keep it up superman. :)'
    else
      msg = 'Most of the users are faster than you. Try harder dude. :('
    end

    NexmoClient.send_message(
      from: 'Toptal',
      to: user.mobile,
      text: msg
    )
  end
end
