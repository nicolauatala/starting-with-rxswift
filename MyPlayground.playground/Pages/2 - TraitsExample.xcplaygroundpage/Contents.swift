import UIKit
import RxSwift

example(of: "Single") {
	let disposeBag = DisposeBag()
	
	enum FileReadError: Error {
		case fileNotFound, unreadable, encodingFailed
	}
	
	func loadText(from fileName: String) -> Single<String> {
		return Single.create { single in
			let disposable = Disposables.create()
			
			guard let path = Bundle.main.path(forResource: fileName, ofType: "txt") else {
				single(.error(FileReadError.fileNotFound))
				return disposable
			}
			
			guard let data = FileManager.default.contents(atPath: path) else {
				single(.error(FileReadError.encodingFailed))
				return disposable
			}
			
			guard let contents = String(data: data, encoding: .utf8) else {
				single(.error(FileReadError.encodingFailed))
				return disposable
			}
			
			single(.success(contents))
			
			return disposable
		}
	}
	
	loadText(from: "ANewHope")
		.subscribe {
			switch $0 {
				case .success(let string):
					print(string)
				case .error(let error):
					print(error)
						
			}
		}
		.disposed(by: disposeBag)
}


