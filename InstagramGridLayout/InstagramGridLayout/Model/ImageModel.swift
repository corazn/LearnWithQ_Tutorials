//
//  ImageModel.swift
//  InstagramGridLayout
//
//  Created by QuyetBH on 17/06/2023.
//

import Foundation

struct ImageModel: Decodable {
    let id: String?
    let secret: String?
    let server: String?
    let farm: Int?
    
    var imageUrl: URL? {
        guard
            let id = self.id,
            let secret = self.secret,
            let server = self.server,
            let farm = self.farm
        else {
            return nil
        }
        let string = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
        return URL(string: string)
    }
}
