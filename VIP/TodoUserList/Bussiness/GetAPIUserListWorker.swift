//
//  GetAPIUserListWorker.swift
//  VIP
//
//  Created by Mohamed El-Taweel on 9/1/20.
//  Copyright © 2020 Learning. All rights reserved.
//

import Foundation
import Moya

struct GetAPIUserListWorker: TodoUserListWorking{
    
    var provider: MoyaProvider<TodoUserListMoyaProvider>
    
    init() {
        self.provider = MoyaProvider<TodoUserListMoyaProvider>(plugins: [NetworkLoggerPlugin(verbose: true)])
    }
    
    func getUserList(onSuccess: @escaping (UserListResponse) -> (), onFailure: @escaping (TodoUserListError) -> ()) {
        provider
            .request(.TodoUserList) { (result) in
                switch result {
                case let .success(moyaResponse):
                    let data = moyaResponse.data
                    let codableTransformer = CodableTransformer()
                    guard let responseModel = codableTransformer.decodeObject(from: data, to: UserListResponse.self) else{
                        onFailure(TodoUserListError.ServerError)
                        return
                    }
                    onSuccess(responseModel)
                case .failure:
                    onFailure(TodoUserListError.Connectivity)
                }
        }
    }
    
    
}
