//
//  NetworkErrorResponse.swift
//  ApplicationList
//
//  Created by Carlo Gabriel Tapales on 06/07/2025.
//

import Foundation

enum NetworkErrorResponse: Int {
    case badRequest = 400
    case unauthorized = 401
    case paymentRequired = 402
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case notAcceptable = 406
    case proxyAuthenticationRequired = 407
    case requestTimeout = 408
    case conflict = 409
    case gone = 410
    case lengthRequired = 411
    case preconditionFailed = 412
    case payloadTooLarge = 413
    case URITooLong = 414
    case unsupportedMediaType = 415
    case rangeNotSatisfiable = 416
    case expectationFailed = 417
    case teapot = 418
    case misdirectedRequest = 421
    case unprocessableEntity = 422
    case locked = 423
    case failedDependency = 424
    case upgradeRequired = 426
    case preconditionRequired = 428
    case tooManyRequests = 429
    case requestHeaderFieldsTooLarge = 431
    case noResponse = 444
    case unavailableForLegalReasons = 451
    case SSLCertificateError = 495
    case SSLCertificateRequired = 496
    case HTTPRequestSentToHTTPSPort = 497
    case clientClosedRequest = 499
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504
    case HTTPVersionNotSupported = 505
    case variantAlsoNegotiates = 506
    case insufficientStorage = 507
    case loopDetected = 508
    case notExtended = 510
    case networkAuthenticationRequired = 511
    case noInternetConnection = 996
    case invalidNetworkResponse = 997
    case invalidUrl = 998
    case unknownError = 999
    
    var message: String {
        switch self {
        case .badRequest:
             "Bad Request."
        case .unauthorized:
             "Unauthorized."
        case .paymentRequired:
             "Payment Required."
        case .forbidden:
             "Forbidden."
        case .notFound:
             "Not Found."
        case .methodNotAllowed:
             "Method Not Allowed."
        case .notAcceptable:
             "Not Acceptable."
        case .proxyAuthenticationRequired:
             "Proxy Authentication Required."
        case .requestTimeout:
             "Request Timeout."
        case .conflict:
             "Conflict."
        case .gone:
             "Gone."
        case .lengthRequired:
             "Length Required."
        case .preconditionFailed:
             "Precondition Failed."
        case .payloadTooLarge:
             "Payload Too Large."
        case .URITooLong:
             "URI Too Long."
        case .unsupportedMediaType:
             "Unsupported Media Type."
        case .rangeNotSatisfiable:
             "Range Not Satisfiable."
        case .expectationFailed:
             "Expectation Failed."
        case .teapot:
             "I'm a teapot."
        case .misdirectedRequest:
             "Misdirected Request."
        case .unprocessableEntity:
             "Unprocessable Entity."
        case .locked:
             "Locked."
        case .failedDependency:
             "Failed Dependency."
        case .upgradeRequired:
             "Upgrade Required."
        case .preconditionRequired:
             "Precondition Required"
        case .tooManyRequests:
             "Too Many Requests."
        case .requestHeaderFieldsTooLarge:
             "Request Header Fields Too Large."
        case .noResponse:
             "No Response."
        case .unavailableForLegalReasons:
             "Unavailable For Legal Reasons."
        case .SSLCertificateError:
             "SSL Certificate Error."
        case .SSLCertificateRequired:
             "SSL Certificate Required."
        case .HTTPRequestSentToHTTPSPort:
             "HTTP Request Sent to HTTPS Port."
        case .clientClosedRequest:
             "Client Closed Request."
        case .internalServerError:
             "Internal Server Error."
        case .notImplemented:
             "Not Implemented."
        case .badGateway:
             "Bad Gateway."
        case .serviceUnavailable:
             "Service Unavailable."
        case .gatewayTimeout:
             "Gateway Timeout."
        case .HTTPVersionNotSupported:
             "HTTP Version Not Supported."
        case .variantAlsoNegotiates:
             "Variant Also Negotiates."
        case .insufficientStorage:
             "Insufficient Storage."
        case .loopDetected:
             "Loop Detected."
        case .notExtended:
             "Not Extended."
        case .networkAuthenticationRequired:
             "Network Authentication Required."
        case .noInternetConnection:
             "No Internet Connection."
        case .invalidNetworkResponse:
             "Invalid Network Response."
        case .invalidUrl:
             "Invalid URL."
        case .unknownError:
             "Unknown Error."
        }
    }
}
