//
//  User.swift
//  contest
//
//  Created by LKY on 12/01/21.
//  Copyright © 2021 LKY. All rights reserved.
//

import Foundation

struct UserResponse {
    let code: Int?
    let meta: Meta?
    let data: User?
}

struct User {
    let id: Int?
    let name: String?
    let email: String?
    let gender: String?
    let status: String?
    let created_at: Date?
    let updated_aus: Date?
}

struct Meta{
    
}
