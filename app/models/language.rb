########################################
# File:languages.rb
# Porpose: Indicates relationships with languages
# GNU AGPLv3
########################################

class Language < ActiveRecord::Base
	has_many :projects
end
