module Marcel
  module Spree
    module OptionTypeDecorator

      def self.prepended(base)
        # base.before_destroy :check_associations, prepend: true
      end

      def filter_param
        name.parameterize if name.present?
      end

      protected

      # def strip_whitespaces
      #   ...
      # end

    end
  end
end

::Spree::OptionType.prepend Marcel::Spree::OptionTypeDecorator if ::Spree::OptionType.included_modules.exclude?(Marcel::Spree::OptionTypeDecorator)