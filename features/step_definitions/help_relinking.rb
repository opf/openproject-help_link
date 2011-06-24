Given /^the help link setting points to the project (.+)$/ do |project_name|
  project_name.gsub!("\"","")
  p = Project.find_by_name(project_name)
  new_values = Setting.plugin_redmine_pi_customizing
  new_values["help_link_target"] = "/projects/#{p.identifier}"
  Setting.plugin_redmine_pi_customizing = new_values

  Redmine::MenuManager.map :top_menu do |menu|
    menu.delete :help
    menu.push :help, Redmine::Info.help_url, :last => true
  end
end