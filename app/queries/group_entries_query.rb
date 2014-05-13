class GroupEntriesQuery
  def initialize(user, period='week')
    @user   = user
    @period = period
  end

  def call
    @user.entries.group_by(&@period.to_sym).lazy
  end
end