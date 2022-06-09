Feature: Certificates
    The certificate should appear when submitted is pressed

    Scenario: I am able to request a new certificate and then see it in the certificate page
        Given I open the drawer
        And The user taps the certificates page button
        And I am in the certificates page
        When I tap the FAB button
        When I select a certificate
        Then I tap the "Submit" button
        Then I return to the certificates page
