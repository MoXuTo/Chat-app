//
//  StorageManager.swift
//  Messenger
//
//  Created by Панкратьева Ольга on 18.04.2021.
//

import Foundation
import FirebaseStorage

final class StorageManager{

    static let shared = StorageManager()
    private let storage = Storage.storage().reference()

    public typealias UploadPictureCompletion = (Result<String,Error>) -> Void

    /// Upload photo to firebase and return url to download
    public func uploadProfilePicture(with data: Data,
                                     fileName: String,
                                     completion: @escaping UploadPictureCompletion){
        storage.child("images/\(fileName)").putData(data, metadata: nil, completion: {metadata, error in guard error == nil else{

            /// Failed
            print("failed to upload photo")
            completion(.failure(StorageErrors.failedToUpload))
            return
            }

        self.storage.child("images/\(fileName)").downloadURL(completion: { url, error in
            guard let url = url else{
                print("failed to get doenload url")
                completion(.failure(StorageErrors.failedToGetDownloadUrl))
                return
            }

            let urlString = url.absoluteString
            print("download url returned : \(urlString)")
            completion(.success(urlString))
        })

        })
    }

    public enum StorageErrors: Error{
        case failedToUpload
        case failedToGetDownloadUrl
    }

    public func downloadURL(for path: String, completion: @escaping (Result<URL, Error>) -> Void) {
        let reference = storage.child(path)

        reference.downloadURL(completion: { url, error in
            guard let url = url, error == nil else {
                completion(.failure(StorageErrors.failedToGetDownloadUrl))
                return
            }

            completion(.success(url))
        })
    }
}
