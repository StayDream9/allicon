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
              AppTabButton { text: "G" }
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
             text: "gamepad",
             icon: IconType.gamepad
         },
          {
             text: "gavel",
             icon: IconType.gavel
         },
          {
             text: "gbp",
             icon: IconType.gbp
         },
          {
             text: "ge",
             icon: IconType.ge
         },
          {
             text: "gear",
             icon: IconType.gear
         },
          {
             text: "gears",
             icon: IconType.gears
         },
          {
             text: "genderless",
             icon: IconType.genderless
         },
          {
             text: "gift",
             icon: IconType.gift
         },
          {
             text: "git",
             icon: IconType.git
         },
          {
             text: "github",
             icon: IconType.github
         },
          {
             text: "glass",
             icon: IconType.glass
         },
          {
             text: "githubalt",
             icon: IconType.githubalt
         },
          {
             text: "githubsquare",
             icon: IconType.githubsquare
         },
          {
             text: "gitsquare",
             icon: IconType.gitsquare
         },
          {
             text: "gittip",
             icon: IconType.gittip
         },
          {
             text: "globe",
             icon: IconType.globe
         },
          {
             text: "google",
             icon: IconType.google
         },
          {
             text: "googleplus",
             icon: IconType.googleplus
         },
          {
             text: "googleplussquare",
             icon: IconType.googleplussquare
         },
          {
             text: "googlewallet",
             icon: IconType.googlewallet
         },
          {
             text: "graduationcap",
             icon: IconType.graduationcap
         },
          {
             text: "gratipay",
             icon: IconType.gratipay
         },
          {
             text: "group",
             icon: IconType.group
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
