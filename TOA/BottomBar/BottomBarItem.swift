import SwiftUI

public struct BottomBarItem {
    public let icon: Image
    public let title: String
    public let color: Color
    
    public init(icon: Image,
                 title: String,
                 color: Color){
         self.icon = icon
         self.title = title
         self.color = color
     }
     
     public init(icon: String,
                 title: String,
                 color: Color) {
         self = BottomBarItem(icon: Image(icon),
                              title: title,
                              color: color)
     }
}



public struct BottomBarItemView: View {
    @Binding var selected : Int
    public let index: Int
    public let item: BottomBarItem
    
    public var body: some View {
        HStack {
            item.icon
                .imageScale(.large)
                .foregroundColor(isSelected ? item.color : .primary)
            
            if isSelected {
                Text(item.title)
                    .foregroundColor(item.color)
                    .font(.caption)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
        }
        .padding()
        .background(
            Capsule()
                .fill(isSelected ? item.color.opacity(0.15) : Color.clear)
        )
    }
    
    var isSelected : Bool{
        selected == index
    }
    
}
