import Felgo
import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

App {
    NavigationStack {
        AppPage {
            id: mainPage
            // Main content of the page
           title: "CHESS CLOCK"
            property int totalTime: 1 * 60 * 1000
            ClockTimer {
                id: blackClockTimer
                timeInMilliseconds: mainPage.totalTime
                onTimeUp: {
                    whiteClockTimer.resetOnTimeUp();
                    white.locked = true;
                    black.locked = true;
                }
            }

            ClockTimer {
                id: whiteClockTimer
                timeInMilliseconds: mainPage.totalTime
                onTimeUp: {
                    blackClockTimer.resetOnTimeUp();
                    white.locked = true;
                    black.locked = true;
                }
            }

           ColumnLayout {
            anchors.fill: parent
            readonly property real clockWidth: parent.width * 0.9 // 90% of width
            readonly property real clockHeight: parent.height / 3.0 // 25% of height
            ClockFace {
                id: black
                property bool locked: true
                side: ClockFace.BLACK
                clockTimer: blackClockTimer
                moves: white.moveNumber
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: parent.clockWidth
                Layout.preferredHeight: parent.clockHeight
                rotation: 180 // Rotate the black clock so that it faces the black player

                MouseArea {
                    anchors.fill: parent
                    enabled: !black.locked
                    onClicked: {
                        black.clockTimer.stop();
                        black.locked = true;
                        white.locked = false;
                        white.clockTimer.start();
                    }
                }
                layer.enabled: true
                layer.effect: Desaturate {
                    desaturation: black.clockTimer.running ? 0.0 : 1.0
                }
            }

            IconButton {
                id: resetButton
                Layout.alignment: Qt.AlignHCenter
                iconType: IconType.refresh
                enabled: (white.locked && black.locked) || (white.clockTimer.running || black.clockTimer.running)
                onClicked: {
                    white.locked = false;
                    black.locked = true;
                    white.clockTimer.resetOnTimeUp();
                    black.clockTimer.resetOnTimeUp();
                }
            }

            ClockFace {
                id: white
                property int moveNumber: 0
                property bool locked: false  
                side: ClockFace.WHITE
                clockTimer: whiteClockTimer
                moves: moveNumber
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: parent.clockWidth
                Layout.preferredHeight: parent.clockHeight
                
                MouseArea {
                    anchors.fill: parent
                    property bool firstTime: true
                    enabled: !white.locked
                    onClicked: {
                        white.clockTimer.stop();
                        white.locked = true;
                        black.locked = false;
                        black.clockTimer.start();
                        white.moveNumber++;
                    }
                }
                layer.enabled: true
                layer.effect: Desaturate {
                    desaturation: white.clockTimer.running ? 0.0 : 1.0
                }
            }
           }
        }
    }
}
