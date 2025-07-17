import Felgo
import QtQuick
import QtQuick.Layouts

App {
    NavigationStack {
        navigationBar.visible: false
        AppPage {
            Rectangle {
                id: clockFace

                //From a nice pallete that gives our app a nice personality
                readonly property color backgroundColor: '#819A91'
                readonly property color mainTextColor: '#EEEFE0'
                readonly property color secondaryTextColor: '#D1D8BE'

                readonly property int mainTextSize: sp(57) // material large headline
                readonly property int secondaryTextSize: sp(32) // material large body

                color: backgroundColor
                border.color: color
                height: dp(Screen.height / 4) // 4 looks good
                width: height
                radius: dp(30) // A nice radius
                anchors.centerIn: parent
                ColumnLayout {
                    anchors.fill: parent
                    // Big time on top
                Column {
                      width: parent.width
                      height: parent.height
                      Layout.alignment: Qt.AlignHCenter 
                        AppText {
                            text: "05:23"
                            font.pixelSize: clockFace.mainTextSize
                            font.bold: true
                            color: clockFace.mainTextColor
                            horizontalAlignment: Text.AlignHCenter
                            width: parent.width
                        }

                        // Smaller milliseconds below
                        Text {
                            text: "231"
                            font.pixelSize: clockFace.secondaryTextSize
                            color: clockFace.secondaryTextColor
                            horizontalAlignment: Text.AlignHCenter
                            width: parent.width
                        }
                    }
                }
            }
        }
    }
}
