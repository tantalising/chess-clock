import Felgo
import QtQuick
import QtQuick.Layouts

App {
    NavigationStack {
        AppPage {
           title: "CHESS CLOCK"
           ColumnLayout {
            anchors.fill: parent
            readonly property real clockWidth: parent.width * 0.9 // 90% of width
            readonly property real clockHeight: parent.height / 3.0 // 25% of height
            ClockFace {
                side: ClockFace.BLACK
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: parent.clockWidth
                Layout.preferredHeight: parent.clockHeight
            }
            ClockFace {
                side: ClockFace.WHITE
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: parent.clockWidth
                Layout.preferredHeight: parent.clockHeight
            }
           }
        }
    }
}
