//: Playground - noun: a place where people can play

import Cocoa
import Foundation
var str = "Hello, playground"


/* Configure session, choose between:
 * defaultSessionConfiguration
 * ephemeralSessionConfiguration
 * backgroundSessionConfigurationWithIdentifier:
 And set session-wide properties, such as: HTTPAdditionalHeaders,
 HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
 */
let sessionConfig = URLSessionConfiguration.default

/* Create session, and optionally set a URLSessionDelegate. */
let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

/* Create the Request:
 Request (POST http://am.aeroidea.ru/api/catalog)
 */

 var URL = URL(string: "http://am.aeroidea.ru/api/catalog")
var request = URLRequest(url: URL)
request.httpMethod = "POST"

// Headers

request.addValue("BITRIX_SM_CITY_NAME=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0; BITRIX_SM_CITY_SALE_LOCATION_ID=19; BITRIX_SM_REGION_ELEMENT_ID=342; BITRIX_SM_REGION_ELEMENT_XML_ID=77; BITRIX_SM_REGION_CODE=moscow; BITRIX_SM_REGION_SHOPS_COUNT=149; PHPSESSID=m34p7g4mahj0g47u2dr6vhjdv5; BITRIX_SM_GUEST_ID=595; BITRIX_SM_LAST_VISIT=21.03.2017+18%3A32%3A07", forHTTPHeaderField: "Cookie")
request.addValue("Basic bG9naW5hcmVhOioqKioqIEhpZGRlbiBjcmVkZW50aWFscyAqKioqKg==", forHTTPHeaderField: "Authorization")

/* Start a new Task */
let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
    if (error == nil) {
        // Success
        let statusCode = (response as! HTTPURLResponse).statusCode
        print("URL Session Task Succeeded: HTTP \(statusCode)")
    }
    else {
        // Failure
        print("URL Session Task Failed: %@", error!.localizedDescription);
    }
})
task.resume()