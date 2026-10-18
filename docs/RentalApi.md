# RentalApi

All URIs are relative to *https://api.smspool.net*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**purchaseRental**](RentalApi.md#purchaseRental) | **POST** /purchase/rental | Order Rental |
| [**rentalAutoExtend**](RentalApi.md#rentalAutoExtend) | **POST** /rental/auto_extend | Enable Auto Extend Rental |
| [**rentalExtend**](RentalApi.md#rentalExtend) | **POST** /rental/extend | Extend Rental |
| [**rentalHistory**](RentalApi.md#rentalHistory) | **POST** /rental/history | Rental History |
| [**rentalInfo**](RentalApi.md#rentalInfo) | **POST** /rental/info | Retrieve Rental Info |
| [**rentalRefund**](RentalApi.md#rentalRefund) | **POST** /rental/refund | Refund Rental |
| [**rentalReset**](RentalApi.md#rentalReset) | **POST** /rental/reset | Reset Rental |
| [**rentalRetrieve**](RentalApi.md#rentalRetrieve) | **POST** /rental/retrieve | Retrieve Active Rentals |
| [**rentalRetrieveAll**](RentalApi.md#rentalRetrieveAll) | **POST** /rental/retrieve_all | Retrieve Rental IDs |
| [**rentalRetrieveHistory**](RentalApi.md#rentalRetrieveHistory) | **POST** /rental/retrieve_history | Retrieve your rentals |
| [**rentalRetrieveMessages**](RentalApi.md#rentalRetrieveMessages) | **POST** /rental/retrieve_messages | Retrieve Rental Messages |
| [**rentalRetrievePricing**](RentalApi.md#rentalRetrievePricing) | **POST** /rental/retrieve_pricing | Retrieve Rental Pricing |
| [**rentalRetrieveServices**](RentalApi.md#rentalRetrieveServices) | **POST** /rental/retrieve_services | Retrieve Rental Services |
| [**rentalRetrieveStatus**](RentalApi.md#rentalRetrieveStatus) | **POST** /rental/retrieve_status | Retrieve Rental Status |
| [**rentalServicePrice**](RentalApi.md#rentalServicePrice) | **POST** /rental/service_price | Retrieve rental service price |
| [**rentalStock**](RentalApi.md#rentalStock) | **POST** /rental/stock | Retrieve Rental Stock |


<a id="purchaseRental"></a>
# **purchaseRental**
> Object purchaseRental(id, days, serviceId, createToken, city, state, zipcode)

Order Rental

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    RentalApi apiInstance = new RentalApi(defaultClient);
    Integer id = 56; // Integer | Rental ID retrieved from Retrieve Rental IDs
    Integer days = 56; // Integer | 
    Integer serviceId = 56; // Integer | Optional value on which service you'd purchase the rental for
    Integer createToken = 56; // Integer | Create a rental token which allows you to share this specific rental
    String city = "city_example"; // String | 
    String state = "state_example"; // String | 
    String zipcode = "zipcode_example"; // String | 
    try {
      Object result = apiInstance.purchaseRental(id, days, serviceId, createToken, city, state, zipcode);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#purchaseRental");
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
| **id** | **Integer**| Rental ID retrieved from Retrieve Rental IDs | |
| **days** | **Integer**|  | |
| **serviceId** | **Integer**| Optional value on which service you&#39;d purchase the rental for | [optional] |
| **createToken** | **Integer**| Create a rental token which allows you to share this specific rental | [optional] |
| **city** | **String**|  | [optional] |
| **state** | **String**|  | [optional] |
| **zipcode** | **String**|  | [optional] |

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

<a id="rentalAutoExtend"></a>
# **rentalAutoExtend**
> Object rentalAutoExtend(rentalCode)

Enable Auto Extend Rental

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    RentalApi apiInstance = new RentalApi(defaultClient);
    String rentalCode = "rentalCode_example"; // String | The retrieved rental code from the `Order rental` endpoint.
    try {
      Object result = apiInstance.rentalAutoExtend(rentalCode);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalAutoExtend");
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
| **rentalCode** | **String**| The retrieved rental code from the &#x60;Order rental&#x60; endpoint. | |

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

<a id="rentalExtend"></a>
# **rentalExtend**
> Object rentalExtend(days, rentalCode)

Extend Rental

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    RentalApi apiInstance = new RentalApi(defaultClient);
    Integer days = 56; // Integer | 
    String rentalCode = "rentalCode_example"; // String | The retrieved rental code from the `Order rental` endpoint.
    try {
      Object result = apiInstance.rentalExtend(days, rentalCode);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalExtend");
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
| **days** | **Integer**|  | |
| **rentalCode** | **String**| The retrieved rental code from the &#x60;Order rental&#x60; endpoint. | |

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

<a id="rentalHistory"></a>
# **rentalHistory**
> Object rentalHistory()

Rental History

Retrieve a history of all your rental actions.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    RentalApi apiInstance = new RentalApi(defaultClient);
    try {
      Object result = apiInstance.rentalHistory();
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalHistory");
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

<a id="rentalInfo"></a>
# **rentalInfo**
> Object rentalInfo(rentalCode)

Retrieve Rental Info

Retrieve rental information

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    RentalApi apiInstance = new RentalApi(defaultClient);
    String rentalCode = "rentalCode_example"; // String | The retrieved rental code from the `Order rental` endpoint.
    try {
      Object result = apiInstance.rentalInfo(rentalCode);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalInfo");
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
| **rentalCode** | **String**| The retrieved rental code from the &#x60;Order rental&#x60; endpoint. | |

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

<a id="rentalRefund"></a>
# **rentalRefund**
> Object rentalRefund(rentalCode)

Refund Rental

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    RentalApi apiInstance = new RentalApi(defaultClient);
    String rentalCode = "rentalCode_example"; // String | The retrieved rental code from the `Order rental` endpoint.
    try {
      Object result = apiInstance.rentalRefund(rentalCode);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalRefund");
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
| **rentalCode** | **String**| The retrieved rental code from the &#x60;Order rental&#x60; endpoint. | |

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

<a id="rentalReset"></a>
# **rentalReset**
> Object rentalReset(rentalCode)

Reset Rental

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    RentalApi apiInstance = new RentalApi(defaultClient);
    String rentalCode = "rentalCode_example"; // String | The retrieved rental code from the `Order rental` endpoint.
    try {
      Object result = apiInstance.rentalReset(rentalCode);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalReset");
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
| **rentalCode** | **String**| The retrieved rental code from the &#x60;Order rental&#x60; endpoint. | |

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

<a id="rentalRetrieve"></a>
# **rentalRetrieve**
> Object rentalRetrieve()

Retrieve Active Rentals

Retrieve a history of all your rental actions.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    RentalApi apiInstance = new RentalApi(defaultClient);
    try {
      Object result = apiInstance.rentalRetrieve();
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalRetrieve");
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

<a id="rentalRetrieveAll"></a>
# **rentalRetrieveAll**
> Object rentalRetrieveAll(type)

Retrieve Rental IDs

Retrieve available rental products. Each listing includes &#x60;is_refundable&#x60; (&#x60;0&#x60; or &#x60;1&#x60;), &#x60;refund_within&#x60; (hours after purchase a refund is allowed; &#x60;0&#x60; when not refundable), and &#x60;refund_min_days&#x60; (minimum duration that is eligible for a refund; &#x60;0&#x60; when there is no duration floor or the rental is never refundable). Refunds also require that no messages have been received.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    RentalApi apiInstance = new RentalApi(defaultClient);
    Integer type = 56; // Integer | Choose whether the rental is extendable or not with a 0 or 1
    try {
      Object result = apiInstance.rentalRetrieveAll(type);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalRetrieveAll");
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
| **type** | **Integer**| Choose whether the rental is extendable or not with a 0 or 1 | |

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
| **404** | Error |  -  |

<a id="rentalRetrieveHistory"></a>
# **rentalRetrieveHistory**
> Object rentalRetrieveHistory()

Retrieve your rentals

List every rental on your account that was not refunded, including expired ones. For the actions taken on your rentals (activations, extensions, refunds) use **Rental History** instead.  - &#x60;rental&#x60;: the rental ID from **Retrieve Rental IDs** - &#x60;rental_code&#x60;: use it with the other rental endpoints, such as **Retrieve Rental Messages** - &#x60;expiration_date&#x60;: Unix timestamp - &#x60;source&#x60;: the pool the number comes from - &#x60;state&#x60;: the US state of the number, or &#x60;Unknown&#x60;

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    RentalApi apiInstance = new RentalApi(defaultClient);
    try {
      Object result = apiInstance.rentalRetrieveHistory();
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalRetrieveHistory");
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

<a id="rentalRetrieveMessages"></a>
# **rentalRetrieveMessages**
> Object rentalRetrieveMessages(rentalCode)

Retrieve Rental Messages

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    RentalApi apiInstance = new RentalApi(defaultClient);
    String rentalCode = "rentalCode_example"; // String | The retrieved rental code from the `Order rental` endpoint.
    try {
      Object result = apiInstance.rentalRetrieveMessages(rentalCode);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalRetrieveMessages");
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
| **rentalCode** | **String**| The retrieved rental code from the &#x60;Order rental&#x60; endpoint. | |

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

<a id="rentalRetrievePricing"></a>
# **rentalRetrievePricing**
> Object rentalRetrievePricing(id, service)

Retrieve Rental Pricing

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    RentalApi apiInstance = new RentalApi(defaultClient);
    Integer id = 56; // Integer | The rental ID retrieved from `Retrieve Rental IDs`
    String service = "service_example"; // String | Service name or service ID which can be retrieved at the /service/retrieve_all endpoint
    try {
      Object result = apiInstance.rentalRetrievePricing(id, service);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalRetrievePricing");
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
| **id** | **Integer**| The rental ID retrieved from &#x60;Retrieve Rental IDs&#x60; | |
| **service** | **String**| Service name or service ID which can be retrieved at the /service/retrieve_all endpoint | [optional] |

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

<a id="rentalRetrieveServices"></a>
# **rentalRetrieveServices**
> Object rentalRetrieveServices(rental)

Retrieve Rental Services

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    RentalApi apiInstance = new RentalApi(defaultClient);
    Integer rental = 56; // Integer | The rental ID retrieved from `Retrieve Rental IDs`
    try {
      Object result = apiInstance.rentalRetrieveServices(rental);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalRetrieveServices");
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
| **rental** | **Integer**| The rental ID retrieved from &#x60;Retrieve Rental IDs&#x60; | [optional] |

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

<a id="rentalRetrieveStatus"></a>
# **rentalRetrieveStatus**
> Object rentalRetrieveStatus(rentalCode)

Retrieve Rental Status

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    RentalApi apiInstance = new RentalApi(defaultClient);
    String rentalCode = "rentalCode_example"; // String | The retrieved rental code from the `Order rental` endpoint.
    try {
      Object result = apiInstance.rentalRetrieveStatus(rentalCode);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalRetrieveStatus");
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
| **rentalCode** | **String**| The retrieved rental code from the &#x60;Order rental&#x60; endpoint. | |

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

<a id="rentalServicePrice"></a>
# **rentalServicePrice**
> Object rentalServicePrice(id, serviceId)

Retrieve rental service price

Some rentals are bound to a single service. This returns the price of a rental for that service, with the custom pricing on your account applied.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    RentalApi apiInstance = new RentalApi(defaultClient);
    Integer id = 56; // Integer | The rental ID retrieved from `Retrieve Rental IDs`
    Integer serviceId = 56; // Integer | The service ID retrieved from `Retrieve Rental Services`
    try {
      Object result = apiInstance.rentalServicePrice(id, serviceId);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalServicePrice");
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
| **id** | **Integer**| The rental ID retrieved from &#x60;Retrieve Rental IDs&#x60; | |
| **serviceId** | **Integer**| The service ID retrieved from &#x60;Retrieve Rental Services&#x60; | |

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

<a id="rentalStock"></a>
# **rentalStock**
> Object rentalStock(id, days, serviceId)

Retrieve Rental Stock

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.RentalApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    RentalApi apiInstance = new RentalApi(defaultClient);
    Integer id = 56; // Integer | The rental ID retrieved from `Retrieve Rental IDs`
    Integer days = 56; // Integer | 
    Integer serviceId = 56; // Integer | 
    try {
      Object result = apiInstance.rentalStock(id, days, serviceId);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling RentalApi#rentalStock");
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
| **id** | **Integer**| The rental ID retrieved from &#x60;Retrieve Rental IDs&#x60; | |
| **days** | **Integer**|  | |
| **serviceId** | **Integer**|  | [optional] |

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

