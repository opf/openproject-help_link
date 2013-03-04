module OpenprojectHelpLinkSettingsHelper
  def help_link_setting
    Setting.plugin_openproject_help_link["help_link_target"]
  end
end
