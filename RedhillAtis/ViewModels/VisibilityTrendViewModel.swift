//
//  VisibilityTrendViewModel.swift
//  RedhillAtis
//
//  Created by Stefano Cislaghi on 04/06/2025.
//

import Foundation

enum VisibilityTrendError: Error, LocalizedError {
    case invalidURL
    case networkError(Error)
    case decodingError(DecodingError)
    case unknownError

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided is invalid."
        case .networkError(let error):
            return "A network error occurred: \(error.localizedDescription)"
        case .decodingError(let decodingError):
            switch decodingError {
            case .keyNotFound(let key, let context):
                return
                    "Decoding error: Key '\(key)' not found. \(context.debugDescription)"
            case .dataCorrupted(let context):
                return
                    "Decoding error: Data corrupted. \(context.debugDescription)"
            case .typeMismatch(let type, let context):
                return
                    "Decoding error: Type mismatch for \(type). \(context.debugDescription)"
            case .valueNotFound(let type, let context):
                return
                    "Decoding error: Value not found for \(type). \(context.debugDescription)"
            @unknown default:
                return "Decoding error: An unknown decoding error occurred."
            }
        case .unknownError:
            return "An unknown error occurred."
        }
    }
}

@Observable
class VisibilityObservationViewModel {
    var visibilityObservation: [VisibilityObservation] = .init()

    func fetchVisibilityTrend() async throws {
        // Validate the URL
        guard
            let url = URL(
                string:
                    "https://serverless-wrapper-redhill-minimet.vercel.app/api/v5/visibility"
            )
        else {
            throw MetarError.invalidURL
        }

        do {
            // Fetch data from the URL
            let (data, _) = try await URLSession.shared.data(from: url)

            // Decode the data into the `RedhillAtis` model
            visibilityObservation = try JSONDecoder().decode([VisibilityObservation].self, from: data)
            debugPrint(visibilityObservation)
        } catch let decodingError as DecodingError {
            // Handle decoding errors
            throw VisibilityTrendError.decodingError(decodingError)
        } catch {
            // Handle other errors (e.g., network errors)
            throw VisibilityTrendError.networkError(error)
        }
    }
}
