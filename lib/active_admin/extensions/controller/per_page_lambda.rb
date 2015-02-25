module Extensions

  module ActiveAdmin

    module Controller

      module PerPageLambda

        def per_page
          if active_admin_config.paginate
            @per_page || if active_admin_config.per_page.try(:lambda?)
              active_admin_config.per_page.call(self)
            else
              super
            end
          else
            super
          end
        end

      end

    end

  end

end
