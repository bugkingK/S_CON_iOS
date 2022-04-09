//
//  Content.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/29.
//

import UIKit

//디테일 뷰에 보여질 데이터
struct DetailData {
    let title: String
    let subTitle: String
    let youtubeLink: URL
    let description: String
    let members: [Member]
    let devSkill: String
    let devDate: String
}

//팀원 정보
struct Member{
    let name: String
    let studentName: String
    let department: DEPARTMENT
}

enum DEPARTMENT: String{
    case HUMAN
    case SOCIETY
    case MEDIA
    case IT
}

struct Header {
    let header: String
    let dataList: [DataList]
}

struct DataList{
    let title: String
    let discription: String
    let photo: UIImage?
    
}
