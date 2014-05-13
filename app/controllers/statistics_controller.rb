class StatisticsController < ApplicationController

  WeeklyReport = Struct.new(:week_number, :date_from, :date_to, :count_entries, :avg_distance, :avg_speed)

  def index
    @weekly_reports = []


    current_user.entries.group_by(&:week).sort.each do |week, entries|
      # This will be moved in refactoring to readable way.
      @weekly_reports << WeeklyReport.new.tap do |r|
         r.week_number   = week
         r.date_from     = weeks_to_date_from(week)
         r.date_to       = weeks_to_date_to(week)
         r.count_entries = entries.count
         r.avg_distance  = avg_distance(entries)
         r.avg_speed     = avg_speed(entries)
       end
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
    distances = 0.0

    entries.each do |e|
      distances += e.distance
    end

    (distances / entries.count).round(2)
  end

  def avg_speed(entries)
    speeds    = 0.0
    entries.each do |e|
      speeds += e.speed
    end
    (speeds / entries.count).round(2)
  end
end
