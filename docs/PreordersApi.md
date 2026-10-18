# PreordersApi

All URIs are relative to *https://api.smspool.net*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**preorderCancel**](PreordersApi.md#preorderCancel) | **POST** /preorder/cancel | Cancel |
| [**preorderCheck**](PreordersApi.md#preorderCheck) | **POST** /preorder/check | Check |
| [**preorderCreate**](PreordersApi.md#preorderCreate) | **POST** /preorder/create | Create |
| [**preorderPrice**](PreordersApi.md#preorderPrice) | **POST** /preorder/price | Price |
| [**preorderRetrieve**](PreordersApi.md#preorderRetrieve) | **POST** /preorder/retrieve | Retrieve |


<a id="preorderCancel"></a>
# **preorderCancel**
> Object preorderCancel(orderid)

Cancel

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.PreordersApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    PreordersApi apiInstance = new PreordersApi(defaultClient);
    String orderid = "orderid_example"; // String | 
    try {
      Object result = apiInstance.preorderCancel(orderid);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling PreordersApi#preorderCancel");
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

<a id="preorderCheck"></a>
# **preorderCheck**
> Object preorderCheck(orderid)

Check

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.PreordersApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    PreordersApi apiInstance = new PreordersApi(defaultClient);
    String orderid = "orderid_example"; // String | 
    try {
      Object result = apiInstance.preorderCheck(orderid);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling PreordersApi#preorderCheck");
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
| **404** | Error |  -  |

<a id="preorderCreate"></a>
# **preorderCreate**
> Object preorderCreate(service, country, pool, maxPrice, areacode)

Create

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.PreordersApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    PreordersApi apiInstance = new PreordersApi(defaultClient);
    String service = "service_example"; // String | Service name or service ID which can be retrieved at the /service/retrieve_all endpoint
    String country = "country_example"; // String | Country name or country ID which can be retrieved at the /country/retrieve_all endpoint
    String pool = "pool_example"; // String | 
    BigDecimal maxPrice = new BigDecimal(78); // BigDecimal | 
    String areacode = "areacode_example"; // String | 
    try {
      Object result = apiInstance.preorderCreate(service, country, pool, maxPrice, areacode);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling PreordersApi#preorderCreate");
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
| **country** | **String**| Country name or country ID which can be retrieved at the /country/retrieve_all endpoint | |
| **pool** | **String**|  | |
| **maxPrice** | **BigDecimal**|  | |
| **areacode** | **String**|  | [optional] |

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

<a id="preorderPrice"></a>
# **preorderPrice**
> Object preorderPrice(service, country, pool)

Price

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.PreordersApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    PreordersApi apiInstance = new PreordersApi(defaultClient);
    String service = "service_example"; // String | Service name or service ID which can be retrieved at the /service/retrieve_all endpoint
    String country = "country_example"; // String | Country name or country ID which can be retrieved at the /country/retrieve_all endpoint
    String pool = "pool_example"; // String | 
    try {
      Object result = apiInstance.preorderPrice(service, country, pool);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling PreordersApi#preorderPrice");
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
| **country** | **String**| Country name or country ID which can be retrieved at the /country/retrieve_all endpoint | |
| **pool** | **String**|  | |

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

<a id="preorderRetrieve"></a>
# **preorderRetrieve**
> Object preorderRetrieve()

Retrieve

This API endpoint allows you to retrieve preorders from the SMS Pool system. It is an HTTP POST request sent to the URL &#x60;https://api.smspool.net/preorder/retrieve&#x60;.  ### Request Parameters  This endpoint requires the \\&#x60;key\\&#x60; parameter which is your API key.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.PreordersApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    PreordersApi apiInstance = new PreordersApi(defaultClient);
    try {
      Object result = apiInstance.preorderRetrieve();
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling PreordersApi#preorderRetrieve");
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
| **403** | Error |  -  |

