########################################
# File:languages.rb
# Porpose: Indicates relationships with languages
# GNU AGPLv3
########################################

# Class that sets a Langguage and its realtions
class Language < ActiveRecord::Base
	has_many :projects
end
