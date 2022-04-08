//
//  ContestData.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/04/07.
//

import Foundation

//enum CONTEST_SORT {
//    case IT, SOFTWARE
//}
//
//enum CONTEST_YEAR{
//    case twenyone, twenty, nineteen
//}
//
//enum PRIZE {
//    case 대상, 금상, 은상, 동상, 장려상
//}

struct ContestData: Decodable{
    let id: Int
    let name: String
    let subTitle: String
    let contestSort: String
    let award: String
    let year: Int
    let img: String
    let infoDetail: InfoDetail
}

struct InfoDetail: Decodable{
    let awardDetail: String
    let summary: String
    let people: String
    let calendar: String
    let gitLink: String
    let youtubeLink: String
    let serviceLink: String
    let skills: String
}
