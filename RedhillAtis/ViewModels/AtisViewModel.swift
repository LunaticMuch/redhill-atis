//
//  AtisViewModel.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 02/04/2025.
//

import Foundation

@Observable
class AtisViewModel {
    var current: RedhillAtis = .init()

    func fetchRedhillAtis() async throws {
        let url = URL(string: "https://serverless-wrapper-redhill-minimet.vercel.app/api/v2/minimet")!
        let (data, _) = try await URLSession.shared.data(from: url)
        current = try JSONDecoder().decode(RedhillAtis.self, from: data)
    }
}
