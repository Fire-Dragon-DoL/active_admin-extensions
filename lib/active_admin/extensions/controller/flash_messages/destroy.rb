require 'active_admin/extensions/controller/action_status'

module ActiveAdmin

  module Extensions

    module Controller

      module FlashMessages

        module Destroy
          include ::ActiveAdmin::Extensions::Controller::ActionStatus

          def destroy
            super() do |success, failure|
              flash.notice = I18n.t(
                'active_admin.extensions.controller.flash_messages.destroy'
              ) if action_successful?
              yield(success, failure) if block_given?
            end
          end
        end

      end

    end

  end

end
