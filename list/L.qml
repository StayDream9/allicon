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
              AppTabButton { text: "L" }
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
             text: "language",
             icon: IconType.language
         },
          {
             text: "laptop",
             icon: IconType.laptop
         },
          {
             text: "lastfm",
             icon: IconType.lastfm
         },
          {
             text: "lastfmsquare",
             icon: IconType.lastfmsquare
         },
          {
             text: "leaf",
             icon: IconType.leaf
         },
          {
             text: "leanpub",
             icon: IconType.leanpub
         },
          {
             text: "legal",
             icon: IconType.legal
         },
          {
             text: "lemono",
             icon: IconType.lemono
         },
          {
             text: "leveldown",
             icon: IconType.leveldown
         },
          {
             text: "levelup",
             icon: IconType.levelup
         },
          {
             text: "lifebouy",
             icon: IconType.lifebouy
         },
          {
             text: "lifebuoy",
             icon: IconType.lifebuoy
         },
          {
             text: "lifering",
             icon: IconType.lifering
         },
          {
             text: "lifesaver",
             icon: IconType.lifesaver
         },
          {
             text: "lightbulbo",
             icon: IconType.lightbulbo
         },
          {
             text: "linechart",
             icon: IconType.linechart
         },
          {
             text: "link",
             icon: IconType.link
         },
          {
             text: "linkedin",
             icon: IconType.linkedin
         },
          {
             text: "linkedinsquare",
             icon: IconType.linkedinsquare
         },
          {
             text: "linux",
             icon: IconType.linux
         },
          {
             text: "list",
             icon: IconType.list
         },
          {
             text: "listalt",
             icon: IconType.listalt
         },
          {
             text: "listol",
             icon: IconType.listol
         },
          {
             text: "listul",
             icon: IconType.listul
         },
          {
             text: "locationarrow",
             icon: IconType.locationarrow
         },
          {
             text: "lock",
             icon: IconType.lock
         },
          {
             text: "longarrowdown",
             icon: IconType.longarrowdown
         },
          {
             text: "longarrowleft",
             icon: IconType.longarrowleft
         },
          {
             text: "longarrowright",
             icon: IconType.longarrowright
         },
          {
             text: "longarrowup",
             icon: IconType.longarrowup
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
