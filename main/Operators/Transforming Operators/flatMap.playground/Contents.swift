//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import RxSwift

/*:
 # flatMap
 */
/*
 Observable, Observer, Subscribe
  
 flatMap을 통해서 Observable로 변환된다.
 Observable을 하나로 모아서 방출한다.
 항목이 업데이트될 때 마다 새로운 항목을 배출한다.
 단순히 처음에 방출된 항목만 전달되는 것이 아니라 업데이트된 항목도 전달된다.
 네트워크 구성할 때 자주 활용된다.
 */
let disposeBag = DisposeBag()

let a = BehaviorSubject(value: 1)
let b = BehaviorSubject(value: 2)

let subject = PublishSubject<BehaviorSubject<Int>>()

subject
    .flatMap{ $0.asObservable() }
    .subscribe{
        print($0)
}
.disposed(by: disposeBag) //구독자로 전달되는것은 BehaviorSubject이다. flatmap을 안썼으면

subject.onNext(a)
subject.onNext(b)//앞에서 생성된 Observable과 합쳐진다.
//내부적으로 여러개의 Observable이 생성, 최종적으로 하나의 Observable fh로 만들어진다.


a.onNext(11)
b.onNext(22)
