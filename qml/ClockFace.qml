import Felgo
import QtQuick
import QtQuick.Layouts

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
    radius: dp(30) // A nice radius
    ColumnLayout {
        anchors.fill: parent
        // Big time on top
        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            AppText {
                text: "05:23"
                font.pixelSize: clockFace.mainTextSize
                font.bold: true
                color: clockFace.mainTextColor
            }

            // Smaller milliseconds below
             AppText {
                    Layout.alignment: Qt.AlignHCenter
                    text: "231"
                    font.pixelSize: clockFace.secondaryTextSize
                    color: clockFace.secondaryTextColor
                }
        }
    }
}
