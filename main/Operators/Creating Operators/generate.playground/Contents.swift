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
 # generate
 */

/*
 
 두번째 파라미터 condition은 false인 경우 바로 onCompleted를 전달하고 시퀀스가 중지된다
 initialState: 초기 값 가장먼저 방출하는 값
 condition: true 경우에만 요소를 방출,  false Completed가 방출되며 종료
 iterate : 값을 바꾸는 코드를 전달한다. 값을 증가시키거나 감소시키거나 하는 값 전달
 */

let disposeBag = DisposeBag()
let red = "🔴"
let blue = "🔵"



Observable.generate(initialState: 0, condition: {$0 <= 10}, iterate: {
    $0 + 2
})
    .subscribe{ print($0)}
    .disposed(by: disposeBag)

//

Observable.generate(initialState: 10, condition: {$0 >= 0}, iterate: {
    $0 - 2
})
    .subscribe{print($0)}
.disposed(by: disposeBag)

Observable.generate(initialState: red, condition: {$0.count < 15}, iterate: {
    $0.count.isMultiple(of: 2) ? $0 + red : $0 + blue
}).subscribe{print($0)}
.disposed(by: disposeBag)






