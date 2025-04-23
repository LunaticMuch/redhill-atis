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
        let url = URL(
            string:
                "https://serverless-wrapper-redhill-minimet.vercel.app/api/v3/minimet"
        )!
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            current = try JSONDecoder().decode(RedhillAtis.self, from: data)
        } catch let DecodingError.keyNotFound(key, context) {
            print(
                "Decoding error (keyNotFound): \(key) not found in \(context.debugDescription)"
            )
            print("Coding path: \(context.codingPath)")
        } catch let DecodingError.dataCorrupted(context) {
            print(
                "Decoding error (dataCorrupted): data corrupted in \(context.debugDescription)"
            )
            print("Coding path: \(context.codingPath)")
        } catch let DecodingError.typeMismatch(type, context) {
            print(
                "Decoding error (typeMismatch): type mismatch of \(type) in \(context.debugDescription)"
            )
            print("Coding path: \(context.codingPath)")
        } catch let DecodingError.valueNotFound(type, context) {
            print(
                "Decoding error (valueNotFound): value not found for \(type) in \(context.debugDescription)"
            )
            print("Coding path: \(context.codingPath)")
        }

    }
}
