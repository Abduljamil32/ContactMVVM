//
//  CreateViewModel.swift
//  ContactMVVM

import Foundation

class CreateViewModel: ObservableObject{
    @Published var isCreated = false
    
    func apiCreatePost(post: Contact){
       isCreated = true
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: { response in
            self.isCreated = false
            switch response.result{
            case .success:
                print(response.result)

            case let .failure(error):
                print(error)
            }
        })
    }
}
