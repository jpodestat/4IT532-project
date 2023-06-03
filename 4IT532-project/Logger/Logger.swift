//
//  Logger.swift
//  4IT532-project
//
//  Created by Jan Podestát on 01.06.2023.
//

import os.log

final class Logger {
    enum MessageKind {
        case info
        case success
        case error
    }
    
    private init() {}
}

extension Logger {
    static func log(_ message: String, _ kind: MessageKind = .info, _ type: OSLogType = .info) {
        let icon: String
        
        switch kind {
        case .info:
            icon = "ℹ️"
        case .success:
            icon = "✅"
        case .error:
            icon = "🔴"
        }
        
        os_log("%@ %@", type: type, icon, message)
    }
}
