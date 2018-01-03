package com.udata.osp.util;
import java.io.UnsupportedEncodingException;

import com.udata.osp.rsa.RSATool;

/**
 * 单点登录至指定邮件，支持极速6及以上版本
 */
public class LoginFolder {

	public static void main(String[] args) throws UnsupportedEncodingException {
		//企业对应的私钥
		String priKey = "30820278020100300d06092a864886f70d0101010500048202623082025e02010002818100acc916301f2d6c0204a0152c532169f059e2c304bf7bdd05ed5fe64a4203267142303e9f40d4af9528876583949278c3a01acc20c52ba39abd76b857358dc70250c44affc695c5dfcf3e11c127d86a55ec8bca6b7627d58083389d9dfd5070ac748ccc71aa7d29425a4f3ee6c6b1c0cf33fc12ade5fc7a2793f0e2665eb67a85020301000102818026f16f99cafd1ed1d99f0706a579eb79ab98ab61bf92b83f24c02f945f0a7cb89c356977d551da7d20d45b71eba393aa6bc47e6b88650c8bccd61c3833aecfc27a7130d4d7ca6b577ea16fd27dba627f1180ab6ff8119b1e6bfd7fdd56868843bb5632b1fd9366ad565a575793bb2adbc0fa0dea96c0d75ca55f749832abf005024100fc984860810b546d96fc25446dd0c3fc581c4c63af076b843a52928961ebc237f84a2b6c1e69ef90435020e3b3eccd1002dbe9a97d306952d5248e465adc57e7024100af1d60bf649c7721df5ddf0a1694b8ebd22c8aee5c87881fc28c4df6f24b61a7d845ebdf41fa28f54cc7f0969410a0a51398b372ba81ad9104f40d6b66c25cb3024100a8b420aaeba520876d2f0cc8ee3b5f9a5b52d32644d144daf4850fbfd7f9b926de9ad2f38c409eb3107224f54fc7599257067fc2268dbdda87e6b96b7de5ea830241008363e2949894019b2bb28e484e7b1668f290b34977a9c58c36f7f903a1f6c7761d831120b9ab4e92072339b471b22c26d016520672441c8be4108e0518dc1a9b024100bc1033498bd63f5da8caf06e639d53f861ecfc4562a4af25771b075f5289a0235f1096f93f1de1636568df7a6cc411f59b29e7ec0680226dac9957b59498c114";
		String domain = "xust.edu.cn";
		String account_name = "zhaoanxin";
		String time = System.currentTimeMillis() + "";
		String module = "mbox.ListModule|{\"fid\":1,\"order\":\"date\",\"desc\":true}";

                String url = "https://entryhz.qiye.163.com/domain/oa/Entry";
                String src = "domain=" + domain + "&account_name=" + account_name + "&time=" + time + "&module=" + module ;
		
		RSATool tool = new RSATool();
		String enc = tool.generateSHA1withRSASigature(account_name + domain + time, priKey);

		String postURL = url + "?" + src + "&enc=" + enc;
		System.out.print(postURL);
	}
	
