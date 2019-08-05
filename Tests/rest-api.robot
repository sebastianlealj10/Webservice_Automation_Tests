*** Settings ***
Documentation  Testing webservices using https://github.com/typicode/json-server
Library    ExtendedRequestsLibrary

*** Variables ***

${idnumber}=  5

*** Test Cases ***
System must make a get request
    [Documentation]  Make a Get Request to the json-server
    [Tags]  Webservices
    create session  localhost  http://localhost:3000
    ${response} =  Get Request  localhost  /posts
    should be equal as strings  ${response.status_code}  200
    ${json} =  set variable  ${response.json()}
    log  ${json}

System must make a post request
    create session  localhost  http://localhost:3000
    &{data}=    Create Dictionary   id=${idnumber}  title=jsonserver  author=sebas
    &{header}=    Create Dictionary  content-type=application/json
    ${response} =  post request  localhost  /posts  json=${data}  headers=${header}
    should be equal as strings  ${response.status_code}  201