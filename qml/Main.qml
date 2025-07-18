import Felgo
import QtQuick
import QtQuick.Layouts

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
            }

            ClockTimer {
                id: whiteClockTimer
                timeInMilliseconds: mainPage.totalTime
            }

           ColumnLayout {
            anchors.fill: parent
            readonly property real clockWidth: parent.width * 0.9 // 90% of width
            readonly property real clockHeight: parent.height / 3.0 // 25% of height
            ClockFace {
                id: black
                side: ClockFace.BLACK
                clockTimer: blackClockTimer
                moves: white.moveNumber
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: parent.clockWidth
                Layout.preferredHeight: parent.clockHeight
                rotation: 180 // Rotate the black clock so that it faces the black player

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        black.clockTimer.stop();
                        white.clockTimer.start();
                    }
                }
            }
            ClockFace {
                id: white
                property int moveNumber: 0
                side: ClockFace.WHITE
                clockTimer: whiteClockTimer
                moves: moveNumber
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: parent.clockWidth
                Layout.preferredHeight: parent.clockHeight

                MouseArea {
                    anchors.fill: parent
                    property bool firstTime: true
                    onClicked: {
                        if (!white.clockTimer.running && !firstTime){
                            return;
                        } else {
                            firstTime = false;
                        }
                        white.clockTimer.stop();
                        black.clockTimer.start();
                        white.moveNumber++;
                    }
                }
            }
           }
        }
    }
}
