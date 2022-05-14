import SwiftUI
import MapKit
import CoreLocation

struct TabDoIt: View{

    @StateObject var locationManager = LocationManager()

    @StateObject var weatherService = WeatherService()
    //@StateObject var weatherTime = WeatherTime()
    @State var selected = "MORNING"
    @State var isExpanded = false
    @State var showZoom = false
    @State var temp: Double?
    @State var conditionImage: Image?
    @ObservedObject var activityList: TaskManager
    @State var nextDate: Date?

    var body: some View {

        if weatherService.errorMessage != nil{
            Text(weatherService.errorMessage!)
        }

        ZStack(alignment: .top) {
            Background()
            if activityList.emptyList {
                VStack{
                    Title(title: "DO IT NOW!")
                    Spacer()
                    Text("No sports planned!")
                    Spacer()
                }
                
                
            }
            else {
                
                VStack{
                    Title(title: "DO IT NOW!")

                    if let lat = locationManager.lastLocation?.coordinate.latitude,
                        let lon = locationManager.lastLocation?.coordinate.longitude {
                        Text("")
                            .onAppear(perform: {self.weatherService.getWeather(lat: lat, lon: lon)})
                            .onAppear(perform: {self.locationManager.getCity(lat: lat, lon: lon)})

                           // .onAppear(perform: {self.weatherTime.getTime()})

                            if let forecastDaily = weatherService.forecast?.list[0] {

                                VStack{
                                    if let nextTask = activityList.nextTask,
                                       let nextDate = activityList.nextDate,
                                       let city = locationManager.currentCity {
                                        DoITHeader(nextTask: nextTask, nextDate: nextDate, city: city);
                                    }
                                    
                                    if let idString = forecastDaily.weather[0].id {
                                        DoITWeatherLine(
                                            forecastDaily: forecastDaily,
                                            condition: weatherService.getConditionName(weatherID: idString),
                                            conditionImage: $conditionImage,
                                            zoomTemp: $temp
                                        )
                                    }
                                    if let nextSport = activityList.nextTask,
                                       let temp = forecastDaily.main.temp,
                                       let condition = forecastDaily.weather[0].id {
                                        if let image = getPicture(sport: nextSport, temp: temp, weather: condition) {
                                            Image(image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        }
                                    }

                                }

                            }
                    }
                }

                VStack{
                    Button(action: {
                        self.showZoom = true;
                        print(self.temp!)
                    }) {
                        Image(systemName: "magnifyingglass.circle.fill")
                    }
                    .sheet(isPresented: $showZoom) {
                        ZoomView(temp: self.$temp, conditionImage: self.$conditionImage)
                    }
                        .font(.title)
                        .offset(x: 140, y: 265)
                        .foregroundColor(.white)
                }

                //Code sourced from https://www.youtube.com/watch?v=0LrP6dv8tHY
                VStack
                {
                    DisclosureGroup("\(selected)"
                                    , isExpanded: $isExpanded){
                        VStack (alignment: .center){
                            Text("MORNING")
                                .font(.title3)
                                .padding(.all)
                                .onTapGesture {
                                    self.selected = "MORNING"
                                    self.isExpanded.toggle()
                                }
                            Text("AFTERNOON")
                                .font(.title3)
                                .padding(.all)
                                .onTapGesture {
                                    self.selected = "AFTERNOON"
                                    self.isExpanded.toggle()
                                }
                            Text("EVENING")
                                .font(.title3)
                                .padding(.all)
                                .onTapGesture {
                                    self.selected = "EVENING"
                                    self.isExpanded.toggle()
                                }
                        }
                    }
                                    .foregroundColor(.black)
                                    .accentColor(.black)
                                    .padding(.all)
                                    .background(Color.orange)
                                    .offset(y: 180)
                }.padding(.all)
                Spacer()
            }
        }.onAppear(perform: {self.activityList.getAllTask()})
            .onAppear(perform: {self.activityList.getNextActivity()})
    }
}


//struct TabDoIt_Previews: PreviewProvider {
//    static var previews: some View {
//        TabDoIt()
//    }
//}
