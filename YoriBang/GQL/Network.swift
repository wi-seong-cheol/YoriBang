//
//  Network.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/04.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()
    
  private(set) lazy var apollo: ApolloClient = {
      // The cache is necessary to set up the store, which we're going to hand to the provider
      let cache = InMemoryNormalizedCache()
      let store = ApolloStore(cache: cache)

      var configuration = URLSessionConfiguration.default
      configuration.timeoutIntervalForRequest = 5.0
      configuration.timeoutIntervalForResource = 5.0
      
      let client = URLSessionClient()
      let provider = NetworkInterceptorProvider(store: store, client: client)
      let url = URL(string: "http://172.30.1.17:3000/graphql")!

      let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                               endpointURL: url)


      // Remember to give the store you already created to the client so it
      // doesn't create one on its own
      return ApolloClient(networkTransport: requestChainTransport,
                          store: store)
  }()
}
