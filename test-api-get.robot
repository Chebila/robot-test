*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://job-search15.p.rapidapi.com/
${API_KEY}     5c720bcc03msh2f994d1ed852901p174fc2jsncbfc31cdba11
${API_HOST}    job-search15.p.rapidapi.com

*** Test Cases ***
Fetch Jobs Using RequestsLibrary
    ${headers}=    Create Headers
    ${data}=       Create Dictionary    api_type=fetch_jobs    search_terms=marketing    location=Chicago, IL    page=1
    ${response}=   POST    ${BASE_URL}    headers=${headers}    json=${data}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    Response Status Code: ${response.status_code}
    Log    Response Headers: ${response.headers}
    Log    Response Body: ${response.json()}

*** Keywords ***
Create Headers
    ${headers}=    Create Dictionary    x-rapidapi-key=${API_KEY}    x-rapidapi-host=${API_HOST}    Content-Type=application/json
    [Return]    ${headers}

