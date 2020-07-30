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
import RxCocoa

/*:
 # AsyncSubject
 */
/*
 이벤트를 전달하는 시점에 차이가 있다.
 이전까지 배웠던 서브젝트로 이벤트가 전달되면 즉시 구독자게에 전달
 Async 서브젝트로 컴플리티드 이벤트가 전달되기전까지 어떤 이벤트도 구독자에게 전달하지않음
 가장 최근에 전달된 Next 이벤트 하나를 전달한다.
 */
let bag = DisposeBag()

enum MyError: Error {
   case error
}


let subject = AsyncSubject<Int>()

subject
    .subscribe(onNext : {
        print($0)
    })
    .disposed(by: bag)

subject.onNext(1)
//여기까지 전달 안됨

subject.onNext(2)
subject.onNext(3)
//여전히 전달안됨

subject.onCompleted() //가장 최근 이벤트가 전달된다.
subject.onError(MyError.error)//에러 이벤트가 전달되고 종료된다.



