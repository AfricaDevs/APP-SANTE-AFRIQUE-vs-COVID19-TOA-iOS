//
//  PieChartView.swift
//  TOA
//
//  Created by Steven on 7/8/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import Foundation
import SwiftUI
import Charts 

struct PieChartSwiftUI: UIViewRepresentable {
    
    typealias UIViewType = UIView
    
    let countryCs: CountryCases = CountryCases(confirmed: CasesSubItem(value: 0), recovered: CasesSubItem(value: 0), deaths: CasesSubItem(value: 0))
     
    let parties = [NSLocalizedString("mainConfirmedCases", comment: ""),NSLocalizedString("mainRecoveredCases", comment: ""), NSLocalizedString("mainDeceasedCases", comment: ""),NSLocalizedString("mainActiveCases", comment: "")]
    
    let pieChart = PieChartView()
    
    func refresh(countryCases: CountryCases){
        
        
        let l = pieChart.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .top
        l.orientation = .vertical
        l.drawInside = false
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0
        
        let entries = [
            PieChartDataEntry(value: 100,
            label: parties[0]), //Total cases
            PieChartDataEntry(value:  countryCases.confirmed.value <= 0 ? 0 : Double(countryCases.recovered.value * 100 / countryCases.confirmed.value),
            label: parties[1]), //Recovered
            PieChartDataEntry(value:  countryCases.confirmed.value <= 0 ? 0 : Double(countryCases.deaths.value * 100 / countryCases.confirmed.value),
            label: parties[2]), // Deaths
            PieChartDataEntry(value:  countryCases.confirmed.value <= 0 ? 100 :
                100 - (
                    Double(countryCases.deaths.value * 100 / countryCases.confirmed.value)
                        +
                    Double(countryCases.recovered.value * 100 / countryCases.confirmed.value)
                ), // Active cases = Total - (Recovered + Dead)
            label: parties[3])
            ]
        
        let set = PieChartDataSet(entries: entries, label: formatDate(stringDate: countryCases.lastUpdate))
        set.drawIconsEnabled = true
        set.sliceSpace = 3
         
        set.colors = [
        
        NSUIColor(red: 64/255.0, green: 89/255.0, blue: 128/255.0, alpha: 1.0),
        NSUIColor(red: 100/255.0, green: 204/255.0, blue: 180/255.0, alpha: 1.0),//vert
        NSUIColor(red: 200/255.0, green: 100/255.0, blue: 120/255.0, alpha: 1.0),//rouge
        NSUIColor(red: 52/255.0, green: 152/255.0, blue: 219/255.0, alpha: 1.0)
        ]
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
         
        data.setValueTextColor(.yellow)
        pieChart.data = data
        pieChart.highlightValues(nil)
    }
    func makeUIView(context: UIViewRepresentableContext<PieChartSwiftUI>) -> UIView {
         
        refresh(countryCases: countryCs)
        
        pieChart.animate(xAxisDuration: 1.4, yAxisDuration: 1.4)
        return pieChart
    }

    func updateUIView(_  uiView: UIView, context: UIViewRepresentableContext<PieChartSwiftUI>) {
         
    }
     
    
    func getChartDataPoints(sessions: [Int], accuracy: [Double]) -> [ChartDataEntry] {
        var dataPoints: [ChartDataEntry] = []
        for count in (0..<sessions.count) {
            dataPoints.append(ChartDataEntry.init(x: Double(sessions[count]), y: accuracy[count]))
        }
        return dataPoints
    }
    
    func formatDate(stringDate: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = NSLocalizedString("dateFormat", comment: "")// HH:mm:ss"
        
        let date = formatter.date(from: stringDate)
         
        return formatter.string(from: date ?? Date())
    }
 
}

 
struct GraphSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        PieChartSwiftUI()
    }
}
 
