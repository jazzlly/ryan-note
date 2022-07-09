### java ignore server certificate

```java
  
import org.junit.Test;  
  
import javax.net.ssl.*;  
  
import java.io.IOException;  
import java.io.InputStreamReader;  
import java.io.Reader;  
import java.net.MalformedURLException;  
import java.net.URL;  
import java.net.URLConnection;  
import java.security.KeyManagementException;  
import java.security.NoSuchAlgorithmException;  
import java.security.cert.X509Certificate;  
  
import static org.junit.Assert.*;  
  
public class UniAuthSsoFilterTest {  
  
    @Test  
 public void ignoreServerCertificate() throws NoSuchAlgorithmException, KeyManagementException, IOException {  
        TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {  
            public java.security.cert.X509Certificate[] getAcceptedIssuers() { return null; }  
            public void checkClientTrusted(X509Certificate[] certs, String authType) { }  
            public void checkServerTrusted(X509Certificate[] certs, String authType) { }  
        } };  
  
        SSLContext sc = SSLContext.getInstance("TLSv1.2");  
        sc.init(null, trustAllCerts, new java.security.SecureRandom());  
        HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());  
  
        // Create all-trusting host name verifier  
 HostnameVerifier allHostsValid = new HostnameVerifier() {  
            public boolean verify(String hostname, SSLSession session) { return true; }  
        };  
  
        // Install the all-trusting host verifier  
 HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);  
        /* End of the fix*/  
  
 URL url = new URL("https://192.168.9.99:4432");  
        URLConnection con = url.openConnection();  
        Reader reader = new InputStreamReader(con.getInputStream());  
        while (true) {  
            int ch = reader.read();  
            if (ch == -1)  
                break;  
            System.out.print((char) ch);  
        }  
    }  
}

```