########################################
# File:operational_systems.rb
# Porpose: Indicates relationships with operational systems
# GNU AGPLv3
########################################

class OperationalSystem < ActiveRecord::Base
	has_many :projects
end
