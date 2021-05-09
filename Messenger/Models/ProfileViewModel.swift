//
//  ProfileViewModel.swift
//  Messenger
//
//  Created by Rustem Kadyrov
//  
//

import Foundation

enum ProfileViewModelType {
    case info, logout
}

struct ProfileViewModel {
    let viewModelType: ProfileViewModelType
    let title: String
    let handler: (() -> Void)?
}

