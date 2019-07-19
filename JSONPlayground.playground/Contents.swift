// Wrtten by John Loehr of MCS in July 2019

import UIKit

struct Ability: Codable {
  let name: String
  
  enum CodingKeys: String, CodingKey {
    case ability
  }
  
  enum AbilityCodingKeys: String, CodingKey {
    case name
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let abilityContainer = try container.nestedContainer(keyedBy: AbilityCodingKeys.self, forKey: .ability)
    self.name = try abilityContainer.decode(String.self, forKey: .name)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    var abilityContainer = container.nestedContainer(keyedBy: AbilityCodingKeys.self, forKey: .ability)
    try abilityContainer.encode(self.name, forKey: .name)
  }
}

struct Form: Codable {
  let name: String
  
  enum CodingKeys: String, CodingKey {
    case name
  }
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.name = try container.decode(String.self, forKey: .name)
  }
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.name, forKey: .name)
  }
}

struct GameIndex: Codable {
  let gameIndex: Int
  let name: String
  
  enum CodingKeys: String, CodingKey {
    case gameIndex = "game_index"
    case version
  }
  
  enum VersionCodingKeys: String, CodingKey {
    case name
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let versionContainer = try container.nestedContainer(keyedBy: VersionCodingKeys.self, forKey: .version)
    self.gameIndex = try container.decode(Int.self, forKey: .gameIndex)
    self.name = try versionContainer.decode(String.self, forKey: .name)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    var versionContainer = container.nestedContainer(keyedBy: VersionCodingKeys.self, forKey: .version)
    try versionContainer.encode(self.name, forKey: .name)
    try container.encode(self.gameIndex, forKey: .gameIndex)
  }
}

struct Move: Codable {
  let name: String
  let versionGroupDetails: [VersionGroupDetails]
  
  enum CodingKeys: String, CodingKey {
    case move
    case versionGroupDetails = "version_group_details"
  }
  
  enum MoveCodingKeys: String, CodingKey {
    case name
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let moveContainer = try container.nestedContainer(keyedBy: MoveCodingKeys.self, forKey: .move)
   
    self.name = try moveContainer.decode(String.self, forKey: .name)
    self.versionGroupDetails = try container.decode([VersionGroupDetails].self, forKey: .versionGroupDetails)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    var moveContainer = container.nestedContainer(keyedBy: MoveCodingKeys.self, forKey: .move)
    
    try moveContainer.encode(self.name, forKey: .name)
  }
}

struct VersionGroupDetails: Codable {
  let levelLearnedAt: Int
  let moveLearnMethodName: String
  let versionGroupName: String
  
  enum CodingKeys: String, CodingKey {
    case levelLearnedAt = "level_learned_at"
    case moveLearnMethod = "move_learn_method"
    case versionGroup = "version_group"
  }
  
  enum VersionDetailsCodingKeys: String, CodingKey {
    case name
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let moveLearnMethodContainer = try container.nestedContainer(keyedBy: VersionDetailsCodingKeys.self, forKey: .moveLearnMethod)
    let versionGroupContainer = try container.nestedContainer(keyedBy: VersionDetailsCodingKeys.self, forKey: .versionGroup)
    
    self.levelLearnedAt = try container.decode(Int.self, forKey: .levelLearnedAt)
    self.moveLearnMethodName = try moveLearnMethodContainer.decode(String.self, forKey: .name)
    self.versionGroupName = try versionGroupContainer.decode(String.self, forKey: .name)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    var moveLearnMethodContainer = container.nestedContainer(keyedBy: VersionDetailsCodingKeys.self, forKey: .moveLearnMethod)
    var versionGroupNameContainer = container.nestedContainer(keyedBy: VersionDetailsCodingKeys.self, forKey: .versionGroup)
    
    try container.encode(self.levelLearnedAt, forKey: .levelLearnedAt)
    try moveLearnMethodContainer.encode(self.moveLearnMethodName, forKey: .name)
    try versionGroupNameContainer.encode(self.versionGroupName, forKey: .name)
  }
  
}

struct Species: Codable {
  let name: String
  
  enum CodingKeys: String, CodingKey {
    case name
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try container.decode(String.self, forKey: .name)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    
    try container.encode(self.name, forKey: .name)
  }
}

struct Sprite: Codable {
  let frontDefault: URL?
  let frontFemale: URL?
  let frontShiny: URL?
  let frontShinyFemale: URL?
  let backDefault: URL?
  let backFemale: URL?
  let backShiny: URL?
  let backShinyFemale: URL?
  
