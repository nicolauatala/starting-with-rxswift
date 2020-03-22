import Foundation

public func example(of description: String, action: () -> Void) {
	print("\n--- Example of:", description, "---")
	action()
}

public enum Quote: Error {
	case neverSaidThat
}

public enum MyError: Error {
	case anError
}

public let itsNotMyFault = "It’s not my fault."
public let doOrDoNot = "Do. Or do not. There is no try."
public let lackOfFaith = "I find your lack of faith disturbing."
public let eyesCanDeceive = "Your eyes can deceive you. Don’t trust them."
public let stayOnTarget = "Stay on target."
public let iAmYourFather = "Luke, I am your father"
public let useTheForce = "Use the Force, Luke."
public let theForceIsStrong = "The Force is strong with this one."
public let mayTheForceBeWithYou = "May the Force be with you."
public let mayThe4thBeWithYou = "May the 4th be with you."


/*
 BlackJack
*/


public let cards = [
	("🂡", 11), ("🂢", 2), ("🂣", 3), ("🂤", 4), ("🂥", 5), ("🂦", 6), ("🂧", 7), ("🂨", 8), ("🂩", 9), ("🂪", 10), ("🂫", 10), ("🂭", 10), ("🂮", 10),
	("🂱", 11), ("🂲", 2), ("🂳", 3), ("🂴", 4), ("🂵", 5), ("🂶", 6), ("🂷", 7), ("🂸", 8), ("🂹", 9), ("🂺", 10), ("🂻", 10), ("🂽", 10), ("🂾", 10),
	("🃁", 11), ("🃂", 2), ("🃃", 3), ("🃄", 4), ("🃅", 5), ("🃆", 6), ("🃇", 7), ("🃈", 8), ("🃉", 9), ("🃊", 10), ("🃋", 10), ("🃍", 10), ("🃎", 10),
	("🃑", 11), ("🃒", 2), ("🃓", 3), ("🃔", 4), ("🃕", 5), ("🃖", 6), ("🃗", 7), ("🃘", 8), ("🃙", 9), ("🃚", 10), ("🃛", 10), ("🃝", 10), ("🃞", 10)
]

public func cardString(for hand: [(String, Int)]) -> String {
	return hand.map { $0.0 }.joined(separator: "")
}

public func points(for hand: [(String, Int)]) -> Int {
	return hand.map { $0.1 }.reduce(0, +)
}

public enum HandError: Error {
	
	case busted
}
