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
              AppTabButton { text: "P" }
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
             text: "pagelines",
             icon: IconType.pagelines
         },
          {
             text: "paintbrush",
             icon: IconType.paintbrush
         },
          {
             text: "paperclip",
             icon: IconType.paperclip
         },
          {
             text: "paperplane",
             icon: IconType.paperplane
         },
          {
             text: "paperplaneo",
             icon: IconType.paperplaneo
         },
          {
             text: "paragraph",
             icon: IconType.paragraph
         },
          {
             text: "paste",
             icon: IconType.paste
         },
          {
             text: "pause",
             icon: IconType.pause
         },
          {
             text: "paw",
             icon: IconType.paw
         },
          {
             text: "paypal",
             icon: IconType.paypal
         },
          {
             text: "pencil",
             icon: IconType.pencil
         },
          {
             text: "pencilsquare",
             icon: IconType.pencilsquare
         },
          {
             text: "pencilsquareo",
             icon: IconType.pencilsquareo
         },
          {
             text: "phone",
             icon: IconType.phone
         },
          {
             text: "phonesquare",
             icon: IconType.phonesquare
         },
          {
             text: "photo",
             icon: IconType.photo
         },
          {
             text: "pictureo",
             icon: IconType.pictureo
         },
          {
             text: "piechart",
             icon: IconType.piechart
         },
          {
             text: "piedpiper",
             icon: IconType.piedpiper
         },
          {
             text: "piedpiperalt",
             icon: IconType.piedpiperalt
         },
          {
             text: "pinterest",
             icon: IconType.pinterest
         },
          {
             text: "pinterestp",
             icon: IconType.pinterestp
         },
          {
             text: "pinterestsquare",
             icon: IconType.pinterestsquare
         },
          {
             text: "plane",
             icon: IconType.plane
         },
          {
             text: "play",
             icon: IconType.play
         },
          {
             text: "playcircle",
             icon: IconType.playcircle
         },
          {
             text: "playcircleo",
             icon: IconType.playcircleo
         },
          {
             text: "plug",
             icon: IconType.plug
         },
          {
             text: "plus",
             icon: IconType.plus
         },
          {
             text: "pluscircle",
             icon: IconType.pluscircle
         },
          {
             text: "plussquare",
             icon: IconType.plussquare
         },
          {
             text: "plussquareo",
             icon: IconType.plussquareo
         },
          {
             text: "poweroff",
             icon: IconType.poweroff
         },
          {
             text: "print_",
             icon: IconType.print_
         },
          {
             text: "puzzlepiece",
             icon: IconType.puzzlepiece
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
