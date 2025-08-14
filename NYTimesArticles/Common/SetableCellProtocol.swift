//
//  SetableCellProtocol.swift
//  NYTimesArticles
//
//  Created by Adnan Alam Khan on 14/08/25.
//

import Foundation

/// - A protocol that defines a cell capable of being configured with a specific data type.
/// - Types conforming to this protocol must define the type of data they work with,
/// - and implement the `configureCell(with:)` method to update the cell's content.
/// -
protocol SetableCellProtocol {
    associatedtype DataType
    func configureCell(with model: DataType)
}
