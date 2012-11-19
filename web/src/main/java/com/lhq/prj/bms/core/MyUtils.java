package com.lhq.prj.bms.core;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;
import java.security.*;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * MyUtils.java Create on 2009-2-17
 * @author andchen
 * @version 1.0
 */
public class MyUtils {

	public static void main(String[] s) {
		List conditions = new ArrayList();
		MyUtils.addToCollection(conditions, MyUtils.split("a,b-c d,e f-g", " ,-"));
		System.out.println(conditions);
	}

	public static boolean delFile(String filePathAndName) {
		File myDelFile = new java.io.File(filePathAndName);
		if (!myDelFile.exists()) {
			return true;
		}
		return myDelFile.delete();
	}

	public static String upload(String uploadFileName, String savePath, File uploadFile) {
		String newFileName = getRandomName(uploadFileName, savePath);
		try {
			FileOutputStream fos = new FileOutputStream(savePath + newFileName);
			FileInputStream fis = new FileInputStream(uploadFile);
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = fis.read(buffer)) > 0) {
				fos.write(buffer, 0, len);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return newFileName;
	}
	public static String getSizeOfPic(File file) throws IOException{
		BufferedImage src = javax.imageio.ImageIO.read(file); //构造Image对象 
		int width = src.getWidth(); //得到源图宽 
		int height = src.getHeight(); //得到源图长   
		return "("+width+","+height+")";
	} 

	public static void mkDirectory(String path) {
		File file;
		try {
			file = new File(path);
			if (!file.exists()) {
				file.mkdirs();
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			file = null;
		}
	}

	public static void addToCollection(Collection collection, Object[] arr) {
		if (null != collection && null != arr) {
			CollectionUtils.addAll(collection, arr);
		}
	}

	public static String[] split(String str, String separatorChars) {
		return StringUtils.split(str, separatorChars);
	}

	public static boolean invokeSetMethod(String fieldName, Object invokeObj, Object[] args) {
		boolean flag = false;
		Field[] fields = invokeObj.getClass().getDeclaredFields(); 
		Method[] methods = invokeObj.getClass().getDeclaredMethods(); 
		for (Field f : fields) {
			String fname = f.getName();
			if (fname.equals(fieldName)) {
				String mname = "set" + (fname.substring(0, 1).toUpperCase() + fname.substring(1));
				for (Method m : methods) {
					String name = m.getName();
					if (mname.equals(name)) {
						if (f.getType().getSimpleName().equalsIgnoreCase("integer") && args.length > 0) {
							args[0] = Integer.valueOf(args[0].toString());
						}
						if (f.getType().getSimpleName().equalsIgnoreCase("boolean") && args.length > 0) {
							args[0] = Boolean.valueOf(args[0].toString());
						}
						try {
							m.invoke(invokeObj, args);
							flag = true;
						} catch (IllegalArgumentException e) {
							flag = false;
							e.printStackTrace();
						} catch (IllegalAccessException e) {
							flag = false;
							e.printStackTrace();
						} catch (InvocationTargetException e) {
							flag = false;
							e.printStackTrace();
						}
					}
				}
			}
		}
		return flag;
	}

	public static boolean isFileExist(String fileName, String dir) {
		File files = new File(dir + fileName);
		return (files.exists()) ? true : false;
	}

	public static String getRandomName(String fileName, String dir) {
		String[] split = fileName.split("\\.");
		String extendFile = "." + split[split.length - 1].toLowerCase();

		Random random = new Random();
		int add = random.nextInt(1000000);
		String ret = add + extendFile;
		while (isFileExist(ret, dir)) {
			add = random.nextInt(1000000);
			ret = fileName + add + extendFile;
		}
		return ret;
	}

	public static void createMiniPic(File file, float width, float height) throws IOException {
		Image src = javax.imageio.ImageIO.read(file);
		int old_w = src.getWidth(null);
		int old_h = src.getHeight(null);
		int new_w = 0;
		int new_h = 0;
		float tempdouble;
		if (old_w >= old_h) {
			tempdouble = old_w / width;
		} else {
			tempdouble = old_h / height;
		}

		if (old_w >= width || old_h >= height) {
			new_w = Math.round(old_w / tempdouble);
			new_h = Math.round(old_h / tempdouble);
			while (new_w > width && new_h > height) {
				if (new_w > width) {
					tempdouble = new_w / width;
					new_w = Math.round(new_w / tempdouble);
					new_h = Math.round(new_h / tempdouble);
				}
				if (new_h > height) {
					tempdouble = new_h / height;
					new_w = Math.round(new_w / tempdouble);
					new_h = Math.round(new_h / tempdouble);
				}
			}
			BufferedImage tag = new BufferedImage(new_w, new_h, BufferedImage.TYPE_INT_RGB);
			tag.getGraphics().drawImage(src, 0, 0, new_w, new_h, null);
			FileOutputStream newimage = new FileOutputStream(file); 
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimage);
			JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(tag);
			param.setQuality((float) (100 / 100.0), true);
			encoder.encode(tag, param);
			encoder.encode(tag); 
			newimage.close();
		}
	}

