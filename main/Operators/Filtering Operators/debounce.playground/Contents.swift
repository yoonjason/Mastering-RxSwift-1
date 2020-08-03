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

/*
Observable, Observer, Subscribe

짧은 시간동안 반복적인 이벤트를 제어한다.
 연산자를 제공하는 파라미터도 동일하다.
 결과는 다르기 때문에 주의해야한다.

 Debounce
 두개의 파라미터, 첫번째는 시간, 두번째는 스케쥴러
 이 시간은 연산자가 넥스트 이벤트를 방출할지 결정하는 조건으로 사용된다.
 지정된 시간동안 다른 넥스트 이벤트를 방출하지않는다면 해당 시점에 가장 마지막 이벤트를 전달한다.
 타이머를 초기화한다음에 다시 지정된 시간동안 대기한다.
 이 시간 이내에 다른 이벤트가 방출하지않는다면 마지막 이벤트를 방출한다.
 이벤트를 방출하면 타이머가 초기화된다
 
 
*/
/*
throttle NExt이벤트를 지정된 주기마다 구독자에게 전달한다 -> 짧은 시간 동안 반복되는 탭 이벤트, 델리게이트 메시지에 이용
debounce - next이벤트가 전달된 다음 지정된 시간이 경과하기까지 다른 이벤트가 전달되지 않는다면, 마지막으로 전달된 이벤트를 구독자에게 전달한다. -> 검색할 때 이동
키워드를 입력할 때마다 네트워크 통신을 해야한다.
문자를 연속해서 입력하게되면 검색하지 않고 있다가, 문자가 다 입력되면 검색이 된다.




*/
/*:
 # debounce
 */

let disposeBag = DisposeBag()

let buttonTap = Observable<String>.create { observer in
   DispatchQueue.global().async {
      for i in 1...10 {
         observer.onNext("Tap \(i)")
         Thread.sleep(forTimeInterval: 0.3)
      }
      
      Thread.sleep(forTimeInterval: 1)
      
      for i in 11...20 {
         observer.onNext("Tap \(i)")
         Thread.sleep(forTimeInterval: 0.5)
      }
      
      observer.onCompleted()
   }
   
   return Disposables.create {
      
   }
}

buttonTap
    .debounce(.milliseconds(1000), scheduler: MainScheduler.instance)
   .subscribe { print($0) }
   .disposed(by: disposeBag)

/*
 .debounce(.milliseconds(1000), scheduler: MainScheduler.instance)
 
 next(Tap 10)
 next(Tap 20)
 completed
 
 결과가 이전과 완전히 다르다.
 지정된 시간동안 방출되지않으면 가장 마지막에 전달된 이벤트를 방출한다./*
 throttle NExt이벤트를 지정된 주기마다 구독자에게 전달한다 -> 짧은 시간 동안 반복되는 탭 이벤트, 델리게이트 메시지에 이용
 debounce - next이벤트가 전달된 다음 지정된 시간이 경과하기까지 다른 이벤트가 전달되지 않는다면, 마지막으로 전달된 이벤트를 구독자에게 전달한다. -> 검색할 때 이동
 키워드를 입력할 때마다 네트워크 통신을 해야한다.
 문자를 연속해서 입력하게되면 검색하지 않고 있다가, 문자가 다 입력되면 검색이 된다.
 
 
 
 
 */

 */

