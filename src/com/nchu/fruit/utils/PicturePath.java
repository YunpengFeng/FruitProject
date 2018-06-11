package com.nchu.fruit.utils;

public class PicturePath {
	
	private String sourcePath; //Դ�ļ���·��
	private String targetPath;//Ŀ���ļ�·��
	private String[] picName;  //ͼƬ����
	
	public String getSourcePath() {
		return sourcePath;
	}
	public String getTargetPath() {
		return targetPath;
	}
	public void setTargetPath(String targetPath) {
		this.targetPath = targetPath;
	}
	public String[] getPicName() {
		return picName;
	}
	public void setPicName(String[] picName) {
		this.picName = picName;
	}
	public void setSourcePath(String sourcePath) {
		this.sourcePath = sourcePath;
	}
}
