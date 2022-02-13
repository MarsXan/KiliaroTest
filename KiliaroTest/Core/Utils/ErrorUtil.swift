//
//  ErrorUtil.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import Foundation

struct ErrorUtil {
    static func ErrorToKiliaroError(error: Error) -> ErrorRes {
        return ErrorRes()
    }

    static func osErrorToKnownError(error: Error) -> NetworkError {

        if let error = error as? NetworkError {
            return error
        } else if let error = error as? DecodingError {
            return NetworkError.decodeError(error)
        } else if let err = error as? URLError, err.code == URLError.Code.notConnectedToInternet {
            return NetworkError.noInternetConnection
        }


        return NetworkError.unknownError(error.localizedDescription)
    }

    static func errorToString(error: NetworkError) -> String {
        switch error {

        case .serverError:
            return "Something Went Wrong!"
        case .validationError(let kiliaroError):
            return kiliaroError.message ??  "Something Went Wrong!"
        case .missingSession:
            return "Invalid Authenticate"
        case .apiNotFound:
            return "Api Not Found"
        case .internalServerError:
            return "Something Went Wrong!"
        case .unknownError(_):
            return "Something Went Wrong!"
        case .decodeError(_):
            return "Something Went Wrong!"
        case .noInternetConnection:
            return "No Internet Connection!"
        case .encodeImageFailed:
            return "encodeImageFailed!"
        case .nilResultError:
            return "nilResultError!"
        case .uploadFailed:
            return "uploadFailed!"
        }
    }

    static func getErrorContent(error: NetworkError) -> String {
        "Error Content"
    }

    static func getErrorIcon(error: NetworkError) -> String {
        "iconName"
    }
}

