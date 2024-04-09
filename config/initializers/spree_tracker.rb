Rails.application.config.after_initialize do

    # Rails.application.config.spree_backend.main_menu.insert_before('stocks',
    #   Spree::Admin::MainMenu::SectionBuilder.new('AnalyticsTrackers ', 'inbox-fill.svg').
    #       with_admin_ability_check(Spree::Tracker).
    #       with_items([
    #        Spree::Admin::MainMenu::ItemBuilder.new('All', Spree::Core::Engine.routes.url_helpers.admin_trackers_path).build
    #       ]).
    #       build
    # )
  
    Rails.application.config.spree_backend.main_menu.add(
        Spree::Admin::MainMenu::ItemBuilder.new('analytics_trackers', Spree::Core::Engine.routes.url_helpers.admin_trackers_path).
        with_icon_key('inbox-fill.svg').
        build
    )


  end