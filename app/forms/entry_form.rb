class EntryForm
  include ActiveModel::Model

  attr_accessor :distance, :time_period, :date_time,
                :status_weather, :status_landform

  validates_presence_of :distance, :time_period, :date_time

  validates_numericality_of :distance, :time_period

  validates :status_weather, inclusion: {
    in: EntryStatus::OPTIONS[:weather]
  }

  validates :status_landform, inclusion: {
    in: EntryStatus::OPTIONS[:landform]
  }
end


