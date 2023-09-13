//Created by Lugalu on 12/09/23.

import Foundation

protocol DataServiceProtocol{
    func retrieveTips(for: TipsType) async throws -> [TipEntity]
}
