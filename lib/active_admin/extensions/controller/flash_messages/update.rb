require 'active_admin/extensions/controller/action_status'

module ActiveAdmin

  module Extensions

    module Controller

      module FlashMessages

        module Update
          include ::ActiveAdmin::Extensions::Controller::ActionStatus

          def update
            super() do |success, failure|
              if action_successful?
                flash.notice = I18n.t(
                  'active_admin.extensions.controller.flash_messages.update'
                )
              end
              yield(success, failure) if block_given?
            end
          end
        end

      end

    end

  end

end
