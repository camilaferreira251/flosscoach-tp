# Class for initialize openhub API for other classes can use your data.

class OpenHubProjectCollection < ActiveResource::Collection
  # initialize elements with parsed result
  def initialize(parsed = {})
    # declare elements of openhup
    @elements = parsed['result']
  end
end