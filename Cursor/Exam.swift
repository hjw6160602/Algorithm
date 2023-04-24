import SwiftUI
import Combine

struct WeatherInfo: Codable {
    let status: String
    let count: String
    let info: String
    let infocode: String
    let lives: [Live]
}

struct Live: Codable {
    let province: String
    let city: String
    let adcode: String
    let weather: String
    let temperature: String
    let winddirection: String
    let windpower: String
    let humidity: String
    let reporttime: String
}

class WeatherViewModel: ObservableObject {
    @Published var weatherInfo: WeatherInfo?
    let city: String
    
    init(city: String) {
        self.city = city
        fetchWeatherInfo()
    }
    
    func fetchWeatherInfo() {
        let url = URL(string: "https://restapi.amap.com/v3/weather/weatherInfo?key=YOUR_API_KEY&city=\(city)&extensions=all")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(WeatherInfo.self, from: data) {
                    DispatchQueue.main.async {
                        self.weatherInfo = decodedResponse
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct ContentView: View {
    let cities = ["北京", "上海", "广州", "深圳", "苏州", "沈阳"]
    
    var body: some View {
        NavigationView {
            List(cities, id: \.self) { city in
                NavigationLink(destination: CityWeatherView(city: city)) {
                    Text(city)
                }
            }
            .navigationBarTitle("Cities")
        }
    }
}

struct CityWeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    init(city: String) {
        viewModel = WeatherViewModel(city: city)
    }
    
    var body: some View {
        VStack {
            if let weatherInfo = viewModel.weatherInfo {
                Text("\(weatherInfo.lives[0].weather)")
                    .font(.title)
                Text("\(weatherInfo.lives[0].temperature)℃")
                    .font(.headline)
                Text("\(weatherInfo.lives[0].winddirection) \(weatherInfo.lives[0].windpower)级")
                    .font(.subheadline)
                Text("湿度 \(weatherInfo.lives[0].humidity)%")
                    .font(.subheadline)
                Text("更新时间 \(weatherInfo.lives[0].reporttime)")
                    .font(.subheadline)
            } else {
                Text("Loading...")
            }
        }
        .navigationBarTitle(viewModel.city)
    }
}
``` 

Note: Replace `YOUR_API_KEY` in the `fetchWeatherInfo()` function with your own AMap API key.



// Set up a semaphore with a count of 0
let semaphore = DispatchSemaphore(value: 0)

// Perform the pasteboard read on a background queue
DispatchQueue.global(qos: .background).async {
    // Wait for up to 3 seconds for the pasteboard string
    let result = UIPasteboard.general.string
    if result != nil {
        // If the string is not nil, print it
        print(result!)
    } else {
        // If the string is nil, print an error message
        print("Pasteboard read timed out")
    }
    // Signal the semaphore to indicate that the task is complete
    semaphore.signal()
}

// Wait for the semaphore to be signaled, or for 3 seconds to elapse
let timeout = DispatchTime.now() + .seconds(3)
if semaphore.wait(timeout: timeout) == .timedOut {
    // If the semaphore wait timed out, print an error message
    print("Pasteboard read timed out")
}


let semaphore = DispatchSemaphore(value: 0)
DispatchQueue.global(qos: .background).async {
    let result = UIPasteboard.general.string
    if result != nil {
        print(result!)
    } else {
        print("粘贴板读取失败！")
    }
    semaphore.signal()
}

let timeout = DispatchTime.now() + .seconds(3)
if semaphore.wait(timeout: timeout) == .timeout {
    print("粘贴板读取超时！")
}