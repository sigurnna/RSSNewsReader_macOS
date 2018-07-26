//
//  ViewInterface.swift
//  RSSNewsReader
//
//  Created by 이승준 on 2018. 7. 4..
//  Copyright © 2018년 seungjun. All rights reserved.
//

import Cocoa

protocol ViewInterface {
    // Empty
}

extension ViewInterface where Self: NSView {
    static func initFromNib() -> Self {
        fatalError("You must override and implement this method")
    }
    
    static func initFromNib(nibName: String) -> Self {
        var topLevelObjects: NSArray?
        
        if Bundle.main.loadNibNamed(NSNib.Name(nibName), owner: nil, topLevelObjects: &topLevelObjects) {
            let view = topLevelObjects?
                .filter { object in
                    return (object as? Self) != nil
                }
                .map { $0 as! Self }
                .first
            
            if let _view = view {
                return _view
            }
        }
        
        fatalError("Can't find \(Self.self) from \(nibName).xib")
    }
}
