//
//  PublishSubjectExample.swift
//  MyExample
//
//  Created by Deforeturn on 2/1/22.
//

import Foundation
import RxSwift



// MARK: - Observable
//print("Hello, World!")
//
//Observable<Int>.create{ (observer) -> Disposable in
//    observer.onNext(0)
//    observer.onNext(1)
//    observer.onCompleted()
//    return Disposables.create()
//}
//
//
//Observable.from([0, 1])



// MARK: - PublishSubject

//let disposebag = DisposeBag()

//enum MyError: Error{
//    case error
//}
//let subject = PublishSubject<String>()

//let o1 = subject.subscribe { a in
//    print("o1: ", a)
//}
//let o2 = subject.subscribe { a in
//    print("o2: ", a)
//}
//subject.onNext("RxSwift2")
//subject.onNext("RxSwift3")
//o1.disposed(by: disposebag)
//subject.onError(MyError.error)
//subject.onCompleted()
//subject.onNext("RxSwift3")
//o2.disposed(by: disposebag)

// MARK: - JustOfFrom

//var arr = [1,2,3,4,5]

//Observable.just(arr).subscribe{ value in
//    print(value)
//}
//Observable.of(arr,arr).subscribe{ value in
//    print(value)
//}
//Observable.from(arr).subscribe{ value in
//    print(value)
//}

// MARK: - JustOfFrom

//let a = BehaviorSubject(value: 1)
//let b = BehaviorSubject(value: 2)
//
//let subject = PublishSubject<BehaviorSubject<Int>>()
//
//subject
//    .flatMap {$0.asObserver()}
//    .subscribe { print($0) }
//
//subject.onNext(a)
//subject.onNext(b)

// MARK: - CombineLatest

let strSubject = PublishSubject<String>()
let numSubject = PublishSubject<Int>()

Observable.combineLatest(strSubject,numSubject) { "\($0)\($1)"}
.subscribe{ print($0.element!) }
strSubject.onNext("A")
numSubject.onNext(1)
numSubject.onNext(2)
numSubject.onNext(3)
strSubject.onNext("B")
strSubject.onNext("C")
