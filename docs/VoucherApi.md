# VoucherApi

All URIs are relative to *https://api.smspool.net*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**voucherBulkGenerate**](VoucherApi.md#voucherBulkGenerate) | **POST** /voucher/bulk_generate | Bulk generate vouchers |
| [**voucherDelete**](VoucherApi.md#voucherDelete) | **POST** /voucher/delete | Delete voucher |
| [**voucherGenerate**](VoucherApi.md#voucherGenerate) | **POST** /voucher/generate | Generate voucher |
| [**voucherRetrieve**](VoucherApi.md#voucherRetrieve) | **POST** /voucher/retrieve | Retrieve vouchers |


<a id="voucherBulkGenerate"></a>
# **voucherBulkGenerate**
> Object voucherBulkGenerate(amount, quantity)

Bulk generate vouchers

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.VoucherApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    VoucherApi apiInstance = new VoucherApi(defaultClient);
    BigDecimal amount = new BigDecimal(78); // BigDecimal | 
    Integer quantity = 56; // Integer | 
    try {
      Object result = apiInstance.voucherBulkGenerate(amount, quantity);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling VoucherApi#voucherBulkGenerate");
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
| **amount** | **BigDecimal**|  | |
| **quantity** | **Integer**|  | |

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

<a id="voucherDelete"></a>
# **voucherDelete**
> Object voucherDelete(voucher)

Delete voucher

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.VoucherApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    VoucherApi apiInstance = new VoucherApi(defaultClient);
    String voucher = "voucher_example"; // String | Your voucher code
    try {
      Object result = apiInstance.voucherDelete(voucher);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling VoucherApi#voucherDelete");
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
| **voucher** | **String**| Your voucher code | |

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

<a id="voucherGenerate"></a>
# **voucherGenerate**
> Object voucherGenerate(amount)

Generate voucher

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.VoucherApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    VoucherApi apiInstance = new VoucherApi(defaultClient);
    BigDecimal amount = new BigDecimal(78); // BigDecimal | The amount per promocode
    try {
      Object result = apiInstance.voucherGenerate(amount);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling VoucherApi#voucherGenerate");
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
| **amount** | **BigDecimal**| The amount per promocode | |

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

<a id="voucherRetrieve"></a>
# **voucherRetrieve**
> Object voucherRetrieve()

Retrieve vouchers

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.VoucherApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    VoucherApi apiInstance = new VoucherApi(defaultClient);
    try {
      Object result = apiInstance.voucherRetrieve();
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling VoucherApi#voucherRetrieve");
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
| **200** | JSON response |  -  |
| **401** | Malformed API key |  -  |
| **403** | Unknown or revoked API key |  -  |

