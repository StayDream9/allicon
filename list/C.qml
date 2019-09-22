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
              AppTabButton { text: "C" }
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
              text: "cab",
              icon: IconType.cab
          },
           {
              text: "calendar",
              icon: IconType.calendar
          },
           {
              text: "calendaro",
              icon: IconType.calendaro
          },
           {
              text: "camera",
              icon: IconType.camera
          },
           {
              text: "cameraretro",
              icon: IconType.cameraretro
          },
           {
              text: "car",
              icon: IconType.car
          },
           {
              text: "caretleft",
              icon: IconType.caretleft
          },
           {
              text: "caretdown",
              icon: IconType.caretdown
          },
           {
              text: "caretsquareodown",
              icon: IconType.caretsquareodown
          },
           {
              text: "cartplus",
              icon: IconType.cartplus
          },
           {
              text: "cc",
              icon: IconType.cc
          },
           {
              text: "ccamex",
              icon: IconType.ccamex
          },
           {
              text: "ccdiscover",
              icon: IconType.ccdiscover
          },
           {
              text: "ccmastercard",
              icon: IconType.ccmastercard
          },
           {
              text: "ccpaypal",
              icon: IconType.ccpaypal
          },
           {
              text: "ccstripe",
              icon: IconType.ccstripe
          },
           {
              text: "ccvisa",
              icon: IconType.ccvisa
          },
           {
              text: "ccvisa",
              icon: IconType.ccvisa
          },
           {
              text: "certificate",
              icon: IconType.certificate
          },
           {
              text: "chain",
              icon: IconType.chain
          },
           {
              text: "chainbroken",
              icon: IconType.chainbroken
          },
           {
              text: "check",
              icon: IconType.check
          },
           {
              text: "checkcircle",
              icon: IconType.checkcircle
          },
           {
              text: "checkcircleo",
              icon: IconType.checkcircleo
          },
           {
              text: "checksquare",
              icon: IconType.checksquare
          },
           {
              text: "checksquareo",
              icon: IconType.checksquareo
          },
           {
              text: "chevroncircledown",
              icon: IconType.chevroncircledown
          },
           {
              text: "chevrondown",
              icon: IconType.chevrondown
          },
           {
              text: "child",
              icon: IconType.child
          },
           {
              text: "circle",
              icon: IconType.circle
          },
           {
              text: "circleo",
              icon: IconType.circleo
          },
           {
              text: "circleonotch",
              icon: IconType.circleonotch
          },
           {
              text: "circlethin",
              icon: IconType.circlethin
          },
           {
              text: "clipboard",
              icon: IconType.clipboard
          },
           {
              text: "clocko",
              icon: IconType.clocko
          },
           {
              text: "close",
              icon: IconType.close
          },
           {
              text: "cloud",
              icon: IconType.cloud
          },
           {
              text: "clouddownload",
              icon: IconType.clouddownload
          },
           {
              text: "cloudupload",
              icon: IconType.cloudupload
          },
           {
              text: "cny",
              icon: IconType.cny
          },
           {
              text: "code",
              icon: IconType.code
          },
           {
              text: "codefork",
              icon: IconType.codefork
          },
           {
              text: "codepen",
              icon: IconType.codepen
          },
           {
              text: "cog",
              icon: IconType.cog
          },
           {
              text: "coffee",
              icon: IconType.coffee
          },
           {
              text: "comment",
              icon: IconType.comment
          },
           {
              text: "columns",
              icon: IconType.columns
          },
           {
              text: "commento",
              icon: IconType.commento
          },
           {
              text: "commentso",
              icon: IconType.commentso
          },
           {
              text: "comments",
              icon: IconType.comments
          },
           {
              text: "compass",
              icon: IconType.compass
          },
           {
              text: "compress",
              icon: IconType.compress
          },
           {
              text: "connectdevelop",
              icon: IconType.connectdevelop
          },
           {
              text: "copy",
              icon: IconType.copy
          },
           {
              text: "copyright",
              icon: IconType.copyright
          },
           {
              text: "creditcard",
              icon: IconType.creditcard
          },
           {
              text: "crop",
              icon: IconType.crop
          },
           {
              text: "crosshairs",
              icon: IconType.crosshairs
          },
           {
              text: "css3",
              icon: IconType.css3
          },
           {
              text: "cube",
              icon: IconType.cube
          },
           {
              text: "cubes",
              icon: IconType.cubes
          },
           {
              text: "cut",
              icon: IconType.cut
          },
           {
              text: "cutlery",
              icon: IconType.cutlery
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
