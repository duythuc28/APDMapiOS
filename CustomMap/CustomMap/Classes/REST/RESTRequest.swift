//
//  RESTRequest.swift
//  SwiftCore
//
//  Created by MacMini on 9/18/15.
//  Copyright © 2015 Duong Tran. All rights reserved.
//

import Foundation
import Alamofire

class RESTRequest: NSObject
{
    var baseUrl: String = ""
    var parameters: [String: String] = [:]
    var headers: [String: String] = [:]
    var multiparts: [RESTMultipart] = []
    var requestBodyType: RESTRequestBodyType
    var requestRESTMethod : RESTRequestMethod

    //MARK: Base
    init(subPath: String, functionName: String, requestMethod: RESTRequestMethod) {
        //set base url
        baseUrl = RESTContants.kDefineWebserviceUrl + subPath + "/" + functionName
        //set default request body type
        requestBodyType = RESTRequestBodyType.JSON
        self.requestRESTMethod = requestMethod
    }
    
    
    
//    func getManager() -> AFHTTPRequestOperationManager {
//        let manager = AFHTTPRequestOperationManager()
//        
//        //set request body type
//        if(requestBodyType == RESTRequestBodyType.JSON) {
//            manager.requestSerializer = AFJSONRequestSerializer()
//        }
//        else {
//            manager.requestSerializer = AFHTTPRequestSerializer()
//            manager.responseSerializer.acceptableContentTypes = NSSet(object: "text/html") as Set<NSObject>
//        }
//        
//        //set time out
//        manager.requestSerializer.timeoutInterval = RESTContants.kDefineRequestTimeOut
//        
//        //set header
//        for headerString in headers.keys {
//            manager.requestSerializer.setValue(headers[headerString], forKey: headerString)
//        }
//        
//        return manager
//    }
    
    //MARK: Properties
    
//    func addQueryParam(objectParam: NSObject)
//    {
//        var query: String = ""
//        let json = ObjectMapper.sharedInstance().dictionaryFromObject(objectParam)
//        for key in json.allKeys {
//            if (query.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) == 0) {
//                query = "?"
//            }
//            else {
//                query += "&"
//            }
//            
//            //query += "key=value"
//            query = query + (key as! String) + "=" + json.valueForKey(key as! String)!.stringValue
//        }
//    }
    
    func appendQueryParam() -> String{
        var query: String = ""
        for key in self.parameters.keys {
            if (query.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) == 0) {
                query = "?"
            }
            else {
                query += "&"
            }
            
            query = query + key + self.parameters[key]!
        }
        
        return query
    }
    
    func addQueryParam(name: String, value: AnyObject)
    {
        parameters[name] = value as? String
    }
    
    func addHeader(name: String, value: AnyObject)
    {
        headers[name] = value as? String
    }
    
    func setContentType(contentType: String)
    {
        headers[RESTContants.kDefineRESTRequestContentTypeKey] = contentType
    }
    
    func setAccept(accept: String)
    {
        headers[RESTContants.kDefineRESTRequestAcceptKey] = accept
    }
    
    func setAuthorization(authorization: String)
    {
        headers[RESTContants.kDefineRESTRequestAuthorizationKey] = authorization
    }
    
    
    
    
    //MARK: AFNetworking functions
    
//    func isSuccess(operation: AFHTTPRequestOperation?) -> Bool
//    {
//        if(operation == nil) {
//            return false
//        }
//        
//        return (operation?.response?.statusCode == RESTEnum.StatusCode.Success.rawValue && RESTRequest.checkSuccessFromResponseData(operation?.responseData)) ? true : false
//    }
//    
//    func parseDataFromSuccessOperation(operation: AFHTTPRequestOperation, completion: (result: AnyObject?, error: RESTError?) -> Void) {
//
//        if (operation.responseObject != nil) {
//            completion(result: operation.responseObject, error: nil)
//        }
//        else {
//            let restError = RESTError.parseError(operation.responseData, error: nil)
//            completion(result: nil, error: restError)
//        }
//    }
    
    func invokeRequest(completion: (result: Response<AnyObject,NSError> , error: RESTError?) -> Void) {
        var requestMethod : Alamofire.Method
        switch (self.requestRESTMethod) {
        case .GET:
           requestMethod = Alamofire.Method.GET
        case .POST:
            requestMethod = Alamofire.Method.POST
        case .PUT:
            requestMethod = Alamofire.Method.PUT
        case .DELETE:
            requestMethod = Alamofire.Method.DELETE
        }
         Alamofire.Manager.sharedInstance.request(requestMethod, self.baseUrl, parameters: self.parameters, encoding: ParameterEncoding.URL, headers: self.headers).responseJSON { (response) -> Void in
            completion(result:response, error: RESTError.parseError(response.data, error: response.result.error))
        }
    }
    
