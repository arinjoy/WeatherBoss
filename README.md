# WeatherBoss
A weather app made with love to demonstrate clean architecture, code organisation and best practices in iOS.

The weather data of Australian cities are fetched from [OpenWeather.org](https://openweathermap.org/current). Please create a free API-KEY from the website if needed.

### Installation: 
- Xcode 10.2.1+ (required)
- Pleae Carthage command `Carthage update --platform iOS` to install the dependent librabries in the `Cartfile`
- Then compile the Xcode


## Clean Architecture
 - VIPER, MVP & MVVM style (a hybrid of all)
 - Clean communication between **`Display`**, **`Presenter`** and **`Router`** in the view/scene stack
 - Connectivity of this components are achieved via protocol instances to achieve loose coupling and unit testability
 - `View` (i.e View Controller) is `Display` itself and contacts its `Presenter`
 - `Presenter` communicates with underlying `Service` layer
 - **`Service`** communicates to **`ApiClient`** or managers
 - `Preseneter` talks back to `Display`
 - `Presenter` also talks to `Router` to navigate from one scene to another
 
 ## Code Organisation
 > Folder / Grouping are done as per below:
 - `Shared`: Accessbility, Localisation, Theme, DataTransform, DataSource, UI helper
 - `Models`: DataModels, Domain Models, Protocols, Mapping (JSON to Data model and Data to Domain model)
 - `Services`: API configs, Service class, ApiClient
 - `Scene`: Consists of view scene stack
 > The number of Scenes:
 - `Root`: App Delegate
 - `WeatherList`: The list of weather summary cells of cities in table view
 - `Settings`: The settings to change app theme and see version number
 - `WeatherDetails`: The weather deatils of a city
 > Breakdown of each `Scene` stack:
  - ViewController
  - Presenter
  - Display
  - Router
  - UIComponents: Custom child views
  - ViewModels: `Transformer` and `PresentationItem`
  - Transformer: Helper that converts a domain model to presentation item or view model with necessary formatting and style if needed
  - PresentationItem: aka. view model that is used to configure views with data (and potentially style)

