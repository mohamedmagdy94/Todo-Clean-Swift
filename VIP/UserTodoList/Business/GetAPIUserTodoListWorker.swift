//
//  GetAPIUserTodoListWorker.swift
//  VIP
//
//  Created by Mohamed El-Taweel on 9/3/20.
//  Copyright © 2020 Learning. All rights reserved.
//

import Foundation
import Moya

struct GetAPIUserTodoListWorker: UserTodoListWorking{
    
    var provider: MoyaProvider<UserTodoNetworkRouter>
    
    init() {
        self.provider = MoyaProvider<UserTodoNetworkRouter>(plugins: [NetworkLoggerPlugin(verbose: true)])
    }
    
    func getUserTodoList(userID: String,onSuccess: @escaping (UserTodoListResponse) -> (), onFailure: @escaping (UserTodoListError) -> ()) {
        let requestBody = UserTodoListRequest(userId: userID)
        provider
            .request(.UserTodoList(request: requestBody)) { (result) in
                switch result{
                case .success(let moyaResponse):
                    let data = moyaResponse.data
                    let codableTransformer = CodableTransformer()
                    guard let responseModel = codableTransformer.decodeObject(from: data, to: UserTodoListResponse.self) else{
                        onFailure(UserTodoListError.ServerError)
                        return
                    }
                    onSuccess(responseModel)
                case .failure:
                    onFailure(UserTodoListError.ServerError)
                    break
                    
                }
        }
    }
    
    
}
