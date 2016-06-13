$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'openproject-help_link'
  s.version     = '5.1.0'
  s.authors     = 'OpenProject GmbH'
  s.email       = 'info@openproject.com'
  s.homepage    = 'https://community.openproject.org/projects/help-link-changer'
  s.summary     = 'OpenProject Help Link'
  s.description = "This plugin allows you to change the target of the help link
                   in your OpenProject. Doing so allows you to e.g. have a
                   support project within your OpenProject."

  s.files = Dir['lib/**/*'] + ['README.md']
  s.post_install_message = <<-MESSAGE
    openproject-help_link has been fully integrated into OpenProject 5.1.
    Please remove this plugin from your Gemfile.plugin entries.
  MESSAGE
end
