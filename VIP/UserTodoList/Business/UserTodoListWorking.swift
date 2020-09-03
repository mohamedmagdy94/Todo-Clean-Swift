//
//  UserTodoListWorking.swift
//  VIP
//
//  Created by Mohamed El-Taweel on 9/3/20.
//  Copyright © 2020 Learning. All rights reserved.
//

import Foundation

protocol UserTodoListWorking {
    func getUserTodoList(userID: String,onSuccess: @escaping (UserTodoListResponse)->(),onFailure: @escaping(UserTodoListError)->())
}
