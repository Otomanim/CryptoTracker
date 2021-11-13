//
//  CryptoListViewModel.swift
//  CryptoTracker
//
//  Created by Evandro Rodrigo Minamoto on 04/11/21.
//

import Foundation

final class CryptoListViewModel {
    private var cryptos = [CryptoCellModel]()
    private let service: NetworkService
    
    enum State {
        case loading
        case error(error: Error)
        case loaded
    }
    
    var currentState: State = .loading {
        didSet {
            stateChaged?()
        }
    }
    
    var stateChaged: (() -> Void)?
    
    var numberOfItems: Int {
//        return cryptos.count
        switch currentState {
        case .loaded:
            return cryptos.count
        default:
            return 0
        }
    }
    
    var stateDescription: String? {
        switch currentState {
        case .loading:
            return "Loading cryptos"
        case .error(let error):
            return error.localizedDescription
        case .loaded:
            return numberOfItems == 0 ? "No cryptos founded" : nil
        }
    }
    
    init(service: NetworkService = NetworkService.shared){
        self.service = service
    }
    
    func modelForRow(at index: Int) -> CryptoCellModel {
        cryptos[index]
    }
    
    func loadCryptos(){
        currentState = .loading
        service.requestAllCryptos {[weak self] result in
            guard let self = self else {return}
//            error para teste
//            let error = NSError(domain: "Test", code: -1, userInfo: nil)
//            self.currentState = .error(error: error)
//            return
            switch result {
            case .success(let cryptos):
                self.cryptos = cryptos.map{ CryptoCellModel(crypto: $0)}
                self.currentState = .loaded
            case .failure(let error):
                print(error)
                self.currentState = .error(error: error)
            }
        }
    }
}
