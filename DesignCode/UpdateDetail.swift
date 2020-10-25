//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by Iago Brayham on 25/10/20.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update
    
    var body: some View {
        VStack {
            Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            Text(update.text)
        }.navigationBarTitle(update.title)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail(update: updateData[0])
    }
}
