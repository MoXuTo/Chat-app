//
//  ConversationsModels.swift
//  Messenger
//
//  Created by Maxim Zaostrovsky on 12/05/21.
//  Copyright © 2020 ASN GROUP LLC. All rights reserved.
//

import Foundation

struct Conversation {
    let id: String
    let name: String
    let otherUserEmail: String
    let latestMessage: LatestMessage
}

struct LatestMessage {
    let date: String
    let text: String
    let isRead: Bool
}
