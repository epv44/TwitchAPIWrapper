//
//  BaseOperation.swift
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/7/16.
//
//

import Foundation

open class BaseOperation: Operation {
    open override var isAsynchronous: Bool {
        get {
            return true
        }
    }
    
    private var _isExecuting: Bool = false
    open override var isExecuting: Bool {
        get {
            return _isExecuting
        }
        set {
            willChangeValue(forKey: "isExecuting")
            _isExecuting = newValue
            didChangeValue(forKey: "isExecuting")
            if _isCancelled == true {
                self.isFinished = true
            }
        }
    }
    
    private var _isFinished: Bool = false
    open override var isFinished: Bool {
        get {
            return _isFinished
        }
        set {
            willChangeValue(forKey: "isFinished")
            _isFinished = newValue
            didChangeValue(forKey: "isFinished")
        }
    }
    
    private var _isCancelled: Bool = false
    open override var isCancelled: Bool {
        get {
            return _isCancelled
        }
        set {
            willChangeValue(forKey: "isCancelled")
            _isCancelled = newValue
            didChangeValue(forKey: "isCancelled")
        }
    }
    
    public final override func start() {
        super.start()
        self.isExecuting = true
    }
    
    public final override func main() {
        if isCancelled {
            isExecuting = false
            isFinished = true
            return
        }
        execute()
    }
    
    public func execute() {
        assertionFailure("execute must be overriden")
        finish()
    }
    
    public final func finish(errors: [Error] = []) {
        self.isFinished = true
        self.isExecuting = false
    }
    
    public final override func cancel() {
        super.cancel()
        isCancelled = true
        if isExecuting {
            isExecuting = false
            isFinished = false
        }
    }
}
