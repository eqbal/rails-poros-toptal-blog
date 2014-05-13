module Report
  class GenerateWeekly
    WeeklyReport = Struct.new(
      :week_number,
      :date_from,
      :date_to,
      :count_entries,
      :avg_distance,
      :avg_speed
    )

    def initialize(user)
      @user = user
    end

    def call
      # weekly_grouped_entries = GroupEntriesQuery.new(@user).call

      @user.entries.group_by(&:week).map do |week, entries|
        WeeklyReport.new(
         week,
         weeks_to_date_from(week),
         weeks_to_date_to(week),
         entries.count,
         avg_distance(entries),
         avg_speed(entries)
        )
      end
    end

    private

    def weeks_to_date_from(week)
      (Date.new + week.to_i.weeks).to_s.split(',')[0]
    end

    def weeks_to_date_to(week)
      (Date.new + week.to_i.weeks + 7.days).to_s.split(',')[0]
    end

    def avg_distance(entries)
      distances = entries.inject(0){|sum, n| sum + n.distance }
      (distances / entries.count).round(2)
    end

    def avg_speed(entries)
      speeds = entries.inject(0){|sum, n| sum + n.speed }
      (speeds / entries.count).round(2)
    end
  end
end