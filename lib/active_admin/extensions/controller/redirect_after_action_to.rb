require 'active_support/concern'
require 'active_admin/extensions/controller/action_status'
require 'active_admin/extensions/controller/public_resources'

module ActiveAdmin

  module Extensions

    module Controller

      module RedirectAfterActionTo
        extend ActiveSupport::Concern
        include PublicResources

        [:create, :update, :destroy].each do |action|
          define_method(action) do |&block|
            super() do |success, failure|
              block.call(success, failure) unless block.nil?

              action_redirect = redirect_after_action[action_name.to_sym]

              unless action_redirect.nil?
                success.html do
                  keep_flash  = action_redirect[:keep_flash]
                  path        = action_redirect[:path]
                  parsed_path = if path.try(:lambda?)
                    path.call(self).to_s
                  else
                    path.to_s
                  end

                  flash.keep if keep_flash
                  redirect_to parsed_path
                end
              end
            end
          end
        end

        def redirect_after_action
          self.class.redirect_after_action
        end

        module ClassMethods

          def redirect_after_action
            @redirect_after_action ||= {}
          end

          def redirect_after_action_to(actions:, path:, keep_flash: true)
            unless actions.respond_to? :each
              actions = [actions]
            end

            actions.each do |action|
              parsed_action = if action.try(:lambda?)
                action.call.to_sym
              else
                action.to_sym
              end

              redirect_after_action[parsed_action] = {
                path: path,
                keep_flash: keep_flash
              }
            end
          end

          def redirect_after_action_to_member_url(
            actions:,
            url_helper:,
            keep_flash: true
          )
            redirect_after_action_to(
              actions: actions,
              path: ->(controller) {
                controller.send(url_helper, controller.send(:resource))
              },
              keep_flash: keep_flash
            )
          end          
          
        end

      end

    end

  end

end