	public static String getMailFolderUrl(){
		//企业对应的私钥
		String priKey = "30820278020100300d06092a864886f70d0101010500048202623082025e02010002818100acc916301f2d6c0204a0152c532169f059e2c304bf7bdd05ed5fe64a4203267142303e9f40d4af9528876583949278c3a01acc20c52ba39abd76b857358dc70250c44affc695c5dfcf3e11c127d86a55ec8bca6b7627d58083389d9dfd5070ac748ccc71aa7d29425a4f3ee6c6b1c0cf33fc12ade5fc7a2793f0e2665eb67a85020301000102818026f16f99cafd1ed1d99f0706a579eb79ab98ab61bf92b83f24c02f945f0a7cb89c356977d551da7d20d45b71eba393aa6bc47e6b88650c8bccd61c3833aecfc27a7130d4d7ca6b577ea16fd27dba627f1180ab6ff8119b1e6bfd7fdd56868843bb5632b1fd9366ad565a575793bb2adbc0fa0dea96c0d75ca55f749832abf005024100fc984860810b546d96fc25446dd0c3fc581c4c63af076b843a52928961ebc237f84a2b6c1e69ef90435020e3b3eccd1002dbe9a97d306952d5248e465adc57e7024100af1d60bf649c7721df5ddf0a1694b8ebd22c8aee5c87881fc28c4df6f24b61a7d845ebdf41fa28f54cc7f0969410a0a51398b372ba81ad9104f40d6b66c25cb3024100a8b420aaeba520876d2f0cc8ee3b5f9a5b52d32644d144daf4850fbfd7f9b926de9ad2f38c409eb3107224f54fc7599257067fc2268dbdda87e6b96b7de5ea830241008363e2949894019b2bb28e484e7b1668f290b34977a9c58c36f7f903a1f6c7761d831120b9ab4e92072339b471b22c26d016520672441c8be4108e0518dc1a9b024100bc1033498bd63f5da8caf06e639d53f861ecfc4562a4af25771b075f5289a0235f1096f93f1de1636568df7a6cc411f59b29e7ec0680226dac9957b59498c114";
		String domain = "xust.edu.cn";
		String account_name = "zhaoanxin";
		String time = System.currentTimeMillis() + "";
		String module = "mbox.ListModule|{\"fid\":1,\"order\":\"date\",\"desc\":true}";

        String url = "https://entryhz.qiye.163.com/domain/oa/Entry";
        String src = "domain=" + domain + "&account_name=" + account_name + "&time=" + time + "&module=" + module ;
		
		RSATool tool = new RSATool();
		String enc = tool.generateSHA1withRSASigature(account_name + domain + time, priKey);

		String postURL = url + "?" + src + "&enc=" + enc;
		System.out.print(postURL);
		
		return postURL;
	}
	
	public static String getMailUrl(String accountName){
		String priKey = "30820278020100300d06092a864886f70d0101010500048202623082025e02010002818100acc916301f2d6c0204a0152c532169f059e2c304bf7bdd05ed5fe64a4203267142303e9f40d4af9528876583949278c3a01acc20c52ba39abd76b857358dc70250c44affc695c5dfcf3e11c127d86a55ec8bca6b7627d58083389d9dfd5070ac748ccc71aa7d29425a4f3ee6c6b1c0cf33fc12ade5fc7a2793f0e2665eb67a85020301000102818026f16f99cafd1ed1d99f0706a579eb79ab98ab61bf92b83f24c02f945f0a7cb89c356977d551da7d20d45b71eba393aa6bc47e6b88650c8bccd61c3833aecfc27a7130d4d7ca6b577ea16fd27dba627f1180ab6ff8119b1e6bfd7fdd56868843bb5632b1fd9366ad565a575793bb2adbc0fa0dea96c0d75ca55f749832abf005024100fc984860810b546d96fc25446dd0c3fc581c4c63af076b843a52928961ebc237f84a2b6c1e69ef90435020e3b3eccd1002dbe9a97d306952d5248e465adc57e7024100af1d60bf649c7721df5ddf0a1694b8ebd22c8aee5c87881fc28c4df6f24b61a7d845ebdf41fa28f54cc7f0969410a0a51398b372ba81ad9104f40d6b66c25cb3024100a8b420aaeba520876d2f0cc8ee3b5f9a5b52d32644d144daf4850fbfd7f9b926de9ad2f38c409eb3107224f54fc7599257067fc2268dbdda87e6b96b7de5ea830241008363e2949894019b2bb28e484e7b1668f290b34977a9c58c36f7f903a1f6c7761d831120b9ab4e92072339b471b22c26d016520672441c8be4108e0518dc1a9b024100bc1033498bd63f5da8caf06e639d53f861ecfc4562a4af25771b075f5289a0235f1096f93f1de1636568df7a6cc411f59b29e7ec0680226dac9957b59498c114";
		String domain = "xust.edu.cn";
		String account_name = accountName;
		
		String time = System.currentTimeMillis() + "";
		String lang = "0";
		String src = account_name + domain + time;
		RSATool rsa = new RSATool();
		String enc = rsa.generateSHA1withRSASigature(src, priKey);
		String url = "https://entryhz.qiye.163.com/domain/oa/Entry?domain=" + domain + "&account_name=" + account_name + "&time=" + time + "&enc=" + enc + "&lang=" + lang;
		System.out.println(url);
		return url;
	}
}
