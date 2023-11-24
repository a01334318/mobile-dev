//
//  ContentView.swift
//  exam
//
//  Created by Erik Cabrera on 23/11/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = CasesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("COVID-19 Global Stats")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .padding(.top, 25)
                
                List(contentViewModel.caseList, id: \.country) { covid in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(covid.country)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text("Total Cases: \(covid.cases.total)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Text("Region: \(covid.region)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            }
            .onAppear {
                Task {
                    await contentViewModel.fetchCases()
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

