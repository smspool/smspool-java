# PricingApi

All URIs are relative to *https://api.smspool.net*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**requestPrice**](PricingApi.md#requestPrice) | **POST** /request/price | Retrieve specific price &amp; Success Rate |
| [**requestPricing**](PricingApi.md#requestPricing) | **POST** /request/pricing | Retrieve all pricing |


<a id="requestPrice"></a>
# **requestPrice**
> Object requestPrice(country, service, pool, skipSuccessRate)

Retrieve specific price &amp; Success Rate

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.PricingApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    PricingApi apiInstance = new PricingApi(defaultClient);
    String country = "country_example"; // String | Country retrieved from ''Country list\\\" endpoint
    String service = "service_example"; // String | Service retrieved from ''Service list\\\" endpoint
    String pool = "pool_example"; // String | Pool retrieved from ''Pool list\\\" endpoint
    String skipSuccessRate = "skipSuccessRate_example"; // String | 
    try {
      Object result = apiInstance.requestPrice(country, service, pool, skipSuccessRate);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling PricingApi#requestPrice");
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
| **skipSuccessRate** | **String**|  | [optional] |

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

<a id="requestPricing"></a>
# **requestPricing**
> Object requestPricing(country, service, pool, maxPrice)

Retrieve all pricing

Retrieves prices, optionally filtered by country, service, pool and maximum price (&#x60;max_price&#x60; is rounded to two decimals).  Without any filter the response is the full catalog (about 20 MB), rebuilt once an hour. It is sent with &#x60;ETag&#x60;, &#x60;Last-Modified&#x60; and &#x60;Cache-Control&#x60; headers: send &#x60;If-None-Match&#x60; (or &#x60;If-Modified-Since&#x60;) with your next request and you get &#x60;304 Not Modified&#x60; with no body while the catalog has not changed.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.PricingApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    PricingApi apiInstance = new PricingApi(defaultClient);
    String country = "country_example"; // String | Optional parameter to request services per country
    String service = "service_example"; // String | Service name or service ID which can be retrieved at the /service/retrieve_all endpoint
    String pool = "pool_example"; // String | 
    BigDecimal maxPrice = new BigDecimal(78); // BigDecimal | 
    try {
      Object result = apiInstance.requestPricing(country, service, pool, maxPrice);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling PricingApi#requestPricing");
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
| **country** | **String**| Optional parameter to request services per country | [optional] |
| **service** | **String**| Service name or service ID which can be retrieved at the /service/retrieve_all endpoint | [optional] |
| **pool** | **String**|  | [optional] |
| **maxPrice** | **BigDecimal**|  | [optional] |

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

