//
//  NetworkError.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import Foundation


import Foundation

public enum NetworkError: Error, LocalizedError {
    case serverError
    case validationError(KiliaroError)
    case missingSession
    case apiNotFound
    case internalServerError
    case unknownError(String)
    case decodeError(Error)
    case noInternetConnection
    case encodeImageFailed
    case nilResultError
    case uploadFailed


    var errorMessage: String? {
        switch self {
        case .validationError(let error):
            return error.message
        case .unknownError(let error):
            return error
        case .decodeError(let error):
            #if DEBUG
            return (error as NSError).debugDescription
            #else
            return error.localizedDescription
            #endif
        default:
            return nil

        }
    }
}

extension NetworkError: Equatable {
    public static func ==(lhs: NetworkError, rhs: NetworkError) -> Bool {
        if case .serverError = lhs, case .serverError = rhs {
            return true
        }
        if case .serverError = lhs, case .serverError = rhs {
            return true
        }
        if case .validationError(_) = lhs, case .validationError(_) = rhs {
            return true
        }
        if case .missingSession = lhs, case .missingSession = rhs {
            return true
        }
        if case .apiNotFound = lhs, case .apiNotFound = rhs {
            return true
        }
        if case .internalServerError = lhs, case .internalServerError = rhs {
            return true
        }
        if case .unknownError(_) = lhs, case .unknownError(_) = rhs {
            return true
        }
        if case .decodeError(_) = lhs, case .decodeError(_) = rhs {
            return true
        }
        if case .noInternetConnection = lhs, case .noInternetConnection = rhs {
            return true
        }
        if case .encodeImageFailed = lhs, case .encodeImageFailed = rhs {
            return true
        }
        if case .nilResultError = lhs, case .nilResultError = rhs {
            return true
        }
        return false
    }
}
