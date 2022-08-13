//
//  SignupStep3VM.swift
//  JangGaeJaRang
//
//  Created by 짜미 on 2022/08/14.
//  Copyright © 2022 org.spaghetti. All rights reserved.
//

import Foundation

enum gbti: CaseIterable {
    case leader, independence, timid, positive
    
    var title: String {
        switch self {
        case .leader:
            return "리더형"
        case .independence:
            return "독립형"
        case .timid:
            return "소심형"
        case .positive:
            return "긍정형"
        }
    }
    
    var tags: String {
        switch self {
        case .leader:
            return "#무리욕구_강함\n#적응력_강함\n#공격형_자기방어"
        case .independence:
            return "#무리욕구_약함\n#적응력_강함\n#공격형_자기방어"
        case .timid:
            return "#무리욕구_약함\n#적응력_약함\n#도주형_자기방어"
        case .positive:
            return "#사고뭉치\n#무리욕구_강함\n#적응력_강함"
        }
    }
}

class SignupStep3VM: BaseViewModel {
    @Published var description: String = ""
    @Published var instagramUrl: String = ""
    @Published var gbti: gbti?
}
