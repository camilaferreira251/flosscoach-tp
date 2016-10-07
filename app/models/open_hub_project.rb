# Class with structure to use data of openhug API

require 'active_resource'
#this class is a XML formater that uses active resources
class MyXMLFormatter
  include ActiveResource::Formats::XmlFormat

  def decode(xml)
    ActiveResource::Formats::XmlFormat.decode(xml)['result']['project']
  end
end

# this class defines an open hub project
class OpenHubProject < ActiveResource::Base

  self.site = "https://www.openhub.net/"
  self.format =  MyXMLFormatter.new
  self.element_name = "projects"
  
  @headers = { 'api_key' => ENV["OPENHUB_KEY"] }
  #this routine find project by id
  def self.find_by_id(id)
    self.find(id, :params => {'api_key' => ENV["OPENHUB_KEY"]})
  end
  def self.find_by_name(nome)
    self.find(:all, :params => {'query' => nome ,'api_key' => ENV["OPENHUB_KEY"]})
  end
end
