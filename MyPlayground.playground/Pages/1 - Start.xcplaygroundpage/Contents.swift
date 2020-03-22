import UIKit
import RxSwift

example(of: "just, of, from") {
	
	let one = 1
	let two = 2
	let three = 3
	
	let _: Observable<Int> = Observable<Int>.just(one)
	
	let _ = Observable.of(one, two, three)
	
	let _ = Observable.of([one, two, three])
	
	let _ = Observable.from([one, two, three])
}

example(of: "subscribe") {
	let one = 1
	let two = 2
	let three = 3
	
	let observable = Observable.of(one, two, three)
	
	observable.subscribe{ event in
		if let element = event.element {
			print(element)
		}
	}
	
	observable.subscribe(onNext: { element in
		print(element)
	})
}

example(of: "DisposeBag") {
	
	let disposeBag = DisposeBag()
	
	Observable.of("A", "B", "C")
		.subscribe { print($0) }
		.disposed(by: disposeBag)
		
}

example(of: "Create") {
	enum Droid: Error {
		case OU812
	}
	
	let disposeBag = DisposeBag()
	
	Observable<String>.create { observer in
		
		observer.onNext("R2-D2")
		observer.onError(Droid.OU812)
		observer.onNext("C-3PO")
		observer.onNext("K-2SO")
		
		return Disposables.create()
	}
	.subscribe(
		onNext: { print($0) },
		onError: { print("Error: ", $0) },
		onCompleted: { print("Completed") },
		onDisposed: { print("Disposed") }
	)
	.disposed(by: disposeBag)
}


//example(of: "Test") {
//	let myData = PublishSubject<String>()
////	let disposeBag = DisposeBag()
//	
//	myData.subscribe { event in
//		guard let event = event.element else { return }
//		print("myData:: \(event)")
//	}
//	
//	myData.onNext("Change myData first time")
//	myData.onNext("Change myData second time")
//	
////	myData.disposed(by: disposeBag)
//	myData.dispose()
//	
//	myData.onNext("Change myData third time")
//	
//	
//}
