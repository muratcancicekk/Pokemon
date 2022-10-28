//
//  PokemonModel.swift
//  Pokemon
//
//  Created by Murat on 27.10.2022.
//

import Foundation

// MARK: - Welcome3
struct Pokemon: Decodable {
    let abilities: [Ability]?
    let baseExperience: Int?
    let id: Int?
    let moves: [Move]?
    let name: String?
    let species: Species?
    let sprites: Sprites?
    let stats: [Stat]?
    let types: [TypeElement]?
    let weight: Int?
}

// MARK: - Ability
struct Ability: Decodable {
    let ability: Species?
    let isHidden: Bool?
    let slot: Int?
}

// MARK: - Species
struct Species: Decodable {
    let name: String?
    let url: String?
}

// MARK: - GameIndex
struct GameIndex: Decodable {
    let gameIndex: Int?
    let version: Species?
}

// MARK: - Move
struct Move: Decodable {
    let move: Species?
    let versionGroupDetails: [VersionGroupDetail]?
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Decodable {
    let levelLearnedAt: Int?
    let moveLearnMethod, versionGroup: Species?
}

// MARK: - GenerationV
struct GenerationV: Decodable {
    let blackWhite: Sprites?
}

// MARK: - GenerationIv
struct GenerationIv: Decodable {
    let diamondPearl, heartgoldSoulsilver, platinum: Sprites
}

// MARK: - Versions
struct Versions: Decodable {
    let generationI: GenerationI?
    let generationIi: GenerationIi?
    let generationIii: GenerationIii?
    let generationIv: GenerationIv?
    let generationV: GenerationV?
    let generationVi: [String: Home]?
    let generationVii: GenerationVii?
    let generationViii: GenerationViii?
}

// MARK: - Sprites
class Sprites: Decodable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
    let other: Other?
    let versions: Versions?
    let animated: Sprites?

    init(backDefault: String?, backFemale: NSNull?, backShiny: String?, backShinyFemale: NSNull?,
         frontDefault: String?, frontFemale: NSNull?, frontShiny: String?, frontShinyFemale: NSNull?, other: Other?, versions: Versions?, animated: Sprites?) {
        self.backDefault = backDefault
        self.backShiny = backShiny
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
        self.other = other
        self.versions = versions
        self.animated = animated
    }
}

// MARK: - GenerationI
struct GenerationI: Decodable {
    let redBlue, yellow: RedBlue
}

// MARK: - RedBlue
struct RedBlue: Decodable {
    let backDefault, backGray, backTransparent, frontDefault: String?
    let frontGray, frontTransparent: String?
}

// MARK: - GenerationIi
struct GenerationIi: Decodable {
    let crystal: Crystal?
    let gold, silver: Gold?
}

// MARK: - Crystal
struct Crystal: Decodable {
    let backDefault, backShiny, backShinyTransparent, backTransparent: String?
    let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String?
}

// MARK: - Gold
struct Gold: Decodable {
    let backDefault, backShiny, frontDefault, frontShiny: String?
    let frontTransparent: String?
}

// MARK: - GenerationIii
struct GenerationIii: Decodable {
    let emerald: Emerald?
    let fireredLeafgreen, rubySapphire: Gold?
}

// MARK: - Emerald
struct Emerald: Decodable{
    let frontDefault, frontShiny: String?
}

// MARK: - Home
struct Home: Decodable {
    let frontDefault: String?
    let frontShiny: String?
}

// MARK: - GenerationVii
struct GenerationVii: Decodable {
    let icons: DreamWorld?
    let ultraSunUltraMoon: Home?
}

// MARK: - DreamWorld
struct DreamWorld: Decodable {
    let frontDefault: String?
}

// MARK: - GenerationViii
struct GenerationViii: Decodable {
    let icons: DreamWorld?
}

// MARK: - Other
struct Other: Decodable {
    let dreamWorld: DreamWorld?
    let home: Home?
    let officialArtwork: OfficialArtwork?
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Decodable {
    let frontDefault: String?
}

// MARK: - Stat
struct Stat: Decodable {
    let baseStat, effort: Int?
    let stat: Species?
}

// MARK: - TypeElement
struct TypeElement: Decodable {
    let slot: Int?
    let type: Species?
}
