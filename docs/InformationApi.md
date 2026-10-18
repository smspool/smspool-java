# InformationApi

All URIs are relative to *https://api.smspool.net*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**countryRetrieveAll**](InformationApi.md#countryRetrieveAll) | **GET** /country/retrieve_all | Country list |
| [**poolRetrieveAll**](InformationApi.md#poolRetrieveAll) | **POST** /pool/retrieve_all | Pool list |
| [**poolRetrieveValid**](InformationApi.md#poolRetrieveValid) | **POST** /pool/retrieve_valid | Suggested Pools |
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

<a id="requestBalance"></a>
# **requestBalance**
> Object requestBalance()

Balance

This HTTP POST request is used to retrieve the balance for a specific SMSPool. The request is sent to the URL &#x60;https://api.smspool.net/request/balance&#x60;.  ### Request Parameters  This request require the \\&#x60;key\\&#x60; param which is your API key  ### Response  The response to this request will have a status code of 200 if the request is successful. The response body will be in JSON format and will include a &#x60;balance&#x60; field. However, the last execution of this request returned an empty string for the &#x60;balance&#x60; field.  Please note that the actual value of the &#x60;balance&#x60; field may vary depending on the user and its configuration.

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

