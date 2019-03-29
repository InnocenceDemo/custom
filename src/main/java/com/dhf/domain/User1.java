package com.dhf.domain;

public class User1 {

    private Integer Id;
    private String name1;//手机号 不能为空
    private String pwd;//密码 不能为空
    private String image;//头像名
    private String nickName;//昵称
    private Integer role;//角色
    private Integer sex;//性别
    private String telephone;//手机号
    private Integer work;
    private String createTime;
    private String updateTime;

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public String getName1() {
        return name1;
    }

    public void setName1(String name1) {
        this.name1 = name1;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Integer getWork() {
        return work;
    }

    public void setWork(Integer work) {
        this.work = work;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public User1() {
    }

    public User1(Integer id, String name1, String pwd, String image, String nickName, Integer role, Integer sex, String telephone, Integer work, String createTime, String updateTime) {
        Id = id;
        this.name1 = name1;
        this.pwd = pwd;
        this.image = image;
        this.nickName = nickName;
        this.role = role;
        this.sex = sex;
        this.telephone = telephone;
        this.work = work;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "User1{" +
                "id=" + Id +
                ", name1='" + name1 + '\'' +
                ", pwd='" + pwd + '\'' +
                ", image='" + image + '\'' +
                ", nickName='" + nickName + '\'' +
                ", role=" + role +
                ", sex=" + sex +
                ", telephone='" + telephone + '\'' +
                ", work=" + work +
                ", createTime='" + createTime + '\'' +
                ", updateTime='" + updateTime + '\'' +
                '}';
    }
}
