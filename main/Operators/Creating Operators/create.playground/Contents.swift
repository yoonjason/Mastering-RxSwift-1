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
 # create
 */

/*
 앞에서 배운 연산자들은 파라미터로 전달된 요소를 방출하는 Observer를 생선한다.
 이렇게 생성되는 요소들은 모든 요소를 Completed 이벤트를 방출한다음 종료된다.
 Observable의 기본요소이다.
 동작을 바꿀 수는 없다. Observable의 동작하는 것을 직접 구현하고 싶다면 Create를 사용한다.
 
 Create 사용시
 1. 요소 방출할 때는 onNext
 2. 파라미터로 방출할 요소를 전달한다
 3. Observable 보통 하나 이상의 요소를 방출하지만, 그렇지 않은 경우도 있다
 반면 종료하기 위해서는 onError, oncompleted 를 반드시 호출해야하고, 둘 중 하나는 반드시 호출해야한다.
 어느 하나라도 호출하면 Observable이 종료된다.
 4. onNext를 호출하려면 onError, oncompleted 호출 되기 전에 호출해야한다.
 5. 그래야 구독자에게 정상적으로 전달된다.
 
 
 */

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}
//옵져버블을 파라미터로 받아서 disposable로 리턴하는 클로저를 전달한다.
Observable<String>.create{ (observer) -> Disposable in
    guard let url = URL(string: "https://www.apple.com/kr")
        else {
            observer.onError(MyError.error) //Enum의 에러
            return Disposables.create()
            //오타가 자주 발생한다.Disposables에서 s가 붙어있다.
            //리턴형이 Disposable여서 그대로 쓰는 경우가 많은데, 꼭 Disposables로 써줘야한다
    }
    guard let html = try? String(contentsOf: url, encoding: .utf8) else {
        observer.onError(MyError.error) //Enum의 에러
        return Disposables.create()
    }
    observer.onNext(html)
    observer.onCompleted()
    
    //다시 문자열을 방출하면?
    observer.onNext("After completed")
    //completed가 된 이후 방출되었기때문에 더이상 이벤트를 전달하지않는다.
    
    return Disposables.create()
    //모든 리소스가 정리되고 Observable이 정리된다.
}
    .subscribe(onNext : {
        print($0)
    })
.disposed(by: disposeBag)






