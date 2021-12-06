package AdminNewPage.Recaptcha;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;

public class RecaptchaVerification {
	public static final String verificationUrl = "https://www.google.com/recaptcha/api/siteverify";
	public static final String secretKey = "6LdNo-QcAAAAAGMwlUZybcbWyoA5HFQxB1DlJ6_I";
	
	public static boolean verify(String gRecapchaResponse) {
		if(gRecapchaResponse == null || "".equals(gRecapchaResponse)) {
			return false;
		}
		
		try {
			URL obj = new URL(verificationUrl);
			HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
			
			// add request header
			con.setRequestMethod("POST");
			con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
			
			String postParams = "secret=" + secretKey + "&response=" + gRecapchaResponse;
			
			// send post request
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();
			
			int responseCode = con.getResponseCode();
			
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			while((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			
			in.close();
			
			JsonReader jsonReader = Json.createReader(new StringReader(response.toString()));
			JsonObject jsonOnject = jsonReader.readObject();
			jsonReader.close();
			
			return jsonOnject.getBoolean("success");
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
