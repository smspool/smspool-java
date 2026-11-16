# SmsApi

All URIs are relative to *https://api.smspool.net*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**purchaseSms**](SmsApi.md#purchaseSms) | **POST** /purchase/sms | Order SMS |
| [**requestActive**](SmsApi.md#requestActive) | **POST** /request/active | Active orders |
| [**requestArchive**](SmsApi.md#requestArchive) | **POST** /request/archive | Archive all orders |
| [**requestAreacodes**](SmsApi.md#requestAreacodes) | **POST** /request/areacodes | Request available areacodes |
| [**requestHistory**](SmsApi.md#requestHistory) | **POST** /request/history | Order History |
| [**requestHistorySearch**](SmsApi.md#requestHistorySearch) | **POST** /request/history_search | Search order history |
| [**smsActivate**](SmsApi.md#smsActivate) | **POST** /sms/activate | Activate SMS |
| [**smsAllStock**](SmsApi.md#smsAllStock) | **POST** /sms/all_stock | One-time stock for all services |
| [**smsArchive**](SmsApi.md#smsArchive) | **POST** /sms/archive | Archive one order |
| [**smsCancel**](SmsApi.md#smsCancel) | **POST** /sms/cancel | Cancel SMS |
| [**smsCancelAll**](SmsApi.md#smsCancelAll) | **POST** /sms/cancel_all | Cancel All SMS |
| [**smsCheck**](SmsApi.md#smsCheck) | **POST** /sms/check | Check SMS |
| [**smsCheckResend**](SmsApi.md#smsCheckResend) | **POST** /sms/check_resend | Check Resend |
| [**smsClearCache**](SmsApi.md#smsClearCache) | **POST** /sms/clear_cache | Clear SMS Cache |
| [**smsMissed**](SmsApi.md#smsMissed) | **POST** /sms/missed | Missed SMS |
| [**smsReactivate**](SmsApi.md#smsReactivate) | **POST** /sms/reactivate | Reactivate SMS |
| [**smsResend**](SmsApi.md#smsResend) | **POST** /sms/resend | Resend |
| [**smsStock**](SmsApi.md#smsStock) | **POST** /sms/stock | One-time SMS stock |
| [**smsUnarchive**](SmsApi.md#smsUnarchive) | **POST** /sms/unarchive | Unarchive order |


<a id="purchaseSms"></a>
# **purchaseSms**
> Object purchaseSms(service, idempotencyKey, country, pool, maxPrice, pricingOption, quantity, areacode, exclude, createToken, activationType, carrier, phonenumber, autoCountry, response, software)

Order SMS

Orders one or more numbers for a service.  ### Response shapes  Without &#x60;response&#x3D;v2&#x60; the shape depends on &#x60;quantity&#x60;: one number returns the order object; several return a JSON array of order objects; if ordering stops part-way, an object with the orders bought so far under &#x60;\&quot;0\&quot;&#x60;, &#x60;\&quot;1\&quot;&#x60;, ... plus &#x60;message&#x60;.  With &#x60;response&#x3D;v2&#x60; every case returns the same object:  - &#x60;success&#x60;: 1 when every requested number was ordered, otherwise 0 - &#x60;orders&#x60;: the orders that were placed (may be empty) - &#x60;failed&#x60;: the error that stopped the request, as a one-element list (empty on success) - &#x60;message&#x60;: a summary - &#x60;auto_country&#x60;: only with &#x60;auto_country&#x3D;1&#x60;, the chosen country  &#x60;response&#x3D;v2&#x60; is ignored together with &#x60;create_token&#x3D;1&#x60;.  ### Pool  &#x60;pool&#x60; is a pool ID or name from the &#x60;Pool List&#x60; endpoint. A name that does not exist answers 400 with &#x60;type: INVALID_POOL&#x60;. Leave it out (or send it empty or &#x60;0&#x60;) for any pool.  ### Retrying safely  Send an &#x60;Idempotency-Key&#x60; header so a retry after a timeout cannot buy twice.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    String service = "service_example"; // String | The service or number retrieved from the `Service List` endpoint
    String idempotencyKey = "3f1c2c0e-7d5b-4a52-9a53-1f6f0f0f2b11"; // String | 
    String country = "country_example"; // String | The country in ISO format or number retrieved from the `Country List` endpoint
    String pool = "pool_example"; // String | The pool ID or name retrieved from the `Pool List` endpoint (optional). An unknown name answers 400 `INVALID_POOL`.
    BigDecimal maxPrice = new BigDecimal(78); // BigDecimal | The max price you are willing to pay per number
    Integer pricingOption = 56; // Integer | Set to 0 if you'd like the cheapest numbers, set to 1 for highest success rate
    Integer quantity = 56; // Integer | Quantity of numbers ordered, 1 to 20. Must be a whole number.
    String areacode = "areacode_example"; // String | Areacodes you would like to include or exclude in JSON format
    Integer exclude = 56; // Integer | Set exclude to 1 if you would like to exclude all listed area codes.
    Integer createToken = 56; // Integer | Optional param; set to 1 if you'd like to create a token link that anyone can access.
    String activationType = "activationType_example"; // String | Options: SMS, VOICE, FLASH. SMS will receive regular SMS, VOICE will receive phone calls that mentions the SMS and FLASH is for FLASH calls for verification.
    Integer carrier = 56; // Integer | Options: 1 or 2. Pick a carrier (only works for pool Foxtrot US)
    Integer phonenumber = 56; // Integer | In case you want to select a specific phone number to order. Digits with the country code; a leading +, spaces and dashes are ignored.
    Integer autoCountry = 56; // Integer | Set to 1 to let SMSPool pick the country: every country with stock is scored on its expected success rate (estimated from the country's record across all services when the service has few orders there; weighed down when little stock backs it, minus a little per dollar) with a bonus for a local number, the country your request's IP resolves to; with pricing_option=1 the cheapest country close to the best score wins. Ignored when country is sent. The response then carries auto_country with the chosen country and the reason.
    String response = "response_example"; // String | Set to `v2` for one response shape whatever the quantity: `{success, orders, failed, message}`. Leave out for the legacy shapes.
    Integer software = 56; // Integer | 
    try {
      Object result = apiInstance.purchaseSms(service, idempotencyKey, country, pool, maxPrice, pricingOption, quantity, areacode, exclude, createToken, activationType, carrier, phonenumber, autoCountry, response, software);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#purchaseSms");
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
| **service** | **String**| The service or number retrieved from the &#x60;Service List&#x60; endpoint | |
| **idempotencyKey** | **String**|  | [optional] |
| **country** | **String**| The country in ISO format or number retrieved from the &#x60;Country List&#x60; endpoint | [optional] |
| **pool** | **String**| The pool ID or name retrieved from the &#x60;Pool List&#x60; endpoint (optional). An unknown name answers 400 &#x60;INVALID_POOL&#x60;. | [optional] |
| **maxPrice** | **BigDecimal**| The max price you are willing to pay per number | [optional] |
| **pricingOption** | **Integer**| Set to 0 if you&#39;d like the cheapest numbers, set to 1 for highest success rate | [optional] |
| **quantity** | **Integer**| Quantity of numbers ordered, 1 to 20. Must be a whole number. | [optional] |
| **areacode** | **String**| Areacodes you would like to include or exclude in JSON format | [optional] |
| **exclude** | **Integer**| Set exclude to 1 if you would like to exclude all listed area codes. | [optional] |
| **createToken** | **Integer**| Optional param; set to 1 if you&#39;d like to create a token link that anyone can access. | [optional] |
| **activationType** | **String**| Options: SMS, VOICE, FLASH. SMS will receive regular SMS, VOICE will receive phone calls that mentions the SMS and FLASH is for FLASH calls for verification. | [optional] |
| **carrier** | **Integer**| Options: 1 or 2. Pick a carrier (only works for pool Foxtrot US) | [optional] |
| **phonenumber** | **Integer**| In case you want to select a specific phone number to order. Digits with the country code; a leading +, spaces and dashes are ignored. | [optional] |
| **autoCountry** | **Integer**| Set to 1 to let SMSPool pick the country: every country with stock is scored on its expected success rate (estimated from the country&#39;s record across all services when the service has few orders there; weighed down when little stock backs it, minus a little per dollar) with a bonus for a local number, the country your request&#39;s IP resolves to; with pricing_option&#x3D;1 the cheapest country close to the best score wins. Ignored when country is sent. The response then carries auto_country with the chosen country and the reason. | [optional] |
| **response** | **String**| Set to &#x60;v2&#x60; for one response shape whatever the quantity: &#x60;{success, orders, failed, message}&#x60;. Leave out for the legacy shapes. | [optional] |
| **software** | **Integer**|  | [optional] |

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
| **409** | Error |  -  |
| **422** | Error |  -  |

<a id="requestActive"></a>
# **requestActive**
> Object requestActive()

Active orders

The recommended endpoint to retrieve your current active orders, this will display all your orders at the same time. We recommend using this endpoint to iterate through your active orders to retrieve your SMS messages.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    try {
      Object result = apiInstance.requestActive();
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#requestActive");
      System.err.println("Status code: " + e.getCode());
      System.err.println("Reason: " + e.getResponseBody());
      System.err.println("Response headers: " + e.getResponseHeaders());
      e.printStackTrace();
    }
  }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**Object**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |
| **401** | Malformed API key |  -  |
| **403** | Unknown or revoked API key |  -  |

<a id="requestArchive"></a>
# **requestArchive**
> Object requestArchive()

Archive all orders

This API endpoint is used to archive a request in the SMS Pool system. The HTTP POST request should be sent to &#x60;https://api.smspool.net/request/archive&#x60;.  ### Request Parameters  The \\&#x60;key\\&#x60; parameter is required for this endpoint, this is your API key.  ### Response  The response for this API endpoint will have a status code of 200, indicating a successful request. The response body will be in JSON format and will contain the following properties:  - &#x60;success&#x60; (integer): A flag indicating the success of the request. A value of 0 indicates failure. - &#x60;message&#x60; (string): An optional message providing additional information about the request. In this case, the message is empty.       Please note that the response may contain additional properties not mentioned here, but they can be ignored for the purpose of this documentation.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    try {
      Object result = apiInstance.requestArchive();
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#requestArchive");
      System.err.println("Status code: " + e.getCode());
      System.err.println("Reason: " + e.getResponseBody());
      System.err.println("Response headers: " + e.getResponseHeaders());
      e.printStackTrace();
    }
  }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**Object**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |
| **401** | Malformed API key |  -  |
| **403** | Unknown or revoked API key |  -  |

<a id="requestAreacodes"></a>
# **requestAreacodes**
> Object requestAreacodes(service, country, pool)

Request available areacodes

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    String service = "service_example"; // String | The service or number retrieved from the `Service List` endpoint
    String country = "country_example"; // String | The country in ISO format or number retrieved from the `Country List` endpoint
    String pool = "pool_example"; // String | The pool or number retrieved from the `Pool List` endpoint (optional)
    try {
      Object result = apiInstance.requestAreacodes(service, country, pool);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#requestAreacodes");
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
| **service** | **String**| The service or number retrieved from the &#x60;Service List&#x60; endpoint | |
| **country** | **String**| The country in ISO format or number retrieved from the &#x60;Country List&#x60; endpoint | |
| **pool** | **String**| The pool or number retrieved from the &#x60;Pool List&#x60; endpoint (optional) | |

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
| **200** | JSON response |  -  |
| **401** | Malformed API key |  -  |
| **403** | Unknown or revoked API key |  -  |

<a id="requestHistory"></a>
# **requestHistory**
> Object requestHistory(start, length, search)

Order History

This API endpoint is used to retrieve the history of SMS requests. It is an HTTP POST request that should be made to the following URL: &#x60;https://api.smspool.net/request/history&#x60;.  The request requires the \\&#x60;key\\&#x60; parameter which is your API key.  The response returned by the API is a JSON array. Each element in the array represents a historical SMS request and contains the following properties:  - &#x60;cost&#x60;: The cost of the SMS request. - &#x60;order_code&#x60;: The order code associated with the SMS request. - &#x60;phonenumber&#x60;: The phone number to which the SMS was sent. - &#x60;code&#x60;: The code associated with the SMS request. - &#x60;full_code&#x60;: The full code associated with the SMS request. - &#x60;short_name&#x60;: The short name associated with the SMS request. - &#x60;service&#x60;: The service associated with the SMS request. - &#x60;status&#x60;: The status of the SMS request. - &#x60;pool&#x60;: The pool associated with the SMS request. - &#x60;timestamp&#x60;: The timestamp of the SMS request. - &#x60;completed_on&#x60;: The completion date of the SMS request. - &#x60;expiry&#x60;: The expiry time of the SMS request. - &#x60;time_left&#x60;: The time left for the SMS request to expire.       Please note that the values for the properties are not provided in the response example, so they may be empty or null.  The last execution of this API request returned a response with a status code of 200, indicating a successful execution. The response body contained an array of SMS request history objects.  Please refer to the API documentation for more details on how to use this endpoint and interpret the response.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    Integer start = 56; // Integer | Which row you'd like to start from
    Integer length = 56; // Integer | Max length of all rows
    String search = "search_example"; // String | Search query for phone number, order_code, service or country
    try {
      Object result = apiInstance.requestHistory(start, length, search);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#requestHistory");
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
| **start** | **Integer**| Which row you&#39;d like to start from | [optional] |
| **length** | **Integer**| Max length of all rows | [optional] |
| **search** | **String**| Search query for phone number, order_code, service or country | [optional] |

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
| **401** | Malformed API key |  -  |
| **403** | Error |  -  |

<a id="requestHistorySearch"></a>
# **requestHistorySearch**
> Object requestHistorySearch(search, cursor, limit)

Search order history

One step of a search through your order history, newest orders first. Each call reads a bounded slice of your orders and returns the matches in it plus &#x60;next&#x60;. Pass &#x60;next&#x60; back as &#x60;cursor&#x60; to continue; the search is complete when &#x60;next&#x60; is &#x60;null&#x60;. A call can return no matches and still have a &#x60;next&#x60;.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    String search = "search_example"; // String | The search term, as typed into the order history's search box. At most 32 characters.
    String cursor = "cursor_example"; // String | `next` from the previous call. Leave out for the first call.
    Integer limit = 56; // Integer | Matches per call, 1 to 500 (default 100).
    try {
      Object result = apiInstance.requestHistorySearch(search, cursor, limit);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#requestHistorySearch");
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
| **search** | **String**| The search term, as typed into the order history&#39;s search box. At most 32 characters. | |
| **cursor** | **String**| &#x60;next&#x60; from the previous call. Leave out for the first call. | [optional] |
| **limit** | **Integer**| Matches per call, 1 to 500 (default 100). | [optional] |

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
| **401** | Malformed API key |  -  |
| **403** | Unknown or revoked API key |  -  |
| **422** | Error |  -  |

<a id="smsActivate"></a>
# **smsActivate**
> Object smsActivate(orderid)

Activate SMS

This endpoint will forcefully activate an SMS to set it available for future resends, please keep in mind that these orders are NOT eligible for a refund after activating them.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    String orderid = "orderid_example"; // String | 
    try {
      Object result = apiInstance.smsActivate(orderid);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#smsActivate");
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
| **orderid** | **String**|  | |

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
| **404** | Error |  -  |

<a id="smsAllStock"></a>
# **smsAllStock**
> Object smsAllStock(country, service, pool)

One-time stock for all services

Retrieves the one-time SMS stock for every country, service and pool, optionally filtered by &#x60;country&#x60;, &#x60;service&#x60; and &#x60;pool&#x60;. The API key is optional.  The unfiltered list is large and rebuilt once a minute. It is sent with &#x60;ETag&#x60;, &#x60;Last-Modified&#x60; and &#x60;Cache-Control&#x60; headers: send &#x60;If-None-Match&#x60; (or &#x60;If-Modified-Since&#x60;) with your next request and you get &#x60;304 Not Modified&#x60; with no body while the list has not changed.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    SmsApi apiInstance = new SmsApi(defaultClient);
    String country = "country_example"; // String | Country retrieved from ''Country list\\\" endpoint (optional)
    String service = "service_example"; // String | Service retrieved from ''Service list\\\" endpoint (optional)
    String pool = "pool_example"; // String | Pool retrieved from ''Pool list\\\" endpoint (optional)
    try {
      Object result = apiInstance.smsAllStock(country, service, pool);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#smsAllStock");
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
| **country** | **String**| Country retrieved from &#39;&#39;Country list\\\&quot; endpoint (optional) | [optional] |
| **service** | **String**| Service retrieved from &#39;&#39;Service list\\\&quot; endpoint (optional) | [optional] |
| **pool** | **String**| Pool retrieved from &#39;&#39;Pool list\\\&quot; endpoint (optional) | [optional] |

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

<a id="smsArchive"></a>
# **smsArchive**
> Object smsArchive(orderid)

Archive one order

Removes one finished order from your active orders. Nothing is refunded and the order stays in your history; &#x60;/sms/unarchive&#x60; brings it back. An order that is still waiting for an SMS cannot be archived: cancel it with &#x60;/sms/cancel&#x60; instead.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    String orderid = "orderid_example"; // String | The order code from the `Order SMS` endpoint.
    try {
      Object result = apiInstance.smsArchive(orderid);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#smsArchive");
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
| **orderid** | **String**| The order code from the &#x60;Order SMS&#x60; endpoint. | |

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
| **401** | Malformed API key |  -  |
| **403** | Unknown or revoked API key |  -  |

<a id="smsCancel"></a>
# **smsCancel**
> Object smsCancel(orderid, orderids, expiry, ban)

Cancel SMS

Cancels an order. An order that has not received a code is cancelled and refunded. An order that already has its code cannot be refunded; it is only archived (removed from your active orders).  Both answer &#x60;success: 1&#x60;; &#x60;action&#x60; tells them apart: &#x60;refunded&#x60; or &#x60;archived&#x60;.  Send &#x60;orderids&#x60; (comma-separated) to cancel several orders at once; the response then lists one result per order under &#x60;results&#x60;.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    String orderid = "orderid_example"; // String | 
    String orderids = "orderids_example"; // String | 
    Integer expiry = 56; // Integer | 
    Integer ban = 56; // Integer | 
    try {
      Object result = apiInstance.smsCancel(orderid, orderids, expiry, ban);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#smsCancel");
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
| **orderid** | **String**|  | [optional] |
| **orderids** | **String**|  | [optional] |
| **expiry** | **Integer**|  | [optional] |
| **ban** | **Integer**|  | [optional] |

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
| **404** | Error |  -  |

<a id="smsCancelAll"></a>
# **smsCancelAll**
> Object smsCancelAll()

Cancel All SMS

# Cancel your SMS order  ## Responses  | **Success** | {\&quot;success\&quot;:1} | | **Fail** | {\&quot;success\&quot;:0} |

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    try {
      Object result = apiInstance.smsCancelAll();
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#smsCancelAll");
      System.err.println("Status code: " + e.getCode());
      System.err.println("Reason: " + e.getResponseBody());
      System.err.println("Response headers: " + e.getResponseHeaders());
      e.printStackTrace();
    }
  }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**Object**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |
| **401** | Malformed API key |  -  |
| **403** | Unknown or revoked API key |  -  |

<a id="smsCheck"></a>
# **smsCheck**
> Object smsCheck(orderid)

Check SMS

You may run into ratelimits while using this endpoint for high rate requests, we recommend using /request/active instead as it will list all your orders at the same time.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    String orderid = "orderid_example"; // String | 
    try {
      Object result = apiInstance.smsCheck(orderid);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#smsCheck");
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
| **orderid** | **String**|  | |

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
| **401** | Malformed API key |  -  |
| **403** | Unknown or revoked API key |  -  |

<a id="smsCheckResend"></a>
# **smsCheckResend**
> Object smsCheckResend(orderid)

Check Resend

Check if the order can be resent or not.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    String orderid = "orderid_example"; // String | 
    try {
      Object result = apiInstance.smsCheckResend(orderid);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#smsCheckResend");
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
| **orderid** | **String**|  | |

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
| **404** | Error |  -  |

<a id="smsClearCache"></a>
# **smsClearCache**
> Object smsClearCache()

Clear SMS Cache

# Clear your previous SMS cache to allocate previous numbers again  ## Responses  | **Success** | {\&quot;success\&quot;:1} |   | **Fail** | {\&quot;success\&quot;:0} |

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    try {
      Object result = apiInstance.smsClearCache();
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#smsClearCache");
      System.err.println("Status code: " + e.getCode());
      System.err.println("Reason: " + e.getResponseBody());
      System.err.println("Response headers: " + e.getResponseHeaders());
      e.printStackTrace();
    }
  }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**Object**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |
| **401** | Malformed API key |  -  |
| **403** | Unknown or revoked API key |  -  |

<a id="smsMissed"></a>
# **smsMissed**
> Object smsMissed(phonenumber, limit)

Missed SMS

Some messages arrive on a number from your one-time orders but cannot finish the order, such as Ticketmaster and Seated codes, Hark reward payouts or Neon Money Talks messages. This returns those messages, the same ones the Missed SMS tool on the website shows. Only numbers from pool Foxtrot are covered.  The newest messages come first. &#x60;url&#x60;, &#x60;code&#x60; and &#x60;email&#x60; hold the first link, code and email address found in the message, or an empty string.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    Integer phonenumber = 56; // Integer | Only return messages for this number, including the country code. Leave it out for all your numbers.
    Integer limit = 56; // Integer | Maximum number of messages. Defaults to 100, at most 500.
    try {
      Object result = apiInstance.smsMissed(phonenumber, limit);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#smsMissed");
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
| **phonenumber** | **Integer**| Only return messages for this number, including the country code. Leave it out for all your numbers. | [optional] |
| **limit** | **Integer**| Maximum number of messages. Defaults to 100, at most 500. | [optional] |

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
| **401** | Malformed API key |  -  |
| **403** | Unknown or revoked API key |  -  |

<a id="smsReactivate"></a>
# **smsReactivate**
> Object smsReactivate(orderid)

Reactivate SMS

This endpoint will reactivate an order, please keep in mind that these orders are NOT eligible for a refund after activating them.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    String orderid = "orderid_example"; // String | 
    try {
      Object result = apiInstance.smsReactivate(orderid);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#smsReactivate");
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
| **orderid** | **String**|  | |

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
| **401** | Malformed API key |  -  |
| **403** | Unknown or revoked API key |  -  |

<a id="smsResend"></a>
# **smsResend**
> Object smsResend(orderid)

Resend

# Resend  Resend the order. Keep in mind that some pools will have a charge per resend. You can see whether the resend will have a charge using the \&quot;Check Resend\&quot; endpoint  ## Responses  | **Success** | {\&quot;success\&quot;:1,\&quot;message\&quot;:\&quot;Number has been requested again\&quot;,\&quot;resend\&quot;:0} |   | **Fail** | {\&quot;success\&quot;:0,\&quot;message\&quot;:\&quot;Phonenumber could not be requested again, try later again.\&quot;,\&quot;resend\&quot;:0} |

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    String orderid = "orderid_example"; // String | 
    try {
      Object result = apiInstance.smsResend(orderid);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#smsResend");
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
| **orderid** | **String**|  | |

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
| **404** | Error |  -  |

<a id="smsStock"></a>
# **smsStock**
> Object smsStock(country, service, pool, includePrice)

One-time SMS stock

Retrieves the one-time SMS stock for a country and service, optionally for one pool.  ### Request Parameters  The API key is optional. Without it the request is limited to 20 calls a minute per IP address; with it the limit is 200 a minute.  ### Response  - &#x60;success&#x60; (integer): 1 when the stock could be read, 0 otherwise. - &#x60;amount&#x60; (integer): the numbers in stock.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    SmsApi apiInstance = new SmsApi(defaultClient);
    String country = "country_example"; // String | Country retrieved from ''Country list\\\" endpoint
    String service = "service_example"; // String | Service retrieved from ''Service list\\\" endpoint
    String pool = "pool_example"; // String | Pool retrieved from ''Pool list\\\" endpoint
    Integer includePrice = 56; // Integer | 
    try {
      Object result = apiInstance.smsStock(country, service, pool, includePrice);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#smsStock");
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
| **country** | **String**| Country retrieved from &#39;&#39;Country list\\\&quot; endpoint | |
| **service** | **String**| Service retrieved from &#39;&#39;Service list\\\&quot; endpoint | |
| **pool** | **String**| Pool retrieved from &#39;&#39;Pool list\\\&quot; endpoint | [optional] |
| **includePrice** | **Integer**|  | [optional] |

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

<a id="smsUnarchive"></a>
# **smsUnarchive**
> Object smsUnarchive(orderid)

Unarchive order

Move an archived order back to your active orders, so it shows up in **Active orders** and on your dashboard again. Use **Archive all orders** to archive them.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    SmsApi apiInstance = new SmsApi(defaultClient);
    String orderid = "orderid_example"; // String | The order ID retrieved from /purchase/sms
    try {
      Object result = apiInstance.smsUnarchive(orderid);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling SmsApi#smsUnarchive");
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
| **orderid** | **String**| The order ID retrieved from /purchase/sms | |

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
| **401** | Malformed API key |  -  |
| **403** | Unknown or revoked API key |  -  |

