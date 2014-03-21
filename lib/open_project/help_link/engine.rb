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
    engine_name :openproject_help_link

    def self.settings
      { :default => {"help_link_target" => "https://www.openproject.org/projects/support"},
        :partial => "settings/openproject_help_link_settings.html.erb" }
    end

    include OpenProject::Plugins::ActsAsOpEngine

    register 'openproject-help_link',
             :author_url => 'http://finn.de',
             :requires_openproject => '>= 3.0.0',
             :settings => settings do

      Redmine::MenuManager.map :top_menu do |menu|
        if Setting.table_exists?
          menu.delete :help
          menu.push :help, OpenProject::Info.help_url, :last => true, :caption => I18n.t('label_help'),
          :html => { :accesskey => OpenProject::AccessKeys.key_for(:help), :class => "icon5 icon-help"}
        end
      end
    end

    config.to_prepare do
      require_dependency 'open_project/help_link/patches/info_patch'
    end
  end
end
