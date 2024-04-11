//
//  Photo.swift
//  PinterestSample
//
//  Created by rayeon lee on 2024/03/13.
//

import Foundation

struct Photo {
    var name : String
    var title : String
    
    static func getPhotos() -> [Photo] {
        let photos = [Photo(name: "image0", title: "Birds are attractive creatures that have various behaviors and adaptations."),
                      Photo(name: "image1", title: "Here's How Watermelon Can Help Control Blood Pressure This Summer"),
                      Photo(name: "image2", title: "He is an African grey parrot"),
                      Photo(name: "image3", title: "tulip"),
                      Photo(name: "image4", title: "night"),
                      Photo(name: "image5", title: "The Old Man and the Sea"),
                      Photo(name: "image6", title: "car"),
                      Photo(name: "image7", title: "the lights of the city"),
                      Photo(name: "image8", title: "The Dolphin and the Baby"),
                      Photo(name: "image9", title: "Disneyland, a fairy tale land"),
                      Photo(name: "image10", title: "green parrot"),
                      Photo(name: "image11", title: "Santorini")]
        return photos
    }
}
