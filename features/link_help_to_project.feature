Feature: Link help to feature
  # As a System Admin
  # I want to relink the help button to a project inside the system
  # So that I can provide help that is customized for the system

  Scenario: HELP link points to public project inside the system
    Given there is 1 user with:
      | login | bob |
    And there is 1 Project with the following:
      | Identifier | tas |
      | Name | Support |
      | Is_public | true |
    And the help link setting points to the project "Support"
    And there is 1 Project with the following:
      | Name | loginproject |
    And there is a role "Loginrole"
    And the user "bob" is a "Loginrole" in the project "loginproject"
    And I am logged in as "bob"
    When I follow "Help" within "#top-menu"
    Then I should be on the page of the project "Support"
