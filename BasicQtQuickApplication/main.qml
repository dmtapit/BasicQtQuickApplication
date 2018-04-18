import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
            id: page

            mouseArea {
                onClicked: stateGroup.state = ' '
            }

            mouseArea1 {
                onClicked: stateGroup.state = 'State1'
            }

            mouseArea2 {
                onClicked: stateGroup.state = 'State2'
            }
        }

        Page2Form {
        }

        StateGroup {
            id: stateGroup
            states: [
                State {
                    name: "State1"

                    PropertyChanges {
                        target: page.icon
                        x: page.middleRightRect.x
                        y: page.middleRightRect.y
                    }
                },
                State {
                    name: "State2"

                    PropertyChanges {
                        target: page.icon
                        x: page.bottomLeftRect.x
                        y: page.bottomLeftRect.y
                    }
                }
            ]
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
    }
}
