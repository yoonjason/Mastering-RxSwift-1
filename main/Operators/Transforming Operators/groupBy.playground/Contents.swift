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
 # groupBy
 */
/*
 옵져버블이 방출하는 요소를 원하는 기준으로 그루핑할 때 사용한다.
 
 */
let disposeBag = DisposeBag()
let words = ["Apple", "Banana", "Orange", "Book", "City", "Axe"]


Observable.from(words)
    .groupBy{ $0.count }
    .subscribe{ print($0) }
    .disposed(by: disposeBag)
// 문자열 기준으로 그룹핑을 했을 때, 4개의 그룹핑으로 나오게된다.

Observable.from(words)
.groupBy{ $0.count }
    .subscribe(onNext : { groupedObservable in
        print("== \(groupedObservable.key)")
        groupedObservable.subscribe{ print("  \($0)")}
    })
.disposed(by: disposeBag)
//Flatmap, toarray 와 활용한다.


Observable.from(words)
    .groupBy{ $0.count }
    .flatMap{ $0.toArray() }
    .subscribe{print($0)}
    .disposed(by: disposeBag)

Observable.from(words)
    .groupBy{ $0.first ?? Character(" ") }
    .flatMap{ $0.toArray() }
    .subscribe{print($0)}
    .disposed(by: disposeBag)

Observable.range(start: 1, count: 10)
    .groupBy{ $0.isMultiple(of:2)}
    .flatMap{ $0.toArray() }
    .subscribe(onNext : {
        print($0)
    })
.disposed(by: disposeBag)
