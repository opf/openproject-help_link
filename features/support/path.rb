module HelpLinkNavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    when /^the help_link settings page$/
      "/settings/plugin/openproject_help_link"
    else
      super
    end
  end
end

World(HelpLinkNavigationHelpers)
