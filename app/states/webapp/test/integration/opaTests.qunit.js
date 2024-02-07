sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'states/test/integration/FirstJourney',
		'states/test/integration/pages/StatesList',
		'states/test/integration/pages/StatesObjectPage'
    ],
    function(JourneyRunner, opaJourney, StatesList, StatesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('states') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStatesList: StatesList,
					onTheStatesObjectPage: StatesObjectPage
                }
            },
            opaJourney.run
        );
    }
);