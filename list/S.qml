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
              AppTabButton { text: "S" }
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
             text: "save",
             icon: IconType.save
         },
          {
             text: "scissors",
             icon: IconType.scissors
         },
          {
             text: "search",
             icon: IconType.search
         },
          {
             text: "searchplus",
             icon: IconType.searchplus
         },
          {
             text: "searchminus",
             icon: IconType.searchminus
         },
          {
             text: "sellsy",
             icon: IconType.sellsy
         },
          {
             text: "send",
             icon: IconType.send
         },
          {
             text: "sendo",
             icon: IconType.sendo
         },
          {
             text: "server",
             icon: IconType.server
         },
          {
             text: "share",
             icon: IconType.share
         },
          {
             text: "sharealt",
             icon: IconType.sharealt
         },
          {
             text: "sharealtsquare",
             icon: IconType.sharealtsquare
         },
          {
             text: "sharesquare",
             icon: IconType.sharesquare
         },
          {
             text: "sharesquareo",
             icon: IconType.sharesquareo
         },
          {
             text: "shekel",
             icon: IconType.shekel
         },
          {
             text: "sheqel",
             icon: IconType.sheqel
         },
          {
             text: "shield",
             icon: IconType.shield
         },
          {
             text: "ship",
             icon: IconType.ship
         },
          {
             text: "shirtsinbulk",
             icon: IconType.shirtsinbulk
         },
          {
             text: "shoppingcart",
             icon: IconType.shoppingcart
         },
          {
             text: "signal",
             icon: IconType.signal
         },
          {
             text: "signin",
             icon: IconType.signin
         },
          {
             text: "signout",
             icon: IconType.signout
         },
          {
             text: "simplybuilt",
             icon: IconType.simplybuilt
         },
          {
             text: "sitemap",
             icon: IconType.sitemap
         },
          {
             text: "skyatlas",
             icon: IconType.skyatlas
         },
          {
             text: "skype",
             icon: IconType.skype
         },
          {
             text: "slack",
             icon: IconType.slack
         },
          {
             text: "sliders",
             icon: IconType.sliders
         },
          {
             text: "slideshare",
             icon: IconType.slideshare
         },
          {
             text: "smileo",
             icon: IconType.smileo
         },
          {
             text: "soccerballo",
             icon: IconType.soccerballo
         },
          {
             text: "sort",
             icon: IconType.sort
         },
          {
             text: "sortalphaasc",
             icon: IconType.sortalphaasc
         },
          {
             text: "sortalphadesc",
             icon: IconType.sortalphadesc
         },
          {
             text: "sortamountasc",
             icon: IconType.sortamountasc
         },
          {
             text: "sortamountdesc",
             icon: IconType.sortamountdesc
         },
          {
             text: "sortasc",
             icon: IconType.sortasc
         },
          {
             text: "sortdesc",
             icon: IconType.sortdesc
         },
          {
             text: "sortdown",
             icon: IconType.sortdown
         },
          {
             text: "sortnumericasc",
             icon: IconType.sortnumericasc
         },
          {
             text: "sortnumericdesc",
             icon: IconType.sortnumericdesc
         },
          {
             text: "sortup",
             icon: IconType.sortup
         },
          {
             text: "soundcloud",
             icon: IconType.soundcloud
         },
          {
             text: "spaceshuttle",
             icon: IconType.spaceshuttle
         },
          {
             text: "spinner",
             icon: IconType.spinner
         },
          {
             text: "spoon",
             icon: IconType.spoon
         },
          {
             text: "spotify",
             icon: IconType.spotify
         },
          {
             text: "square",
             icon: IconType.square
         },
          {
             text: "squareo",
             icon: IconType.squareo
         },
          {
             text: "stackexchange",
             icon: IconType.stackexchange
         },
          {
             text: "stackoverflow",
             icon: IconType.stackoverflow
         },
          {
             text: "star",
             icon: IconType.star
         },
          {
             text: "starhalf",
             icon: IconType.starhalf
         },
          {
             text: "starhalfempty",
             icon: IconType.starhalfempty
         },

          {
             text: "starhalffull",
             icon: IconType.starhalffull
         },
          {
             text: "starhalfo",
             icon: IconType.starhalfo
         },
          {
             text: "staro",
             icon: IconType.staro
         },
          {
             text: "steam",
             icon: IconType.steam
         },
          {
             text: "steamsquare",
             icon: IconType.steamsquare
         },
          {
             text: "stepbackward",
             icon: IconType.stepbackward
         },
          {
             text: "stepforward",
             icon: IconType.stepforward
         },
          {
             text: "stethoscope",
             icon: IconType.stethoscope
         },
          {
             text: "stop",
             icon: IconType.stop
         },
          {
             text: "streetview",
             icon: IconType.streetview
         },
          {
             text: "strikethrough",
             icon: IconType.strikethrough
         },
          {
             text: "stumbleupon",
             icon: IconType.stumbleupon
         },
          {
             text: "stumbleuponcircle",
             icon: IconType.stumbleuponcircle
         },
          {
             text: "subscript",
             icon: IconType.subscript
         },
          {
             text: "subway",
             icon: IconType.subway
         },
          {
             text: "suitcase",
             icon: IconType.suitcase
         },
          {
             text: "suno",
             icon: IconType.suno
         },
          {
             text: "superscript",
             icon: IconType.superscript
         },
          {
             text: "support",
             icon: IconType.support
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
