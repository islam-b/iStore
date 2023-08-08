//
//  CategoryManager.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 8/8/2023.
//

import Foundation


class CategoryService : BaseService {
    
    var delegate : CategoryServiceDelegate?
        
    func fetchCategories() {
        let url = URL(string: "\(baseUrl)/categories")
        let request = URLRequest(url: url!)
        
        performRequest(request, handleData: { data in
            self.delegate?.onCategoriesReceived(data)
        }, handleError: { error in
            self.delegate?.handleError(error)
        })
    }
    
    
}



protocol CategoryServiceDelegate: BaseServiceDelegate {
    
    func onCategoriesReceived(_ page: PagedResult<Category>) -> Void
    
}

