import bb.cascades 1.0


NavigationPane {
    id: navigationPane



Page {
    Container {
        layout: DockLayout {
        
        }    
        
        Container {
            visible: false
            id: tof
            ImageView {
                imageSource: "asset:///images/pizza.jpg"
                animations: RotateTransition {
                    id: rotateAnimation
                    toAngleZ: 360
                    duration: 3000
                }
            }
        
        
        }    
        
        
        Container {
            layout: StackLayout {
            
            }
            
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Label {
                id: hello
                // Localized text with the dynamic translation and locale updates support
                text: qsTr("Allo pizza") + Retranslate.onLocaleOrLanguageChanged
                textStyle.base: SystemDefaults.TextStyles.BigText
                horizontalAlignment: HorizontalAlignment.Center
                multiline: false
                
            }
            TextField {
                id: nom
                hintText: "entre votre nom..."
            }
            ActivityIndicator {
                id: indicator
                visible: false
                //verticalAlignment: VerticalAlignment.Fill
                //horizontalAlignment: HorizontalAlignment.Fill
            }
            Button {  
                id:btn              
                text: qsTr("Say Hello")
                horizontalAlignment: HorizontalAlignment.Center
                onClicked: {
                    hello.setText("hello "+nom.text)
                    nom.setVisible(false)
                    tof.setVisible(true)  
                    btn.setVisible(false)
                    rotateAnimation.play();
                    indicator.setVisible(true)
                }
            
            }


        }
    }
    
    /*attachedObjects: ComponentDefinition {
        id:PagePizza
        source: "pizzas.qml"
    }
    onclick: {
        var page=PagePizza.createObject()
        navigationPage.push(page)
    }*/
    
    
    
    
    
    actions: [
        ActionItem {
            title: "Pizzas"
            imageSource: "images/pizza.jpg"
            onTriggered: {
                var page=pagePizza.createObject()
                navigationPane.push(page)                
            }
            attachedObjects: ComponentDefinition {
                id:pagePizza
                source: "Pizzas.qml"
            }
            ActionBar.placement: ActionBarPlacement.OnBar
        },
        ActionItem {
            title: "Boissons"
            onTriggered: {
                var page=pageBoisson.createObject()
                navigationPane.push(page)                
            }
            attachedObjects: ComponentDefinition {
                id:pageBoisson
                source: "boissons.qml"
            }
            ActionBar.placement: ActionBarPlacement.OnBar
        },
        ActionItem {
            title: "Sandwichs"
            onTriggered: indicator.start()
            ActionBar.placement: ActionBarPlacement.OnBar
        },
        ActionItem {
            title: "Desserts"
            onTriggered: indicator.start()
            ActionBar.placement: ActionBarPlacement.InOverflow
        },
        ActionItem {
            title: "Suppléments"
            onTriggered: indicator.start()
            ActionBar.placement: ActionBarPlacement.InOverflow
        }
    ]
}

}

