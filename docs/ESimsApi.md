# ESimsApi

All URIs are relative to *https://api.smspool.net*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**esimDelete**](ESimsApi.md#esimDelete) | **POST** /esim/delete | Delete eSIM |
| [**esimHistory**](ESimsApi.md#esimHistory) | **POST** /esim/history | View eSIM history |
| [**esimLabelUpdate**](ESimsApi.md#esimLabelUpdate) | **POST** /esim/label/update | Update eSIM label |
| [**esimPlans**](ESimsApi.md#esimPlans) | **POST** /esim/plans | View eSIM plans per country |
| [**esimPricing**](ESimsApi.md#esimPricing) | **POST** /esim/pricing | View eSIM countries |
| [**esimProfile**](ESimsApi.md#esimProfile) | **POST** /esim/profile | View eSIM profile |
| [**esimPurchase**](ESimsApi.md#esimPurchase) | **POST** /esim/purchase | Purchase eSIM |
| [**esimTopup**](ESimsApi.md#esimTopup) | **POST** /esim/topup | Top up eSIM |
| [**esimTopupPlans**](ESimsApi.md#esimTopupPlans) | **POST** /esim/topup_plans | Top Up Plans |


<a id="esimDelete"></a>
# **esimDelete**
> Object esimDelete(transactionId)

Delete eSIM

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.ESimsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    ESimsApi apiInstance = new ESimsApi(defaultClient);
    String transactionId = "transactionId_example"; // String | transactionId retrieved from /esim/purchase
    try {
      Object result = apiInstance.esimDelete(transactionId);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling ESimsApi#esimDelete");
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
| **transactionId** | **String**| transactionId retrieved from /esim/purchase | |

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

<a id="esimHistory"></a>
# **esimHistory**
> Object esimHistory(start, length, search)

View eSIM history

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.ESimsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    ESimsApi apiInstance = new ESimsApi(defaultClient);
    Integer start = 56; // Integer | Start page
    Integer length = 56; // Integer | Amount of rows per page
    String search = "search_example"; // String | Alphanumeric search
    try {
      Object result = apiInstance.esimHistory(start, length, search);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling ESimsApi#esimHistory");
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
| **start** | **Integer**| Start page | [optional] |
| **length** | **Integer**| Amount of rows per page | [optional] |
| **search** | **String**| Alphanumeric search | [optional] |

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

<a id="esimLabelUpdate"></a>
# **esimLabelUpdate**
> Object esimLabelUpdate(transactionId, label)

Update eSIM label

Set or clear the label of one of your eSIMs. The label is returned as &#x60;label&#x60; by **View eSIM history**, so you can use it to tell your eSIMs apart.  A label can be up to 30 characters long and may only contain letters, numbers and spaces. Leave &#x60;label&#x60; out, or send it empty, to remove the label.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.ESimsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    ESimsApi apiInstance = new ESimsApi(defaultClient);
    String transactionId = "transactionId_example"; // String | transactionId retrieved from /esim/purchase
    String label = "label_example"; // String | The new label: letters, numbers and spaces, at most 30 characters. Empty or left out removes the label.
    try {
      Object result = apiInstance.esimLabelUpdate(transactionId, label);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling ESimsApi#esimLabelUpdate");
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
| **transactionId** | **String**| transactionId retrieved from /esim/purchase | |
| **label** | **String**| The new label: letters, numbers and spaces, at most 30 characters. Empty or left out removes the label. | [optional] |

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

<a id="esimPlans"></a>
# **esimPlans**
> Object esimPlans(country)

View eSIM plans per country

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.ESimsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    ESimsApi apiInstance = new ESimsApi(defaultClient);
    String country = "country_example"; // String | ISO 3166 country code
    try {
      Object result = apiInstance.esimPlans(country);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling ESimsApi#esimPlans");
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
| **country** | **String**| ISO 3166 country code | |

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

<a id="esimPricing"></a>
# **esimPricing**
> Object esimPricing(start, length, search)

View eSIM countries

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.ESimsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    ESimsApi apiInstance = new ESimsApi(defaultClient);
    Integer start = 56; // Integer | Start page
    Integer length = 56; // Integer | Amount of rows per page
    String search = "search_example"; // String | Search query for country
    try {
      Object result = apiInstance.esimPricing(start, length, search);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling ESimsApi#esimPricing");
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
| **start** | **Integer**| Start page | [optional] |
| **length** | **Integer**| Amount of rows per page | [optional] |
| **search** | **String**| Search query for country | [optional] |

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

<a id="esimProfile"></a>
# **esimProfile**
> Object esimProfile(transactionId)

View eSIM profile

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.ESimsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    ESimsApi apiInstance = new ESimsApi(defaultClient);
    String transactionId = "transactionId_example"; // String | transactionId retrieved from /esim/purchase
    try {
      Object result = apiInstance.esimProfile(transactionId);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling ESimsApi#esimProfile");
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
| **transactionId** | **String**| transactionId retrieved from /esim/purchase | [optional] |

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

<a id="esimPurchase"></a>
# **esimPurchase**
> Object esimPurchase(plan)

Purchase eSIM

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.ESimsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    ESimsApi apiInstance = new ESimsApi(defaultClient);
    Integer plan = 56; // Integer | The plan ID which is obtained from /esim/pricing
    try {
      Object result = apiInstance.esimPurchase(plan);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling ESimsApi#esimPurchase");
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
| **plan** | **Integer**| The plan ID which is obtained from /esim/pricing | |

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

<a id="esimTopup"></a>
# **esimTopup**
> Object esimTopup(transactionId, plan)

Top up eSIM

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.auth.*;
import io.github.smspool.models.*;
import io.github.smspool.api.ESimsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");
    
    // Configure HTTP bearer authorization: bearerAuth
    HttpBearerAuth bearerAuth = (HttpBearerAuth) defaultClient.getAuthentication("bearerAuth");
    bearerAuth.setBearerToken("BEARER TOKEN");

    ESimsApi apiInstance = new ESimsApi(defaultClient);
    String transactionId = "transactionId_example"; // String | Transaction ID retrieved from eSIM history
    Integer plan = 56; // Integer | Topup plan retrieved from \\\"Top Up Plans\\\"
    try {
      Object result = apiInstance.esimTopup(transactionId, plan);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling ESimsApi#esimTopup");
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
| **transactionId** | **String**| Transaction ID retrieved from eSIM history | |
| **plan** | **Integer**| Topup plan retrieved from \\\&quot;Top Up Plans\\\&quot; | |

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

<a id="esimTopupPlans"></a>
# **esimTopupPlans**
> Object esimTopupPlans(plan)

Top Up Plans

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.ESimsApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    ESimsApi apiInstance = new ESimsApi(defaultClient);
    Integer plan = 56; // Integer | `plan` retrieved from eSIM history
    try {
      Object result = apiInstance.esimTopupPlans(plan);
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling ESimsApi#esimTopupPlans");
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
| **plan** | **Integer**| &#x60;plan&#x60; retrieved from eSIM history | |

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

