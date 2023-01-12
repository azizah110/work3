//
//  new.swift
//  work3
//
//  Created by azizah ahmed alshami on 17/06/1444 AH.
//

import SwiftUI

struct new: View {
    @State var counter = 0
//    @State var showSheet: Bool = false
    @State var isVoiceOverPressed = true
    var body: some View {
        
//        NavigationView{
            
            ZStack{
                
                Text("counter: \(counter)")
                RoundedRectangle(cornerRadius: 20.0)
                    .frame(maxWidth: .infinity)
                    .frame(width: 500.0, height: 980.0)
                    .foregroundColor(Color(red: 0.1, green: 0.72, blue: 0.655))
                
                
                Text("Today’s Goals")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 744.0)
                    .accessibilityLabel(Text("Today’s Goals"))
                
                RoundedRectangle(cornerRadius: 45.0)
                    .padding(.horizontal)
                    .frame(width: 350.0, height: 650.0)
                    .foregroundColor(.white)
                VStack{
                    
                    Text("+ Add your goals ")
                        .font(.title2)
                        .foregroundColor(Color(red: 0.976, green: 0.602, blue: 0.252))
                        .padding(.top, 200.0)
                        .padding(.trailing, 120.0)
                        .onTapGesture {
                
                            counter += 1
             
                        
                           
                        }
                    
                    List{
                        
                        ForEach(0 ..< counter, id:\.self) { i in
                            
                            New()
                           
                        }
                        .swipeActions(edge: .trailing){
                            Button(role: .destructive){
                            } label: {
                                Label("Delete" , systemImage: "trash")
                            }
                            
                        }
                    }.frame(width: 300.0)
                    
                        .scrollContentBackground(.hidden)

                }
                
                .toolbar {

                        ToolbarItem(placement: .navigationBarLeading){
                        Button{
                        }label: {

                            NavigationLink( destination: Tips()){ Label: do {
                                Image(systemName: "lightbulb.circle")
                                    .padding(.leading, 220.0)
                                    .font(.system(size: 35))
                                    .foregroundColor(Color(hue: 0.081, saturation: 0.459, brightness: 0.949))
                            }
                            }
                        }

                    }
                }
            }
            
            .navigationBarBackButtonHidden(false)

            
        }
            }
    
//}

struct new_Previews: PreviewProvider {
    static var previews: some View {
        new()
    }
}
struct New: View {
    
    @State var goal = ""
    
    var body: some View {
       
        TextField("Enter your  goals", text: $goal)
            .accessibilityLabel(Text("Enter your  goals"))
                        .frame(width: 200.0)
            
    }
}
