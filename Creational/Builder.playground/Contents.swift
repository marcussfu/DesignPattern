import Foundation

protocol VocationBuilder {
    func setBeginDate(date: String) -> VocationBuilder
    func setEndDate(date: String) -> VocationBuilder
    func setHotel(hotel: Hotel) -> VocationBuilder
    func setRestaurant(restaurant: Restaurant) -> VocationBuilder
    func setTicket(tickets: [Ticket]) -> VocationBuilder
    func build() -> Vocation
}

class Hotel {
    var name = "Hotel"
}

class Restaurant {
    var name = "Restaurant"
}

class Ticket {
    var id = 0
}

class Vocation {
    var beginDate: String
    var endDate: String
    var hotel: Hotel
    var restaurant: Restaurant
    var tickets: [Ticket]
    
    init(beginDate: String, endDate: String, hotel: Hotel, restaurant: Restaurant, tickets: [Ticket]) {
        self.beginDate = beginDate
        self.endDate = endDate
        self.hotel = hotel
        self.restaurant = restaurant
        self.tickets = tickets
    }
    
    func printVocationData() {
        print("beginDate: \(beginDate)\nendDate: \(endDate)\nhotel: \(hotel.name)\nrestaurant: \(restaurant.name)")
    }
}

class ThreeDayVocationBuilder: VocationBuilder {
    var beginDate: String = ""
    var endDate: String = ""
    var hotel: Hotel = Hotel()
    var restaurant: Restaurant = Restaurant()
    var tickets: [Ticket] = [Ticket]()
    
    func setBeginDate(date: String) -> VocationBuilder {
        beginDate = date
        return self
    }
    
    func setEndDate(date: String) -> VocationBuilder {
        endDate = date
        return self
    }
    
    func setHotel(hotel: Hotel) -> VocationBuilder {
        self.hotel = hotel
        return self
    }
    
    func setRestaurant(restaurant: Restaurant) -> VocationBuilder {
        self.restaurant = restaurant
        return self
    }
    
    func setTicket(tickets: [Ticket]) -> VocationBuilder {
        self.tickets = tickets
        return self
    }
    
    func build() -> Vocation {
        return Vocation(beginDate: beginDate, endDate: endDate, hotel: hotel, restaurant: restaurant, tickets: tickets)
    }
    
    
}

var vocationBuilder = ThreeDayVocationBuilder()
vocationBuilder.setBeginDate(date: "2019/11/1")
vocationBuilder.setEndDate(date: "2019/11/4")
var hotel = Hotel()
hotel.name = "priceness"
vocationBuilder.setHotel(hotel: hotel)
var vocation1 = vocationBuilder.build()
vocation1.printVocationData()
print("\n")
// Fluent interface
var vocation2: Vocation = ThreeDayVocationBuilder()
                            .setBeginDate(date: "2019/11/5")
                            .setEndDate(date: "2019/11/11")
                            .build()
vocation2.printVocationData()
