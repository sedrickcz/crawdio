module Refinery
  module UserHistories
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::UserHistories

      engine_name :refinery_user_histories

      initializer "register refinerycms_user_histories plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "user_histories"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.user_histories_admin_user_histories_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/user_histories/user_history',
            :title => 'field'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::UserHistories)
      end
    end
  end
end
