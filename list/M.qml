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
              AppTabButton { text: "M" }
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
             text: "magic",
             icon: IconType.magic
         },
          {
             text: "magnet",
             icon: IconType.magnet
         },
          {
             text: "mailforward",
             icon: IconType.mailforward
         },
          {
             text: "mailreply",
             icon: IconType.mailreply
         },
          {
             text: "mailreplyall",
             icon: IconType.mailreplyall
         },
          {
             text: "male",
             icon: IconType.male
         },
          {
             text: "mapmarker",
             icon: IconType.mapmarker
         },
          {
             text: "mars",
             icon: IconType.mars
         },
          {
             text: "marsdouble",
             icon: IconType.marsdouble
         },
          {
             text: "marsstroke",
             icon: IconType.marsstroke
         },
          {
             text: "marsstrokeh",
             icon: IconType.marsstrokeh
         },
          {
             text: "marsstrokev",
             icon: IconType.marsstrokev
         },
          {
             text: "maxcdn",
             icon: IconType.maxcdn
         },
          {
             text: "meanpath",
             icon: IconType.meanpath
         },
          {
             text: "medium",
             icon: IconType.medium
         },
          {
             text: "medkit",
             icon: IconType.medkit
         },
          {
             text: "meho",
             icon: IconType.meho
         },
          {
             text: "mercury",
             icon: IconType.mercury
         },
          {
             text: "microphone",
             icon: IconType.microphone
         },
          {
             text: "microphoneslash",
             icon: IconType.microphoneslash
         },
          {
             text: "minus",
             icon: IconType.minus
         },
          {
             text: "minuscircle",
             icon: IconType.minuscircle
         },
          {
             text: "minussquare",
             icon: IconType.minussquare
         },
          {
             text: "minussquareo",
             icon: IconType.minussquareo
         },
          {
             text: "mobile",
             icon: IconType.mobile
         },
          {
             text: "mobilephone",
             icon: IconType.mobilephone
         },
          {
             text: "money",
             icon: IconType.money
         },
          {
             text: "moono",
             icon: IconType.moono
         },
          {
             text: "mortarboard",
             icon: IconType.mortarboard
         },
          {
             text: "motorcycle",
             icon: IconType.motorcycle
         },
          {
             text: "music",
             icon: IconType.music
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