	public static boolean isValid(String contentType, String[] allowTypes) {
		if (null == contentType || "".equals(contentType)) {
			return false;
		}
		for (String type : allowTypes) {
			if (contentType.equals(type)) {
				return true;
			}
		}
		return false;
	}
    public final static String str2MD5(String _str) {
    	char hexDigits[] = {
    			'0', '1', '2', '3', '4', '5', '6', '7', '8',
    			'9', 'a', 'b', 'c', 'd', 'e', 'f'};
    	try {
    		byte[] strTemp = _str.getBytes();
    		MessageDigest mdTemp = MessageDigest.getInstance("MD5");
    		mdTemp.update(strTemp);
    		byte[] md = mdTemp.digest();
    		int j = md.length;
    		char str[] = new char[j * 2];
    		int k = 0;
    		for (int i = 0; i < j; i++) {
    			byte byte0 = md[i];
    			str[k++] = hexDigits[byte0 >>> 4 & 0xf];
    			str[k++] = hexDigits[byte0 & 0xf];
    		}
    		return new String(str);
    	} catch (Exception e) {
    		return null;
    	}
   	}
    // 16位
    public final static String str2MD5to16byte(String _str) {
    	return str2MD5(_str).substring(8, 24);
    }
    public static Integer getStringLength(String str)
    {
        int valueLength = 0;
        String chinese = "[\u0391-\uFFE5]";
        /* 获取字段值的长度，如果含中文字符，则每个中文字符长度为2，否则为1 */
        for (int i = 0; i < str.length(); i++) {
            /* 获取一个字符 */
            String temp = str.substring(i, i + 1);
            /* 判断是否为中文字符 */
            if (temp.matches(chinese)) {
                /* 中文字符长度为2 */
                valueLength += 2;
            } else {
                /* 其他字符长度为1 */
                valueLength += 1;
            }
        }
        return valueLength;
    }
    public static String dispStartByFs(Integer intS)
    {
    	String stmpa="<img src='images/star1.gif'/>";
    	String stmpb="<img src='images/star2.gif'/>";
    	String stmpc="<img src='images/star3.gif'/>";
    	String strRetu;
    	Integer iLmp;
    	Integer intA;
    	Integer intB;
    	Integer intC;
    	Double da;
    	
		intA=5;
		intB=0;
		intC=0;
		strRetu="";
		
		da=Math.floor(intS/2);
		iLmp=intS%2;
		if (da>0)
		{
			intB=da.intValue();
		}
		if (iLmp>0)
		{
			intC=1;
		}
		intA=5-intB-intC;
		
		//输出
    	if (intB>0)
    	{
    		for (iLmp=0;iLmp<intB;iLmp++)
    		{
    			strRetu=strRetu+stmpb;
    		}
    	}
    	if (intC>0)
    	{
			strRetu=strRetu+stmpc;
    	}
    	if (intA>0)
    	{
    		for (iLmp=0;iLmp<intA;iLmp++)
    		{
    			strRetu=strRetu+stmpa;
    		}
    	}
    	return strRetu;
    }
    public static int getMulInt(int a,int b)
    {
    	return (((double)a/(double)b)> (a/b)?a/b+1:a/b);
    }
    public static String getNormalPageInfo(Integer intSize,Integer intPageLine,Integer intPageCur,Integer intPageZs,Integer intGrpPage)
    {
    	String strPageOut="";
    	Integer intCurGrp;
    	Integer intLmp;
    	Integer intA;
    	Integer intB;
    	Integer intW;
    	Integer intKs;
    	Integer intJs;

    	if (intSize==null) intSize=0;
    	if (intPageLine==null) intPageLine=10;
    	if (intPageCur==null) intPageCur=1;
    	if (intPageZs==null) intPageZs=0;
    	if (intSize>0 && intPageZs>1)
    	{
   			intCurGrp=1;
   			if (intPageZs<100)
  			{
   				strPageOut="<tr><td width=40 style='text-align:center;'>共"+intPageZs.toString()+"页</td>";
   			}else
   			{
   	   			if (intPageZs<10000)
   	  			{
   	   				strPageOut="<tr><td width=50 style='text-align:center;'>共"+intPageZs.toString()+"页</td>";
   	   			}else
   	   			{
   	   				strPageOut="<tr><td width=60 style='text-align:center;'>共"+intPageZs.toString()+"页</td>";
   	   			}
   			}
   			if (intPageCur==1)
   			{
   				strPageOut=strPageOut+"<td width=40 style='color:332414;text-align:center;'>第一页</td>";
   			}else
   			{
   				strPageOut=strPageOut+"<td width=40 style='border:1px solid #CADCE8;text-align:center;'><a href='#' onclick='toPage(1)'><font color='9194C9'>第一页</font></a></td>";
   			}
			strPageOut=strPageOut+"<td width=3></td>";
   			if (intPageCur==1)
   			{
   				strPageOut=strPageOut+"<td width=40 style='color:332414;text-align:center;'>上一页</td>";
   			}else
   			{
   				intLmp=intPageCur-1;
   				strPageOut=strPageOut+"<td width=40 style='border:1px solid #CADCE8;text-align:center;'><a href='#' onclick='toPage("+String.valueOf(intLmp)+")'><font color='9194C9'>上一页</font></a></td>";
   			}
   			//当中页码
   			intKs=(intGrpPage-1)/2;
   			intKs=intPageCur-intKs;
   			if (intKs<=0) intKs=1;
   			intJs=intKs+intGrpPage-1;
   			if (intPageZs<intJs) intJs=intPageZs;
   			if (intPageZs<=intGrpPage) intKs=1;
			for (intLmp=intKs;intLmp<=intJs;intLmp++)
			{
   				intW=0;
				if (intLmp<10)
				{
					intW=10;
				}else
				{
					if (intLmp<100)
					{
						intW=15;
					}else
					{
						if (intLmp<1000)
						{
							intW=20;
						}else
						{
							intW=25;
						}
					}
				}
				if (!intLmp.equals(intPageCur))
				{
					if (intLmp==1)
					{
   		   				strPageOut=strPageOut+"<td width=3></td>";
					}
					strPageOut=strPageOut+"<td width="+String.valueOf(intW)+" style='border:1px solid #CADCE8;text-align:center;'>";
					strPageOut=strPageOut+"<a href='#' onclick='toPage("+String.valueOf(intLmp)+")'><font color='9194C9'>&nbsp;"+String.valueOf(intLmp)+"&nbsp;</font></a></td>";
   				}else
   				{
   		   			strPageOut=strPageOut+"<td width=3></td>";
		   			strPageOut=strPageOut+"<td width="+String.valueOf(intW)+" style='color:332414;text-align:center;'>"+String.valueOf(intLmp)+"</td>";
   				}
   			}
/*
   			if (intPageZs<=intGrpPage)
   			{
   				for (intLmp=1;intLmp<=intPageZs;intLmp++)
   				{
	   				intW=0;
					if (intLmp<10)
					{
						intW=10;
					}else
					{
						if (intLmp<100)
						{
							intW=15;
						}else
						{
							if (intLmp<1000)
							{
								intW=20;
							}else
							{
								intW=25;
							}
						}
					}
   					if (!intLmp.equals(intPageCur))
   					{
   						if (intLmp==1)
   						{
   	   		   				strPageOut=strPageOut+"<td width=3></td>";
   						}
						strPageOut=strPageOut+"<td width="+String.valueOf(intW)+" style='border:1px solid #CADCE8;text-align:center;'>";
						strPageOut=strPageOut+"<a href='#' onclick='toPage("+String.valueOf(intLmp)+")'><font color='9194C9'>&nbsp;"+String.valueOf(intLmp)+"&nbsp;</font></a></td>";
   					}else
   					{
   		   				strPageOut=strPageOut+"<td width=3></td>";
		   				strPageOut=strPageOut+"<td width="+String.valueOf(intW)+" style='color:332414;text-align:center;'>"+String.valueOf(intLmp)+"</td>";
   					}
   				}
   			}else
   			{
   				intCurGrp=intPageCur/intGrpPage;
   				if (intPageCur<intGrpPage)
   				{
   					intCurGrp=0;
   				}
   				if ((intPageCur%intGrpPage)>0)
   				{
   					intCurGrp=intCurGrp+1;
   				}
   				intA=(intCurGrp-1)*intGrpPage+1;
   				intB=intCurGrp*intGrpPage;
   				if (intPageZs<intB)
   				{
   					intB=intPageZs;
   				}
   				for (intLmp=intA;intLmp<=intB;intLmp++)
   				{
	   				intW=0;
					if (intLmp<10)
					{
						intW=10;
					}else
					{
						if (intLmp<100)
						{
							intW=15;
						}else
						{
							if (intLmp<1000)
							{
								intW=20;
							}else
							{
								intW=25;
							}
						}
					}
   					if (!intLmp.equals(intPageCur))
   					{
   						strPageOut=strPageOut+"<td width="+String.valueOf(intW)+" style='border:1px solid #CADCE8;text-align:center;'><a href='#' onclick='toPage("+String.valueOf(intLmp)+")'><font color='9194C9'>"+String.valueOf(intLmp)+"</font></a></td>";
   					}else
   					{
   		   				strPageOut=strPageOut+"<td width=3></td>";
		   				strPageOut=strPageOut+"<td width="+String.valueOf(intW)+" style='color:332414;text-align:center;'>"+String.valueOf(intLmp)+"</td>";
   					}
   				}
   			}
*/    				
   			if (intPageCur.equals(intPageZs))
   			{
   				strPageOut=strPageOut+"<td width=40 style='color:332414'>下一页</td>";
   				strPageOut=strPageOut+"<td width=30 style='color:332414'>末页</td>";
   			}else
   			{
   				intLmp=intPageCur+1;
   				strPageOut=strPageOut+"<td width=3></td>";
   				strPageOut=strPageOut+"<td width=40 style='border:1px solid #CADCE8'><a href='#' onclick='toPage("+String.valueOf(intLmp)+")'><font color='9194C9'>下一页</font></a></td>";
   				strPageOut=strPageOut+"<td width=3></td>";
   				strPageOut=strPageOut+"<td width=30 style='border:1px solid #CADCE8'><a href='#' onclick='toPage("+String.valueOf(intPageZs)+")'><font color='9194C9'>末页</font></a></td>";
   			}
   			strPageOut=strPageOut+"<td width=3></td>";
   			strPageOut=strPageOut+"<td width=50><input type='text' name='ipg' size=5 width=50 value='' onkeydown= 'if(event.keyCode==13) toTurnPage()'/></td>";
			strPageOut=strPageOut+"<td width=30 style='border:1px solid #CADCE8'><a href='#' onclick='toTurnPage()'><font color='9194C9'>跳转</font></a></td>";
   			strPageOut=strPageOut+"</td></tr>";
   			strPageOut="<table border=0 align=center>"+strPageOut+"</table><input type='text' style='display:none;' />";
   			strPageOut="<form name='frmTurnPage'>"+strPageOut+"</form>";
    	}
    	
    	return strPageOut;
    }
}
