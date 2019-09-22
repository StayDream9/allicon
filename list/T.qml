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
              AppTabButton { text: "T" }
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
             text: "table",
             icon: IconType.table
         },
          {
             text: "tablet",
             icon: IconType.tablet
         },
          {
             text: "tachometer",
             icon: IconType.tachometer
         },
          {
             text: "tachometer",
             icon: IconType.tachometer
         },
          {
             text: "tag",
             icon: IconType.tag
         },
          {
             text: "tags",
             icon: IconType.tags
         },
          {
             text: "tasks",
             icon: IconType.tasks
         },
          {
             text: "taxi",
             icon: IconType.taxi
         },
          {
             text: "tencentweibo",
             icon: IconType.tencentweibo
         },
          {
             text: "terminal",
             icon: IconType.terminal
         },
          {
             text: "textheight",
             icon: IconType.textheight
         },
          {
             text: "textwidth",
             icon: IconType.textwidth
         },
          {
             text: "th",
             icon: IconType.th
         },
          {
             text: "thlarge",
             icon: IconType.thlarge
         },
          {
             text: "thlist",
             icon: IconType.thlist
         },
          {
             text: "thumbsdown",
             icon: IconType.thumbsdown
         },
          {
             text: "thumbsodown",
             icon: IconType.thumbsodown
         },
          {
             text: "thumbsoup",
             icon: IconType.thumbsoup
         },
          {
             text: "thumbsup",
             icon: IconType.thumbsup
         },
          {
             text: "thumbtack",
             icon: IconType.thumbtack
         },
          {
             text: "ticket",
             icon: IconType.ticket
         },
          {
             text: "times",
             icon: IconType.times
         },
          {
             text: "timescircle",
             icon: IconType.timescircle
         },
          {
             text: "timescircleo",
             icon: IconType.timescircleo
         },
          {
             text: "tint",
             icon: IconType.tint
         },
          {
             text: "toggledown",
             icon: IconType.toggledown
         },
          {
             text: "toggleleft",
             icon: IconType.toggleleft
         },
          {
             text: "toggleoff",
             icon: IconType.toggleoff
         },
          {
             text: "toggleon",
             icon: IconType.toggleon
         },
          {
             text: "toggleright",
             icon: IconType.toggleright
         },
          {
             text: "toggleup",
             icon: IconType.toggleup
         },
          {
             text: "train",
             icon: IconType.train
         },
          {
             text: "transgender",
             icon: IconType.transgender
         },
          {
             text: "transgenderalt",
             icon: IconType.transgenderalt
         },
          {
             text: "trash",
             icon: IconType.trash
         },
          {
             text: "trasho",
             icon: IconType.trasho
         },
          {
             text: "tree",
             icon: IconType.tree
         },
          {
             text: "trophy",
             icon: IconType.trophy
         },
          {
             text: "trello",
             icon: IconType.trello
         },
          {
             text: "truck",
             icon: IconType.truck
         },
          {
             text: "try_",
             icon: IconType.try_
         },
          {
             text: "tty",
             icon: IconType.tty
         },
          {
             text: "tumblr",
             icon: IconType.tumblr
         },
          {
             text: "tumblrsquare",
             icon: IconType.tumblrsquare
         },
          {
             text: "turkishlira",
             icon: IconType.turkishlira
         },
          {
             text: "twitch",
             icon: IconType.twitch
         },
          {
             text: "twitter",
             icon: IconType.twitter
         },
          {
             text: "twittersquare",
             icon: IconType.twittersquare
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
