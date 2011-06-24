require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare do
  require_dependency 'help_link/info_patch'
end

Redmine::Plugin.register :chiliproject_help_link do
  name 'Help Link Changer'
  author 'Jens Ulfert, Felix Schäfer @ finnlabs'
  description 'Point the help link to any project.'
  version '0.1.0'
  url 'http://finn.de'
  author_url 'http://finn.de/team'
  
  settings :default => {"help_link_target" => 'http://www.redmine.org/guide'}, :partial => 'settings/chiliproject_help_link_settings.html.erb'
end
