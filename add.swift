//
//  add.swift
//  work3
//
//  Created by azizah ahmed alshami on 16/06/1444 AH.
//

import SwiftUI

struct add: View {
    @State var counter = 0
    @State var showSheet: Bool = false
    var body: some View {
        
        NavigationStack {
            
            ZStack{
                
                
                Text("counter: \(counter)")
                RoundedRectangle(cornerRadius: 20.0)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color(red: 0.1, green: 0.72, blue: 0.655))
                    .ignoresSafeArea()
                    .padding(.top,-30)
                    .padding(.top,1.0)
                
                
                RoundedRectangle(cornerRadius: 60.0)
                    .foregroundColor(.white)
                    .padding(.bottom, 50.0)
                    .padding(.top, 50.0)
                    .padding(.horizontal, 30.0)

                VStack {
                    ForEach(0 ..< counter, id:\.self) { i in
                    add2()
                        
                    }
               
                }
                
                
                Text("Today’s Goals")
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.081, green: 0.362, blue: 0.251))
                    .padding(.top, -270.0)
                    .padding(.leading,-150)
                
                Image(systemName: "plus.app")
                    .foregroundColor(Color.orange)
                    .padding(.top, -269.0)  .padding(.leading, 100.0)
               
       
       
                                Text("Add a Goal")
                    .foregroundColor(Color(red: 0.98, green: 0.602, blue: 0.252))
                                    .padding(.top, -270.0)
                                    .padding(.leading, -100.0)
                                    .onTapGesture {
                                        counter += 1
                                        
                                    }
                                        
                                 
            }
            .toolbar {
                
                ToolbarItem {
                    Button(action:{
                        showSheet = true
                    },label:{
                            Image(systemName: "lightbulb.circle")
                                .font(.system(size: 35))
                                .foregroundColor(Color.white)
                                .padding(.trailing, -300.0)

                    })
                }
            }
            .sheet(isPresented: $showSheet) {
                 Tips()
        }

        }
       


            }
                    }
                    




struct add_Previews: PreviewProvider {
    static var previews: some View {
        add2()
    }
}

struct Add: View {
    
    @State var goal = ""
    
    var body: some View {
        TextField("enter goal", text: $goal)
            .frame(width: 200)
    }
}

