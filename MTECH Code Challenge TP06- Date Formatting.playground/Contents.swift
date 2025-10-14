//  🏔️ MTECH Code Challenge TP06: "Date Formatting"
//  Concept: Practice working with Date objects

//  Instructions:
    //  Create a function that returns a date from a given string.
    //  The string will always be in the format "yyyy-mm-dd".

//  Examples:
    //  Input: "1992-12-20"
    //  Output: Optional(1992-12-20 07:00:00 +0000)

    //  Input: "2001-50-90" (invalid date)
    //  Output: nil

//  ⌺ Black Diamond Challenge:
    //  Make a function that does the reverse (takes in a Date object and returns a String). Output the string in the format "Dec 20, 1992".

import Foundation

func convertToDate(_ dateString: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: dateString)
}

print(convertToDate("1992-12-20"))
