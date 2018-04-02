

import Foundation

//
// Flight model
//

struct FlightData {
  let summary: String
  let flightNr: String
    // flight Number
  let gateNr: String
  let departingFrom: String
  let arrivingTo: String
  let weatherImageName: String
  let showWeatherEffects: Bool
  let isTakingOff: Bool
  let flightStatus: String
}

//
// Pre- defined flights
//

let londonToParis = FlightData(
  summary: "01 Apr 2015 09:42",
  flightNr: "ZY 2014",
  gateNr: "T1 A33",
  departingFrom: "LGW",
  arrivingTo: "CDG",
  weatherImageName: "bg-snowy",
  showWeatherEffects: true,
  isTakingOff: false,
  flightStatus: "Delayed")


let parisToRome = FlightData(
  summary: "01 Apr 2015 17:05",
  flightNr: "AE 1107",
  gateNr: "045",
  departingFrom: "CDG",
  arrivingTo: "FCO",
  weatherImageName: "bg-sunny",
  showWeatherEffects: false,
  isTakingOff: true,
  flightStatus: "Boarding")