  enum CodingKeys: String, CodingKey {
    case frontDefault = "front_default"
    case frontFemale = "front_female"
    case frontShiny = "front_shiny"
    case frontShinyFemale = "front_shiny_female"
    case backDefault = "back_default"
    case backFemale = "back_female"
    case backShiny = "back_shiny"
    case backShinyFemale = "back_shiny_female"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.frontDefault = try container.decode(URL?.self, forKey: .frontDefault)
    self.frontFemale = try container.decode(URL?.self, forKey: .frontFemale)
    self.frontShiny = try container.decode(URL?.self, forKey: .frontDefault)
    self.frontShinyFemale = try container.decode(URL?.self, forKey: .frontShinyFemale)
    
    self.backDefault = try container.decode(URL?.self, forKey: .backDefault)
    self.backFemale = try container.decode(URL?.self, forKey: .backFemale)
    self.backShiny = try container.decode(URL?.self, forKey: .backShiny)
    self.backShinyFemale = try container.decode(URL?.self, forKey: .backShinyFemale)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    
    try container.encode(self.frontDefault, forKey: .frontDefault)
    try container.encode(self.frontFemale, forKey: .frontFemale)
    try container.encode(self.frontShiny, forKey: .frontShiny)
    try container.encode(self.frontShinyFemale, forKey: .frontShinyFemale)
    
    try container.encode(self.backDefault, forKey: .backDefault)
    try container.encode(self.backFemale, forKey: .backFemale)
    try container.encode(self.backShiny, forKey: .backShiny)
    try container.encode(self.backShinyFemale, forKey: .backShinyFemale)
  }
}

struct Stats: Codable {
  let name: String
  let baseStat: Int
  let effort: Int
  
  enum CodingKeys: String, CodingKey {
    case stat
    case baseStat = "base_stat"
    case effort
  }
  
  enum StatCodingKeys: String, CodingKey {
    case name
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let statContainer = try container.nestedContainer(keyedBy: StatCodingKeys.self, forKey: .stat)
    self.name = try statContainer.decode(String.self, forKey: .name)
    self.baseStat = try container.decode(Int.self, forKey: .baseStat)
    self.effort = try container.decode(Int.self, forKey: .effort)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    var statContainer = container.nestedContainer(keyedBy: StatCodingKeys.self, forKey: .stat)
    try statContainer.encode(self.name, forKey: .name)
    try container.encode(self.baseStat, forKey: .baseStat)
    try container.encode(self.effort, forKey: .effort)
  }
}

struct Type: Codable {
  let slot: Int
  let name: String
  
  enum CodingKeys: String, CodingKey {
    case slot
    case type
  }
  
  enum TypeCodingKeys: String, CodingKey {
    case name
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let typeContainer = try container.nestedContainer(keyedBy: TypeCodingKeys.self, forKey: .type)
    self.slot = try container.decode(Int.self, forKey: .slot)
    self.name = try typeContainer.decode(String.self, forKey: .name)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    var typeContainer = container.nestedContainer(keyedBy: TypeCodingKeys.self, forKey: .type)
    try container.encode(self.slot, forKey: .slot)
    try typeContainer.encode(self.name, forKey: .name)
  }
}

struct Pokemon: Codable {
  let abilities: [Ability]
  let baseExperience: Int = 227
  let forms: [Form]
  let gameIndices: [GameIndex]
  let height: Int = 14
  // let heldItems: NOTE - contains an empty array of unknown type
  let id: Int = 34
  let isDefault: Bool = true
  let locationAreaEncounters: String = "https://pokeapi.co/api/v2/pokemon/34/encounters"
  let moves: [Move]
  let name: String = "nidoking"
  let order: Int = 54
  let species: Species
  let sprites: Sprite
  let stats: [Stats]
  let types: [Type]
  let weight: Int = 620
  
  enum CodingKeys: String, CodingKey {
    case abilities
    case baseExperience = "base_experience"
    case forms
    case gameIndices = "game_indices"
    case height
    //case heldItems = "held_items"
    case id
    case isDefault = "is_default"
    case locationAreaEncounters = "location_area_encounters"
    case moves
    case name
    case order
    case species
    case sprites
    case stats
    case types
    case weight
  }
}


if let jsonURL = Bundle.main.url(forResource: "PokemonExample", withExtension: "json"),
  let jsonData = try? Data(contentsOf: jsonURL) {
    let pokemon = try? JSONDecoder().decode(Pokemon.self, from: jsonData)
  print(pokemon)
//  let pokemon = Pokemon(dictionary: jsonDictionary)
//  print(pokemon)
} else {
  print("Something went horribly wrong.")
}
