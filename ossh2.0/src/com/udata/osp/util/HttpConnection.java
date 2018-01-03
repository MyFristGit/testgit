package com.udata.osp.util;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
@SuppressWarnings("deprecation")
public class HttpConnection{
	private static Log logger = LogFactory.getLog(HttpConnection.class);
	
	
	public static JSONObject doGet(String url) throws Exception {
		@SuppressWarnings("unused")
		JSONObject jsonObject = new JSONObject();
		
		try {
			HttpClient client = new DefaultHttpClient();
			if (url.startsWith("https")) {
				enableSSL(client);
			}
			HttpGet httpget = new HttpGet(new URI(url));
			httpget.setHeader("Content-Type", "application/json");
			HttpResponse response = client.execute(httpget);
			int status = response.getStatusLine().getStatusCode();
			String entityStr = EntityUtils.toString(response.getEntity(),"UTF-8");
			if (status != 200) {
				throw new RuntimeException(String.format("api return error http code %d, detail: \n%s", status,entityStr));
			}
			return jsonObject = JSONObject.fromObject(entityStr);
		} catch (Exception t) {
			String msg = String.format("Failed to call api '%s'", url);
			logger.error(msg, t);
			throw t;
		}
	}
	
	public static JSONObject doPut(String url, Map<String, String> parameters) throws Exception {
		@SuppressWarnings("unused")
		JSONObject jsonObject = new JSONObject();
		Map<String, String> params = new LinkedHashMap<String, String>();
		if (parameters != null) {
			params.putAll(parameters);
		}
		try {
			HttpClient client = new DefaultHttpClient();
			if (url.startsWith("https")) {
				enableSSL(client);
			}
			HttpPut httpput = new HttpPut(new URI(url));
			List<NameValuePair> nvps = new ArrayList<NameValuePair>();
			for (Entry<String, String> entry : params.entrySet()) {
				nvps.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
			}

			httpput.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));
			HttpResponse response = client.execute(httpput);
			int status = response.getStatusLine().getStatusCode();
			String entityStr = EntityUtils.toString(response.getEntity(),"UTF-8");
			if (status != 200) {
				throw new RuntimeException(String.format("api return error http code %d, detail: \n%s", status,entityStr));
			}
			return jsonObject = JSONObject.fromObject(entityStr);
		} catch (Exception t) {
			String msg = String.format("Failed to call api '%s'", url);
			logger.error(msg, t);
			throw t;
		}
	}
	
	
	public static JSONObject doPost(String url, Map<String, String> parameters) throws Exception {
		@SuppressWarnings("unused")
		JSONObject jsonObject = new JSONObject();
		Map<String, String> params = new LinkedHashMap<String, String>();
        if (parameters != null) {
            params.putAll(parameters);
        }
		try {
			HttpClient client = new DefaultHttpClient();
			if(url.startsWith("https")) {
				enableSSL(client);
			}
			HttpPost httppost = new HttpPost(new URI(url));
			List<NameValuePair> nvps = new ArrayList<NameValuePair>();  
			for (Entry<String, String> entry : params.entrySet()) {
				nvps.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));  
			}
			httppost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));  
			httppost.setHeader("Content-Type", "application/x-www-form-urlencoded");
			HttpResponse response = client.execute(httppost);
			int status = response.getStatusLine().getStatusCode();
			String entityStr = EntityUtils.toString(response.getEntity(), "UTF-8");
			if (status != 200) {
				throw new RuntimeException(String.format("api return error http code %d, detail: \n%s", status,
						entityStr));
			}
			return jsonObject = JSONObject.fromObject(entityStr);
		} catch (Exception t) {
			String msg = String.format("Failed to call api '%s'", url);
			logger.error(msg, t);
			throw t;
		}
	}
	
	

	

	
	  
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 
	 * @param params
	 *            请求参数
	 * @return 构建query
	 */
	public static String buildQuery(Map<String, String> params, String charset) {
		if (params == null || params.isEmpty()) {
			return null;
		}
		StringBuilder sb = new StringBuilder();
		boolean first = true;
		for (Entry<String, String> entry : params.entrySet()) {
			if (first) {
				first = false;
			} else {
				sb.append("&");
			}
			String key = entry.getKey();
			String value = entry.getValue();
			if (StringUtils.isNotEmpty(key) && StringUtils.isNotEmpty(value)) {
				try {
					sb.append(key).append("=")
							.append(URLEncoder.encode(value, charset));
				} catch (UnsupportedEncodingException e) {
				}
			}
		}
		return sb.toString();

	}

	private static TrustManager truseAllManager = new X509TrustManager() {

		public X509Certificate[] getAcceptedIssuers() {
			return new X509Certificate[] {};
		}

		public void checkClientTrusted(X509Certificate[] cert, String oauthType)
				throws java.security.cert.CertificateException {
		}

		public void checkServerTrusted(X509Certificate[] cert, String oauthType)
				throws java.security.cert.CertificateException {
		}
	};

	/**
	 * https
	 * 
	 * @param httpclient
	 */
	private static void enableSSL(HttpClient httpclient) {
		// 调用ssl
		try {
			SSLContext sslcontext = SSLContext.getInstance("TLS");
			sslcontext.init(null, new TrustManager[] { truseAllManager }, null);
			SSLSocketFactory sf = new SSLSocketFactory(sslcontext);
			sf.setHostnameVerifier(SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
			Scheme https = new Scheme("https", sf, 443);
			httpclient.getConnectionManager().getSchemeRegistry()
					.register(https);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	  
	  
}




