# MindBoost_App (рус)

## Описание
MindBoost_App - это приложение, созданное на SwiftUI, которое предлагает пользователю позитивные аффирмации. Приложение включает в себя онбординг и главный экран (MainTabBar) с аффирмациями

## Технологии
- **SwiftUI** - используется для создания всех пользовательских интерфейсов в приложении.
- **Realm** - применяется для локального хранения данных.
- **MVVM + Coordinator** - архитектурный подход, обеспечивающий разделение логики и интерфейса, упрощает навигацию и управление состоянием.
- **Стратегия** (Strategy Pattern) - используется для гибкой работы с различными источниками данных, что облегчает тестирование и расширение функциональности приложения.

## Архитектура
Архитектура приложения организована по принципу MVVM с использованием координатора для управления потоком и навигацией. Использование стратегий для получения данных позволяет легко адаптировать и изменять источники данных без воздействия на остальные части приложения.

## Локализация
Приложение полностью локализовано на два языка: русский и английский, что делает его доступным для широкой аудитории.

## Онбординг и Навигация
Приложение включает в себя процесс онбординга для новых пользователей, который помогает освоиться с основными функциями. После завершения онбординга пользователь переходит на главный экран (MainTabBar), который служит центром управления основными функциями приложения.

## Скринкаст
Для демонстрации возможностей приложения и его интерфейса предоставлен скринкаст: [Смотреть скринкаст](https://www.youtube.com/playlist?list=PLkB1qmG6jQH97ZB-gbZxcyqn6tYjZGsLS)


## Лицензия
Этот проект лицензирован под лицензию MIT. Подробности см. в файле [LICENSE](./LICENSE).
## Автор: Александра Гоман



# MindBoost_App

## Description
MindBoost_App is a SwiftUI application that offers users positive affirmations. The app includes onboarding and a main screen (MainTabBar) with affirmations.

## Technologies
- **SwiftUI** - Used for creating all user interfaces within the app.
- **Realm** - Used for local data storage.
- **MVVM + Coordinator** - An architectural approach that separates logic and interface, simplifying navigation and state management.
- **Strategy Pattern** - Utilized for flexible data sourcing, facilitating testing and functionality expansion.

## Architecture
The application's architecture is organized according to the MVVM principle using a coordinator to manage flow and navigation. The use of strategies for data retrieval allows for easy adaptation and modification of data sources without impacting other parts of the app.

## Localization
The application is fully localized in two languages: Russian and English, making it accessible to a wide audience.

## Onboarding and Navigation
The application includes an onboarding process for new users that helps them become acquainted with the main features. After completing onboarding, the user moves to the main screen (MainTabBar), which serves as the control center for the app's main functions.

## Screencast
To demonstrate the capabilities and interface of the app, a screencast is provided: [Watch the Screencast](https://www.youtube.com/playlist?list=PLkB1qmG6jQH97ZB-gbZxcyqn6tYjZGsLS)


## License
This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.
## Created by: Aliaksandra Homan
