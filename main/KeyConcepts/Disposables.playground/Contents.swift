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
 # Disposables
 */

/*
 Next가 전달 : 이벤트의 이름과 포함된 요소 출력
 Error가 전달 : 이벤트 이름 출력, 에러 출력
 Completed : 이벤트 이름 출력
 Dispose는 Observable이 전달하는 이벤트는 아니다.
 파라미터로 클로저를 전달하면 옵저버블과 관련된 모든 리소스들이 제거된 후에 호출된다.
 */

let subscription1 = Observable.from([1,2,3])
.subscribe(onNext: { elem in
    print("Next", elem)
}, onError: { error in
    print("Error", error)
}, onCompleted: {
    print("Completed")
}, onDisposed: {
    print("Disposed") //리소스가 해지되는 시점에 자동으로 호출된다. 해지될 때 실행할 것이 필요하면 처음것과 같이 작성한다.
})

subscription1.dispose()//이방식으로 리소스를 해지할 수 있다. 직접 호출하는것보다 DisposeBag을 사용하라고 나와있다.

var disposeBag = DisposeBag()



Observable.from([1,2,3,4])
.subscribe{
 print($0)
}
.disposed(by: disposeBag)
//Subscribe
//문제는 없으나, 가능하다면 dispose를 해주는 것이 좋다.
/*
 리소스를 해지할 때는 바로 위 코드를 써서 구현하는 것이 좋다.
 
 */
disposeBag = DisposeBag()

let subscription2 = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
    .subscribe(onNext: { elem in
        print("Next", elem)
    }, onError: { error in
        print("Error", error)
    }, onCompleted: {
        print("Completed")
    }, onDisposed: {
        print("Disposed")
    })
//1초에 1번씩 숫자 증가

DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
     subscription2.dispose()
}















