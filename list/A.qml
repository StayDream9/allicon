import QtQuick 2.0
import Felgo 3.0
import "../common"

FlickablePage {
  id: examplePage
  property bool activated: true

  // configure custom rightBarItem for navigation bar of example page
//  rightBarItem:  NavigationBarRow {
//    ActivityIndicatorBarItem {
//      id: busyBarItem
//      animating: examplePage.activated
//      showItem: showItemAlways
//    }
//    IconButtonBarItem {
//      icon: examplePage.activated ? IconType.toggleon : IconType.toggleoff
//      onClicked: examplePage.activated = !examplePage.activated
//      title: "Toggle"
//    }
//  }

  rightBarItem: IconButtonBarItem {
        icon: IconType.search
        onClicked: InputDialog.inputTextMultiLine(app,
                                                  qsTr("New tweet"),
                                                  qsTr("Enter text..."),
                                                  function(ok, text) {
                                                    if(ok) logic.addTweet(text)
                                                  })

  }

  Component {
      id: appComponentsPage
      Page {
          id: page
          title: a_item.title

//                        rightBarItem: stackLayout.currentIndex >= 0 ? stackLayout.children[stackLayout.currentIndex].rightBarItem : null

          AppTabBar {
              id: tabBar
              contentContainer: stackLayout
              AppTabButton { text: "A" }
          }


    // we need a Wrapper-Item because the Page always fills its parent,
    // which would be the bigger container within SwipeView
//              AppComponentsPage { }
//              ExamplePage { }

      }
      }

  flickable.contentHeight: scrollCol.height + dp(8)

  Column  {
    id: scrollCol
    width: parent.width

//    SectionHeader { icon: IconType.thumbsup; text: "Rich User Interface, Less Code" }
//    SectionDescription { text: "This example only requires about 120 lines code." }
    Repeater {
      model: [
        {
          text: "adjust",
          icon: IconType.adjust
        },
        {
          text: "adn",
          icon: IconType.adn
        },
        {
          text: "aligncenter",
          icon: IconType.aligncenter
        },
        {
          text: "alignjustify",
          icon: IconType.alignjustify
        },
        {
          text: "alignleft",
          icon: IconType.alignleft
        },
        {
          text: "alignright",
          icon: IconType.alignright
        },
        {
          text: "ambulance",
          icon: IconType.ambulance
        },
        {
          text: "anchor",
          icon: IconType.anchor
        },
        {
          text: "android",
          icon: IconType.android
        },
        {
          text: "angellist",
          icon: IconType.angellist
        },
        {
          text: "angledoubledown",
          icon: IconType.angledoubledown
        },
        {
          text: "angledown",
          icon: IconType.angledown
        },
        {
          text: "apple",
          icon: IconType.apple
        },
        {
          text: "archive",
          icon: IconType.archive
        },
        {
          text: "areachart",
          icon: IconType.areachart
        },
        {
          text: "arrowcircledown",
          icon: IconType.arrowcircledown
        },
        {
          text: "arrowcircleodown",
          icon: IconType.arrowcircleodown
        },
        {
          text: "arrowcircleright",
          icon: IconType.arrowcircleright
        },
        {
          text: "arrowdown",
          icon: IconType.arrowdown
        },
        {
          text: "arrowsalt",
          icon: IconType.arrowsalt
        },
        {
          text: "arrowsh",
          icon: IconType.arrowsh
        },
        {
          text: "arrowsv",
          icon: IconType.arrowsv
        },
        {
          text: "arrowup",
          icon: IconType.arrowup
        },
        {
          text: "asterisk",
          icon: IconType.asterisk
        },
        {
          text: "at",
          icon: IconType.at
        },
        {
          text: "automobile",
          icon: IconType.automobile
        }
      ]
      delegate: SwipeOptionsContainer {
        id: container
        height: row.height
        enabled: !(isSnapped && isRight)

        //the actual list item
        SimpleRow {
          id: row
          style.showDisclosure: false
        }

        //left swipe option (when swiping list item to right)
        leftOption: SwipeButton {
          text: "Option"
          icon: IconType.gear
          height: row.height
          onClicked: {
            row.item.text = "Option clicked"
            row.itemChanged()

            //hide left option when clicked
            container.hideOptions()
          }
        }

        //right swipe option (when swiping list item to left)
        rightOption: AppActivityIndicator {
          width: row.height
          anchors.centerIn: parent
        }

        //hide right option after timer finishes
        onRightOptionShown: hideTimer.start()

        property Timer hideTimer: Timer {
          running: false
          interval: 1000
          onTriggered: container.hideOptions()
        }
      }
    }

    SectionSpacer { }
//    SectionHeader { text: "Signals and Property Binding" }
//    SectionDescription { text: "Press the switch below or in the navigation bar. Both items are linked together and also affect both of the activity indicators.\n
//This is achieved by binding the checked and activated states of the controls in a single code line." }
//    SectionContent { contentItem: Row {
//        anchors.horizontalCenter: parent.horizontalCenter

//        AppSwitch {
//          id: sw
//          anchors.verticalCenter: parent.verticalCenter
//          checked: examplePage.activated
//          updateChecked: false //always keep the property binding
//          onToggled: examplePage.activated = !examplePage.activated
//        }

//        AppActivityIndicator {
//          anchors.verticalCenter: parent.verticalCenter
//          animating: examplePage.activated
//        }
//      }
//    }
  } // flickable content
}
