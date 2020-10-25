//
//  CourseList.swift
//  DesignCode
//
//  Created by Iago Brayham on 25/10/20.
//

import SwiftUI

struct CourseList: View {
    
    @State var show = false;
    
    @State var viewState = CGSize.zero
    
    @State var showBottomCard = false
    
    @State var bottomCardViewState = CGSize.zero
    
    @State var showBottomCardFull = false
    
    var body: some View {
        ZStack {
            
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showBottomCard ? 0.4 : 1)
                .offset(y: showBottomCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
                        // .speed(2))
                    )
            
            BackCardView()
                .frame(width: showBottomCard ? 300 : 340, height: 220)
                .background(Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showBottomCard ? -180 : 0)
                .scaleEffect(showBottomCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showBottomCard ? -10 : 0))
                .rotation3DEffect(
                    .degrees(showBottomCard ? 0 : 10),
                    axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            BackCardView()
                .frame(width: 340, height: 220)
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showBottomCard ? -140 : 0)
                .scaleEffect(showBottomCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(showBottomCard ? -5 : 0))
                .rotation3DEffect(
                    .degrees(showBottomCard ? 0 : 5),
                    axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
                  
            
            CardView()
                .frame(width: showBottomCard ? 375 : 340, height: 220)
                .background(Color.black)
                // .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showBottomCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showBottomCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showBottomCard.toggle()
                    
                }
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                        self.show = true
                    }
                    .onEnded { value in
                        self.viewState = .zero
                        self.show = false
                    }
                )
            
            
            BottomCardView()
                .offset(x: 0, y: showBottomCard ? 360 : 1000)
                .offset(y: bottomCardViewState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.bottomCardViewState = value.translation
                            
                            if self.showBottomCardFull {
                                self.bottomCardViewState.height += -300
                            }
                            
                            if self.bottomCardViewState.height < -300 {
                                self.bottomCardViewState.height = -300
                            }
                        }
                        .onEnded { value in
                            if self.bottomCardViewState.height > 50 {
                                self.showBottomCard = false
                            }
                            
                            if (self.bottomCardViewState.height < -100  && !self.showBottomCardFull) || (self.bottomCardViewState.height < -250 && self.showBottomCardFull)  {
                                self.bottomCardViewState.height = -300
                                self.showBottomCardFull = true
                            } else {
                                self.bottomCardViewState = .zero
                                self.showBottomCardFull = false
                            }
                            
                           
                        }
                )
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Spacer()
            
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
            
        }
       
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
            }
            .padding()
            Image("Background1")
            
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                .opacity(0.1)
            
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .edgesIgnoringSafeArea(.bottom)
    }
}

