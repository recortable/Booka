Feature: Create content
  In order to show contributions
  As an administrator
  I want to create project's content

  Background: 
    Given a project titled "Mis cosillas"
    And I'm authenticated as "Paula"

  Scenario: I'm able to add content if I admin the project
    Given I have "admin" permission on "Mis cosillas"
    When I go to "Mis cosillas" contents page
    And debug page
    Then I should see "Añadir material"

  @current
  Scenario: I can create new content
    Given I have "admin" permission on "Mis cosillas"
    When I go to "Mis cosillas" new content page
    And I fill in "content[title]" with "Mi título"
    And I fill in "content[summary]" with "Mi resúmen"
    And I fill in "content[body]" with "Mi contenido"
    And I press "Guardar"
    Then I should be on "Mi título" content page
    Then I should see "Mi título"
    Then I should see "Mi contenido"
    Then I should see "Mi resúmen"