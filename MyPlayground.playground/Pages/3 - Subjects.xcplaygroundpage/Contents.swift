import RxSwift

public func example(of description: String, action: () -> Void) {
	print("\n--- Example of:", description, "---")
	action()
}

example(of: "PublishSubject") {
	
	/*
	
	PublishSubject emits only new items to its subscriber; every item added to the subject before the subscription
	will be not emitted. If the source Observable terminates with an error, the PublishSubject will not emit any
	items to subsequent observers, but will simply pass along the Error/Completed event from the source Observable.
	*/
	
	let quotes = PublishSubject<String>()
	
	quotes.onNext(itsNotMyFault)
	
	let subscriptionOne = quotes
		.subscribe {
			print("1) \($0)")
	}
	
	quotes.on(.next(doOrDoNot))
	
	let subscriptionTwo = quotes
		.subscribe {
			print("2) \($0)")
	}
	
	quotes.onNext(lackOfFaith)
	
	subscriptionOne.dispose()
	
	quotes.onNext(eyesCanDeceive)
	
	quotes.onCompleted()
	
	let subscriptionThree = quotes
		.subscribe {
			print("3) \($0)")
	}
	
	quotes.onNext(stayOnTarget)
	
	subscriptionTwo.dispose()
	subscriptionThree.dispose()
}

example(of: "BehaviorSubject") {
	
	let disposeBag = DisposeBag()
	
	let quotes = BehaviorSubject<String>(value: iAmYourFather)
	
	quotes.subscribe {
		print("1) \($0)")
	}
	
	quotes.onError(Quote.neverSaidThat)
	
	quotes.onNext("Second thing I said")
	
	quotes.onNext("Thrid thing I said")
	
	quotes.subscribe {
		print("2) \($0)")
	}
	.disposed(by: disposeBag)
}

example(of: "ReplaySubject") {
	let disposeBag = DisposeBag()
	
	let subject = ReplaySubject<String>.create(bufferSize: 2)
	
	subject.onNext(useTheForce)
	
	subject.onNext(theForceIsStrong)
	
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

