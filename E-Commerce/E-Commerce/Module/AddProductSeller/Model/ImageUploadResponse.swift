//
//  ImageUploadResponse.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 24/10/23.
//

struct ImageUploadResponse: Codable {
    let data: DataClass?
    let success: Bool?
    let status: Int?
}


struct DataClass: Codable {
    let id, title: String?
    let urlViewer: String?
    let url, displayURL: String?
    let width, height, size, time: Int?
    let expiration: Int?
    let image, thumb, medium: Image?
    let deleteURL: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case urlViewer
        case url
        case displayURL
        case width, height, size, time, expiration, image, thumb, medium
        case deleteURL
    }
}

struct Image: Codable {
    let filename, name, mime, imageExtension: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case filename, name, mime
        case imageExtension
        case url
    }
}
