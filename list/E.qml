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
              AppTabButton { text: "E" }
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
              text: "edit",
              icon: IconType.edit
          },
           {
              text: "eject",
              icon: IconType.eject
          },
           {
              text: "ellipsish",
              icon: IconType.ellipsish
          },
           {
              text: "ellipsisv",
              icon: IconType.ellipsisv
          },
           {
              text: "empire",
              icon: IconType.empire
          },
           {
              text: "envelope",
              icon: IconType.envelope
          },
           {
              text: "envelopeo",
              icon: IconType.envelopeo
          },
           {
              text: "envelopesquare",
              icon: IconType.envelopesquare
          },
           {
              text: "eraser",
              icon: IconType.eraser
          },
           {
              text: "eur",
              icon: IconType.eur
          },
           {
              text: "euro",
              icon: IconType.euro
          },
           {
              text: "exchange",
              icon: IconType.exchange
          },
           {
              text: "exclamation",
              icon: IconType.exclamation
          },
           {
              text: "exclamationcircle",
              icon: IconType.exclamationcircle
          },
           {
              text: "exclamationtriangle",
              icon: IconType.exclamationtriangle
          },
           {
              text: "expand",
              icon: IconType.expand
          },
           {
              text: "externallink",
              icon: IconType.externallink
          },
           {
              text: "externallinksquare",
              icon: IconType.externallinksquare
          },
           {
              text: "eye",
              icon: IconType.eye
          },
           {
              text: "eyedropper",
              icon: IconType.eyedropper
          },
           {
              text: "eyeslash",
              icon: IconType.eyeslash
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
