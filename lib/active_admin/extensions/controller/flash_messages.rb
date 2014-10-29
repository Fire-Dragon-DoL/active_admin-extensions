require 'active_admin/extensions/controller/flash_messages/create'
require 'active_admin/extensions/controller/flash_messages/update'
require 'active_admin/extensions/controller/flash_messages/destroy'

module ActiveAdmin

  module Extensions

    module Controller

      module FlashMessages
        include Create
        include Update
        include Destroy
      end

    end

  end

end
