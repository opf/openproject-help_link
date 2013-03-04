module OpenprojectHelpLink
  module InfoPatch
    def self.included(base)
      base.send(:extend, ClassMethods)

      base.class_eval do
        unloadable

        class << self
          alias_method_chain :help_url, :settings
        end
      end
    end

    module ClassMethods
      def help_url_with_settings
        Setting.plugin_openproject_help_link["help_link_target"]
      end
    end
  end
end
