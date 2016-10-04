########################################
# File: project.rb
# Porpose: Indicates all relationships with project
# GNU AGPLv3
########################################

class Project < ActiveRecord::Base

  # Indicates project belongs to languages
  belongs_to :languages 

  # Indicates project belongs to operational system
  belongs_to :operational_systems 

  # Indicates project belongs to tools
  belongs_to :tools

  # Indicates project belongs to users
  belongs_to :users

  # Search for a project by name
  def self.search(search)
    if search
      Project.where('name LIKE ?', "%#{search}%")
    else
      Project.all
    end
  end


end
