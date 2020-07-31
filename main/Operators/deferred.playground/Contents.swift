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
 # deferred
 */

/*
 특정 조건에 따라서 Observable을 생성할 수 있다.
 Observable을 리턴하는 클로저를 파라미터로 받는다.
 return형을 추론할 수 없다고 하면 타입 어노테이션을 추가해주면 된다.
 어느타입인지 정해라
 : Observable<String>
 이렇게
 
 */

let disposeBag = DisposeBag()
let animals = ["🐶", "🐱", "🐹", "🐰", "🦊", "🐻", "🐯"]
let fruits = ["🍎", "🍐", "🍋", "🍇", "🍈", "🍓", "🍑"]
var flag = true

let factory : Observable<String> = Observable.deferred{
    flag.toggle() //기존값을 뒤집는다.
    
    if flag {
        return Observable.from(animals)
    }else {
        return Observable.from(fruits)
    }
}

factory
    .subscribe {print($0)}
    .disposed(by: disposeBag)

factory
.subscribe {print($0)}
.disposed(by: disposeBag)

factory
.subscribe {print($0)}
.disposed(by: disposeBag)







