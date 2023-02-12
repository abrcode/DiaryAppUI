//
//  DiaryModel.swift
//  DiaryApp
//
//  Created by Aniket Rao on 05/08/22.
//

import Foundation

// MARK: - Diary Model

struct DiaryData: Decodable {
    var diaryList : [DiaryList]?
}

struct DiaryList: Decodable{
    
    var id, title, content, date: String?
    
    enum CodingKeys : String, CodingKey{
       case id = "id"
        case title = "title"
        case content = "content"
        case date = "date"
    }
}

