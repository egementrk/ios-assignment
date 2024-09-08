//
//  VehicleCellModel+Extensions.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 7.09.2024.
//

extension VehicleCellModel {
    convenience init(_ vehicle: Vehicle) {
        self.init(id: vehicle.id,
                  title: vehicle.title,
                  location: vehicle.location,
                  category: vehicle.category,
                  modelName: vehicle.modelName,
                  price: vehicle.price,
                  priceFormatted: vehicle.priceFormatted,
                  date: vehicle.date,
                  dateFormatted: vehicle.dateFormatted,
                  photo: vehicle.photo,
                  properties: vehicle.properties)
    }
}
