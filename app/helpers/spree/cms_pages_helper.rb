module Spree
    module CmsPagesHelper
      def simple_page?(page)
        page.content.present? && !page.sections?
      end
  
      def section_tags(section, &block)
        inner_content = content_tag(:div, class: section.css_classes, &block)
        section_class = section.id.to_s+"_section"
  
        if section.fullscreen?
          content_tag(:section, class: section_class , &block)
        else
          content_tag(:section, inner_content, class: "container #{section_class}")
        end
      end
  
      def build_section(section)
        section_tags(section) do
            render "spree/shared/cms/sections/#{spree_resource_path(section)}", section: section
        end
      end
    end
  end