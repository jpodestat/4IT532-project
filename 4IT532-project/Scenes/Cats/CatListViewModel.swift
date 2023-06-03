//
//  CatsListViewModel.swift
//  4IT532-project
//
//  Created by Jan Podestát on 01.06.2023.
//

import Foundation

@MainActor final class CatListViewModel: ObservableObject {

    enum State {
        case initial
        case loading
        case fetched
        case failed
    }
    
    @Injected private var apiManager: APIManaging
        
    @Published var cats: [Cat] = []
    @Published var state: State = .initial
    
    
    func load() async {
        state = .loading
        await fetch()
    }
    
    
    func fetch(page: Int? = nil) async {
        
        do {
            Logger.log("Calling cats breeds", .info)

            let endpoint = CatEndpoint.getBreeds(page: page)
            
            let response: [Cat] = try await apiManager.request(endpoint: endpoint)
            
            // make it alphabetical
            cats = response.sorted(by: {
                $0.name < $1.name
            })
            Logger.log("Successfully called cats breeds", .info)
            state = .fetched
        } catch {
            
            if let error = error as? URLError, error.code == .cancelled {
                Logger.log("URL request was cancelled", .error)
                
                state = .fetched
                
                return
            }
            
            debugPrint(error)
            state = .failed
        }
    }
}
