class OpenHubProjectCollection < ActiveResource::Collection
  def initialize(parsed = {})
    @elements = parsed['result']
  end
end