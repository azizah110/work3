//
//  ContentView.swift
//  Stay Focused2
//
//  Created by Sara bayan alharbi on 12/06/1444 AH.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State var isVoiceOverPressed = false
    @State var accessibilityInputLabels = ["Start Timer", "Go To Goals"]
    @State var sendMessage = false
    @State var Start = false
    @State var to : CGFloat = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var count = 25
    @State var TimeRemaining = 1500
    func ConvertSecondsToTime(timeInSeconds : Int)-> String{
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
   
    var body: some View {
        NavigationView(){
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color(red: 0.1, green: 0.72, blue: 0.655))
                    .ignoresSafeArea()
                    .padding(.top, -30)
                    .padding(.top, 1.0)

                RoundedRectangle(cornerRadius: 60)
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
                    .padding(.top, 50)
                    .padding(.horizontal, 30)

                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading){
                            Button {
                                print("Done Tapd")
                            } label:{
                           
                                NavigationLink(destination: BlankPage(isVoiceOverPressed: false), label: {
                                Image(systemName: "lightbulb.circle")
                                    .resizable()
                                    .foregroundColor(Color(hue: 0.081, saturation: 0.459, brightness: 0.949))
                                    .frame(width: 44, height: 48)
//                                    .font(.system(size: 35))
                                    .accessibilityLabel("Tips")
                                    .accessibilityAction {
                                        isVoiceOverPressed = true
                                    }
                            })
                            }
                        }
                   }
    
                
                Button {
                    print("s")}
            label: {
    
             NavigationLink(destination: (isVoiceOverPressed: false),
                NavigationLink(destination: Tips(),
                     label: {
                                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 12.0)
                            .frame(width: 140, height: 50)
                            .foregroundColor(Color(red:0.947, green: 0.7, blue: 0.39))
                            .padding(.top, 600)
                            .padding(.trailing, 20.0)
                            
                            .accessibilityLabel("Goals")
                            .accessibilityAction {
                                isVoiceOverPressed = true
                            }
                        
                        Text("Goals")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding(.top,600)
                          //  .accessibilityInputLabels(["Goals"])
                        }
                   
                })
          
            

                
                ZStack{
                    Circle()
                        .trim(from: 0, to: 55)
                        .stroke(Color.black.opacity(0.30), style: StrokeStyle(lineWidth:10, lineCap: .round))
                        .frame (width: 250, height: 245)
                    
                    Circle()
                        .trim(from: 0, to: self.to)
                        .stroke(Color(red: 0.982, green: 0.598, blue: 0.252), style: StrokeStyle(lineWidth:10, lineCap: .round))
                        .frame (width: 250, height: 245)
                }
                
                        .rotationEffect(.init(degrees: -90))
//                        .accessibilityLabel("Circle")
//                           .accessibilityAction {
//                               isVoiceOverPressed = true
//                   }
                VStack{
                    Text(ConvertSecondsToTime(timeInSeconds: TimeRemaining))
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.978, green: 0.602, blue: 0.252))
                    HStack(spacing: 15){
                        Button(action:{
                            if self.TimeRemaining == 1500{
                                self.TimeRemaining = 1500
                                withAnimation(.default){
                                    self.to = 0
                                }
                            }
                            self.Start.toggle()
                        })
                        {
                            Image(systemName: self.Start ?  "pause" : "play")
                                .frame(width: 34, height: 48)
                                .font(.title)
                                .foregroundColor(Color(red: 0.982, green: 0.602, blue: 0.252))
//                                .accessibilityLabel("Play")
//
//                                .accessibilityAction {
//                                    isVoiceOverPressed = true
//
//                                }
//                                .accessibilityHint("Play")
                        }
                    }
                               .padding(.vertical)
                               .clipShape(Capsule())
                   
                }

                
                .onAppear(perform: {
                    UNUserNotificationCenter.current().requestAuthorization(options:
                    [.badge,.sound, .alert]) { (_,_) in }
                })
                
                .onReceive(self.time) { (_) in
                    if self.Start{
                        if self.TimeRemaining != 0{
                            self.TimeRemaining -= 1
                            print("hello \(TimeRemaining)")
                            
                            withAnimation(.default){
                                self.to = CGFloat(self.TimeRemaining) / 1500
                            }
                        }
                        else{
                            self.Start.toggle()
                            self.Notify()
                        }
                    }
                }
                
                
            }
//             .accessibilityLabel("Start")
//             .accessibilityAction {
//                 isVoiceOverPressed = true
//             }
//            Button(action: {
//                sendMessage = true
//            }) {
//                Image(systemName: "paperplane")
//                    .font(.title)
//                    .accessibilityInputLabels(["1", "2", "3"])
//            }
//            .accessibilityLabel(["Start Timer", "Go To Goals"])
//               .accessibilityAction {
//                   isVoiceOverPressed = true
//       }
        }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
                    ContentView()
        }
    }
    
    func Notify(){
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = "Time Take a break"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
}

//                .accessibilityLabel("Play")
//
//                .accessibilityAction {
//                    isVoiceOverPressed = true
//                }
//                .accessibilityLabel("Stop")
//
//                .accessibilityAction {
//                    isVoiceOverPressed = true
//                }


// .accessibilityLabel("Record")
//    .accessibilityAction {
//        isVoiceOverPressed = true

//                .toolbar{
//                    ToolbarItem(placement: .navigationBarTrailing){
//                        Button {
//                            print("Done")
//                        } label: {
//                            NavigationLink(destination: BlankPage(), label: {
//                                Image("Bar")
//                                    .resizable()
//                                    .frame(width: 45, height: 48)
//                            })
//                        }
//                    }
//                }

//                        HStack(spacing: 15){
//                        Button(action:{
//                            self.count = 25
//                            withAnimation(.default){
//                                self.to = 25
//                            }
//                        }){
//                            Image(systemName: "arrow.clockwise")
//                                .frame(width: 34, height: 48)
//                                //.foregroundColor(.cyan)
//                        }
//                        }
