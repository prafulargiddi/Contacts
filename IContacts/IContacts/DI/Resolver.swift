//
//  Resolver.swift
//  IContacts
//
//  Created by Praful Argiddi on 23/12/23.
//

import Foundation
import Swinject
class Resolver {
    static let shared = Resolver()
    private var container = buildContainer()
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
    func setDependancyContainer(_ container: Container) {
        self.container = container
    }
}
