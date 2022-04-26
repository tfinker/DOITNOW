//
//  ZoomView.swift
//  DOITNOW
//
//  Created by Madi Berman on 4/25/22.
//

import SwiftUI
import Foundation

struct ZoomView: View{
    
    @State var image: Image? = Image("Arnold")
    
    var body: some View {
        VStack{
            
            if image != nil{
                image!
            }
        }
    }
}
