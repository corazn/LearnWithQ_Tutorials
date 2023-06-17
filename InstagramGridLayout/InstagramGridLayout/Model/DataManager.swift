//
//  DataManager.swift
//  InstagramGridLayout
//
//  Created by QuyetBH on 17/06/2023.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private init() {
        do {
            let data = try Data(contentsOf: Bundle.main.url(forResource: "images", withExtension: "json")!)
            self.imageModels = try JSONDecoder().decode([ImageModel].self, from: data)
        } catch let e {
            print(e)
        }
    }
    
    private var imageModels = [ImageModel]()
    
    func fetchRandomImage(completion: @escaping (Data?) -> Void) {
        guard
            let randomModel = self.imageModels.randomElement(),
            let url = randomModel.imageUrl
        else {
            completion(nil)
            return
        }
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            completion(data)
        }
    }
    
}
