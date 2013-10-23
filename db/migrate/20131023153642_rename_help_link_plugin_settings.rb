require Rails.root.join("db","migrate","migration_utils","setting_renamer").to_s
class RenameHelpLinkPluginSettings < ActiveRecord::Migration
  def up
    Migration::SettingRenamer.rename("plugin_help_link","plugin_openproject_help_link")
  end

  def down
    Migration::SettingRenamer.rename("plugin_openproject_help_link","plugin_help_link")
  end
end
