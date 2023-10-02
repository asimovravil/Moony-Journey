//
//  RequestResponse.swift
//  Moony Journey
//
//  Created by Mikha on 29.09.2023.
//

import Foundation

final class RequestResponseManager {
    
    static let shared = RequestResponseManager()
    
    var privacyPolicy = URL(string: "https://dev-g5juatkti177rij.api.raw-labs.com/moon_journey")!
    
    func isItPossibleToOpenOrNot(
        _ url: URL,
        comletion: @escaping(Bool) -> Void
    ) {
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard
                error == nil,
                let data = data,
                let htmlString = String(data: data, encoding: .utf8)
            else {
                comletion(true)
                return
            }
            comletion(htmlString.isEmpty)
        }
        task.resume()
    }
    
    func getGames(
        success: @escaping(StructedSettings) -> Void,
        failure: @escaping() -> Void
    ) {
        let urlString = "https://dev-g5juatkti177rij.api.raw-labs.com/moon_journey"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async { failure() }
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(
                    with: data,
                    options: []
                ) as? Any
                guard let json = json else {
                    DispatchQueue.main.async { failure() }
                    return
                }
                guard
                    let privacy = json as? [String: Any],
                    let privacyPolicyString = privacy["privacy_policy"] as? String,
                    let termOfUseString = privacy["term_of_use"] as? String,
                    let sumChecked = privacy["sum_checked"] as? Bool,
                    let privacyPolicy = URL(string: privacyPolicyString),
                    let termOfUse = URL(string: termOfUseString)
                else {
                    DispatchQueue.main.async { failure() }
                    return
                }
                print("ХЭЙ")
                self.privacyPolicy = privacyPolicy
                if sumChecked {
                    self.isItPossibleToOpenOrNot(url) { impossible in
                        DispatchQueue.main.async {
                            success(StructedSettings(
                                privacyPolicy: privacyPolicy,
                                termOfUse: termOfUse,
                                sumChecked: !impossible
                            ))
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        success(StructedSettings(
                            privacyPolicy: privacyPolicy,
                            termOfUse: termOfUse,
                            sumChecked: false
                        ))
                    }
                }
            } catch {
                DispatchQueue.main.async { failure() }
            }
        }
        task.resume()
    }
    
    
}
