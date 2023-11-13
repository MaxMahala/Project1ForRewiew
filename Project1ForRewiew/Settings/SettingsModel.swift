//
//  SettingsModel.swift
//  Project1ForRewiew
//
//  Created by Maksym on 20.10.2023.
//

import Foundation
import SwiftUI

final class RedColor{
    let redColor = Color("RedColor")
}
final class BlueColor{
    let blueColor = Color("BlueColor")
}

enum ColorCases: String{
    case dark, light
}
class Scheme: ObservableObject{
}
