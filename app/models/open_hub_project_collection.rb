# Class for initialize openhub API for other classes can use your data.

class OpenHubProjectCollection < ActiveResource::Collection
  def initialize(parsed = {})
    @elements = parsed['result']
  end
end