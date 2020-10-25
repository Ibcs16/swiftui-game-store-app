//
//  UpdateList.swift
//  DesignCode
//
//  Created by Iago Brayham on 24/10/20.
//

import SwiftUI

struct UpdateList: View {
    var body: some View {
        NavigationView {
            List(updateData) { update in
                NavigationLink(
                    destination: Text(update.text)
                ) {
                    UpdateRow(update: update)
                }
            }
            .navigationBarTitle(Text("Updates"))
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}


struct Update: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var text: String
    var date: String
}

struct UpdateRow: View {
    var update: Update
    
    var body: some View {
        HStack {
            Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .background(Color.black)
                .cornerRadius(20)
                .padding(.trailing, 4)
            
            
            VStack(alignment: .leading, spacing: 8.0) {
                Text(update.title)
                    .font(
                        .system(size: 20, weight: .bold)
                    )
                
                Text(update.text)
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                
                Text(update.date)
                    .font(.caption)
                    .bold()
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}




let updateData = [
    Update(title: "SwiftUI Advanced", image: "Card1", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: "JAN 1"),
    Update(title: "Webflow", image: "Card2", text: "Design and animate a high converting landing page with advanced interactions, payments and CMS", date: "OCT 17"),
    Update(title: "ProtoPie", image: "Card3", text: "Quickly prototype advanced animations and interactions for mobile and Web.", date: "AUG 27"),
    Update(title: "SwiftUI", image: "Card4", text: "Learn how to code custom UIs, animations, gestures and components in Xcode 11", date: "JUNE 26"),
    Update(title: "Framer Playground", image: "Card5", text: "Create powerful animations and interactions with the Framer X code editor", date: "JUN 11")
]
