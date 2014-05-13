module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | ToptalTask"
    end
  end
end
