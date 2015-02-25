require 'active_admin/extensions/controller/action_status'

module ActiveAdmin

  module Extensions

    module Controller

      module FlashMessages

        module Create
          include ::ActiveAdmin::Extensions::Controller::ActionStatus

          def create
            super() do |success, failure|
              if action_successful?
                flash.notice = I18n.t(
                  'active_admin.extensions.controller.flash_messages.create',
                  resource: resource.class.model_name.human
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
