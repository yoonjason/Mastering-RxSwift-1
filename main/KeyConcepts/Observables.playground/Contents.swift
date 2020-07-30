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
 # Observables
 */
//Observable Sequence
/*
 Emission -> 방출
 create -> 연산자
 observer를 받아서 Disposable을 return한다.
 Subscribe 메소드는 Subscribe 연산자라고 부르기도한다. Observable와 Observer를 연결한다.
 이벤트가 전달되는 시점을 Observer가 이벤트를 구독하는 시점에 전달된다.(Subscriber)
 Observer는 동시에 두 개 이상의 이벤트를 처리하지않는다.
 Observable은 Observer가 하나의 이벤트를 처리한 후에 이어지는 이벤트를 전달한다.
 여러 이벤트를 동시에 전달하지않는다.
 항상 하나의 이벤트가 전달된 다음에 이어지는 이벤트가 전달된다.
 
 */

/*
 옵져버블을 생성하는 방법
 */
//#1
let o1 = Observable<Int>.create{ (observer) -> Disposable in
    observer.on(.next(0)) //구독자로 0이 전달되는 next event 발생
    observer.onNext(1) //같은 방법이다.
    observer.onCompleted() // complete가 전달되고, 이벤트가 종료된다.
    
    return Disposables.create()
}

//#1
o1.subscribe {//이 클로저가 Observer
    print("== Start ==")
    print($0)
    
    if let elem = $0.element { //이 값을 꺼내서 사용하고 싶을 때 형식이 Optional이기 때문
        print(elem)
    }
    print("== End ==")
}
print("------------------------")
//#2
o1.subscribe(onNext: { elem in
    print(elem)
}) //Element요소로 사용할 필요가 없다.




//#2 미리 정의된 규칙에 따라서 이벤트를 전달한다. from 연산자를 이용해서 create 연산자와 동일한 Observable을 생성
/*
 From : 파라미터로 전달한 배열에 있는 요소를 순서대로 방출하고 Completed이벤트를 전달하는 Observable을 생성
 */
Observable.from([0, 1])














