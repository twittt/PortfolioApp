//
//  ResumeListItemView.swift
//  TelaWittigPortfolio
//
//  Created by Tela Wittig on 2/6/23.
//

import SwiftUI

struct ResumeListItemView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var resumeItem: ResumeListItem
    @State var datePieces: [Int] = [0, 0, 0]
    @State var monthString: String = ""

    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack { //Calendar Icon Element
                Text(self.monthString)
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .font(Fonts.font(Fonts.Poppins_Regular, 16))
                    .padding(.horizontal)
                    .frame(width: 70)
                    .background(Color.black)
                    .cornerRadius(12, corners: [.topLeft, .topRight])
                
                Text(String(self.datePieces[0]))
                    .foregroundColor(.black)
                    .font(Fonts.font(Fonts.Poppins_Regular, 24))
                    .frame(width: 70)
            }
            .background(
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(12)
                        .shadow(
                            radius: 4,
                            x: 1,
                            y: 3
                        )
                )
            .frame(width: 90, height: 90)
            .background(.clear)
            .padding(.trailing, 5)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Started in \(self.monthString) of \(self.datePieces[0])")
            .accessibilityIdentifier("calendar")
            
            VStack(alignment: .leading, spacing: 0) {
                Text(self.buildTimeString())
                    .foregroundColor(.black.opacity(0.8))
                    .font(Fonts.font(Fonts.Poppins_Regular, 12))
                    .accessibilityIdentifier("duration")
                HStack {
                    VStack(alignment: .leading) {
                        Text(resumeItem.title)
                            .font(Fonts.font(Fonts.Poppins_Bold, 18))
                            .foregroundColor(.black.opacity(0.9))
                            .lineLimit(10)
                            .layoutPriority(1)
                            .accessibilityIdentifier("positionTitle")
                        Text(resumeItem.company)
                            .font(Fonts.font(Fonts.Poppins_Regular, 16))
                            .foregroundColor(.black.opacity(0.9))
                            .lineLimit(10)
                            .layoutPriority(1)
                            .accessibilityIdentifier("companyName")
                        ForEach(resumeItem.responsibilities, id:\.self) { resp in
                            HStack(alignment: .top, spacing: 0) {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.black.opacity(0.9))
                                    .frame(width: 4)
                                    .layoutPriority(1)
                                    .padding(.top, 6)
                                    .padding(.trailing, 2)
                                    .accessibilityHidden(true)
                                Text(resp)
                                    .font(Fonts.font(Fonts.GFSDidot_Regular, 14))
                                    .foregroundColor(.black.opacity(0.9))
                                    .lineLimit(10)
                                    .layoutPriority(1)
                                    .accessibilityIdentifier("responsibility")
                            }
                        }
                        .accessibilityIdentifier("responsibilities")
                    }
                }
            }
            .layoutPriority(1)
            .padding(.top, 10)
        }
        .padding(.trailing, 20)
        .onAppear {
            self.getDatePieces(date: self.resumeItem.startDate.dateToString())
        }
    }
    func buildTimeString() -> String {
        let weeksSinceStart = resumeItem.startDate.weeks()
        let yearsSinceStart: Int = Int(floor(Double(weeksSinceStart/52)))
        let monthsSinceStart: Int = Int(floor(Double((weeksSinceStart % 52) / 4)))
        
        if resumeItem.endDate == nil {
            //Is current
            if monthsSinceStart > 0 {
                return "\(yearsSinceStart) years & \(monthsSinceStart) months"
            } else {
                return "\(yearsSinceStart) \(yearsSinceStart > 1 ? "years" : "year")"
            }
        }
        
        let weeksSinceEnd = resumeItem.endDate!.weeks()
        let yearsSinceEnd: Int = Int(floor(Double(weeksSinceEnd/52)))
        let monthsSinceEnd: Int = Int(floor(Double((weeksSinceEnd % 52) / 4)))
        
        let years = yearsSinceStart - yearsSinceEnd
        let months = monthsSinceStart - monthsSinceEnd
        
        if months > 0 {
            return "\(years) \(years > 1 ? "years" : "year") & \(months) months"
        } else {
            return "\(years) \(years > 1 ? "years" : "year")"
        }
        
    }
    func getDatePieces(date: String){
        print(date)
        let stringElements: [String] = date.components(separatedBy: "-")
        var intElements: [Int] = []
        for elm in stringElements {
            intElements.append(Int(elm)!)
        }
        print("Date Pieces: \(intElements[0]), \(intElements[1]), \(intElements[2])")
        self.datePieces = intElements
        self.getMonthName(monthNum: datePieces[1])
        print(datePieces[1])
        print("Get Month Name called")
    }
    func getMonthName(monthNum: Int) {
        switch monthNum {
        case 1:
            self.monthString = "Jan"
        case 2:
            self.monthString = "Feb"
        case 3:
            self.monthString = "Mar"
        case 4:
            self.monthString = "Apr"
        case 5:
            self.monthString = "May"
        case 6:
            self.monthString = "Jun"
        case 7:
            self.monthString = "Jul"
        case 8:
            self.monthString = "Aug"
        case 9:
            self.monthString = "Sep"
        case 10:
            self.monthString = "Oct"
        case 11:
            self.monthString = "Nov"
        case 12:
            self.monthString = "Dec"
        default:
            self.monthString = ""
        }
    }
}

struct ResumeListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeListItemView(resumeItem: ResumeListItem(data: [:]))
    }
}
