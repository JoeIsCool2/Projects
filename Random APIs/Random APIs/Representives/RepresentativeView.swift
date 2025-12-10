//
//  Untitled.swift
//  Random APIs
//
//  Created by joseph wright on 12/10/25.
//



import SwiftUI

struct RepresentativeView: View {
    @State private var representative: [Representative]? = nil
    @State private var errorMessage: String? = nil
    @State private var isLoading = false
    private let api = RepresentativeAPIController()
    @State private var repData: RepresentativesResponse? = nil
    @State var zipCodeSearched: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search ZipCode", text: $zipCodeSearched )
                    .padding()
                    .glassEffect(in: RoundedRectangle(cornerRadius: 16))
                    .padding()
                    .onSubmit {
                        findRep(zipCode: zipCodeSearched)
                    }
                
                Spacer()
                if isLoading {
                    ProgressView("Loading...")
                } else if let reps = representative {
                    ScrollView {
                        ForEach(reps) { rep in
                            HStack {
                                Spacer()
                                VStack {
                                    Text(rep.name)
                                        .font(.custom("Impact", size: 40))
                                        .bold()
                                    Text("\(rep.party), \(rep.state)")
                                        .font(.custom("", size: 20))
                                    Text("Link: \(rep.link)")
                                        .font(.custom("", size: 20))
                                }
                                Spacer()
                            }
                            .padding()
                            .glassEffect(.regular.tint(rep.party.hasPrefix("R") ? Color.red : .blue),
                                         in: RoundedRectangle(cornerRadius: 16))
                            .padding()
                        }
                    }
                } else if let error = errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .navigationTitle("Representative")
        }
    }

    // State updater
    func findRep(zipCode: String) {
        Task {
            isLoading = true
            do {
                repData = try await api.fetchRep(zipCode: zipCode)
                representative = repData?.results
                errorMessage = nil
            } catch {
                errorMessage = "Failed to fetch representative. \(error)"
            }
            isLoading = false
        }
    }
}

#Preview {
    RepresentativeView()
}
