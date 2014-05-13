module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | ToptalTask"
    end
  end

  def decorate(object, klass = nil)
    klass ||= "#{object.class}Decorator".constantize
    decorator = klass.new(object, self)
    yield decorator if block_given?
    decorator
  end
end
