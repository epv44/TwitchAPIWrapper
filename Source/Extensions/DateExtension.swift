//
//  DateExtension.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 3/31/18.
//

import Foundation

extension Date {
    static var twitchStandardDateFormatter: DateFormatter {
        struct Static {
            static let instance: DateFormatter = {
                let df = DateFormatter()
                df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                return df
            }()
        }
        return Static.instance
    }
}
