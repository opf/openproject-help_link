#    OpenProject Help Link - Allows to modify the help link target
#    Copyright (C) 2013  Finn GmbH
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'rails/engine'

module OpenProject::HelpLink
  class Engine < ::Rails::Engine
    initializer 'helplink.register_test_paths' do |app|
      app.config.plugins_to_test_paths << self.root
    end

    initializer 'help_link.append_migrations' do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    config.to_prepare do
      require 'redmine/plugin'

      spec = Bundler.environment.specs['openproject-help_link'][0]

      require 'open_project/help_link/info_patch'

      Redmine::Plugin.register :openproject_help_link do
        name 'OpenProject Help Link Changer'
        author ((spec.authors.kind_of? Array) ? spec.authors[0] : spec.authors)
        author_url spec.homepage
        description spec.description
        version spec.version
        url "https://www.openproject.org/projects/help-link-changer"

        requires_openproject ">= 3.0.pre23"

        settings :default => {"help_link_target" => "https://www.openproject.org/projects/support"},
                 :partial => "settings/openproject_help_link_settings.html.erb"

        Redmine::MenuManager.map :top_menu do |menu|
          if Setting.table_exists?
            menu.delete :help
            menu.push :help, OpenProject::Info.help_url, :last => true, :caption => I18n.t('label_help'), :html => { :accesskey => OpenProject::AccessKeys.key_for(:help), :class => "icon5 icon-help"}
          end
        end
      end

      unless OpenProject::Info.included_modules.include?(OpenProject::HelpLink::InfoPatch)
          OpenProject::Info.send(:include, OpenProject::HelpLink::InfoPatch)
      end
    end
  end
end
