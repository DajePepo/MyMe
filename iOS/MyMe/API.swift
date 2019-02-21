//  This file was automatically generated and should not be edited.

import Apollo

public enum VisibilityEnum: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case all
  case friends
  case onlyMe
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ALL": self = .all
      case "FRIENDS": self = .friends
      case "ONLY_ME": self = .onlyMe
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .all: return "ALL"
      case .friends: return "FRIENDS"
      case .onlyMe: return "ONLY_ME"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: VisibilityEnum, rhs: VisibilityEnum) -> Bool {
    switch (lhs, rhs) {
      case (.all, .all): return true
      case (.friends, .friends): return true
      case (.onlyMe, .onlyMe): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public enum ContentTypeEnum: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case text
  case video
  case audio
  case image
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "TEXT": self = .text
      case "VIDEO": self = .video
      case "AUDIO": self = .audio
      case "IMAGE": self = .image
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .text: return "TEXT"
      case .video: return "VIDEO"
      case .audio: return "AUDIO"
      case .image: return "IMAGE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ContentTypeEnum, rhs: ContentTypeEnum) -> Bool {
    switch (lhs, rhs) {
      case (.text, .text): return true
      case (.video, .video): return true
      case (.audio, .audio): return true
      case (.image, .image): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public final class CreateMemoryMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateMemory($creatorId: ID!, $visibility: VisibilityEnum!, $latitude: Float!, $longitude: Float!, $contentType: ContentTypeEnum!, $content: String!, $creationDate: DateTime!, $unlockingDate: DateTime) {\n  createMemory(creatorId: $creatorId, visibility: $visibility, latitude: $latitude, longitude: $longitude, contentType: $contentType, content: $content, creationDate: $creationDate, unlockingDate: $unlockingDate) {\n    __typename\n    id\n    creationDate\n    contentType\n  }\n}"

  public var creatorId: GraphQLID
  public var visibility: VisibilityEnum
  public var latitude: Double
  public var longitude: Double
  public var contentType: ContentTypeEnum
  public var content: String
  public var creationDate: String
  public var unlockingDate: String?

  public init(creatorId: GraphQLID, visibility: VisibilityEnum, latitude: Double, longitude: Double, contentType: ContentTypeEnum, content: String, creationDate: String, unlockingDate: String? = nil) {
    self.creatorId = creatorId
    self.visibility = visibility
    self.latitude = latitude
    self.longitude = longitude
    self.contentType = contentType
    self.content = content
    self.creationDate = creationDate
    self.unlockingDate = unlockingDate
  }

  public var variables: GraphQLMap? {
    return ["creatorId": creatorId, "visibility": visibility, "latitude": latitude, "longitude": longitude, "contentType": contentType, "content": content, "creationDate": creationDate, "unlockingDate": unlockingDate]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createMemory", arguments: ["creatorId": GraphQLVariable("creatorId"), "visibility": GraphQLVariable("visibility"), "latitude": GraphQLVariable("latitude"), "longitude": GraphQLVariable("longitude"), "contentType": GraphQLVariable("contentType"), "content": GraphQLVariable("content"), "creationDate": GraphQLVariable("creationDate"), "unlockingDate": GraphQLVariable("unlockingDate")], type: .object(CreateMemory.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createMemory: CreateMemory? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createMemory": createMemory.flatMap { (value: CreateMemory) -> ResultMap in value.resultMap }])
    }

    public var createMemory: CreateMemory? {
      get {
        return (resultMap["createMemory"] as? ResultMap).flatMap { CreateMemory(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createMemory")
      }
    }

    public struct CreateMemory: GraphQLSelectionSet {
      public static let possibleTypes = ["Memory"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("creationDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("contentType", type: .nonNull(.scalar(ContentTypeEnum.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, creationDate: String, contentType: ContentTypeEnum) {
        self.init(unsafeResultMap: ["__typename": "Memory", "id": id, "creationDate": creationDate, "contentType": contentType])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var creationDate: String {
        get {
          return resultMap["creationDate"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "creationDate")
        }
      }

      public var contentType: ContentTypeEnum {
        get {
          return resultMap["contentType"]! as! ContentTypeEnum
        }
        set {
          resultMap.updateValue(newValue, forKey: "contentType")
        }
      }
    }
  }
}

public final class DeleteMemoryMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation DeleteMemory($id: ID!) {\n  deleteMemory(id: $id) {\n    __typename\n    id\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteMemory", arguments: ["id": GraphQLVariable("id")], type: .object(DeleteMemory.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteMemory: DeleteMemory? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteMemory": deleteMemory.flatMap { (value: DeleteMemory) -> ResultMap in value.resultMap }])
    }

    public var deleteMemory: DeleteMemory? {
      get {
        return (resultMap["deleteMemory"] as? ResultMap).flatMap { DeleteMemory(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteMemory")
      }
    }

    public struct DeleteMemory: GraphQLSelectionSet {
      public static let possibleTypes = ["Memory"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Memory", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class AuthenticateUserMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation AuthenticateUser($facebookToken: String!) {\n  authenticateUser(facebookToken: $facebookToken) {\n    __typename\n    token\n  }\n}"

  public var facebookToken: String

  public init(facebookToken: String) {
    self.facebookToken = facebookToken
  }

  public var variables: GraphQLMap? {
    return ["facebookToken": facebookToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("authenticateUser", arguments: ["facebookToken": GraphQLVariable("facebookToken")], type: .nonNull(.object(AuthenticateUser.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(authenticateUser: AuthenticateUser) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "authenticateUser": authenticateUser.resultMap])
    }

    /// facebookAuthentication
    public var authenticateUser: AuthenticateUser {
      get {
        return AuthenticateUser(unsafeResultMap: resultMap["authenticateUser"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "authenticateUser")
      }
    }

    public struct AuthenticateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["AuthenticateUserPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("token", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String) {
        self.init(unsafeResultMap: ["__typename": "AuthenticateUserPayload", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}

public final class AllMemoriesQuery: GraphQLQuery {
  public let operationDefinition =
    "query AllMemories {\n  allMemories {\n    __typename\n    ...MemoryDetails\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(MemoryDetails.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allMemories", type: .nonNull(.list(.nonNull(.object(AllMemory.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allMemories: [AllMemory]) {
      self.init(unsafeResultMap: ["__typename": "Query", "allMemories": allMemories.map { (value: AllMemory) -> ResultMap in value.resultMap }])
    }

    public var allMemories: [AllMemory] {
      get {
        return (resultMap["allMemories"] as! [ResultMap]).map { (value: ResultMap) -> AllMemory in AllMemory(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: AllMemory) -> ResultMap in value.resultMap }, forKey: "allMemories")
      }
    }

    public struct AllMemory: GraphQLSelectionSet {
      public static let possibleTypes = ["Memory"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(MemoryDetails.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, visibility: VisibilityEnum, latitude: Double, longitude: Double, contentType: ContentTypeEnum) {
        self.init(unsafeResultMap: ["__typename": "Memory", "id": id, "visibility": visibility, "latitude": latitude, "longitude": longitude, "contentType": contentType])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var memoryDetails: MemoryDetails {
          get {
            return MemoryDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class LoggedInUserQuery: GraphQLQuery {
  public let operationDefinition =
    "query LoggedInUser {\n  loggedInUser {\n    __typename\n    id\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("loggedInUser", type: .object(LoggedInUser.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(loggedInUser: LoggedInUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "loggedInUser": loggedInUser.flatMap { (value: LoggedInUser) -> ResultMap in value.resultMap }])
    }

    /// loggedInUser
    public var loggedInUser: LoggedInUser? {
      get {
        return (resultMap["loggedInUser"] as? ResultMap).flatMap { LoggedInUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "loggedInUser")
      }
    }

    public struct LoggedInUser: GraphQLSelectionSet {
      public static let possibleTypes = ["LoggedInUserPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "LoggedInUserPayload", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public struct MemoryDetails: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment MemoryDetails on Memory {\n  __typename\n  id\n  visibility\n  latitude\n  longitude\n  contentType\n}"

  public static let possibleTypes = ["Memory"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("visibility", type: .nonNull(.scalar(VisibilityEnum.self))),
    GraphQLField("latitude", type: .nonNull(.scalar(Double.self))),
    GraphQLField("longitude", type: .nonNull(.scalar(Double.self))),
    GraphQLField("contentType", type: .nonNull(.scalar(ContentTypeEnum.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, visibility: VisibilityEnum, latitude: Double, longitude: Double, contentType: ContentTypeEnum) {
    self.init(unsafeResultMap: ["__typename": "Memory", "id": id, "visibility": visibility, "latitude": latitude, "longitude": longitude, "contentType": contentType])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var visibility: VisibilityEnum {
    get {
      return resultMap["visibility"]! as! VisibilityEnum
    }
    set {
      resultMap.updateValue(newValue, forKey: "visibility")
    }
  }

  public var latitude: Double {
    get {
      return resultMap["latitude"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "latitude")
    }
  }

  public var longitude: Double {
    get {
      return resultMap["longitude"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "longitude")
    }
  }

  public var contentType: ContentTypeEnum {
    get {
      return resultMap["contentType"]! as! ContentTypeEnum
    }
    set {
      resultMap.updateValue(newValue, forKey: "contentType")
    }
  }
}