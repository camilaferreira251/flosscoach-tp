# Class with structure to use data of openhug API

require 'active_resource'
# This class is a XML formater that uses active resources
class MyXMLFormatter
  include ActiveResource::Formats::XmlFormat

  # Find the project in the openhub XML.
  def decode(xml)
    ActiveResource::Formats::XmlFormat.decode(xml)['result']['project']
  end
end

# This class defines an open hub project
class OpenHubProject < ActiveResource::Base

  # Openhub site
  self.site = "https://www.openhub.net/"

  # Define format of openhub XML
  self.format =  MyXMLFormatter.new

  # Define the name os element for serch
  self.element_name = "projects"
  
  @headers = { 'api_key' => ENV["OPENHUB_KEY"] }
  #this routine find project by id
  def self.find_by_id(id)
    self.find(id, :params => {'api_key' => ENV["OPENHUB_KEY"]})
  end

  #Define params fo search on openhub.
  def self.find_by_name(nome)
    self.find(:all, :params => {'query' => nome ,'api_key' => ENV["OPENHUB_KEY"]})
  end
end
