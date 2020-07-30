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

/*
            Sending Events
 Obesrvable -------------> Observer
            <------------
               Subscribe
 
 subject는 다른 Obesrvable로부터 이벤트를 받아 Observer Subribe에게 이벤트를 전달할 수 있다.
 Obesrvable인 동시에 observer이다.
 
 Publish
  - Subject로 전달되는 새로운 이벤트를 구독자로 전달
 Behavior
  - 생성 시점에 시작 이벤트를 지정한다. Subject로 전달되는 이벤트 중에서 가장 마지막에 전달된 최신 이벤트를
    저장해두었다가 새로운 구독자에게 새로운 이벤트를 전달한다.
 Replay
  - 하나 이상의 최신 이벤트를 버퍼에 저장,
    옵저버가 구독을 시작하면 버퍼에 있는 모든 이벤트를 전달한다.
 Asyns
  - Subject로 Completed 이벤트가 전달되는 시점에 마지막으로 전달된 Next이벤트를 구독자로 전달
 
 RxSwift는 Subject를 래핑하고 있는 두가지 Relay를 제공한다.
 Publish -> Publish subject를 래핑
 Behavior -> Behavior subject를 래핑
 
 일반적인 subject와 달리 next이벤트만 받는다.
주로 종료되지않고, 계속 전달되는 이벤트 시퀀스를 처리할 때 활용한다.
 */
/*:
 # PublishSubject
 */

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}
//타입 파라미터는 String 문자열이 포함된 Next이벤트를 받아서 다른 옵저버에게 전달할 수 있다.
//생성자를 호출할 때는 파라미터를 전달하지않는다. 비어있는 상태로 생성된다.
//생성되는 시점에는 내부에 아무 이벤트가 저장되어있지않다.
//Subject는 Observable인 동시에 Observer이다.

let subject = PublishSubject<String>()

subject.onNext("Hello")

let o1 = subject.subscribe{ print(">> 1", $0)}
o1.disposed(by: disposeBag)

subject.onNext("RxSwift")

let o2 = subject.subscribe{ print(">> 2", $0)}
o2.disposed(by: disposeBag)

subject.onNext("Subject")

//subject.onCompleted()
subject.onError(MyError.error)

let o3 = subject.subscribe{ print(">> 3", $0)}
o3.disposed(by: disposeBag)
