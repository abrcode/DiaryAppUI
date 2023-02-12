//
//  URLSession.swift
//  DiaryApp
//
//  Created by Aniket Rao on 05/08/22.
//

import Foundation
import UIKit

class URLSessionFile{
    
   static let shared =  URLSessionFile()
    
    func getDiaryData(){
        let url = URL(string: "https://private-ba0842-gary23.apiary-mock.com/notes")!

        var request = URLRequest(url: url)

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let diaryData = try? JSONDecoder().decode([DiaryList].self, from: data) {
                    print(diaryData)
                    print("First Content :\(diaryData[0].content)")
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        
        task.resume()
        
    }

}
