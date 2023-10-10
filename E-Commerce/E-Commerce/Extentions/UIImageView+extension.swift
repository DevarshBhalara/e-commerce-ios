//
//  UIImageView+extension.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 23/08/23.
//

import Foundation
import UIKit
extension UIImage {
    func resizedImage(to targetSize: CGSize) -> UIImage? {
        let render = UIGraphicsImageRenderer(size: targetSize)
        return render.image { ctx in
            self.draw(in: .init(origin: .zero, size: targetSize))
        }
    }
    
    func resizedImage(to targetSize: Int) -> UIImage? {
        return resizedImage(to: CGSize(width: targetSize, height: targetSize))
    }
}
