import bb.cascades 1.0

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
            Button {
                text: qsTr("Say Hello")
                horizontalAlignment: HorizontalAlignment.Center
                onClicked: {
                    hello.setText("hello "+nom.text)
                    nom.setVisible(false)
                    tof.setVisible(true)
                }
            
            }
        
        }
    
    }
}

