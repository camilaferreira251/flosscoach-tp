require 'active_resource'

class MyXMLFormatter
  include ActiveResource::Formats::XmlFormat

  def decode(xml)
    ActiveResource::Formats::XmlFormat.decode(xml)['result']['project']
  end
end


class OpenHubProject < ActiveResource::Base

	self.site = "https://www.openhub.net/"
	self.format =  MyXMLFormatter.new
	self.element_name = "projects"

 	@headers = { 'api_key' => ENV["OPENHUB_KEY"] }

 	def self.find_by_id(id)
 		self.find(id, :params => {'api_key' => ENV["OPENHUB_KEY"]})
 	end
 	def self.find_by_name(nome)
 		self.find(:all, :params => {'query' => nome ,'api_key' => ENV["OPENHUB_KEY"]})
 	end
end
