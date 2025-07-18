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

    readonly property Item _whitePallete: Item {
        readonly property color backgroundColor: '#210F37'
        readonly property color mainTextColor: '#DCA06D'
        readonly property color secondaryTextColor: '#A55B4B'
    }

    readonly property Item _blackPallete: Item {
        readonly property color backgroundColor: '#0E2148'
        readonly property color mainTextColor: '#E3D095'
        readonly property color secondaryTextColor: '#7965C1'
    }

    readonly property Item _pallete: clockFace.side === ClockFace.WHITE ? _whitePallete: _blackPallete

    readonly property int _mainTextSize: sp(57) // material large headline
    readonly property int _secondaryTextSize: sp(32) // material large body
    readonly property int _smallMargin: dp(10)
    readonly property int _largeMargin: dp(20)

    required property ClockTimer clockTimer
    required property int moves

    color: _pallete.backgroundColor
    border.color: color
    radius: dp(30) // A nice radius
    ColumnLayout {
        anchors.fill: parent
        // Big time on top
        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            AppText {
                text: clockTimer.minutes + " : " + clockTimer.seconds
                font.pixelSize: clockFace._mainTextSize
                font.bold: true
                color: _pallete.mainTextColor
            }

            // Smaller milliseconds below
             AppText {
                    Layout.alignment: Qt.AlignHCenter
                    text: clockTimer.milliseconds
                    font.pixelSize: clockFace._secondaryTextSize
                    color: _pallete.secondaryTextColor
                }
        }
    }
    AppText {
        id: playerName
        text: side === ClockFace.WHITE ? "WHITE" : "BLACK"
        font.pixelSize: clockFace._secondaryTextSize
        color: _pallete.secondaryTextColor
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: clockFace._smallMargin
    }
    AppText {
        id: moveNumber
        font.pixelSize: clockFace._secondaryTextSize
        color: _pallete.secondaryTextColor
        anchors {
            right: parent.right
            bottom: parent.bottom
            rightMargin: clockFace._largeMargin
        }
        text: "move: " + clockFace.moves
    }
}
