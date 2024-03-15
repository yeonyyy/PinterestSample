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
        let photos = [Photo(name: "image0", title: "*djkdjkd*"),
                      Photo(name: "image1", title: "*djkdjkdjkjkjkjkjk*"),
                      Photo(name: "image2", title: "*ccc*"),
                      Photo(name: "image3", title: "*ddddddddddddddddddddddddddddddddddddjkdljldjldjldddddd*"),
                      Photo(name: "image4", title: "*aaaaaaaaa*"),
                      Photo(name: "image5", title: "*a*"),
                      Photo(name: "image6", title: "*djkd*"),
                      Photo(name: "image7", title: "*b*"),
                      Photo(name: "image8", title: "*aaaaaaaaa*"),
                      Photo(name: "image9", title: "*akjlalajlajlajaljaljalajlajakdjkjkbjkbjkbjbkbjbjk*"),
                      Photo(name: "image10", title: "*aaaaaaaaa*"),
                      Photo(name: "image11", title: "*bbjkjbkjbkjbkjb*")]
        return photos
    }
}
