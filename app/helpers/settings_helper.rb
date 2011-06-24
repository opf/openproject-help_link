module SettingsHelper
  include ApplicationHelper

  unloadable

  def help_link_setting
    Setting.plugin_chiliproject_help_link["help_link_target"]
  end
end