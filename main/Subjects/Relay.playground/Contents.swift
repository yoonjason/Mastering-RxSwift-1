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
 # Relay
 */
/*
 PublishRelay ---------------- BehaviorRelay
 PublishSubject                 BehaviorSubject
 
 가장 큰 차이는 Next이벤트만 전달한다
 
 Source -Next-> Relay -Next-> Observer
 주로 UI이벤트 처리에 활용된다.
 
 */
let bag = DisposeBag()

let prelay = PublishRelay<Int>() //빈것으로 생성하는 것은 PublishSubject와 동일하다.
prelay.subscribe{ print("1: \($0)") }
.disposed(by: bag)

prelay.accept(2) //onNext를 사용하지않고, accept를 사용한다.

let brelay = BehaviorRelay<Int>(value: 1)
brelay.accept(2)

brelay.subscribe(onNext : {
    print("2 : \($0)")
})
.disposed(by: bag)

brelay.accept(3)//즉시 Subscribe에게 전달

print(brelay.value)

