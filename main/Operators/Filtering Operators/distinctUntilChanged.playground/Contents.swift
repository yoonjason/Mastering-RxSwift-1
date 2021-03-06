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
 # distinctUntilChanged
 */
/*
 Observable, Observer, Subscribe
 
 파라미터가 없고 원본 옵져버블이 전달되는 순서대로 비교한다음 같으면 방출하지않는다.
 
 */
let disposeBag = DisposeBag()
let numbers = [1, 1, 3, 2, 2, 3, 1, 5, 5, 7, 7, 7]

Observable.from(numbers)
    .distinctUntilChanged()
    .subscribe{print($0)}
    .disposed(by: disposeBag)

/*
 배열은 1이 연속적으로 저장되어있다.
 distinctUntilChanged 두번째 요소인 1은 무시한다.
 동일한 요소가 연속적으로 방출되지않는다면 그대로 방출한다.
 단지 이전 값과 동일한 값인지 확인한다.
 
 next(1)
 next(3)
 next(2)
 next(3)
 next(1)
 next(5)
 next(7)
 completed
 
 */

