//
//  ContentView.swift
//  ListView
//
//  Created by Tam Trieu on 27/02/2023.
//

import SwiftUI

//struct ContentView: View {
//    @State var backGroundColor = Color.white
//    //@State  let Colors  : [String] = ["Red","Blue","Pink"]
//    @State private var selection : String = "1"
//    var body: some View {
//        //        backGroundColor.ignoresSafeArea()
//        //            .overlay (
//        //                ColorPicker("Color Picker", selection: $backGroundColor)
//        //                    .frame(width :150)
//        //            )
//        //Text("Select Color \(selectColor)")
//
//        Picker(selection: $selection,
//               label: Text("Picker"),
//               content: {
//            Text("Red")
//            Text("Blue")
//            Text("Green")
//
//        })
//    }
//}
struct ContentView: View {
    @State private var backgroundColor = Color.white
    private var colors = ["Red", "Green", "Blue"]
    @State private var selectedColor = "Red" // <1>
    var body: some View {
        ZStack {
            VStack {
                Picker( "Please choose a Color", selection: $selectedColor) {
                content: do {
                    ForEach(colors, id: \.self) {
                        Text($0)
                        }
                    }
                }.font(.largeTitle).background(.black).padding(10).cornerRadius(10)
                //.pickerStyle(.inline)
                .onChange(of: selectedColor) { _ in
                    if selectedColor == "Red" {
                        backgroundColor = Color.red
                    }else if selectedColor == "Green"  {
                        backgroundColor = Color.green
                    } else {
                        backgroundColor = Color.blue
                    }
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(backgroundColor)
    }
}

 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
