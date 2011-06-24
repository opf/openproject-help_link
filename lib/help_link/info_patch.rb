module HelpLink
  module InfoPatch
    def self.included(base)
      base.send(:extend, ClassMethods)

      base.class_eval do
        class << self
          alias_method :help_url_without_settings, :help_url unless method_defined?(:help_url_without_settings)
          alias_method :help_url, :help_url_with_settings
        end

        refresh_help_menu if Setting.table_exists? #so that the migrations run. No Settings table exists then.
      end
    end

    module ClassMethods
      def help_url_with_settings
        Setting.plugin_chiliproject_help_link["help_link_target"]
      end

      def refresh_help_menu
        Redmine::MenuManager.map :top_menu do |menu|
          menu.delete :help
          menu.push :help, Redmine::Info.help_url, :last => true
        end
      end
    end
  end
end

Redmine::Info.send(:include, HelpLink::InfoPatch)