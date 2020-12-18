//
//  ContentView.swift
//  UI-76
//
//  Created by にゃんにゃん丸 on 2020/12/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    var body: some View{
        
        VStack{
            
            
            HStack{
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("t1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                })
                
                Spacer()
                
                Text("Title")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("t2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                })
                
                
                
                
                
            }
            .padding(.horizontal)
            
            
            GeometryReader{reader in
                
                ForEach(items.reversed()){pro in
                    
                    ProfileView(pro: pro, frame: reader.frame(in: .global))
                    
                    
                }
                
                
            }
            .padding([.horizontal,.bottom])
            
            Spacer()
            
        }
        .background(Color.black.opacity(0.03).edgesIgnoringSafeArea(.all))
        
        
        
    }
}

struct ProfileView : View {
    @State var pro : item
    
    var frame : CGRect
    
    var body: some View{
        
        ZStack(alignment:Alignment(horizontal: .center, vertical: .bottom)){
            
            Image(pro.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: frame.width, height: frame.height)
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                
                
                (pro.offset > 0 ? Color.green : Color.purple)
                    .opacity(pro.offset != 0 ? 0.7 : 0)
                
                
                HStack{
                    
                    if pro.offset < 0{ Spacer(minLength: 0)}
                    
                    
                    Text(pro.offset == 0 ? "" : (pro.offset > 0 ? "Gool" : "SuperCool"))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top,25)
                        .padding(.horizontal)
                        
                       
                        
                    
                    
                    
                    
                    
                  if pro.offset > 0{Spacer(minLength: 0)}
                    
                }
                
                
            })
            
            
            
            LinearGradient(gradient: .init(colors: [Color.red.opacity(0.3),Color.purple.opacity(0.3)]), startPoint: .center, endPoint: .bottom)
            
            VStack{
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 20, content: {
                        Text(pro.name)
                            .font(.title)
                            .fontWeight(.bold)
                            
                        
                        Text(pro.age + " +")
                            .font(.title)
                            .fontWeight(.bold)
                           
                        
                    })
                    .padding()
                    .foregroundColor(.white)
                    Spacer(minLength: 0)
                    
                    HStack(spacing:20){
                        
                        Spacer()
                        
                        
                        Button(action: {
                            withAnimation(Animation.easeIn(duration: 1)){
                                pro.offset = -1000
                                
                                
                            }
                            
                            
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                                .padding(20)
                                .background(Color.blue)
                                .clipShape(Circle())
                                .offset(x: -20)
                        })
                        
                        Button(action: {
                            withAnimation(Animation.easeIn(duration: 1)){
                                pro.offset = +1000
                                
                                
                            }
                            
                        }, label: {
                            Image(systemName: "checkmark")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                                .padding(20)
                                .background(Color.purple)
                                .clipShape(Circle())
                                .offset(x: -20)
                        })
                        Spacer(minLength: 0)
                        
                    }
                    
                    
                }
                
                
            }
          
            
            
            
        }
       
        .cornerRadius(20)
        .offset(y: pro.offset)
        .rotationEffect(.init(degrees: pro.offset == 0 ? 0 :(pro.offset > 0 ? 12 : -12)))
        .gesture(
        
        DragGesture()
            .onChanged({ (value) in
                withAnimation(Animation.default){
                    pro.offset = value.translation.width
                    
                    
                }
            })
            
            .onEnded({ (value) in
                
                withAnimation(Animation.easeIn){
                    if pro.offset > 150{
                        
                        pro.offset = 1000
                        
                    }
                    else if pro.offset < -150{
                        
                        pro.offset = -1000
                        
                    }
                    else{pro.offset = 0}
                    
                }
                
            })
        
        )
        
        
        
    }
}
