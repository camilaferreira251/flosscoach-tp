module ActiveResource #:nodoc:
  module Extend
    module AuthWithApi
      module ClassMethods
        def element_path_with_auth(id, prefix_options = {}, query_options = nil)
          query_options.merge!({:token => self.api_key})
          element_path_without_auth(id, prefix_options, query_options)
        end
        def collection_path_with_auth(prefix_options = {}, query_options = nil)
          query_options.merge!({:token => self.api_key})
          collection_path_without_auth(prefix_options, query_options)
        end
      end

      def self.included(base)
        base.class_eval do
          extend ClassMethods
          class << self
            alias_method_chain :element_path, :auth
            # alias_method_chain :new_element_path, :auth
            alias_method_chain :collection_path, :auth
            attr_accessor :api_key
          end
        end
      end  
    end
  end
end