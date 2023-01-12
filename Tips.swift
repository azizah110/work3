//
//  Tips.swift
//  work3
//
//  Created by azizah ahmed alshami on 15/06/1444 AH.
//

import SwiftUI

struct Tips: View {
 
    @State var isVoiceOverPressed = true
    var body: some View {

            ZStack {
                
                
                
                
                
                RoundedRectangle(cornerRadius: 20.0)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color(red: 0.108, green: 0.716, blue: 0.651))
                    .ignoresSafeArea()
                    .padding(.top,-30)
                    .padding(.top,1.0)
                
                Text("Tips")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,678.0)
                    .accessibilityLabel(Text("Tips"))
                
                
                ZStack {
                    
                    
                    RoundedRectangle (cornerRadius: 12.0)
                    
                        .frame(width: 360.0 ,height:68.0)
                        .foregroundColor(Color(hue: 0.09, saturation: 0.0, brightness: 0.992))
                        .padding(.bottom,350.0)
                    

                    
                    Text("Don't Put Off Today's Work Until                  Tomorrow ✍🏻📚")
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundColor(Color(red: 0.374, green: 0.409, blue: 0.391))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .padding(.top, -200.0)
                        .padding(.trailing, -5.0)
                        .accessibilityLabel(Text("Don't Put Off Today's Work                           Until Tomorrow"))
                }
                
        
                
                ZStack {
                    
                    
                    
                    RoundedRectangle (cornerRadius: 12.0)
                        .frame(width: 360.0 ,height:68.0)
                        .foregroundColor(Color(hue: 0.094, saturation: 0.0, brightness: 0.992))
                        .padding(.bottom,190.0)
                    
                    
                    Text(" Focus Only On The Work✨🗃️")
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundColor(Color(red: 0.374, green: 0.409, blue: 0.391))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .padding(.top, -107.0)
                        .accessibilityLabel(Text("Focus Only On The Work"))
                }
                ZStack {
                    
                    
                    RoundedRectangle (cornerRadius: 12.0)
                        .frame(width: 360.0 ,height:68.0)
                        .foregroundColor(Color(hue: 0.094, saturation: 0.0, brightness: 0.992))
                        .padding(.top, -30.0)
                    
                    
                    Text(" Make Sure To Drink Water💦🧊")
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundColor(Color(red: 0.374, green: 0.409, blue: 0.391))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .padding(.bottom, 30.0)
                        .accessibilityLabel(Text("Make Sure To Drink Water"))
                    
                }
            }
            
       }

    }


struct Tips_Previews: PreviewProvider {
    static var previews: some View {
        Tips()
    }
}
