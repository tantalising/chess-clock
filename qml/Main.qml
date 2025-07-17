import Felgo
import QtQuick
import QtQuick.Layouts

App {
    NavigationStack {
        navigationBar.visible: false
        AppPage {
            anchors.fill: parent
           ColumnLayout {
            anchors.fill: parent
            readonly property real clockWidth: dp(parent.width * 0.8) // 80% of width
            readonly property real clockHeight: dp(parent.height / 4.0) // 25% of height
            ClockFace {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: parent.clockWidth
                Layout.preferredHeight: parent.clockHeight
            }
            ClockFace {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: parent.clockWidth
                Layout.preferredHeight: parent.clockHeight
            }
           }
        }
    }
}
