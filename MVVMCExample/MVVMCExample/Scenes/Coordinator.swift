//Created by Lugalu on 12/10/23.

import Foundation

typealias Coordinator = (BaseCoordinator & CoordinatorProtocol)

class BaseCoordinator: Equatable {
    private(set) var childs: [BaseCoordinator] = []
    
    func addChildCoordinator(_ coordinator: BaseCoordinator){
        childs.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: BaseCoordinator){
        if let index = childs.firstIndex(of: coordinator) {
            childs.remove(at: index)
        }
    }
    
    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        childs = childs.filter { $0 is T  == false }
    }
    
    func removeAllChildCoordinators() {
        childs.removeAll()
    }
    
    static func == (lhs: BaseCoordinator, rhs: BaseCoordinator) -> Bool {
        return lhs === rhs
    }
}


protocol CoordinatorProtocol: BaseCoordinator{
    func start()
    func finish()
}



