//
//  ContentView.swift
//  exam
//
//  Created by Erik Cabrera on 23/11/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CasesViewModel()
    // Datos de muestra
    //    var case = (
    //        country: "Mexico",
    //        region: "North",
    //        cases: "")
    
    var body: some View {
        VStack{
            Text("Lista de Casos")
            if viewModel.isLoading {
                Text("Cargando")
            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
            } else {
                List(viewModel.cases) {data in
                    HStack {
                        // Detalles
                        VStack(alignment: .leading) {
                            Text(data.country ?? "Mexico")
                                .font(.headline)
                            Text(data.region ?? "Queretaro")
                                .font(.subheadline)
                        }
                        .padding(.leading, 5)
                    }
                }
            }
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

