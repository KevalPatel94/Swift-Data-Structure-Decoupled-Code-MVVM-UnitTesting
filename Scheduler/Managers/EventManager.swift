//
//  EventManager.swift
//  Scheduler
//
//  Created by Keval Patel on 1/18/21.
//

import Foundation

// MARK: - EventManager
/// `EventManager` is Singleton Class which can be accessed using `EventManager.shared`
class EventManager {
    private let mockFileName = "MockEvents"
    private let mockFileType = "json"
    private let dateFormat = "MMMM dd, yyyy hh:mm a"
    static let shared = EventManager()
    private init() {}
    
    /// getMeetingList generate meetingList from readJSONFromFile() and return error and result in the completion block.
    /// - Parameters:
    ///     - expectingReturnType: T.Type
    ///     - completion: String
    /// - Returns:  @escaping ((Result<T, Error>) -> Void)
    public func getMeetingList<T: Codable>(expectingReturnType: T.Type , completion: @escaping ((Result<T, SchedulerError>) -> Void)) {
        var decodableResult: T?
        guard let jsonData = readJSONFromFile() else {
            completion(.failure(LocalErrors.dataNotReadable))
            return
        }
        do {
            let decoder = JSONDecoder()
            let dateFormatter: DateFormatter = constructDateFormatter(dateFormat: dateFormat)
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            decodableResult = try decoder.decode(T.self, from: jsonData)
        }
        catch let jsonError{
            let error = SchedulerError(kind: .jsonError, message: jsonError.localizedDescription)
            completion(.failure(error))
        }
        
        guard let result = decodableResult else {
            completion(.failure(LocalErrors.dataNotDecodable))
          return
        }
        completion(.success(result))
        
    }
    
    /// readJSONFromFile reads data from "MockMeeting"  json file and returns that data.
    /// - Returns: Data?
    private func readJSONFromFile() -> Data? {
        var jsonData: Data
        // Retrive Path for file
        guard let filePath = Bundle.main.path(forResource: mockFileName, ofType: mockFileType) else {
            return nil
        }
        do {
            // Generate url of file using filePath
            let fileURL = URL(fileURLWithPath: filePath)
            jsonData = try Data(contentsOf: fileURL, options: .mappedIfSafe)
        }
        catch {
            return nil
        }
        return jsonData
    }

    /// constructDateFormatter construct the DateFormatter with any dateFormat given as an input.
    /// - Parameters:
    ///     - dateFormat: String
    /// - Returns: DateFormatter
    private func constructDateFormatter(dateFormat: String) -> DateFormatter {
        let localIdentifier = "en_US_POSIX"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = Locale(identifier: localIdentifier)
        return dateFormatter
    }
    
}

// MARK: - SchedulerError
struct SchedulerError: Error {
    enum ErrorKind {
        case dataNotReadable
        case dataNotDecodable
        case jsonError
    }
    let kind: ErrorKind
    let message: String
}


// MARK: - Errors
/// `LocalErrors` is a struct that has defination of errors used by enum `Errors`
struct LocalErrors {
    static let dataNotReadable = SchedulerError(kind: .dataNotReadable, message: "Can not Read Data from file")
    static let dataNotDecodable = SchedulerError(kind: .dataNotDecodable, message: "Can not decode Data from file")
}
