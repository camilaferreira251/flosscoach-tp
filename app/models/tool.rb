########################################
# File: tool.rb
# Porpose: set tool and its relations
# GNU AGPLv3
########################################

#this class defines a tool and his relation with projects
class Tool < ActiveRecord::Base
	has_many :projects
end
