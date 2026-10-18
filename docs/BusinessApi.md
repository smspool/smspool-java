# BusinessApi

All URIs are relative to *https://api.smspool.net*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**businessCreate**](BusinessApi.md#businessCreate) | **POST** /business/create | Register user |
| [**businessUserHistory**](BusinessApi.md#businessUserHistory) | **POST** /business/user/history | History |
| [**businessUserUpdate**](BusinessApi.md#businessUserUpdate) | **POST** /business/user/update | Update |
| [**businessUsers**](BusinessApi.md#businessUsers) | **GET** /business/users | Retrieve users |


<a id="businessCreate"></a>
# **businessCreate**
> Object businessCreate(username, password, dailySpendLimit)

Register user

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.BusinessApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    BusinessApi apiInstance = new BusinessApi(defaultClient);
    String username = "username_example"; // String | 
    String password = "password_example"; // String | 
    BigDecimal dailySpendLimit = new BigDecimal(78); // BigDecimal | Optional daily spend cap in USD. Omit for no limit.
    try {
      Object result = apiInstance.businessCreate(username, password, dailySpendLimit);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling BusinessApi#businessCreate");
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
| **username** | **String**|  | |
| **password** | **String**|  | |
| **dailySpendLimit** | **BigDecimal**| Optional daily spend cap in USD. Omit for no limit. | [optional] |

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

<a id="businessUserHistory"></a>
# **businessUserHistory**
> Object businessUserHistory(id)

History

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.BusinessApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    BusinessApi apiInstance = new BusinessApi(defaultClient);
    Integer id = 56; // Integer | User ID retrievd from `Retrieve users` endpoint
    try {
      Object result = apiInstance.businessUserHistory(id);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling BusinessApi#businessUserHistory");
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
| **id** | **Integer**| User ID retrievd from &#x60;Retrieve users&#x60; endpoint | |

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

<a id="businessUserUpdate"></a>
# **businessUserUpdate**
> Object businessUserUpdate(id, password, balance, active, dailySpendLimit)

Update

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.BusinessApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    BusinessApi apiInstance = new BusinessApi(defaultClient);
    Integer id = 56; // Integer | User ID retrievd from `Retrieve users` endpoint
    String password = "password_example"; // String | Leave empty if you do not wish to update the password
    BigDecimal balance = new BigDecimal(78); // BigDecimal | Leave empty if you do not wish to update the balance, sets the balance by the requested value
    Integer active = 56; // Integer | Disable/enable user account (optional)
    BigDecimal dailySpendLimit = new BigDecimal(78); // BigDecimal | Daily spend cap in USD. Leave empty to leave unchanged, send -1 to remove the cap, 0 to block all spending.
    try {
      Object result = apiInstance.businessUserUpdate(id, password, balance, active, dailySpendLimit);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling BusinessApi#businessUserUpdate");
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
| **id** | **Integer**| User ID retrievd from &#x60;Retrieve users&#x60; endpoint | |
| **password** | **String**| Leave empty if you do not wish to update the password | [optional] |
| **balance** | **BigDecimal**| Leave empty if you do not wish to update the balance, sets the balance by the requested value | [optional] |
| **active** | **Integer**| Disable/enable user account (optional) | [optional] |
| **dailySpendLimit** | **BigDecimal**| Daily spend cap in USD. Leave empty to leave unchanged, send -1 to remove the cap, 0 to block all spending. | [optional] |

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

<a id="businessUsers"></a>
# **businessUsers**
> Object businessUsers()

Retrieve users

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.BusinessApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    BusinessApi apiInstance = new BusinessApi(defaultClient);
    try {
      Object result = apiInstance.businessUsers();
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling BusinessApi#businessUsers");
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

