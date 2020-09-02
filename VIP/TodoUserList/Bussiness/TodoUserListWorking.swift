//
//  TodoUserListWorking.swift
//  VIP
//
//  Created by Mohamed El-Taweel on 9/1/20.
//  Copyright © 2020 Learning. All rights reserved.
//

import Foundation

protocol TodoUserListWorking {
    func getUserList(onSuccess: @escaping(UserListResponse)->(),onFailure: @escaping(TodoUserListError)->())
}
