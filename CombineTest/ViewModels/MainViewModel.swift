//
//  MainViewModel.swift
//  CombineTest
//
//  Created by Leo Ho on 2023/3/6.
//

import Foundation
import Combine

class MainViewModel {
    
    /// 儲存訂閱狀態
    var subscribes: Set<AnyCancellable> = []
    
    /// 訊息陣列
    @Published var messageArray: [String] = []
}
