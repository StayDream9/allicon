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

//                        rightBarItem: stackLayout.currentIndex >= 0 ? stackLayout.children[stackLayout.currentIndex].rightBarItem : null

          AppTabBar {
              id: tabBar
              contentContainer: stackLayout
              AppTabButton { text: "I" }
          }


    // we need a Wrapper-Item because the Page always fills its parent,
    // which would be the bigger container within SwipeView
//              AppComponentsPage { }
//              ExamplePage { }

      }
      }

  //滚轮下滑
  flickable.contentHeight: scrollCol.height + dp(8)

  Column  {
    id: scrollCol
    width: parent.width

//    SectionHeader { icon: IconType.thumbsup; text: "Rich User Interface, Less Code" }
//    SectionDescription { text: "This example only requires about 120 lines code." }
    Repeater {
      model: [
          {
             text: "ils",
             icon: IconType.ils
         },
          {
             text: "image",
             icon: IconType.image
         },
          {
             text: "inbox",
             icon: IconType.inbox
         },
          {
             text: "indent",
             icon: IconType.indent
         },
          {
             text: "info",
             icon: IconType.info
         },
          {
             text: "infocircle",
             icon: IconType.infocircle
         },
          {
             text: "inr",
             icon: IconType.inr
         },
          {
             text: "instagram",
             icon: IconType.instagram
         },
          {
             text: "institution",
             icon: IconType.institution
         },
          {
             text: "ioxhost",
             icon: IconType.ioxhost
         },
          {
             text: "italic",
             icon: IconType.italic
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

  } // flickable content
}
