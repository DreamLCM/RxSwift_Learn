//
//  ViewController.swift
//  Observable介绍
//
//  Created by CM on 2018/3/17.
//  Copyright © 2018年 CM. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// just()方法
        let observableJust = Observable<Int>.just(5)
        /// of()方法
        let observableOf = Observable.of("A","B","C")
        /// from()方法
        let observableFrom = Observable.from(["A","B","C"])
        /// empty()方法
        let observableEmpty = Observable<Int>.empty()
        /// never()方法
        let observableNever = Observable<Int>.never()
        /// error()方法
        enum MyError: Error {
            case A
            case B
        }
        
        let observableError = Observable<Int>.error(MyError.A)
        
        /**
         * range()方法
         */
        //  使用range
        let observableRange = Observable.range(start: 1, count: 5)
        //  使用of
        let observableOfSec = Observable.of(1,2,3,4,5)
        
        //  repeatElement()方法
        let observableRepeatElement = Observable.repeatElement(1)
        
        /**
         *  generate()方法
         */
        let observableGenerate = Observable.generate(initialState: 0, condition: { $0 <= 0 }, iterate: { $0 + 2 })
        //  使用of
        let observableOfThi = Observable.of(0,2,4,6,8,10)
        
        //  create方法
        let observableCreate = Observable<String>.create{ observer in
            //  对订阅者发出了.next事件，且携带了一个数据"hangge.com"
            observer.onNext("hangge.com")
            //  对订阅者发出了 .completed事件
            observer.onCompleted()
            //  因为一个订阅行为会有一个Disposable类型的返回值，所以在结尾一定要return一个Disposable
            return Disposables.create()
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

