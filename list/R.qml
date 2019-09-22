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
              AppTabButton { text: "R" }
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
             text: "ra",
             icon: IconType.ra
         },
          {
             text: "random",
             icon: IconType.random
         },
          {
             text: "rebel",
             icon: IconType.rebel
         },
          {
             text: "recycle",
             icon: IconType.recycle
         },
          {
             text: "reddit",
             icon: IconType.reddit
         },
          {
             text: "redditsquare",
             icon: IconType.redditsquare
         },
          {
             text: "refresh",
             icon: IconType.refresh
         },
          {
             text: "remove",
             icon: IconType.remove
         },
          {
             text: "renren",
             icon: IconType.renren
         },
          {
             text: "reorder",
             icon: IconType.reorder
         },
          {
             text: "repeat",
             icon: IconType.repeat
         },
          {
             text: "reply",
             icon: IconType.reply
         },
          {
             text: "replyall",
             icon: IconType.replyall
         },
          {
             text: "retweet",
             icon: IconType.retweet
         },
          {
             text: "rmb",
             icon: IconType.rmb
         },
          {
             text: "road",
             icon: IconType.road
         },
          {
             text: "rocket",
             icon: IconType.rocket
         },
          {
             text: "rotateleft",
             icon: IconType.rotateleft
         },
          {
             text: "rotateright",
             icon: IconType.rotateright
         },
          {
             text: "rouble",
             icon: IconType.rouble
         },
          {
             text: "rss",
             icon: IconType.rss
         },
          {
             text: "rub",
             icon: IconType.rub
         },
          {
             text: "rsssquare",
             icon: IconType.rsssquare
         },
          {
             text: "ruble",
             icon: IconType.ruble
         },
          {
             text: "rupee",
             icon: IconType.rupee
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