module HelpLinkSettingsHelper
  def help_link_setting
    Setting.plugin_help_link["help_link_target"]
  end
end
