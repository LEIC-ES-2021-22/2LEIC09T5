# Use Case Model  

## UML diagram

![use case diagram](../images/usecase.png)

|||
| --- | --- |
| *Name* | Request Certificate |
| *Actor* |  Student | 
| *Description* | The student requests a certificate through the application interface. |
| *Preconditions* | - The student is eligible to request a certificate. <br> - The system has certificates available to issue. |
| *Postconditions* | - The student gets a confirmation on the app that the certificate request was successful. |
| *Normal flow* | 1. The user accesses the certificate request page.<br> 2. The system shows the list of certificates that are able to be requested.<br> 3. The student chooses a certificate to request.<br> 4. The system asks the student for confirmation.<br> 5. The student confirms the request.<br> 6. The system applies the request.<br> 7. The system shows a message confirming the success of the operation. |
| *Alternative flows and exceptions* | 1. [Request Failure] If, in step 6, the request fails, the system gives the student the possibility to cancel or retry. |

<br/><br/>

|||
| --- | --- |
| *Name* | Retrieve Declaration |
| *Actor* |  Student | 
| *Description* | The student can view and download a declaration.  |
| *Preconditions* | - The student is eligible to view and use a declaration. <br> - SIGARRA has declarations available to be used. |
| *Postconditions* | - The student views the declaration in-app and, if necessary. <br> - The declaration gets downloaded to the user's phone if the student wishes. |
| *Normal flow* | 1. The user accesses the eligible declaration page.<br> 2. The system shows the list of declarations that are able to be used.<br> 3. The student chooses a declaration to view.<br> 4. The system displays the declaration in-app.<br> 5. If wanted, the student can download the declaration.<br> 6. In that case, the system downloads the declaration to the student's phone. |
| *Alternative flows and exceptions* | N/A|

<br/><br/>

|||
| --- | --- |
| *Name* | Check Certificate Status |
| *Actor* |  Student | 
| *Description* | The student requests to check the status of their certificate request. |
| *Preconditions* | - The student has issued a certificate request. |
| *Postconditions* | - The student is informed of the status of their certificate requests. |
| *Normal flow* | 1. The student accesses the app page relative to viewing all certificate request's status.<br>2. The system presents the status of the certificate requests to the student.|
| *Alternative flows and exceptions* | N/A |

<br/><br/>

|||
| --- | --- |
| *Name* | Download Approved Certificates |
| *Actor* |  Student | 
| *Description* | Download an available certificate from SIGARRA to the user's device. |
| *Preconditions* | - There should be at least one available certificate to be downloaded. |
| *Postconditions* | - The user gets the certificate as a pdf document. |
| *Normal flow* | 1. The user accesses the available certificates page of app. <br> 2. The app shows the list of certificates and available certificates display a download option. <br> 3. The user selects the download button for their desired certificate. <br> 4. The pdf file is downloaded to the user's device. |
| *Alternative flows and exceptions* | 1. [SIGARRA fails to send the file] An error message is displayed in place of step 4. |

<br/><br/>

|||
| --- | --- |
| *Name* | Justify Absences |
| *Actor* | Student |
| *Description* | The student justifies one or more absences from classes |
| *Preconditions* | - The student was absent in one or more classes |
| *Postconditions* | - An email gets sent from the student's university email to the relevant faculty member |
| *Normal flow* | 1. The student accesses the app page for justifying absences. <br> 2. The student fills a form with the relevant information needed to justify the absence. <br> 3. The app sends an email from the student's university email to the relevant faculty member that should process the request. |
| *Alternative flows and exceptions* | N/A |

<br/><br/>

|||
| --- | --- |
| *Name* | Request Class Change |
| *Actor* |  Student | 
| *Description* | The student request a change from class X into class Y, in a certain course unit. |
| *Preconditions* | - The student is enrolled in the unit and in class X. <br> - Class X is assigned to students of that year. <br> - The new class's schedule does not interfere with the existing student's schedule. |
| *Postconditions* | - Information about available exchanges is updated. |
| *Normal flow* | 1. The student accesses the "Request Class Change" page.<br> 2. The student fills in a form with the information of the course unit, their current class and the class they wish to change to.<br> 3. UNI updates its current available class changes.<br> 4. UNI finds possible matches to the request within its database. |
| *Alternative flows and exceptions* | 1. [Verify status] If, in step 1 the user does not fill the form, they may check all currently active class changes. |

<br/><br/>

|||
| --- | --- |
| *Name* |  Check Class Change Request |
| *Actor* |  Board | 
| *Description* | The board has received a class change request from a student and has to accept or refuse the request |
| *Preconditions* | - A valid request has been received |
| *Postconditions* | - The student is notified of the decision made on their request <br> - The student making the request is moved to the class they requested, if possible <br> - The student is removed from the class they were originally in, provided the request was accepted |
| *Normal flow* | 1. The board accesses the "Class Change Requests" tab <br> 2. The application shows the list of requests not yet handled <br> 3. The board selects whether to allow/refuse the request <br> 4. The system changes (or not) the student's class|
| *Alternative flows and exceptions* | 1. [Put on hold for vacancies] If the class the student wishes to change to has no vacancies left, they are put on a waiting list until a student from the target class chooses to trade classes with them |