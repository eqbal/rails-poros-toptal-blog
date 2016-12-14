class CreateEntry
  class NotValidEntryRecord < StandardError; end

  def initialize(user, params)
    @user   = user
    @params = params
  end

  def call
    @entry_form = ::EntryForm.new(@params)

    if @entry_form.valid?
      entry = Entry.new(@params)
      entry.user = @user

      entry.status = EntryStatus.new(
        @params[:status_weather],
        @params[:status_landform]
      )

      # compare_speed_and_notify_user
      entry.save!
    else
      raise(NotValidEntryRecord, @entry_form.errors.full_messages.to_sentence)
    end
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
