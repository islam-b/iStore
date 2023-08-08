//
//  PagedResult.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 8/8/2023.
//

import Foundation


struct PagedResult<T: Decodable> : Decodable {
    let totalCount: Int
    let items: [T]
}
