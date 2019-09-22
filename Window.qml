import QtQuick 2.4
import QtQuick.Controls 2.0 as Quick2
import QtQuick.Layouts 1.3
import Felgo 3.0
import "list"

//import "pages"

Page {
    // make page navigation public, so app-demo launcher can track navigation changes and log screens with Google Analytics
    property alias navigation: navigation

    // for windows platform check
    property bool isWindows: system.isPlatform(4) || system.isPlatform(9) || system.isPlatform(10) // windows, winPhone or winRT

    useSafeArea: true // main page fills whole window

    Navigation {
        id: navigation

         NavigationItem{
            id: a_Item
            title: "A"
//            icon: IconType.bolt

            NavigationStack {
                A { title: a_Item.title }
                initialPage: appComponentsPage

//                Component {
//                    id: appComponentsPage
//                    Page {
//                        id: page
//                        title: a_item.title

////                        rightBarItem: stackLayout.currentIndex >= 0 ? stackLayout.children[stackLayout.currentIndex].rightBarItem : null

//                        AppTabBar {
//                            id: tabBar
//                            contentContainer: stackLayout
//                            AppTabButton { text: "Overview" }
//                        }


//                        StackLayout {
//                            id: stackLayout
//                            width: parent.width
//                            anchors.top: tabBar.bottom
//                            anchors.bottom: parent.bottom
//                            clip: true

//                            A{}
//                        }

//                  // we need a Wrapper-Item because the Page always fills its parent,
//                  // which would be the bigger container within SwipeView
//            //              AppComponentsPage { }
//            //              ExamplePage { }

//                    }
//                    }
            }
        }

         NavigationItem{
             id: b_Item
             title: "B"

             NavigationStack {
                 B{title: b_Item.title}
                 //                navigationBarShadow: false
                 //        ControlsPage { title: controlsItem.title }
             }
         }
         NavigationItem{
             id: c_Item
             title: "C"

             NavigationStack {
                 C{title: c_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: d_Item
             title: "D"

             NavigationStack {
                 D{title: d_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: e_Item
             title: "E"

             NavigationStack {
                 E{title: e_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: f_Item
             title: "F"

             NavigationStack {
                 F{title: f_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: g_Item
             title: "G"

             NavigationStack {
                 G{title: g_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: h_Item
             title: "H"

             NavigationStack {
                 H{title: h_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: i_Item
             title: "I"

             NavigationStack {
                 I{title: i_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: j_Item
             title: "J"

             NavigationStack {
                 J{title: j_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: k_Item
             title: "K"

             NavigationStack {
                 K{title: k_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: l_Item
             title: "L"

             NavigationStack {
                 L{title: l_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: m_Item
             title: "M"

             NavigationStack {
                 M{title: m_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: n_Item
             title: "N"

             NavigationStack {
                 N{title: n_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: o_Item
             title: "O"

             NavigationStack {
                 O{title: o_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: p_Item
             title: "P"

             NavigationStack {
                 P{title: p_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: q_Item
             title: "Q"

             NavigationStack {
                 Q{title: q_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: r_Item
             title: "R"

             NavigationStack {
                 R{title: r_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: s_Item
             title: "S"

             NavigationStack {
                 S{title: s_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: t_Item
             title: "T"

             NavigationStack {
                 T{title: t_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: u_Item
             title: "U"

             NavigationStack {
                 U{title: u_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: v_Item
             title: "V"

             NavigationStack {
                 V{title: v_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: w_Item
             title: "W"

             NavigationStack {
                 W{title: w_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: x_Item
             title: "X"

             NavigationStack {
                 X{title: x_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: y_Item
             title: "Y"

             NavigationStack {
                 Y{title: y_Item.title}
                 //                navigationBarShadow: false
             }
         }
         NavigationItem{
             id: z_Item
             title: "Z"

             NavigationStack {
                 Z{ title: z_Item.title }
                 //                navigationBarShadow: false
             }
         }

    }
}
