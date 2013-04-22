Feature: Settings for Help Link

  Scenario: Help Link Settings fields
    Given I am admin
    When I go to the help_link settings page
    Then there should be a "settings[help_link_target]" field
