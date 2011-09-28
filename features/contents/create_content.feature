Feature: Create content
  In order to show contributions
  As an administrator
  I want to create project's content

  Background: 
    Given I'm authenticated as "Paula"
    Given a project titled "Booka"

  @current
  Scenario: Add content
    When I go to "Booka" contents page
    Then I should see "Añadir material"