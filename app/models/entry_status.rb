class EntryStatus
  include Comparable

  class NotValidEntryStatus < StandardError; end

  OPTIONS = {
    weather:  %w(Sunny Rainy Windy Dry),
    landform: %w(Beach Cliff Desert Flat)
  }

  attr_reader :weather, :landform

  def initialize(weather, landform)
    @weather, @landform = weather, landform
  end

  def <=>(other)
    weather == other.weather && landform == other.landform
  end
end
