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
 # buffer
 */
/*
 특정 주기동안 옵져버블이 방출하는 항목을 수집하고 하나의 배열로 리턴한다.
 Controlled buffering이라고 한다.
 - parameter timeSpan: Maximum time length of a buffer. 지정한 시간마다 수집되어있는 항목을 배출한다. 시간이 경과되지않아도 방출할 수 있다.
 - parameter count: Maximum element count of a buffer. 수집할 항목의 숫자이다. 최대 숫자이다.
 - parameter scheduler: Scheduler to run buffering timers on.
 - returns: An observable sequence of buffers. //배열에 담아서 리턴한다.
 */
let disposeBag = DisposeBag()

Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
    .buffer(timeSpan: .seconds(5), count: 5, scheduler: MainScheduler.instance)
    .take(5)
    .subscribe{ print($0) }
    .disposed(by: disposeBag)


/*
 버퍼시간 2초
 next([0])
 next([1, 2, 3])
 next([4, 5])
 next([6, 7])
 next([8, 9])
 completed
 
 버퍼시간 5초
 next([0, 1, 2])
 next([3, 4, 5])
 next([6, 7, 8])
 next([9, 10, 11])
 next([12, 13, 14])
 completed

 
 */




