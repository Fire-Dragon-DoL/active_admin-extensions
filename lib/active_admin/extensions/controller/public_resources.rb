require 'active_support/concern'

module ActiveAdmin

  module Extensions

    module Controller

      module PublicResources
        extend ActiveSupport::Concern

        included do
          public :resource
          public :collection
        end
      end

    end

  end

end
