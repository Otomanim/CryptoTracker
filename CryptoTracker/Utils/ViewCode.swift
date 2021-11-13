//
//  ViewCode.swift
//  CryptoTracker
//
//  Created by Evandro Rodrigo Minamoto on 04/11/21.
//

import Foundation
protocol ViewCode {
  func buildViewHierarchy()
  func addConstraints()
  func additionalConfiguration()
  func setup()
}
extension ViewCode {
  func setup() {
    buildViewHierarchy()
    addConstraints()
    additionalConfiguration()
  }
}
