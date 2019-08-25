# WeatherBoss
A weather app made with ❤️ to demonstrate some exmaples of clean architecture, code organisation and grouping and best practices and styles used in iOS programming using `Swift`.

The weather data of Australian cities are fetched from [OpenWeather.org](https://openweathermap.org/current). Please create a free API-KEY from the website if required.

![](/Docs/WeatherBoss-in-action.gif "")

### Installation: 
- Xcode **10.2.1**+ (required)
- Clean `/DrivedData` folder if any
- Run the Carthage update command to install the dependent libraries in the `Cartfile`
  **`carthage update --platform iOS`** 
- Then clean and build the project in Xcode

## 3rd Party Libraries
 - **`RxSwift`** - to make `Reactive` binding of API call and response 😇
 - **`Alamofire`** - to call API much easily 😀
 - **`ObjectMapper`** - to map `JSON` response to data models easily 😊
 - **`SnapKit`** - to snap auto layout constraints with ease 🤓
 - **`PKHUD`** - to show loading activity indicator like a pro 🙈


## Clean Architecture
 - VIPER, MVP & MVVM style (a hybrid of all)
 - Clean communication between **`Display`**, **`Presenter`** and **`Router`** in the view/scene stack
 - Connectivity of this components are achieved via protocol instances to achieve loose coupling and unit testability
 - `View` (i.e View Controller) is `Display` itself and contacts its `Presenter`
 - `Presenter` communicates with underlying `Service` layer
 - **`Service`** communicates to **`ApiClient`** or managers
 - `Presenter` talks back to `Display`
 - `Presenter` also talks to `Router` to navigate from one scene to another
 
 ## Code Organisation
 > Folder / Grouping are done as per below:
 - `Shared`: Theme, Accessibility, Localisation, DataTransform, DataSource, UI helper
 - `Models`: DataModels, Domain Models, Protocols, Mapping (JSON to Data model and Data to Domain model)
 - `Services`: API configs, Service class, ApiClient
 - `Scene`: Consists of view scene stack
 > The number of Scenes:
 - `Root`: App Delegate
 - `WeatherList`: The list of weather summary cells of cities in table view
 - `Settings`: The settings to change app theme and see version number
 - `WeatherDetails`: The weather deatils of a city
 > Breakdown of each `Scene` stack:
  - `ViewController`
  - `Presenter`
  - `Display`
  - `Router`
  - `UIComponents`: Custom child views
  - `ViewModels`: `Transformer`s and `PresentationItem`s
  - `Transformer`: Helper that converts a domain model to presentation item or view model with necessary formatting and style if needed
  - `PresentationItem`: aka. view model that is used to configure views with data (and potentially with some style)
  
## Usage of Abstractions and Protocols
> There are many usages of abstractions using `protocol`s
- `DomainMapping` Used to map a low level `ObjectMapper` data model into mid level `CityWeather` domain model
- `DataTransforming`: Used to transform a domain model to a presentation item (aka. view model)
- `DataSource`: Used provide data source to table views. A convenient abstraction to bind transformed data source of view models to table view's cells. Same can be used for collection view as well.

  
## Theme Engine
> A custom theme engine is used. It has `light` and `dark` style. 
User is allowed to toggle between default `light mode` and `dark mode` through settings. Refer to the `ThemeManger` under `Theme` group to see how it is exposed and binds togther the current app theme and colours that are provided text labels and view backgrounds. 
-  `enum` based mechanism is used for to access every instance of `UIColor` used in the app
- `Theme+Icon` provides icons used in the app and all instances of `UIImage`s are accessed from `Theme.Icon`
- `ThemeManager` **persists** the theme information in **`UserDefaults`** and it's synced as soon as user taps the `switch` control in settings
- The effect of the theme change is immediate and done via shared application delegate

![](/Docs/app_theme_persistence.gif "")

## API Error Handling
> Handling of the error is basic but provision has been made to custom mapping error using `WeatherFetchingError` enum and there are few cases which can be checked and show custom error messages. (Left note in the code in `WeatherListPresenter`)

![](/Docs/error_dark.png "")

## Localisation & Copies
> Localization can be done via localized strings loading and enum `StringKeys` based mechanism to access strings copies used in the app. No copy is hardcoded in a class file. Refer to `Localization` folder and the usage of it.

## Customised Accessibility
> Custom Accessibility is being attached to custom UI components and computed accessibility labels, hints and traits are attached where necessary. This is done by transformers and accessibility configuration is passed via presentation items and then eventually to the view it binds to. For example, we can inspect the elements in `Accessibility Inspector`.

![](/Docs/acc_list.png "")
![](/Docs/acc_temperature.png "")
![](/Docs/acc_windspeed.png "")



# Screenshots

![](/Docs/list_light.png "") ![](/Docs/list_dark.png "")
![](/Docs/detail_light.png "") ![](/Docs/detail_dark.png "")
![](/Docs/settings_light.png "") ![](/Docs/settings_dark.png "")


