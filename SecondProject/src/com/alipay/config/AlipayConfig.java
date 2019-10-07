package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101000652752";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDhBTIAYBVtsd3LOpiJEl4TzjAxpYEBXhfUYgyKna/JUMVzS9rmQ1FiKmFV83N7BjjoICnPno6+P83iC3sC95GPCIlelUBqLR7e22gSFL0WpWFb2JY9+sN+VBacoTDMzm9HlpWexgpFci+SSyjK8aIaj0TrRfh8J+UxWkjjgMKYHr54VsLCCCdSIqsNKtOV6wXni9ZtigT63hGHP2UVyv2v/vb5sn01+QmGGwFqAuGXetYQ8dziyeYugP6UQEehy0BneMA8Jfo8RAA5/yysDgpWP9fhr1lxDH8xjClfNfxYgnLSclbvEcL5iUPG2nMKxVWjgQfsHU6wRgdxUn/bktUjAgMBAAECggEAOC9/6LAVKaq74r7iz3cSnodhaUQWDi1cbd99mi79cZsFcmCCa/RrIcPLQhbjwtgu5WcCiaDhq4dq9QJA2ODQK5LKGh/SUbCqgKLwPXOIM1tgD/roqNkwbx639qwY70qsZoenHFn+vpBgaHrz2Ji1DUSwxL5X6Uhc5hHRGV1ROYIbx3wMqmBhVjfssZy6lBcf3dvSi44dXCwRq/5SPRlXaDUm19hHj2PEqFH7OaaKhsswZ8zhLMDd4HIfvGwHV6lANhfhLnh/1tHuvDBEQXj9xEk469XFHHJZZZlBgq+PnzXMFlPRTv3U6kYlU/4LJCCqoVURxC297Ufg7R0mk+C0IQKBgQD4Tyo7L63rk2eFUo/j5aPUG3OHr1yyKQAnteUfoFED57L6hMZwqWWrJyoBmyxNFemq+821z5ORHhr4HK39nhC+mHNx7yw/YgwBO3XCzGNE4ADa9Rhkmhm3bimlSMJO2797NucFqobs6o3SnCfV3YogjPFP7ydsU4AUTS94QzgtRwKBgQDn/V+G6HDz/enYrGDMwhXylGgmE/V9th+G8jSQv1K7fqK7XJf0pm4ii+R9t6hFU3vnpBuwh6KMXG3IKer2quxh56ylftKVYTsZvmleFQZ1KAqXuLv8oIPtv3at88SNh7C0tiQCcKwQ0OvN3x2CDBGdDw6TPHuzwh5l9AuxiVjXRQKBgQCZJRpCzrFRreQXEki0ohlc5GFouftN1oPF+iWKT/InmmuEnwdUzOVrnggGXZIBKRao4gyJqbC1u/+eLvIQjcB+DMCG8KA1p18IE4gZ0L0Y6Z8dbDTTN0fNHiCJVEqjIF0EvWPW1snIrREzaCQZfz2FvefHCRUjdoxz+PbiEXNAWQKBgQCbm3lS7WCuWFddjapUTa8ZCnCdce/Nhba59oZJvPtKZlPTJvWKFYR0Sa9WoDUPY0MOCibEjwX57hl5FJzVHar2tMY6L8oihph02SKmB6ZQOS55vGDjv+seMrnxTjw9zpE5dZ7LwDW6BdjVO134mA3McogNPJmg5okrS7n4OK9NnQKBgAWarkev1f7Zf61AoJVZ4gftgsoes2Q89WY/UGQRduEAWyo2jWTPmSct3wsLJFfXLyp9Gq//b3XD4uo6jAVcGtl4+IFs+RQbDZ3wq/DpNkIbo5Fb9EIhGKgMY3a98WhBNQs3poHuxu/vPbZhmrzpHxg8CZ9tIe/WEIcUBBM4addD";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqd/21LVeMGWY1odkWaUejXcU7AlKwYj9zfNOcW82EX7nh0Jsds1kgzspdfvw4bbLj3JgoKEVbNpJK5AyKRZNAQz9lm+nFYreUPNn5+fGN8CK3Bi1DPi6nwpX7kmostxlyKdU1vE2xbrADIV/KpQ3QkOkDA9FiZNTTD0GprHlRJZYKHvwleq+ZBEL24b/KkEnNC1m0jlp1jTgPGLQqRVv5XcE3nXof/1XbYmh3s4WIHLYUyQMXJcNGm4I7a5M5AeLsz5wYn4WyXE+7n1twDqQKtvxgid69fC28qHL1nn54Vnul5k6KTiOoIKE/iadp4abIjjrN7xfhVYnukvYreSPOQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/SecondProject/alipay/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/SecondProject/index.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

