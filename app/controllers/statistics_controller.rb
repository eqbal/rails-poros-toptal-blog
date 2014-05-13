class StatisticsController < ApplicationController
  def index
    @weekly_reports = Report::GenerateWeekly.new(current_user).call
  end
end
