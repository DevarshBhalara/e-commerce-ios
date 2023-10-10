//
//  Slider.swift
//  E-Commerce
//
//  Created by Devarsh Bhalara on 11/10/23.
//

import UIKit

struct SliderModel {
    var image: UIImage?
}

struct Slider {
    static func getAllImage() -> [SliderModel] {
        return [
            SliderModel(image: UIImage(named: "ads")),
            SliderModel(image: UIImage(named: "ads")),
            SliderModel(image: UIImage(named: "ads")),
            SliderModel(image: UIImage(named: "ads")),
            SliderModel(image: UIImage(named: "ads")),
        ]
    }
}
