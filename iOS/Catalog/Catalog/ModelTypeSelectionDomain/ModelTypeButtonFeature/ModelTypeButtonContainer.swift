//
//  ModelTypeButtonContainer.swift
//  Catalog
//
//  Created by Jung peter on 8/12/23.
//

import SwiftUI

struct ModelTypeButtonContainer: View {
  var intent: ModelTypeCellIntentType
  var options: [ModelTypeOptionState]
}

extension ModelTypeButtonContainer {
  var body: some View {
    HStack {
      ForEach(options.indices, id: \.self) { i in
        ModelTypeButtonView(state: options[i], action: { id in
          if let index = options.firstIndex(where: { $0.id == id }) {
            intent.send(action: .onTapOptions(id: id))
          }
        })
      }
    }
  }
}

struct ModelTypeButtonContainer_Previews: PreviewProvider {
    static var previews: some View {
      ModelTypeButtonContainer(intent: ModelTypeCellIntent(initialState: .init()), options: [])
    }
}