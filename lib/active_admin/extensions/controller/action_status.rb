module ActiveAdmin

  module Extensions

    module Controller

      module ActionStatus

        [:create, :update, :destroy].each do |parsed_action|
          define_method(parsed_action) do |&block|
            super() do |success, failure|
              @action_successful = failure.class != InheritedResources::BlankSlate
              block.call(success, failure) unless block.nil?
            end
          end
        end

        def action_successful?
          @action_successful = false if @action_successful.nil?
          @action_successful
        end

        def action_failure?
          !action_successful?
        end

      end

    end

  end

end