//    
//    func baseGET(completion: (result: AnyObject?, error: RESTError?) -> Void)
//    {
//        let manager = self.getManager()
//        manager.GET(self.baseUrl, parameters: self.parameters, success: { (operation: AFHTTPRequestOperation, responseObj: AnyObject) -> Void in
//            
//            self.parseDataFromSuccessOperation(operation, completion: { (result, error) -> Void in
//                    completion(result: operation.responseObject, error: error)
//                })
//            
//            }) { (operation: AFHTTPRequestOperation, error: NSError) -> Void in
//                completion(result: nil, error: RESTError.parseError(operation.responseData, error: error))
//            }
//    }
//    
//    func basePOST(objectBody: NSObject, completion: (result: AnyObject?, error: RESTError?) -> Void) {
//        let paramater: NSDictionary = ObjectMapper.sharedInstance().dictionaryFromObject(objectBody) as! NSDictionary
//        self.basePOSTWithJSON(paramater) { (result, error) -> Void in
//            if(result != nil) {
//                completion(result: result, error: nil)
//            }
//            else {
//                completion(result: nil, error: error)
//            }
//        }
//    }
//    
//    func basePOSTWithJSON(jsonBody: NSDictionary, completion: (result: AnyObject?, error: RESTError?) -> Void) {
//        let manager = self.getManager()
//        manager.POST(self.baseUrl, parameters: jsonBody, success: { (operation: AFHTTPRequestOperation, responseObj: AnyObject) -> Void in
//            
//            self.parseDataFromSuccessOperation(operation, completion: { (result, error) -> Void in
//                completion(result: result, error: error)
//            })
//            
//            }) { (operation: AFHTTPRequestOperation, error: NSError) -> Void in
//                completion(result: nil, error: RESTError.parseError(operation.responseData, error: error))
//        }
//    }
//    
//    func basePUT(objectBody: NSObject, completion: (result: AnyObject?, error: RESTError?) -> Void) {
//        let paramater = ObjectMapper.sharedInstance().dictionaryFromObject(objectBody)
//        let manager = self.getManager()
//        
//        manager.PUT(self.baseUrl, parameters: paramater, success: { (operation: AFHTTPRequestOperation, responseObj: AnyObject) -> Void in
//            
//            self.parseDataFromSuccessOperation(operation, completion: { (result, error) -> Void in
//                completion(result: result, error: error)
//            })
//            
//            }) { (operation: AFHTTPRequestOperation, error: NSError) -> Void in
//                completion(result: nil, error: RESTError.parseError(operation.responseData, error: error))
//        }
//
//    }
//    
//    func basePOSTMultiPart(completion: (result: JSON?, error: RESTError?) -> Void) {
//        if(self.multiparts.count > 0) {
//            let manager = self.getManager()
//            self.baseUrl = self.baseUrl + self.appendQueryParam()
//            
//            manager.POST(self.baseUrl, parameters: self.parameters, constructingBodyWithBlock: { (formData:AFMultipartFormData) -> Void in
//                for multipart: RESTMultipart in self.multiparts {
//                    formData.appendPartWithHeaders(multipart.getHeader() as [NSObject : AnyObject], body: multipart.data)
//                }
//                }, success: { (operation: AFHTTPRequestOperation, result: AnyObject) -> Void in
//                    
//                }, failure: { (operation: AFHTTPRequestOperation, error: NSError) -> Void in
//                    
//            })
//        }
//        else {
//            let restError = RESTError()
//            restError.errorFromResponse = "Please add least part"
//            completion(result: nil, error: restError)
//        }
//    }
}