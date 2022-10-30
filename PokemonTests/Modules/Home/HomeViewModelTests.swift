//
//  HomeViewModelTests.swift
//  PokemonTests
//
//  Created by Murat on 30.10.2022.
//

import Foundation
@testable import Pokemon

final class HomeViewModelTests: XCTestCase {
    private var viewModel: HomePageViewModel!
    private var view: PokemonHomeView!
    override func setUp() {
        super.setUp()
        view = .init()
        viewModel = .init()
    }
    override func tearDown() {
        super.tearDown()
    }
    func test_fetchPokemon_ReturnPokemon() {
        XCTAssertEqual(view, 0)
    }
}
