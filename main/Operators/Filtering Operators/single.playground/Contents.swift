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
 # single
 */
/*
 Single : 원본 옵져버블에서 첫번째 요소만 방출하거나 조건에 일치하는 첫번째 요소만 방출한다.
 두개 이상의 방출이 되는 경우에는 에러가 발생한다.
 
 */

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

Observable.just(1)
    .single()
    .subscribe{
        print($0)
}
    .disposed(by: disposeBag)

/*
 next(1)
 completed
하나만 방출한다.
 */

Observable.from(numbers)
//    .single()
    .single{$0 == 3}
    .subscribe{ print($0) }
    .disposed(by: disposeBag)

/*
 next(1)
 error(Sequence contains more than one element.)
 시퀀스에 하나 이상의 요소가 포함되어있다고 하며 에러가 난다.
 numbers가 배열이기 때문.
 
 .single{$0 == 3} 와 같이 조건을 넣어주었을 때 배열에 값이 하나면 에러없이 방출이 잘된다.
  
 하나의 요소가 방출되는 것을 보장한다.
 
 */

let subject = PublishSubject<Int>()

subject.single()
    .subscribe{print($0)}
    .disposed(by: disposeBag)

subject.onNext(100)

/*
  새로운 요소가 들어가면 방출된다.
 원본 옵져버블에서 completed가 전달되기전까지 방출한다.
 */

