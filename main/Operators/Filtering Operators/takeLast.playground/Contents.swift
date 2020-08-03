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
 # takeLast
 */
/*
 정수를 파라미터로 받아서 Observable이 방출된다.
 
 */

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let subject = PublishSubject<Int>()

enum MyError : Error {
    case error
}

subject.takeLast(2)
    .subscribe{print($0)}
    .disposed(by: disposeBag)

numbers.forEach{
    subject.onNext($0)
}

//아무것도 출력되지않는다.
//마지막에 방출한 9와 10을 버퍼에 저장하고 있다.
subject.onNext(11)
/*
 10과 11로 바뀐다.
 
 */

subject.onCompleted()
/*
 subject.onCompleted()
 호출하면 이 때 요소가 방출된다.
 next(10)
 next(11)
 completed

 subject.onError(MyError.error) 하게되면
 error이벤트만 전달된다.
 */

subject.onError(MyError.error)
