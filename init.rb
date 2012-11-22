require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare do
  require_dependency 'help_link/info_patch'
end

Redmine::Plugin.register :help_link do
  name 'Help Link Changer'
  author 'finn GmbH'
  description 'Point the help link to any URL.'
  version '2.0.0'
  url 'https://github.com/finnlabs/help_link'
  author_url 'http://www.finn.de/team'

  settings :default => {"help_link_target" => "https://www.openproject.org/projects/support"},
           :partial => "settings/help_link_settings.html.erb"

  Redmine::MenuManager.map :top_menu do |menu|
    if Setting.table_exists?
      menu.delete :help
      menu.push :help, Redmine::Info.help_url, :last => true
    end
  end
end
