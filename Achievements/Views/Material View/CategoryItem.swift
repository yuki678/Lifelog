//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Yuki Takahashi on 03/01/2021.
//

import SwiftUI

struct CategoryItem: View {
    var material: Material
    static let updateDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            self.material.image.map({
                UIImage(data: $0)
                    .map({
                            Image(uiImage: $0)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 155, height:155)
                                .cornerRadius(5)
                    })
            })
            
            HStack {
                Text(material.wrappedName)
                    .foregroundColor(.primary)
                    .font(.caption)
                Spacer()
                Text("\(material.wrappedUpdateDate, formatter: Self.updateDateFormat)" )
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
//    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let material1 = Material(context: context)
        material1.name = "Test book"
        material1.category = "Book"
        material1.updateDate = Date()
        return CategoryItem(material: material1)
            //.environment(\.managedObjectContext, context)
        
    }
}
