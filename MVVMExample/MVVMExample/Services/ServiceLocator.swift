//Created by Lugalu on 12/09/23.

import Foundation

protocol ServiceLocatorProtocol{
    static var serviceLocator: ServiceLocatorProtocol { get }
    static func createServiceLocator(overwrite: ServiceLocatorProtocol) -> ServiceLocatorProtocol
    func retriveDataService() -> DataServiceProtocol?
    func updateDataService(with dataService: DataServiceProtocol)
}

class ServiceLocator: ServiceLocatorProtocol{

    private var dataService: DataServiceProtocol = OfflineService()
    
    static private(set) var serviceLocator: ServiceLocatorProtocol = ServiceLocator()
    
    private init(){ }
    
    static func createServiceLocator(overwrite: ServiceLocatorProtocol = ServiceLocator()) -> ServiceLocatorProtocol {
        ServiceLocator.serviceLocator = overwrite
        return serviceLocator
    }
    
    func retriveDataService() -> DataServiceProtocol? {
        return dataService
    }
    
    func updateDataService(with dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    
}
