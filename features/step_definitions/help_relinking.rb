#-- copyright
# OpenProject Help Link Plugin
#
# Copyright (C) 2011 - 2014 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#++

Given(/^the help link setting points to help page$/) do
  new_values = Setting.plugin_openproject_help_link
  new_values["help_link_target"] = OpenProject::Info.help_url
  Setting.plugin_openproject_help_link = new_values

  Redmine::MenuManager.map :top_menu do |menu|
    menu.delete :help
    menu.push :help, OpenProject::Info.help_url, :last => true
  end
end

When(/^I visit the root page$/) do
  visit '/'
end

Then(/^I should have the help link$/) do
  page.should have_link('Help', :href => OpenProject::Info.help_url)
end
