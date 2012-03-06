require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare do
  require_dependency 'help_link/info_patch'
end

Redmine::Plugin.register :chiliproject_help_link do
  name 'Help Link Changer'
  author 'Jens Ulfert, Felix Schäfer @ finnlabs'
  description 'Point the help link to any URL.'
  version '1.0.3'
  url 'https://github.com/finnlabs/chiliproject_help_link'
  author_url 'http://www.finn.de/team'

  settings :default => {"help_link_target" => "https://www.chiliproject.org/help"},
           :partial => "settings/chiliproject_help_link_settings.html.erb"
end
