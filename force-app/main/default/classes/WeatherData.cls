/**
 * @Description         : 
 * @Created By          : Meric Asaner (meric.asaner@ritmus.com)
 * @Last Modified Date  : 09/08/2022
**/
global with sharing class WeatherData {
    global String city { get; set; }
    global Decimal temp { get; set;}

    global WeatherData(String city, Decimal temp) {
        this.city = city;
        this.temp = temp;
    }
}