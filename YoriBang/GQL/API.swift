// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct SendVerificationCodeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - phoneNumber
  public init(phoneNumber: String) {
    graphQLMap = ["phoneNumber": phoneNumber]
  }

  public var phoneNumber: String {
    get {
      return graphQLMap["phoneNumber"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phoneNumber")
    }
  }
}

public struct LoginInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - phoneNumber
  ///   - verificationCode
  public init(phoneNumber: String, verificationCode: String) {
    graphQLMap = ["phoneNumber": phoneNumber, "verificationCode": verificationCode]
  }

  public var phoneNumber: String {
    get {
      return graphQLMap["phoneNumber"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phoneNumber")
    }
  }

  public var verificationCode: String {
    get {
      return graphQLMap["verificationCode"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "verificationCode")
    }
  }
}

public final class SendVerificationCodeMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SendVerificationCode($input: SendVerificationCodeInput) {
      sendVerificationCode(input: $input)
    }
    """

  public let operationName: String = "SendVerificationCode"

  public var input: SendVerificationCodeInput?

  public init(input: SendVerificationCodeInput? = nil) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sendVerificationCode", arguments: ["input": GraphQLVariable("input")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sendVerificationCode: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "sendVerificationCode": sendVerificationCode])
    }

    public var sendVerificationCode: String? {
      get {
        return resultMap["sendVerificationCode"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "sendVerificationCode")
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Login($input: LoginInput) {
      login(input: $input)
    }
    """

  public let operationName: String = "Login"

  public var input: LoginInput?

  public init(input: LoginInput? = nil) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: String) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login])
    }

    public var login: String {
      get {
        return resultMap["login"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "login")
      }
    }
  }
}
