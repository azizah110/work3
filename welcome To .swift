//
//  welcome To .swift
//  work3
//
//  Created by azizah ahmed alshami on 15/06/1444 AH.
//

import SwiftUI

struct welcome_To_: View {

    var body: some View {
 NavigationView{
         
           ZStack{
               Image("az")
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width:700.0, height:960)
                   .padding(-50)
               
               
               VStack{
                   
                   
                   Text("Welcome To")
                       .font(.title)
                       .fontWeight(.bold)
                       .multilineTextAlignment(.center)
                       .padding(.top, -40.0)
                       .foregroundColor(Color(hue: 0.472, saturation: 0.772, brightness: 0.618))
                       .accessibilityLabel(Text("Welcome To"))
                   Text("StayFocus")
                       .font(.title)
                       .fontWeight(.bold)
                       .foregroundColor(Color(hue: 0.074, saturation: 0.686, brightness: 0.927))
                       .foregroundColor(Color.white)
                       .multilineTextAlignment(.center)
                       .padding([.bottom, .trailing], -70.0)
                       .accessibilityLabel(Text("StayFocus"))
               }
       
                       Button{
                           print("s")
                       }label: {
                           
                           NavigationLink(destination: ContentView(), label: {
                               ZStack{
                                   RoundedRectangle (cornerRadius: 12.0)
                                       .frame(width: 200.0 ,height: 50.0)
                                       .foregroundColor(Color(red: 0.971, green: 0.586, blue: 0.005))
                                       .padding(.leading, 10.0)
                                       .padding(.top,500.0)
                                   Text ("Start")
                                       .font(.title)
                                       .fontWeight(.bold)
                                       .foregroundColor(Color.white)
                                       .padding(.leading, 10.0)
                                       .padding(.top, 500.0)
                                       .accessibilityLabel(Text("Start"))
                               }
                           })
                       }
                       
                   }
                
            
  }
    }
        }
                    
struct welcome_To__Previews: PreviewProvider {
    static var previews: some View {
        welcome_To_()
    }
}

