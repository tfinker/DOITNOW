//
//  DoITHeader.swift
//  DOITNOW
//
//  Created by Finlay Kerr on 5/14/22.
//

import SwiftUI

struct DoITHeader: View {
    
    var nextTask: String;
    var nextDate: Date;
    var city: String;
//    @State var nextDateString = "";
    
    func getDateString(nextDate: Date) -> String {

        //Code sourced from: https://stackoverflow.com/questions/54084023/how-to-get-the-todays-and-tomorrows-date-in-swift-4
        let calendar = Calendar.current
        let today = Date()
        let midnight = calendar.startOfDay(for: today)
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: midnight)!
        
        switch nextDate.formatted(date: .abbreviated, time: .omitted) {
        case today.formatted(date: .abbreviated, time: .omitted):
            return "TODAY"
        case tomorrow.formatted(date: .abbreviated, time: .omitted):
            return "TOMORROW"
        default:
            return "\(nextDate.formatted(date: .abbreviated, time: .omitted))"
        }
    }
    
    var body: some View {
        Text("\(nextTask)")
                .font(.title.bold())
                .padding(.horizontal)
                .foregroundColor(.black)
                .textCase(.uppercase)
        
        Text(getDateString(nextDate: nextDate))
            .font(.title)
            .padding(.horizontal)
            .foregroundColor(.gray)
        
        
        Text("\(city)".uppercased())
            .font(.title)
            .padding(.horizontal)
            .foregroundColor(.gray)
    }
}

//struct DoITHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        DoITHeader()
//    }
//}
