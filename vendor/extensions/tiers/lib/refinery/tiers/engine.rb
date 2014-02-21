module Refinery
  module Tiers
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Tiers

      engine_name :refinery_tiers

      initializer "register refinerycms_tiers plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "tiers"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.tiers_admin_tiers_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/tiers/tier'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Tiers)
      end
    end
  end
end
