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
                    footer.setVisible(true)
                }
            
            }
        
        }
    
    
    	Container {
    	    id:footer
    	    visible: false
         layout: StackLayout {
             orientation: LayoutOrientation.LeftToRight
         }
         verticalAlignment: VerticalAlignment.Bottom
         	Button {
         	    id: pizza
                text: qsTr("Pizzas")
                onClicked: {
                    
                }
            }
            Button {
                text: qsTr("sandiwshs")
            }
            Button {
                text: qsTr("boissons")
            }

        }
    }

}

