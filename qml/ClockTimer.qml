import QtQuick

Item { 
    id: timer

    required property int timeInMilliseconds
    signal timeUp();

    readonly property int minutes: _toMinutes(timeInMilliseconds - _millisecondsPassed)
    readonly property int seconds: _toSeconds(timeInMilliseconds - _millisecondsPassed) % 60
    readonly property int milliseconds: (_millisecondsPassed % 1000) / 10
    readonly property bool running: _isRunning

    property bool _isRunning: false 
    property int _millisecondsPassed: 0 

    Timer {
        id: updateTrigger
        interval: 20 
        repeat: true
        running: timer._isRunning 

        onTriggered: { 
            _millisecondsPassed += 20; 
            if (_millisecondsPassed >= timeInMilliseconds) {
                timer.reset();
            }
        }
    }

    function start() {
        _isRunning = true;
    }

    function stop() {
        _isRunning = false;
    }

    function reset() {
        _isRunning = false;
        _millisecondsPassed = 0;
        timeUp();
    }

    function resetOnTimeUp() {
        _isRunning = false;
        _millisecondsPassed = 0;
    }

    function _toMinutes(milliseconds) {
        return Math.floor(milliseconds / 1000 / 60);
    }

    function _toSeconds(milliseconds) {
        return Math.floor(milliseconds / 1000);
    }
}