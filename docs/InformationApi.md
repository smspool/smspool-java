# InformationApi

All URIs are relative to *https://api.smspool.net*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**countryRetrieveAll**](InformationApi.md#countryRetrieveAll) | **GET** /country/retrieve_all | Country list |
| [**poolRetrieveAll**](InformationApi.md#poolRetrieveAll) | **POST** /pool/retrieve_all | Pool list |
| [**poolRetrieveValid**](InformationApi.md#poolRetrieveValid) | **POST** /pool/retrieve_valid | Suggested Pools |
| [**requestAutoCountry**](InformationApi.md#requestAutoCountry) | **POST** /request/auto_country | Pick the best country for a service |
| [**requestBalance**](InformationApi.md#requestBalance) | **POST** /request/balance | Balance |
| [**requestSuccessRate**](InformationApi.md#requestSuccessRate) | **POST** /request/success_rate | Retrieve country success rates per service |
| [**requestSuggestedCountries**](InformationApi.md#requestSuggestedCountries) | **POST** /request/suggested_countries | Suggested Countries |
| [**serviceRetrieveAll**](InformationApi.md#serviceRetrieveAll) | **GET** /service/retrieve_all | Service list |


<a id="countryRetrieveAll"></a>
# **countryRetrieveAll**
> Object countryRetrieveAll(showAll)

Country list

This API endpoint is used to retrieve the full country list for SMSPool requests. It sends an HTTP GET request to the URL &#x60;https://api.smspool.net/country/retrieve_all&#x60;.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.InformationApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    InformationApi apiInstance = new InformationApi(defaultClient);
    String showAll = "showAll_example"; // String | 
    try {
      Object result = apiInstance.countryRetrieveAll(showAll);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling InformationApi#countryRetrieveAll");
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
| **showAll** | **String**|  | [optional] |

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

<a id="poolRetrieveAll"></a>
# **poolRetrieveAll**
> Object poolRetrieveAll()

Pool list

This API endpoint is used to retrieve a list of our active pools for SMSPool requests. It sends an HTTP POST request to the URL &#x60;https://api.smspool.net/pool/retrieve_all&#x60;.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.InformationApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    InformationApi apiInstance = new InformationApi(defaultClient);
    try {
      Object result = apiInstance.poolRetrieveAll();
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling InformationApi#poolRetrieveAll");
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

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

<a id="poolRetrieveValid"></a>
# **poolRetrieveValid**
> Object poolRetrieveValid(service, country, web, includeStock)

Suggested Pools

This API endpoint is used to retrieve suggested pools for SMSPool requests. It sends an HTTP POST request to the URL &#x60;https://api.smspool.net/pool/retrieve_valid&#x60;.  Please use either the service ID, or the service name as service param.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.InformationApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    InformationApi apiInstance = new InformationApi(defaultClient);
    String service = "service_example"; // String | Service retrieved from ''Service list\\\" endpoint
    String country = "country_example"; // String | Country retrieved from ''Country list\\\" endpoint
    String web = "web_example"; // String | Return array format
    String includeStock = "includeStock_example"; // String | 
    try {
      Object result = apiInstance.poolRetrieveValid(service, country, web, includeStock);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling InformationApi#poolRetrieveValid");
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
| **service** | **String**| Service retrieved from &#39;&#39;Service list\\\&quot; endpoint | |
| **country** | **String**| Country retrieved from &#39;&#39;Country list\\\&quot; endpoint | |
| **web** | **String**| Return array format | [optional] |
| **includeStock** | **String**|  | [optional] |

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
| **400** | Error |  -  |

<a id="requestAutoCountry"></a>
# **requestAutoCountry**
> Object requestAutoCountry(service, pricingOption)

Pick the best country for a service

Returns the country SMSPool would order from for this service when you do not want to choose one (the quick order&#39;s \&quot;Pick for me\&quot;). It sends an HTTP POST request to the URL &#x60;https://api.smspool.net/request/auto_country&#x60;.  Every country with stock is scored on its expected success rate, weighed down when little stock backs it, minus a little per dollar, plus a bonus when it matches the country your request&#39;s IP resolves to (a local number verifies more often). The IP country is only used for that comparison; it is neither stored nor returned. Ties go to more stock, then the lower price. With &#x60;pricing_option&#x3D;1&#x60; the cheapest country within reach of the best score wins instead.  &#x60;success_rate&#x60; is that expected rate. Where the service has at least 20 recent orders in the country it is the measured rate and &#x60;rate_measured&#x60; is true. With fewer, it is an estimate that blends those orders (&#x60;rate_orders&#x60; of them) with how the country does across all services and how the service does elsewhere, and &#x60;rate_measured&#x60; is false.  Send &#x60;auto_country&#x3D;1&#x60; to &#x60;/purchase/sms&#x60; to order with the same choice in one call.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.InformationApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    InformationApi apiInstance = new InformationApi(defaultClient);
    String service = "service_example"; // String | Service name or service ID which can be retrieved at the /service/retrieve_all endpoint
    Integer pricingOption = 56; // Integer | Set to 1 to prefer the cheapest country among those close to the best score; 0 (default) picks purely on the score.
    try {
      Object result = apiInstance.requestAutoCountry(service, pricingOption);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling InformationApi#requestAutoCountry");
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
| **service** | **String**| Service name or service ID which can be retrieved at the /service/retrieve_all endpoint | |
| **pricingOption** | **Integer**| Set to 1 to prefer the cheapest country among those close to the best score; 0 (default) picks purely on the score. | [optional] |

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
| **400** | Error |  -  |

<a id="requestBalance"></a>
# **requestBalance**
> Object requestBalance()

Balance

Retrieves your account balance in USD.  ### Request Parameters  Only your API key, sent as a bearer token.  ### Response  A JSON object with a &#x60;balance&#x60; field: the balance as a string with two decimals, for example &#x60;\&quot;5.00\&quot;&#x60;.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.InformationApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    InformationApi apiInstance = new InformationApi(defaultClient);
    try {
      Object result = apiInstance.requestBalance();
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling InformationApi#requestBalance");
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
| **400** | Error |  -  |
| **401** | Malformed API key |  -  |
| **403** | Error |  -  |

<a id="requestSuccessRate"></a>
# **requestSuccessRate**
> Object requestSuccessRate(service, country)

Retrieve country success rates per service

This API endpoint is used to retrieve success per country for SMSPool requests. It sends an HTTP POST request to the URL &#x60;https://api.smspool.net/request/success_rate&#x60;.  Please use either the service ID, or the service name as service param.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.InformationApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    InformationApi apiInstance = new InformationApi(defaultClient);
    String service = "service_example"; // String | Service name or service ID which can be retrieved at the /service/retrieve_all endpoint
    String country = "country_example"; // String | Country name or country ID which can be retrieved at the /country/retrieve_all endpoint
    try {
      Object result = apiInstance.requestSuccessRate(service, country);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling InformationApi#requestSuccessRate");
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
| **service** | **String**| Service name or service ID which can be retrieved at the /service/retrieve_all endpoint | |
| **country** | **String**| Country name or country ID which can be retrieved at the /country/retrieve_all endpoint | [optional] |

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
| **400** | Error |  -  |

<a id="requestSuggestedCountries"></a>
# **requestSuggestedCountries**
> Object requestSuggestedCountries(service)

Suggested Countries

This API endpoint is used to retrieve suggested countries for SMS pool requests. It sends an HTTP POST request to the URL &#x60;https://api.smspool.net/request/suggested_countries&#x60;.  Please use either the service ID, or the service name as service param.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.InformationApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    InformationApi apiInstance = new InformationApi(defaultClient);
    String service = "service_example"; // String | Service name or service ID which can be retrieved at the /service/retrieve_all endpoint
    try {
      Object result = apiInstance.requestSuggestedCountries(service);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling InformationApi#requestSuggestedCountries");
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
| **service** | **String**| Service name or service ID which can be retrieved at the /service/retrieve_all endpoint | |

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
| **400** | Error |  -  |

<a id="serviceRetrieveAll"></a>
# **serviceRetrieveAll**
> Object serviceRetrieveAll(country)

Service list

This API endpoint is used to retrieve the full service list for SMSPool requests. It sends an HTTP GET request to the URL &#x60;https://api.smspool.net/service/retrieve_all&#x60;.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.InformationApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    InformationApi apiInstance = new InformationApi(defaultClient);
    String country = "1"; // String | 
    try {
      Object result = apiInstance.serviceRetrieveAll(country);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling InformationApi#serviceRetrieveAll");
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
| **country** | **String**|  | [optional] |

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | OK |  -  |

