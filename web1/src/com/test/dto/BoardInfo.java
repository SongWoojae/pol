package com.test.dto;

public class BoardInfo {
	private int binum;
	private String bititle;
	private String bicontent;
	private String bipwd;
	private String creusr;
	
	
	public int getBiNum(){
		return binum;
	}
	
	public void setBiNum(int binum){
		this.binum = binum;
	}
	public String getBiTitle(){
		return bititle;
	}
	public void setBiTitle(String bititle){
		this.bititle = bititle;
	}
	public String getBiContent(){
		return bicontent;
	}
	public void setBiContent(String bicontent){
		this.bicontent = bicontent;
	}
	public String getbipwd(){
		return bipwd;
	}
	public void setbipwd(String bipwd){
		this.bipwd = bipwd;
	}
	public String getcreusr(){
		return creusr;
	}
	public void setcreusr(String creusr){
		this.creusr = creusr;
	}	
	

}
