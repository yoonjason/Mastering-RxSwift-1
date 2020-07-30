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
 # Operators
 */

let bag = DisposeBag()

Observable.from([1, 2, 3, 4, 5, 6, 7, 8, 9])
    .filter{ $0.isMultiple(of: 2)}
    .take(5)
    .subscribe { print($0) }
    .disposed(by: bag)

/*
 ObservableType
 
 Operators 특징
 1.대부분의 연산자는 Observable상에서 동작하고 새로운 Observable을 리턴한다.
 2.Observable을 리턴하기 대문에 두개 이상의 연산자를 호출할 수 있다.
 3.하지만 호출 순서에 따라서 다른 결과가 나오기 때문에 호출 순서에 항상 주의해야한다.
 
 take Operator
 소스 옵져버블이 방출하는 요소중에 파라미터 수만큼 방출한다.
 처음 다섯개만 전달한다.
 연산자는 필요에 따라 얼마든지 사용할 수 있다.
 순서는 잘 사용해야한다.
 */























