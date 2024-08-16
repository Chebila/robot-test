*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://rapid-linkedin-jobs-api.p.rapidapi.com
${API_KEY}     6fc4363381mshccc938c5300e831p1a2d4cjsnc09dc6d2a411
${API_HOST}    rapid-linkedin-jobs-api.p.rapidapi.com

*** Test Cases ***
Fetch Jobs Using New Endpoint
    ${headers}=                   Create Headers
    ${response}=    GET    ${BASE_URL}/search-jobs-v2    headers=${headers}    params=keywords=golang&locationId=92000000&datePosted=anyTime&sort=mostRelevant
    Should Be Equal As Numbers    ${response.status_code}    200
    Log                           ${response.text}

*** Keywords ***
Create Headers
    ${headers}=    Create Dictionary    x-rapidapi-key=${API_KEY}    x-rapidapi-host=${API_HOST}
    RETURN         ${headers}
