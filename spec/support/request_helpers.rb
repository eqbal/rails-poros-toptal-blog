module Requests
  module JsonHelpers
    def my_json
      @json = JSON.parse(response.body)
    end
  end
end