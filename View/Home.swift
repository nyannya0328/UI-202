//
//  Home.swift
//  UI-202
//
//  Created by にゃんにゃん丸 on 2021/05/23.
//

import SwiftUI

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}

struct Home: View {
    @StateObject var animationVM = AnimationViewModel()
    @Namespace var animation
    var body: some View {
        ZStack{
            
            GeometryReader{proxy in
                
                let frame = proxy.frame(in:.global)
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height)
                
                BlurView(style: .systemChromeMaterialDark)
                    .onTapGesture {
                        withAnimation(Animation.easeInOut.speed(1.3)){
                            
                            
                            animationVM.showDetail = false
                            
                        }
                    }
                
                
            }
            .ignoresSafeArea()
            
            
            VStack{
                
                
                HStack{
                    
                    
                    Image(systemName: "chart.bar.fill")
                    
                    Text("Version")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image(systemName: "alarm.fill")
                    
                    Text("55%")
                    
                    Image(systemName: "battery.25")
                    
                }
                .foregroundColor(.white)
                .padding(.top,50)
                
                HStack(spacing:15){
                    
                   
                        
                        
                            
                    ZStack{
                        
                        if !animationVM.showDetail{
                            
                            GeometryReader{proxy in
                            
                                VStack(spacing:15){
                                
                                HStack(spacing:15){
                                    
                                    ActionButton(image: "airplane.circle.fill", title: "Ari Plan Mode", slected: $animationVM.ariPlanMode, animation: animation)
                                    
                                    ActionButton(image: "antenna.radiowaves.left.and.right", title: "Mobile Data", slected: $animationVM.dateMode, animation: animation)
                                    
                                }
                                
                                HStack(spacing:15){
                                    ActionButton(image: "wifi", title: "Wifi", slected: $animationVM.wifyMode, animation: animation)
                                    ActionButton(image: "airplayaudio", title: "Ari Drop", slected: $animationVM.ariDropMode, animation: animation)
                                }
                                
                                
                            }
                            .padding(15)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(
                            
                                HStack(spacing:15){
                                    ActionButton(image: "wave.3.right", title: "NFC", slected: $animationVM.NFCMode, animation: animation)
                                    ActionButton(image: "personalhotspot", title: "Hot Spot", slected: $animationVM.hotspotMode, animation: animation)
                                }
                                .offset(y: 40)
                                .padding(.horizontal,10)
                                .opacity(0)
                            
                            )
                            .background(
                                BlurView(style: .dark)
                                    .cornerRadius(30)
                                    .matchedGeometryEffect(id: "ACTION_SHEET", in: animation)
                            
                            )
                            .scaleEffect(animationVM.enalrgetActions ? 0.9 : 1)
                            }
                        }
                    }

                            
                        
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .onLongPressGesture(minimumDuration: 0.25){

                            withAnimation(.easeInOut){


                                animationVM.enalrgetActions = true

                            }


                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){

                                UIImpactFeedbackGenerator(style: .light).impactOccurred()

                                withAnimation(Animation.easeInOut.speed(1.3)){

                                    animationVM.enalrgetActions = false
                                    animationVM.showDetail = true

                                }




                            }






                        }
                        
                    
                    
                    
                    GeometryReader{proxy in
                        
                        VStack{
                            
                            
                            
                          
                                
                                Text("Not Playing")
                                
                                    .foregroundColor(.white)
                                
                                HStack{
                                    
                                    
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Image(systemName: "backward.fill")
                                    })
                                    .disabled(true)
                                    .opacity(0.7)
                                    
                                    Spacer()
                                    
                                    
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Image(systemName: "play.fill")
                                            .foregroundColor(.red)
                                    })
                                   
                                    
                                    Spacer()
                                   
                                    
                                    
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Image(systemName: "arrowtriangle.forward.fill")
                                    })
                                    .disabled(true)
                                    .opacity(0.7)
                                    
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                         
                           
                            
                            
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(
                            BlurView(style: .dark)
                                .cornerRadius(30)
                        
                        )
                        
                    }
                    
                    
                    
                }
                .frame(height: (getRect().width - 75) / 2)
                
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal,30)
            .opacity(animationVM.showDetail ? 0 : 1)
            
            GeometryReader{proxy in
                
                
                if animationVM.showDetail{
                    
                    
                    VStack{
                        
                        HStack(spacing:15){
                            
                            ActionButton(image: "airplane.circle.fill", title: "Ari Plan Mode", slected: $animationVM.ariPlanMode, animation: animation)
                            
                            ActionButton(image: "antenna.radiowaves.left.and.right", title: "Mobile Data", slected: $animationVM.dateMode, animation: animation)
                            
                        }
                        
                        HStack(spacing:15){
                            ActionButton(image: "wifi", title: "Wifi", slected: $animationVM.wifyMode, animation: animation)
                            ActionButton(image: "airplayaudio", title: "Ari Drop", slected: $animationVM.ariDropMode, animation: animation)
                        }
                        
                        HStack(spacing:15){
                            ActionButton(image: "wave.3.right", title: "NFC", slected: $animationVM.NFCMode, animation: animation)
                            ActionButton(image: "personalhotspot", title: "Hot Spot", slected: $animationVM.hotspotMode, animation: animation)
                        }
                        
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal,25)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        BlurView(style: .dark)
                            .cornerRadius(30)
                            .matchedGeometryEffect(id: "ACTION_SHEET", in: animation)
                    
                    )
                   
                    
                    
                    
                }
                
                
            }
            .frame(height: (getRect().height) / 2.1)
            .padding(.horizontal,30)
            
            
            
            
        }
        .environmentObject(animationVM)
        .statusBar(hidden: true)
     
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}

struct ActionButton : View {
    var image : String
    var title : String
    @Binding var slected : Bool
    var animation : Namespace.ID
    
    @EnvironmentObject var animationVM : AnimationViewModel
    
    var body: some View{
        
        VStack{
            
            let actualFrameSize = (getRect().width - 75) / 2
            
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(image == "wifi" && !slected ? .red : .white)
                .frame(width: (actualFrameSize - 45) / 2, height: (actualFrameSize - 45) / 2)
                .background(
                    
                    
                    ZStack{
                        
                        if image == "airplane.circle.fill" {slected ? Color.orange : Color.gray}
                        
                        else if image == "antenna.radiowaves.left.and.right" {slected ? Color.green : Color.gray}
                        
                        else if image == "wifi" {slected ? Color.blue : Color.white}
                        
                        else {slected ? Color.blue : Color.gray}
                        
                        
                            
                            
                            
                        
                        
                    }
                   )
                .clipShape(Circle())
            if animationVM.showDetail{
                
                
                Text(title)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                
                Text(slected ? "ON" : "OF")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            
            
            
        }
        .matchedGeometryEffect(id: image, in: animation)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gesture(
        
            TapGesture()
                .onEnded({ () in
                    
                    withAnimation(.linear){
                        
                        slected.toggle()
                    }
                    
                })
                .simultaneously(with: LongPressGesture(minimumDuration: 0.2).onEnded({ _ in
                    
                    withAnimation(.easeInOut){
                        
                        
                        animationVM.enalrgetActions = true
                        
                    }
                    
                   
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                      
                        
                        withAnimation(Animation.easeInOut.speed(1.3)){
                            
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            
                            animationVM.enalrgetActions = false
                            animationVM.showDetail = true
                            
                        }
                        
                        
                        
                        
                    }
                    
                    
                }))
        
        )
        .disabled(animationVM.enalrgetActions)
        
        
        
    
    }
}
