module Marcel
    module Spree
      module StockLocationDecorator

        def self.prepended(base)
          # puts base.to_s
          base.before_destroy :check_associations, prepend: true

        end
  
        # def some_method
        #   ...
        # end
  
        protected
  
        # def strip_whitespaces
        #   ...
        # end

        # def add_extra_menu_location
        #   ...
        # end
        def check_associations
            if shipments.count > 0
              errors.add(:base, "Cannot delete Stock Location. You have order or shipments with it.")
              throw(:abort)
            end
        end

      end
    end
  end
  
  ::Spree::StockLocation.prepend Marcel::Spree::StockLocationDecorator if ::Spree::StockLocation.included_modules.exclude?(Marcel::Spree::StockLocationDecorator)