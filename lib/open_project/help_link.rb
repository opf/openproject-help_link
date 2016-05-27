module OpenProject
  module HelpLink
    # Merged into OpenProject core
    ActiveSupport::Deprecation.warn <<-DEPRECATION_NOTE.strip_heredoc
      openproject-help_link has been fully integrated into OpenProject 5.1.
      Please remove this plugin from your Gemfile.plugin entries.
      
      Use the OpenProject configuration 'force_help_link' to override the help URL.
    DEPRECATION_NOTE
  end
end