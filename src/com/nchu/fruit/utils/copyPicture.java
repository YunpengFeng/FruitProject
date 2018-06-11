package com.nchu.fruit.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;

/*
 * ͼƬ�ļ�����
 * @Author feng
 */
public class copyPicture {
	
	private final static String sourcepath="D:\\ImprotantPictures\\temp\\";
	private final static String targetpath="D:\\ImprotantPictures\\fruitImages\\";
	private final static String targetpath2="D:\\ImprotantPictures\\commentPictures\\";

	private PicturePath pp=new PicturePath();
	//删除所有的temp图片
	 public void del(String tagname){
		 File file =new File(sourcepath,tagname);
		 file.delete();
		 /*File files[] = file.listFiles();
		 for(File f :files){
			f.delete();
		 }*/
	 }
	 
	public void copy(int flag ,String picname,String rname){
		
		pp.setSourcePath(sourcepath);
		if(flag==1){
			pp.setTargetPath(targetpath);
		}
		if(flag==2){
			pp.setTargetPath(targetpath2);

		}
		BufferedInputStream bis=null;
		BufferedOutputStream bos=null;
		System.err.println(pp.getSourcePath()+picname);
		try {
			 bis =new BufferedInputStream(new FileInputStream(pp.getSourcePath()+picname));
			 bos =new BufferedOutputStream(new FileOutputStream(pp.getTargetPath()+rname));
			byte a[]=new byte[1024];
			int b=0;
			int i=0;
			try {
				while((b=bis.read())!=-1){
					a[i]=(byte) b;
					i++;
					if(i==1024){
						bos.write(a,0,i);
						bos.flush();
						i=0;
					}
					
				}
				bos.write(a,0,i);
				bos.flush();
				System.out.println("1111111成功");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println("失败");
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("失败哦");
		}finally {
			try {
				if(bos!=null)
					bos.close();
				if(bis!=null)
					bis.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}
		
}
