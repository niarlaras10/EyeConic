////
////  ContentView.swift
////  EyeConic
////
////  Created by Rachmaniar Larasati on 25/05/23.
////
//
import SwiftUI
import RealityKit
import ARKit


struct ContentView : View {
    var arView: ARView!
    @State private var activeButton: ButtonType? = nil
    @Environment(\.presentationMode) var presentationMode
    
    enum ButtonType {
        case round, square, oval, aviator, geometric
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(activeButton: $activeButton).edgesIgnoringSafeArea(.all)
            
            HStack {
                Button(action: {
                    toggleButton(.round)
                }) {
                    ZStack {
                        Image("round")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 50)
                            .clipShape(Circle())
                    }
                }
                Button(action: {
                    toggleButton(.square)
                }) {
                    ZStack {
                        Image("square")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 50)
                            .clipShape(Circle())
                    }
                }
                Button(action: {
                    toggleButton(.oval)
                }) {
                    ZStack {
                        Image("oval")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 50)
                            .clipShape(Circle())
                    }
                }
                Button(action: {
                    toggleButton(.aviator)
                }) {
                    ZStack {
                        Image("aviator")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 50)
                            .clipShape(Circle())
                    }
                }
                Button(action: {
                    toggleButton(.geometric)
                }) {
                    ZStack {
                        Image("geometric")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 50)
                            .clipShape(Circle())
                    }
                }
                
            }
            .padding(130)
            }
        }
    func toggleButton(_ button: ButtonType) {
        if activeButton == button {
            activeButton = nil
        } else {
            activeButton = button
        }
    }
}


struct ARViewContainer: UIViewRepresentable {
    var arView: ARView!
    @Binding var activeButton: ContentView.ButtonType?

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        let arConfiguration = ARFaceTrackingConfiguration()
        uiView.session.run(arConfiguration, options: [.resetTracking, .removeExistingAnchors])

        // Remove existing anchors
        uiView.scene.anchors.removeAll()

        // Add new anchor based on the active button
        if let activeButton = activeButton {
            switch activeButton {
            case .round:
                let anchor = try! Experience.loadRound()
                uiView.scene.anchors.append(anchor)
            case .square:
                let anchor = try! Experience.loadSquare()
                uiView.scene.anchors.append(anchor)
            case .oval:
                let anchor = try! Experience.loadOval()
                uiView.scene.anchors.append(anchor)
            case .aviator:
                let anchor = try! Experience.loadAviator()
                uiView.scene.anchors.append(anchor)
            case .geometric:
                let anchor = try! Experience.loadGeometric()
                uiView.scene.anchors.append(anchor)
            }
        }
    }
}

#if DEBUG
struct ContentView_Preview : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif


//struct ContentView : View {
//    var arView:ARView!
//    @State var propld: Int = 0
//    @Environment(\.presentationMode) var presentationMode
//    var body: some View {
//        //        ARViewContainer().edgesIgnoringSafeArea(.all)
//        // 1
//        ZStack { // 2
//            ARViewContainer(propld: $propld).edgesIgnoringSafeArea(.all) // 3
//            //            VStack{
//            //                Button(action: {
//            //                    self.propld = self.propld <= 0 ? 0 : self.propld - 1
//            //                }) {
//            //                    Image(systemName: "chevron.left")
//            //                        .clipShape(Circle())
//            //                }
//            //                Spacer()
//            
//            VStack {
////                HStack {
////                    Button(action: {
////                        presentationMode.wrappedValue.dismiss()
////                    }){
////                        Image(systemName: "chevron.left")
////                            .padding(20)
////                    }
////
////                    Spacer()
////                }
//                
//                Spacer()
//                
//                HStack {
//                    Button(action: {
//                        self.propld = self.propld <= 0 ? 0 : self.propld - 1
//                        self.propld = self.propld <= 0 ? 0 : self.propld - 1
//                    }) {
//                        ZStack {
//                            Image("toy_car")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 30, height: 30) // Adjust the width and height values as desired
//                                .clipShape(Circle())
//                        }
//                    }
//                    Button(action: {
//                        self.propld = self.propld >= 2 ? 2 : self.propld + 1
//                    }) {
//                        ZStack {
//                            Image("pie_lemon")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 30, height: 30) // Adjust the width and height values as desired
//                                .clipShape(Circle())
//                        }
//                    }
//                }
//            }
//            
//            //            }
//        }
//    }
//    //    func TakeSnapshot(){
//    //        //             1
//    //        arView.snapshot(saveToHDR: false) { (image) in
//    //            // 2
//    //            let compressedlmage = UIImage( data: (image?.pngData())!)
//    //            // 3
//    //            UIImageWriteToSavedPhotosAlbum( compressedlmage!, nil, nil, nil)
//    //        }
//    //    }
//}
//
//struct ARViewContainer: UIViewRepresentable {
//    var arView:ARView!
//    @Binding var propld: Int
//    func makeUIView(context: Context) -> ARView {
//        
//        let arView = ARView(frame: .zero)
//        
//        // Load the "Box" scene from the "Experience" Reality File
//        //        let boxAnchor = try! Experience.loadBox()
//        
//        // Add the box anchor to the scene
//        //        arView.scene.anchors.append(boxAnchor)
//        
//        return arView
//        
//    }
//    
//    func updateUIView(_ uiView: ARView, context: Context) {
//        // 1
//        let arConfiguration = ARFaceTrackingConfiguration()
//        // 2
//        uiView.session.run(arConfiguration,
//                           options:[.resetTracking, .removeExistingAnchors])
//        
//        switch(propld) {
//        case 0: // Eyes
//            let arAnchor = try! Experience.loadEyes()
//            uiView.scene.anchors.append(arAnchor)
//            break
////        case 1: // Eyes1
////                    let arAnchor = try! Experience.loadEyes1()
////                    uiView.scene.anchors.append(arAnchor)
////        case 1: // Eyes1
////                    let arAnchor = try! Experience.loadEyes1()
////                    uiView.scene.anchors.append(arAnchor)
////                    break
//            //    case 2: // Mustache
//            //        let arAnchor = try! Experience.loadMustache()
//            //        uiView.scene.anchors.append(arAnchor)
//            //        break
//        default:
//            break
//        }
//        
//    }
//    
//}
//
//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif
