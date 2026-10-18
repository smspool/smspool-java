import com.google.gson.Gson;
import io.github.smspool.ApiClient;
import io.github.smspool.ApiException;
import io.github.smspool.api.InformationApi;
import java.util.List;

public class JavaSmoke {
    public static void main(String[] args) throws Exception {
        ApiClient client = new ApiClient();
        client.setBasePath("https://api.smspool.net");
        InformationApi api = new InformationApi(client);
        Object countries = api.countryRetrieveAll(null);
        if (!(countries instanceof List<?> list) || list.isEmpty()) throw new RuntimeException("no countries");
        System.out.println("countries: " + list.size() + " " + new Gson().toJson(list.get(0)));
        String rates = new Gson().toJson(api.requestSuccessRate("1", null));
        System.out.println("success_rate (form POST): " + rates.substring(0, Math.min(80, rates.length())));

        ApiClient authed = new ApiClient();
        authed.setBasePath("https://api.smspool.net");
        authed.setBearerToken("0".repeat(32));
        try {
            new InformationApi(authed).requestBalance();
            throw new RuntimeException("expected an auth error");
        } catch (ApiException e) {
            if (e.getCode() != 401 && e.getCode() != 403) throw e;
            String body = e.getResponseBody();
            System.out.println("bad key -> " + e.getCode() + " " + body.substring(0, Math.min(80, body.length())));
        }
        System.out.println("JAVA OK");
    }
}
