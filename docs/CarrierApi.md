# CarrierApi

All URIs are relative to *https://api.smspool.net*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**carrierPaidLookup**](CarrierApi.md#carrierPaidLookup) | **POST** /carrier/paid_lookup | Lookup |


<a id="carrierPaidLookup"></a>
# **carrierPaidLookup**
> Object carrierPaidLookup(phonenumber)

Lookup

This API endpoint is used to perform a paid lookup for a phone number. The request is sent via an HTTP POST method to the following URL: &#x60;https://api.smspool.net/carrier/paid_lookup&#x60;  &#x60;&#x60;&#x60; json {   \&quot;success\&quot;: true,   \&quot;phonenumber\&quot;: \&quot;\&quot;,   \&quot;country\&quot;: \&quot;\&quot;,   \&quot;carrier\&quot;: \&quot;\&quot;,   \&quot;carrier_type\&quot;: \&quot;\&quot;,   \&quot;charge\&quot;: 0 }   &#x60;&#x60;&#x60;  The &#x60;success&#x60; field indicates whether the lookup was successful or not. The &#x60;phonenumber&#x60; field represents the phone number for which the lookup was performed. The &#x60;country&#x60; field indicates the country associated with the phone number. The &#x60;carrier&#x60; field provides the name of the carrier associated with the phone number. The &#x60;carrier_type&#x60; field specifies the type of carrier. The &#x60;charge&#x60; field represents the cost charged for the lookup operation.  Please note that specific values for &#x60;phonenumber&#x60;, &#x60;country&#x60;, &#x60;carrier&#x60;, and &#x60;carrier_type&#x60; were not provided in the response, and the &#x60;charge&#x60; field had a value of 0.  To use this endpoint, send an HTTP POST request to the provided URL with the necessary parameters. The request should include the phone number for which you want to perform the lookup. The response will contain the details of the carrier and associated information.  Make sure to handle any errors that may occur during the lookup process and check the &#x60;success&#x60; field in the response to determine the outcome of the operation.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.CarrierApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    CarrierApi apiInstance = new CarrierApi(defaultClient);
    Integer phonenumber = 56; // Integer | 
    try {
      Object result = apiInstance.carrierPaidLookup(phonenumber);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling CarrierApi#carrierPaidLookup");
      System.err.println("Status code: " + e.getCode());
      System.err.println("Reason: " + e.getResponseBody());
      System.err.println("Response headers: " + e.getResponseHeaders());
      e.printStackTrace();
    }
  }
}
```

### Parameters

| Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **phonenumber** | **Integer**|  | |

### Return type

**Object**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |
| **400** | Error |  -  |
| **401** | Malformed API key |  -  |
| **403** | Unknown or revoked API key |  -  |

