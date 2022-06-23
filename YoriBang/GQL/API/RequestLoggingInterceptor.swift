//
//  RequestLoggingInterceptor.swift
//  YoriBang
//
//  Created by wi_seong on 2021/11/04.
//

import Apollo
import OSLog

class RequestLoggingInterceptor: ApolloInterceptor {
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        
        debugPrint(request)
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}
