# SmsApi

All URIs are relative to *https://api.smspool.net*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**purchaseSms**](SmsApi.md#purchaseSms) | **POST** /purchase/sms | Order SMS |
| [**requestActive**](SmsApi.md#requestActive) | **POST** /request/active | Active orders |
| [**requestArchive**](SmsApi.md#requestArchive) | **POST** /request/archive | Archive all orders |
| [**requestAreacodes**](SmsApi.md#requestAreacodes) | **POST** /request/areacodes | Request available areacodes |
| [**requestHistory**](SmsApi.md#requestHistory) | **POST** /request/history | Order History |
| [**smsActivate**](SmsApi.md#smsActivate) | **POST** /sms/activate | Activate SMS |
| [**smsAllStock**](SmsApi.md#smsAllStock) | **POST** /sms/all_stock | One-time stock for all services |
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
> Object purchaseSms(service, country, pool, maxPrice, pricingOption, quantity, areacode, exclude, createToken, activationType, carrier, phonenumber, software)

Order SMS

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
    BigDecimal maxPrice = new BigDecimal(78); // BigDecimal | The max price you are willing to pay per number
    Integer pricingOption = 56; // Integer | Set to 0 if you'd like the cheapest numbers, set to 1 for highest success rate
    Integer quantity = 56; // Integer | Quantity of numbers ordered
    String areacode = "areacode_example"; // String | Areacodes you would like to include or exclude in JSON format
    Integer exclude = 56; // Integer | Set exclude to 1 if you would like to exclude all listed area codes.
    Integer createToken = 56; // Integer | Optional param; set to 1 if you'd like to create a token link that anyone can access.
    String activationType = "activationType_example"; // String | Options: SMS, VOICE, FLASH. SMS will receive regular SMS, VOICE will receive phone calls that mentions the SMS and FLASH is for FLASH calls for verification.
    Integer carrier = 56; // Integer | Options: 1 or 2. Pick a carrier (only works for pool Foxtrot US)
    Integer phonenumber = 56; // Integer | In case you want to select a specific phone number to order
    Integer software = 56; // Integer | 
    try {
      Object result = apiInstance.purchaseSms(service, country, pool, maxPrice, pricingOption, quantity, areacode, exclude, createToken, activationType, carrier, phonenumber, software);
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
| **country** | **String**| The country in ISO format or number retrieved from the &#x60;Country List&#x60; endpoint | [optional] |
| **pool** | **String**| The pool or number retrieved from the &#x60;Pool List&#x60; endpoint (optional) | [optional] |
| **maxPrice** | **BigDecimal**| The max price you are willing to pay per number | [optional] |
| **pricingOption** | **Integer**| Set to 0 if you&#39;d like the cheapest numbers, set to 1 for highest success rate | [optional] |
| **quantity** | **Integer**| Quantity of numbers ordered | [optional] |
| **areacode** | **String**| Areacodes you would like to include or exclude in JSON format | [optional] |
| **exclude** | **Integer**| Set exclude to 1 if you would like to exclude all listed area codes. | [optional] |
| **createToken** | **Integer**| Optional param; set to 1 if you&#39;d like to create a token link that anyone can access. | [optional] |
| **activationType** | **String**| Options: SMS, VOICE, FLASH. SMS will receive regular SMS, VOICE will receive phone calls that mentions the SMS and FLASH is for FLASH calls for verification. | [optional] |
| **carrier** | **Integer**| Options: 1 or 2. Pick a carrier (only works for pool Foxtrot US) | [optional] |
| **phonenumber** | **Integer**| In case you want to select a specific phone number to order | [optional] |
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
| **401** | Malformed API key |  -  |
| **403** | Unknown or revoked API key |  -  |
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
import io.github.smspool.models.*;
import io.github.smspool.api.SmsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

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

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | JSON response |  -  |

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

This API endpoint is used to retrieve one-time SMS stock in the SMSPool system. The HTTP POST request should be sent to &#x60;https://api.smspool.net/sms/stock&#x60;.  ### Request Parameters  The \\&#x60;key\\&#x60; parameter is required for this endpoint, this is your API key.  ### Response  The response for this API endpoint will have a status code of 200, indicating a successful request. The response body will be in JSON format and will contain the following properties:  - &#x60;success&#x60; (integer): A flag indicating the success of the request. A value of 0 indicates failure.      - &#x60;message&#x60; (string): An optional message providing additional information about the request. In this case, the message is empty.       Please note that the response may contain additional properties not mentioned here, but they can be ignored for the purpose of this documentation.

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

<a id="smsCancel"></a>
# **smsCancel**
> Object smsCancel(orderid, orderids, expiry, ban)

Cancel SMS

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

Some messages arrive on a number from your one-time orders but cannot finish the order, such as Ticketmaster and Seated codes or Hark reward payouts. This returns those messages, the same ones the Missed SMS tool on the website shows. Only numbers from pool Foxtrot are covered.  The newest messages come first. &#x60;url&#x60;, &#x60;code&#x60; and &#x60;email&#x60; hold the first link, code and email address found in the message, or an empty string.

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

This API endpoint is used to retrieve one-time SMS stock in the SMSPool system. The HTTP POST request should be sent to &#x60;https://api.smspool.net/sms/stock&#x60;.  ### Request Parameters  The \\&#x60;key\\&#x60; parameter is required for this endpoint, this is your API key.  ### Response  The response for this API endpoint will have a status code of 200, indicating a successful request. The response body will be in JSON format and will contain the following properties:  - &#x60;success&#x60; (integer): A flag indicating the success of the request. A value of 0 indicates failure.      - &#x60;message&#x60; (string): An optional message providing additional information about the request. In this case, the message is empty.       Please note that the response may contain additional properties not mentioned here, but they can be ignored for the purpose of this documentation.

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

