require 'delegate'

class BaseDecorator < SimpleDelegator
  def initialize(base, view_context)
    super(base)
    @object = base
    @view_context = view_context
  end

  private

  def self.decorates(name)
    define_method(name) do
      @object
    end
  end

  # This method acts as a proxy for view context.
  #
  # By default the view context is an instance of a view class, the default
  # view class being ActionView::Base. You can access view helpers with this:
  #
  #  _h.content_tag :div, 'foo', class: 'bar'
  def _h
    @view_context
  end

  def html_escape(*args)
    ERB::Util.html_escape(*args)
  end
end
