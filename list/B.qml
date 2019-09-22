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
              AppTabButton { text: "B" }
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
          text: "ban",
          icon: IconType.ban
        },
        {
          text: "bank",
          icon: IconType.bank
        },
        {
          text: "barchart",
          icon: IconType.barchart
        },
        {
          text: "barcode",
          icon: IconType.barcode
        },
        {
          text: "bars",
          icon: IconType.bars
        },
        {
          text: "bed",
          icon: IconType.bed
        },
        {
          text: "beer",
          icon: IconType.beer
        },
        {
          text: "behance",
          icon: IconType.behance
        },
        {
          text: "behancesquare",
          icon: IconType.behancesquare
        },
        {
          text: "bell",
          icon: IconType.bell
        },
        {
          text: "bello",
          icon: IconType.bello
        },
        {
          text: "bellslash",
          icon: IconType.bellslash
        },
        {
          text: "bellslasho",
          icon: IconType.bellslasho
        },
        {
          text: "bicycle",
          icon: IconType.bicycle
        },
        {
          text: "binoculars",
          icon: IconType.binoculars
        },
        {
          text: "birthdaycake",
          icon: IconType.birthdaycake
        },
        {
          text: "bitbucket",
          icon: IconType.bitbucket
        },
        {
          text: "bitbucketsquare",
          icon: IconType.bitbucketsquare
        },
        {
          text: "bitcoin",
          icon: IconType.bitcoin
        },
        {
          text: "bold",
          icon: IconType.bold
        },
        {
          text: "bolt",
          icon: IconType.bolt
        },
        {
          text: "bomb",
          icon: IconType.bomb
        },
        {
          text: "book",
          icon: IconType.book
        },
        {
          text: "bookmark",
          icon: IconType.bookmark
        },
        {
          text: "bookmarko",
          icon: IconType.bookmarko
        },
        {
          text: "briefcase",
          icon: IconType.briefcase
        },
        {
          text: "btc",
          icon: IconType.btc
        },
        {
          text: "bug",
          icon: IconType.bug
        },
        {
          text: "building",
          icon: IconType.building
        },
        {
          text: "buildingo",
          icon: IconType.buildingo
        },
        {
          text: "bullhorn",
          icon: IconType.bullhorn
        },
        {
          text: "bullseye",
          icon: IconType.bullseye
        },
        {
          text: "buysellads",
          icon: IconType.buysellads
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
