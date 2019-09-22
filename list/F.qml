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
              AppTabButton { text: "F" }
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
             text: "facebook",
             icon: IconType.facebook
         },
          {
             text: "facebookf",
             icon: IconType.facebookf
         },
          {
             text: "facebookofficial",
             icon: IconType.facebookofficial
         },
          {
             text: "facebooksquare",
             icon: IconType.facebooksquare
         },
          {
             text: "fastbackward",
             icon: IconType.fastbackward
         },
          {
             text: "fastforward",
             icon: IconType.fastforward
         },
          {
             text: "fax",
             icon: IconType.fax
         },
          {
             text: "female",
             icon: IconType.female
         },
          {
             text: "fighterjet",
             icon: IconType.fighterjet
         },
          {
             text: "file",
             icon: IconType.file
         },
          {
             text: "filearchiveo",
             icon: IconType.filearchiveo
         },
          {
             text: "fileaudioo",
             icon: IconType.fileaudioo
         },
          {
             text: "filecodeo",
             icon: IconType.filecodeo
         },
          {
             text: "fileexcelo",
             icon: IconType.fileexcelo
         },
          {
             text: "fileimageo",
             icon: IconType.fileimageo
         },
          {
             text: "filemovieo",
             icon: IconType.filemovieo
         },
          {
             text: "fileo",
             icon: IconType.fileo
         },
          {
             text: "filepdfo",
             icon: IconType.filepdfo
         },
          {
             text: "filephotoo",
             icon: IconType.filephotoo
         },
          {
             text: "filepictureo",
             icon: IconType.filepictureo
         },
          {
             text: "filepowerpointo",
             icon: IconType.filepowerpointo
         },
          {
             text: "fileso",
             icon: IconType.fileso
         },
          {
             text: "filesoundo",
             icon: IconType.filesoundo
         },
          {
             text: "filetext",
             icon: IconType.filetext
         },
          {
             text: "filetexto",
             icon: IconType.filetexto
         },
          {
             text: "filevideoo",
             icon: IconType.filevideoo
         },
          {
             text: "filewordo",
             icon: IconType.filewordo
         },
          {
             text: "filezipo",
             icon: IconType.filezipo
         },
          {
             text: "film",
             icon: IconType.film
         },
          {
             text: "filter",
             icon: IconType.filter
         },
          {
             text: "fire",
             icon: IconType.fire
         },
          {
             text: "fireextinguisher",
             icon: IconType.fireextinguisher
         },
          {
             text: "flag",
             icon: IconType.flag
         },
          {
             text: "flagcheckered",
             icon: IconType.flagcheckered
         },
          {
             text: "flago",
             icon: IconType.flago
         },
          {
             text: "flash",
             icon: IconType.flash
         },
          {
             text: "flask",
             icon: IconType.flask
         },
          {
             text: "flickr",
             icon: IconType.flickr
         },
          {
             text: "floppyo",
             icon: IconType.floppyo
         },
          {
             text: "folder",
             icon: IconType.folder
         },
          {
             text: "foldero",
             icon: IconType.foldero
         },
          {
             text: "folderopen",
             icon: IconType.folderopen
         },
          {
             text: "folderopeno",
             icon: IconType.folderopeno
         },
          {
             text: "font",
             icon: IconType.font
         },
          {
             text: "forumbee",
             icon: IconType.forumbee
         },
          {
             text: "foursquare",
             icon: IconType.foursquare
         },
          {
             text: "forward",
             icon: IconType.forward
         },
          {
             text: "frowno",
             icon: IconType.frowno
         },
          {
             text: "futbolo",
             icon: IconType.futbolo
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
