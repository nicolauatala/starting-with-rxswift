import RxSwift

public func example(of description: String, action: () -> Void) {
	print("\n--- Example of:", description, "---")
	action()
}

example(of: "PublishSubject") {
	
	let quotes = PublishSubject<String>()
	/*
	
	PublishSubject emits only new items to its subscriber; every item added to the subject before the subscription
		will be not emitted. If the source Observable terminates with an error, the PublishSubject will not emit any
		items to subsequent observers, but will simply pass along the Error/Completed event from the source Observable.
	*/
	
	quotes.onNext("itsNotMyFault")
	
	let subscriptionOne = quotes
		.subscribe {
			print("1) \($0)")
	}
	
	quotes.on(.next("doOrNot"))
	
	let subscriptionTwo = quotes
		.subscribe {
			print("2) \($0)")
	}
	
	quotes.onNext("lackFail")
	
	quotes.onCompleted()
	
}

example(of: "BehaviorSubject") {
	
	enum AnyError: Error {
		case neverSaidThat
	}
	
	let disposeBag = DisposeBag()
	
	let quotes = BehaviorSubject<String>(value: "I'm your father")
	
	quotes.onNext("Second thing I said")
	
	let subscriptionOne = quotes.subscribe {
		print("1) \($0)")
	}
	
	quotes.onNext("Thrid thing I said")
	
	quotes.onError(AnyError.neverSaidThat)
	
	quotes.subscribe {
		print("2) \($0)")
	}
	.disposed(by: disposeBag)
}

example(of: "ReplaySubject") {
	let disposeBag = DisposeBag()
	
	let subject = ReplaySubject<String>.create(bufferSize: 2)
	
	subject.onNext("Use the force Luke")
	
	subject.onNext("The force is strong")
	
	subject.subscribe {
		print("1) \($0)")
	}
	.disposed(by: disposeBag)
	
	subject.onNext("For the thrid time use the force")
	
	subject.subscribe {
		print("2) \($0)")
	}
	.disposed(by: disposeBag)
	
}
