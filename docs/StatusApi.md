# StatusApi

All URIs are relative to *https://api.smspool.net*

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| [**up**](StatusApi.md#up) | **GET** /up | Health check |


<a id="up"></a>
# **up**
> Object up()

Health check

For uptime monitors. Needs no API key. &#x60;db&#x60; and &#x60;cache&#x60; say whether the database and the cache answered; &#x60;status&#x60; is &#x60;ok&#x60; when both did. The result is refreshed every few seconds.

### Example
```java
// Import classes:
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.Configuration;
import io.github.smspool.models.*;
import io.github.smspool.api.StatusApi;

public class Example {
  public static void main(String[] args) {
    ApiClient defaultClient = Configuration.getDefaultApiClient();
    defaultClient.setBasePath("https://api.smspool.net");

    StatusApi apiInstance = new StatusApi(defaultClient);
    try {
      Object result = apiInstance.up();
      System.out.println(result);
    } catch (ApiException e) {
      System.err.println("Exception when calling StatusApi#up");
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
| **503** | Error |  -  |

