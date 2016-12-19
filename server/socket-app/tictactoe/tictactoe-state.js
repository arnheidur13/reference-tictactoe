var _ = require('lodash');

module.exports = function (injected) {

    return function (history) {

        var gamefull=false;

        function processEvent(event) {
            if(event.type==="GameJoined"){
                gamefull=true;
            }

            /*if(event.type==="MovePlaced") {
                playersTurn(event);
            }*/
        }

        function processEvents(history) {
            _.each(history, processEvent);
        }

        function gameFull(event) {
            return gamefull;
        }

        /*function playersTurn(event) {
            if(event.side==='X'){
                event.side==='O',
                return true;
            }
        }*/

        processEvents(history);

        return {
            gameFull: gameFull,
            processEvents: processEvents
        }
    };
};
