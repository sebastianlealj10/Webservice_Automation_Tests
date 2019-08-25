*** Settings ***
Documentation  Testing webservices using https://github.com/typicode/json-server
Library    ExtendedRequestsLibrary
*** Variables ***
${idnumber}=  32

*** Test Cases ***
System must make a post request
    [Documentation]  Make a post request
    [Tags]  Webservices
    create session  localhost  http://localhost:3000
    &{data}=      Create Dictionary   id=${idnumber}  title=jsonserver  author=sebas
    &{header}=    Create Dictionary  content-type=application/json
    ${response} =  post request  localhost  /posts  json=${data}  headers=${header}
    should be equal as strings  ${response.status_code}  201

System must make a get request
    [Documentation]  Make a Get Request to the json-server
    [Tags]  Webservices
    ${response} =  Get Request  localhost  /posts/${idnumber}
    should be equal as strings  ${response.status_code}  200
    ${json} =  set variable  ${response.json()}
    log  ${json}
    should be equal as strings  ${response.json()}  {u'author': u'sebas', u'id': u'${idnumber}', u'title': u'jsonserver'}

System must make a put request
    [Documentation]  Make a put request to the json-server
    [Tags]  Webservices
    &{data}=      Create Dictionary   title=newjsonserv  author=sebas
    &{header}=    Create Dictionary  content-type=application/json
    ${response} =  put request  localhost  /posts/${idnumber}  json=${data}  headers=${header}
    should be equal as strings  ${response.status_code}  200
    ${json} =  set variable  ${response.json()}
    log  ${json}
    should be equal as strings  ${response.json()}  {u'author': u'sebas', u'id': u'${idnumber}', u'title': u'newjsonserv'}

System must make a delete request
    [Documentation]  Make a delete request to the json-server
    [Tags]  Webservices
    &{data}=      Create Dictionary   id=${idnumber}  title=newjsonserver  author=sebas
    &{header}=    Create Dictionary  content-type=application/json
    ${response} =  delete request  localhost  /posts/${idnumber}  headers=${header}
    should be equal as strings  ${response.status_code}  200
    ${json} =  set variable  ${response.json()}
    log  ${json}
    should be equal as strings  ${response.json()}  {}