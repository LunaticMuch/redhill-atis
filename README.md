# Redhill Airport ATIS App

A modern, reliable iOS app providing real-time ATIS (Automatic Terminal Information Service) and METAR data for [Redhill Aerodrome](https://redhillaerodrome.com) (EGKR) in Surrey, UK.

## Why This App Exists

Redhill Aerodrome's weather information system has several limitations that can be frustrating for pilots and aviation enthusiasts:

- **Unreliable phone service**: The official weather phone line (+44 1737 822947) is often busy or experiences connection issues
- **Limited accessibility**: No digital interface or mobile-friendly way to access current conditions
- **Outdated delivery method**: Relying solely on voice communication in 2025 feels antiquated
- **No historical data**: Impossible to review recent weather trends or compare conditions

This app solves these problems by providing:

✈️ **Instant Access** - Get current ATIS information immediately without waiting on hold  
📱 **Modern Interface** - Clean, readable format optimized for mobile devices  
🔄 **Real-time Updates** - Always current data fetched from reliable sources  
🌍 **Nearby METARs** - Compare conditions at surrounding airports  
⌚ **Apple Watch Support** - Quick access from your wrist  
🎯 **Pilot-Focused Design** - Information displayed exactly how pilots need it

## Features

- **Current ATIS Information**: Designator, runway in use, QNH/QFE, wind conditions, visibility, temperature, and more
- **Full Weather View**: Complete METAR data with detailed breakdowns
- **Nearby Airports**: METAR data from surrounding airports for comparison
- **Apple Watch App**: Essential weather data on your wrist
- **In-Flight Mode**: Large, easy-to-read display for cockpit use
- **Settings**: Customize display preferences (QFE vs QNH, launch options)

## Screenshots

The app includes automated screenshot generation using Fastlane for App Store submissions.

## Technical Details

Built with:

- SwiftUI for modern, responsive UI
- Combine framework for reactive programming
- Network layer with proper error handling
- MVVM architecture pattern
- Comprehensive test coverage

## Data Sources

Weather data is sourced from:

- Redhill Airport's official weather station via serverless API
- [NOAA](https://www.noaa.gov/weather) Aviation Weather Center API for nearby METAR data

## Disclaimer

This application provides weather information for reference purposes. For official weather briefings, always consult official sources or call Redhill Airport at +44 1737 822947. This app is not affiliated with Redhill Aerodrome.

## Development

Built by [Stefano Cislaghi](https://github.com/lunaticmuch) with ❤️ for the aviation community.

## License

See [LICENSE](LICENSE) file for details.
