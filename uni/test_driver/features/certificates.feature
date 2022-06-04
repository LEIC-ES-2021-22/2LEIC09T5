Feature: Certificates
    The certificate should appear when submitted is pressed

    Scenario: I am able to request a new certificate
        Given That the declaration text is empty
        When I tap the "fab" button
        Then I expect the certificate creation page to appear
        When I tap the "select certificate" dropdown
        Then I expect the certificate creation page to change its' contents
        When I tap the "Submit" button
        Then I return to the certificates page
    
    Scenario: I am able to request a new certificate and then see it in the certificate page
        Given That the declaration text is empty
        When I tap the "fab" button
        Then I expect the certificate creation page to appear
        When I tap the "select certificate" dropdown
        Then I expect the certificate creation page to change its' contents
        When I tap the "Submit" button
        Then I return to the certificates page
        When I refresh the certificate page
        Then I should see the new certificate