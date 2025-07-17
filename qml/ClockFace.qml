import Felgo
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: clockFace

    enum Side {
        WHITE,
        BLACK
    }

    property int side: ClockFace.WHITE

    readonly property Item whitePallete: Item {
        readonly property color backgroundColor: '#210F37'
        readonly property color mainTextColor: '#DCA06D'
        readonly property color secondaryTextColor: '#A55B4B'
    }

    readonly property Item blackPallete: Item {
        readonly property color backgroundColor: '#0E2148'
        readonly property color mainTextColor: '#E3D095'
        readonly property color secondaryTextColor: '#7965C1'
    }

    readonly property Item pallete: clockFace.side === ClockFace.WHITE ? whitePallete: blackPallete

    readonly property int mainTextSize: sp(57) // material large headline
    readonly property int secondaryTextSize: sp(32) // material large body

    color: pallete.backgroundColor
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
                color: pallete.mainTextColor
            }

            // Smaller milliseconds below
             AppText {
                    Layout.alignment: Qt.AlignHCenter
                    text: "231"
                    font.pixelSize: clockFace.secondaryTextSize
                    color: pallete.secondaryTextColor
                }
        }
    }
}
