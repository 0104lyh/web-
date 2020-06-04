package com.vo;

public class Classes {
	private int classId;
	private String className;
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public Classes(int classId, String className) {
		super();
		this.classId = classId;
		this.className = className;
	}
	@Override
	public String toString() {
		return "Classes [classId=" + classId + ", className=" + className + "]";
	}
	

}
