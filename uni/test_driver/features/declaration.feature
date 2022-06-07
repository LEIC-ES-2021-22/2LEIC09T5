Feature: Declaration
    The declaration text should appear when the respective button is pressed

    Scenario: "Multiusos" declaration appears when its button is pressed
        Given I open the drawer
        And The user taps the declarations page button
        And The declaration text is empty
        When I tap the "multiusos" declaration button
        Then I expect the declaration text to not be empty
        And I expect the declaration text to have the text related to the "multiusos" declaration
    
    Scenario: "Deslocamento" declaration appears when its button is pressed
        Given I open the drawer
        And The user taps the declarations page button
        And The declaration text is empty
        When I tap the "deslocamento" declaration button
        Then I expect the declaration text to not be empty
        And I expect the declaration text to have the text related to the "deslocamento" declaration