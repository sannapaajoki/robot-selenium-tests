*** Settings ***
Documentation		Simple experiment with Google search using Robot Framework 3.0.3 and SeleniumLibrary 3.1.1.
Library				SeleniumLibrary
Suite Setup			Go to homepage
Suite Teardown		Close All Browsers

*** Variables ***
${HOMEPAGE}		http://www.google.fi
${BROWSER}		firefox

*** Test Cases ***
Google search "ketky" and find Ketky homepage in the results
	Google and check results	ketky		Ketky: Etusivu

*** Keywords ***
Google and check results
	[Arguments]		${searchkey}	${result}
	Input Text		id:lst-ib		${searchkey}
	Press Key		id:lst-ib		\\13
	Wait Until Page Contains	${result}
	
Go to homepage
	Open Browser	${HOMEPAGE}		${BROWSER}
