//
//  AnalyticsEvent.swift
//  GBShop
//
//  Created by Анастасия Живаева on 12.11.2021.
//

import Foundation
import Firebase

enum AnalyticsEvent {
    enum LoginParams {
        static let methodDefault = "default"
    }
    enum SomeMethodParams {
        static let nameDefault = "default"
        static let nameAssertionFailure = "assertionFailure"
    }
    case login(method: String, success: Bool)
    case someMethod(name: String, some: String)
}

protocol TrackableMixin {
    func track(_ event: AnalyticsEvent)
}

extension TrackableMixin {
    func track(_ event: AnalyticsEvent) {
        switch event {
        case let .login(method, success):
            Analytics.logEvent("login", parameters: [
                AnalyticsParameterMethod: method,
                AnalyticsParameterSuccess: success,
            ])
        case let .someMethod(name, some):
            Analytics.logEvent(name, parameters: [
                some: "parameter"
            ])
        }
    }
}
