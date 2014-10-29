# module RedirectUpdate
#   def update
#     super() do |success, failure|
#       yield(success, failure) if block_given?
#       success.html do
#         redirect_to edit_user_url(resource)
#       end
#     end
#   end
# end
require 'active_support/concern'
require 'active_admin/extensions/controller/action_status'

module ActiveAdmin

  module Extensions

    module Controller

      module RedirectAfterActionTo
        extend ActiveSupport::Concern

        module ClassMethods

          def redirect_after_action_to(actions:, path:, keep_flash: true)
            controller do

              unless actions.respond_to? :each
                actions = [actions]
              end

              actions.each do |action|
                parsed_action = if action.try(:lambda?)
                  action.call.to_sym
                else
                  action.to_sym
                end

                define_method(parsed_action) do |&block|
                  super() do |success, failure|
                    block.call(success, failure)
                    success.html do
                      flash.keep if keep_flash
                      redirect_to if path.try(:lambda?)
                        path.call(self).to_s
                      else
                        path.to_s
                      end
                    end
                  end
                end
              end

            end

          end

          def redirect_after_action_to_member_url(
            actions:,
            url_helper:,
            keep_flash: true
          )
            redirect_after_action_to(
              actions: action_or_actions,
              path: ->(controller) {
                controller.send(url_method, controller.send(:resource))
              },
              keep_flash: keep_flash
            )
          end          
          
        end

      end

    end

  end

end

::ActiveAdmin::DSL.send(:include, ActiveAdmin::Extensions::DSL::RedirectActionTo)
