//
//  NetworkService.swift
//  Compass_collection
//
//  Created by Kashif Rizvi on 12/05/22.
//

import Foundation
import UIKit

class NetworkService {
    let imageString = "https://picsum.photos/seed/%s/%d"
    
    func fetchImage(key: String?, index: Int, imageview: UIImageView) {//, completion: @escaping (UIImage?) -> Void) {
        
        var imageUrl = imageString.replacingOccurrences(of: "%s", with: key ?? "compass")
        imageUrl = imageUrl.replacingOccurrences(of: "%d", with: String(index))
        
        guard let url = URL(string: imageUrl) else {
            return
        }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                imageview.image = image
            }
            
            
        }.resume()
    }
}
