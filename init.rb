require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare do
  require_dependency 'help_link/info_patch'
end

Redmine::Plugin.register :chiliproject_help_link do
  name 'Help Link Changer'
  author 'Jens Ulfert, Felix Schäfer @ finnlabs'
  description 'Point the help link to any URL.'
  version '1.0.5'
  url 'https://github.com/finnlabs/chiliproject_help_link'
  author_url 'http://www.finn.de/team'

  settings :default => {"help_link_target" => "https://www.openproject.org/projects/support"},
           :partial => "settings/chiliproject_help_link_settings.html.erb"

  Redmine::MenuManager.map :top_menu do |menu|
    if Setting.table_exists?
      menu.delete :help
      menu.push :help, Redmine::Info.help_url, :last => true
    end
  end
end
