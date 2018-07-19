//
//  StoreItem.swift
//  StoreApp
//
//  Created by yuaming on 09/07/2018.
//  Copyright © 2018 yuaming. All rights reserved.
//

import Foundation

struct StoreItem: Decodable {
  let title: String
  let description: String
  let normalPrice: String?
  let salePrice: String
  let deliveryTypes: [String]?
  let detailHash: String
  let imageUrl: String
  let alt: String
  let badges: [String]?
  let thumbnail: Thumbnail
  
  enum CodingKeys: String, CodingKey {
    case title
    case description
    case normalPrice = "n_price"
    case salePrice = "s_price"
    case deliveryTypes = "delivery_type"
    case detailHash = "detail_hash"
    case imageUrl = "image"
    case alt
    case badges = "badge"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self.title = try values.decode(String.self, forKey: .title)
    self.description = try values.decode(String.self, forKey: .description)
    self.normalPrice = try? values.decode(String.self, forKey: .normalPrice)
    self.salePrice = try values.decode(String.self, forKey: .salePrice)
    self.deliveryTypes = try? values.decode([String].self, forKey: .deliveryTypes)
    self.detailHash = try values.decode(String.self, forKey: .detailHash)
    self.imageUrl = try values.decode(String.self, forKey: .imageUrl)
    self.alt = try values.decode(String.self, forKey: .alt)
    self.badges = try? values.decode([String].self, forKey: .badges)
    self.thumbnail = Thumbnail(imageUrl)
  }
}
