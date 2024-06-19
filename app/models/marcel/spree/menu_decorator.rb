module Marcel
    module Spree
      module MenuDecorator

        def self.prepended(base)
          # puts base.to_s
          # puts base::MENU_LOCATIONS.to_s
          location_name = 'sidebar'
          location_name2 = 'footer_small'
          location_name3 = 'footer_2'
          base::MENU_LOCATIONS.push('Sidebar')
          base::MENU_LOCATIONS.push('Footer small')
          base::MENU_LOCATIONS.push('Footer 2')
          base::MENU_LOCATIONS_PARAMETERIZED.push(location_name)
          base::MENU_LOCATIONS_PARAMETERIZED.push(location_name2)
          base::MENU_LOCATIONS_PARAMETERIZED.push(location_name3)

          base.define_singleton_method("for_#{location_name}") do |locale|
            menu = find_by(location: location_name, locale: locale.to_s)
            menu.root if menu.present?
          end
          base.define_singleton_method("for_#{location_name2}") do |locale|
            menu = find_by(location: location_name2, locale: locale.to_s)
            menu.root if menu.present?
          end
          base.define_singleton_method("for_#{location_name3}") do |locale|
            menu = find_by(location: location_name3, locale: locale.to_s)
            menu.root if menu.present?
          end

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

      end
    end
  end
  
  ::Spree::Menu.prepend Marcel::Spree::MenuDecorator if ::Spree::Menu.included_modules.exclude?(Marcel::Spree::MenuDecorator)