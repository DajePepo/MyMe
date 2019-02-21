//
//  DataManager.swift
//  MyMe
//
//  Created by Pietro Santececca on 21.02.19.
//  Copyright © 2019 Tecnojam. All rights reserved.
//

import Foundation
import Apollo
import SwiftKeychainWrapper
import FacebookLogin

let accessTokenKey = "accessToken"
let graphQLEndpoint = "https://api.graph.cool/simple/v1/cjsbnx4hu4gyh017633iwc1lu"
let apollo: ApolloClient = {
    guard let accessToken = KeychainWrapper.standard.string(forKey: accessTokenKey) else {
        return ApolloClient(url: URL(string: graphQLEndpoint)!)
    }
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(accessToken)"]
    let url = URL(string: graphQLEndpoint)!
    return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
}()

struct DataManager {
    
    static func isUserLogged(completion: @escaping (Bool) -> Void) -> Void {
        if let _ = KeychainWrapper.standard.string(forKey: accessTokenKey) {
            apollo.fetch(query: LoggedInUserQuery()) { result, error in
                if let _ = result?.data?.loggedInUser?.id {
                    completion(true)
                }
                else {
                    completion(false)
                }
            }
        }
        else {
            completion(false)
        }
    }
    
    static func loginWithFacebook(success: @escaping () -> Void, failure: @escaping () -> Void) {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email, .userFriends]) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
                failure()
            case .cancelled:
                print("ERROR: User cancelled login.")
                failure()
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged with facebook!");
                print("Facebook token: \(accessToken.authenticationToken)")
                print("Granted permission: \(grantedPermissions)")
                print("Declined permissions: \(declinedPermissions)")
                let authenticateUserMutation = AuthenticateUserMutation(facebookToken: accessToken.authenticationToken)
                apollo.perform(mutation: authenticateUserMutation) { result, error in
                    guard let graphcoolToken = result?.data?.authenticateUser.token else {
                        print("ERROR: Graphcool authentication failed.")
                        failure(); return
                    }
                    let hasBeenTokenSaved = KeychainWrapper.standard.set(graphcoolToken, forKey: accessTokenKey)
                    if !hasBeenTokenSaved {
                        print("ERROR: Graphcool token has not been saved.")
                        failure(); return
                    }
                    print("User authentication completed!");
                    print("Graphcool token: \(graphcoolToken)")
                    success()
                }
            }
        }
    }

}
