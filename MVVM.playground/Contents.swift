import UIKit
import Foundation
import Combine



public struct User {
    let name: String
    let ocupation: String
}

class NetworkService {
    func fetchData() -> AnyPublisher<User,Error>{
        
       let data = User(name: "faizul", ocupation: "Software eng")
       
        return Just(data).setFailureType(to: Error.self).delay(for: .seconds(2), scheduler: DispatchQueue.main).eraseToAnyPublisher()
    }
}


class UserViewModel {
    var onUpdate: (() -> Void)?
    let networkService = NetworkService()
    @Published var user : User?
    private var cancelable = Set<AnyCancellable>()
    func fetchUserData() {
        networkService.fetchData().receive(on: DispatchQueue.main).sink { copletion in
            if case .failure(let error) = copletion {
            print("Error fetching user data: \(error.localizedDescription)")
                      }
            
        } receiveValue: { user in
            self.user = user
            
        }.store(in: &cancelable)
    }
}

class Viewcontroller {
    
    var userViewModel: UserViewModel!
    private var cancelable = Set<AnyCancellable>()
    init(userModel : UserViewModel) {
        self.userViewModel = userModel

        self.userViewModel.$user.receive(on: DispatchQueue.main).sink { [weak self] user in
            self?.updateView()
        }.store(in: &cancelable)

    }
    func updateView(){
        print("\(userViewModel.user?.name ?? "")")
    }
    
    
    
}

var userv = UserViewModel()


let useC = Viewcontroller(userModel: userv)
useC.userViewModel.fetchUserData()
    
