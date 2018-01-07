package com.help.entity;

/**
 * Created by Administrator on 2017/6/27 0027.
 */
public class Person {
    private int pid;
    private int identify;
    private int p_age;
    private String p_name;
    private String p_gender;
    private String p_race;
    private String p_hukou;
    private int p_homesum;
    private String p_workable;
    private String sta_name;
    private String p_marry;
    private String p_first;
    private String p_ill;
    private String p_trade;
    private int p_phone;
    private String p_adress;
    private float p_monery;
    private String p_agree;
    private String p_towm_monery;
    private String p_xian_monery;
    private String p_person_monery;
    private String p_shifaqianren;
    private String p_issendmonery;
    private String why;
    private int sta_id;
    private int wid;

    @Override
    public String toString() {
        return "Person{" +
                "pid=" + pid +
                ", identify=" + identify +
                ", p_age=" + p_age +
                ", p_name='" + p_name + '\'' +
                ", p_gender='" + p_gender + '\'' +
                ", p_race='" + p_race + '\'' +
                ", p_hukou='" + p_hukou + '\'' +
                ", p_homesum=" + p_homesum +
                ", p_workable='" + p_workable + '\'' +
                ", sta_name='" + sta_name + '\'' +
                ", p_marry='" + p_marry + '\'' +
                ", p_first='" + p_first + '\'' +
                ", p_ill='" + p_ill + '\'' +
                ", p_trade='" + p_trade + '\'' +
                ", p_phone=" + p_phone +
                ", p_adress='" + p_adress + '\'' +
                ", p_monery=" + p_monery +
                ", p_agree='" + p_agree + '\'' +
                ", p_towm_monery='" + p_towm_monery + '\'' +
                ", p_xian_monery='" + p_xian_monery + '\'' +
                ", p_person_monery='" + p_person_monery + '\'' +
                ", p_shifaqianren='" + p_shifaqianren + '\'' +
                ", p_issendmonery='" + p_issendmonery + '\'' +
                ", why='" + why + '\'' +
                ", sta_id=" + sta_id +
                ", wid=" + wid +
                '}';
    }

    public Person(int pid, int identify, int p_age, String p_name, String p_gender, String p_race, String p_hukou, int p_homesum, String p_workable, String sta_name, String p_marry, String p_first, String p_ill, String p_trade, int p_phone, String p_adress, float p_monery, String p_agree, String p_towm_monery, String p_xian_monery, String p_person_monery, String p_shifaqianren, String p_issendmonery, String why, int sta_id, int wid) {
        this.pid = pid;
        this.identify = identify;
        this.p_age = p_age;
        this.p_name = p_name;
        this.p_gender = p_gender;
        this.p_race = p_race;
        this.p_hukou = p_hukou;
        this.p_homesum = p_homesum;
        this.p_workable = p_workable;
        this.sta_name = sta_name;
        this.p_marry = p_marry;
        this.p_first = p_first;
        this.p_ill = p_ill;
        this.p_trade = p_trade;
        this.p_phone = p_phone;
        this.p_adress = p_adress;
        this.p_monery = p_monery;
        this.p_agree = p_agree;
        this.p_towm_monery = p_towm_monery;
        this.p_xian_monery = p_xian_monery;
        this.p_person_monery = p_person_monery;
        this.p_shifaqianren = p_shifaqianren;
        this.p_issendmonery = p_issendmonery;
        this.why = why;
        this.sta_id = sta_id;
        this.wid = wid;
    }

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public int getSta_id() {
        return sta_id;
    }

    public void setSta_id(int sta_id) {
        this.sta_id = sta_id;
    }

    public String getWhy() {
        return why;
    }

    public void setWhy(String why) {
        this.why = why;
    }

    public Person() {
        super();
    }

    public Person(int pid, int p_age, String p_name, String p_gender, String p_race,
                  String p_hukou, int p_homesum, String p_workable, String sta_name,
                  String p_marry) {
        this.pid = pid;
        this.p_age = p_age;
        this.p_name = p_name;
        this.p_gender = p_gender;
        this.p_race = p_race;
        this.p_hukou = p_hukou;
        this.p_homesum = p_homesum;
        this.p_workable = p_workable;
        this.sta_name = sta_name;
        this.p_marry = p_marry;
    }

    public Person(int identify, int p_age, String p_name, String p_gender, String p_race, String p_hukou, int p_homesum, String p_workable, String p_marry, String p_first, String p_ill, String p_trade, int p_phone, String p_adress) {
        this.identify = identify;
        this.p_age = p_age;
        this.p_name = p_name;
        this.p_gender = p_gender;
        this.p_race = p_race;
        this.p_hukou = p_hukou;
        this.p_homesum = p_homesum;
        this.p_workable = p_workable;
        this.p_marry = p_marry;
        this.p_first = p_first;
        this.p_ill = p_ill;
        this.p_trade = p_trade;
        this.p_phone = p_phone;
        this.p_adress = p_adress;
    }

    public Person(int pid, int identify, int p_age, String p_name, String p_gender,
                  String p_race, String p_hukou, int p_homesum, String p_workable,
                  String sta_name, String p_marry, String p_first, String p_ill,
                  String p_trade, int p_phone, String p_adress, float p_monery,
                  String p_agree, String p_towm_monery, String p_xian_monery,
                  String p_person_monery, String p_shifaqianren, String p_issendmonery) {
        this.pid = pid;
        this.identify = identify;
        this.p_age = p_age;
        this.p_name = p_name;
        this.p_gender = p_gender;
        this.p_race = p_race;
        this.p_hukou = p_hukou;
        this.p_homesum = p_homesum;
        this.p_workable = p_workable;
        this.sta_name = sta_name;
        this.p_marry = p_marry;
        this.p_first = p_first;
        this.p_ill = p_ill;
        this.p_trade = p_trade;
        this.p_phone = p_phone;
        this.p_adress = p_adress;
        this.p_monery = p_monery;
        this.p_agree = p_agree;
        this.p_towm_monery = p_towm_monery;
        this.p_xian_monery = p_xian_monery;
        this.p_person_monery = p_person_monery;
        this.p_shifaqianren = p_shifaqianren;
        this.p_issendmonery = p_issendmonery;

    }

    public String getSta_name() {
        return sta_name;
    }

    public void setSta_name(String sta_name) {
        this.sta_name = sta_name;
    }

    public int getP_age() {
        return p_age;
    }

    public void setP_age(int p_age) {
        this.p_age = p_age;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getIdentify() {
        return identify;
    }

    public void setIdentify(int identify) {
        this.identify = identify;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_gender() {
        return p_gender;
    }

    public void setP_gender(String p_gender) {
        this.p_gender = p_gender;
    }

    public String getP_race() {
        return p_race;
    }

    public void setP_race(String p_race) {
        this.p_race = p_race;
    }

    public String getP_hukou() {
        return p_hukou;
    }

    public void setP_hukou(String p_hukou) {
        this.p_hukou = p_hukou;
    }

    public int getP_homesum() {
        return p_homesum;
    }

    public void setP_homesum(int p_homesum) {
        this.p_homesum = p_homesum;
    }

    public String getP_workable() {
        return p_workable;
    }

    public void setP_workable(String p_workable) {
        this.p_workable = p_workable;
    }

    public String getP_marry() {
        return p_marry;
    }

    public void setP_marry(String p_marry) {
        this.p_marry = p_marry;
    }

    public String getP_first() {
        return p_first;
    }

    public void setP_first(String p_first) {
        this.p_first = p_first;
    }

    public String getP_ill() {
        return p_ill;
    }

    public void setP_ill(String p_ill) {
        this.p_ill = p_ill;
    }

    public String getP_trade() {
        return p_trade;
    }

    public void setP_trade(String p_trade) {
        this.p_trade = p_trade;
    }

    public int getP_phone() {
        return p_phone;
    }

    public void setP_phone(int p_phone) {
        this.p_phone = p_phone;
    }

    public String getP_adress() {
        return p_adress;
    }

    public void setP_adress(String p_adress) {
        this.p_adress = p_adress;
    }

    public float getP_monery() {
        return p_monery;
    }

    public void setP_monery(float p_monery) {
        this.p_monery = p_monery;
    }

    public String getP_agree() {
        return p_agree;
    }

    public void setP_agree(String p_agree) {
        this.p_agree = p_agree;
    }

    public String getP_towm_monery() {
        return p_towm_monery;
    }

    public void setP_towm_monery(String p_towm_monery) {
        this.p_towm_monery = p_towm_monery;
    }

    public String getP_xian_monery() {
        return p_xian_monery;
    }

    public void setP_xian_monery(String p_xian_monery) {
        this.p_xian_monery = p_xian_monery;
    }

    public String getP_person_monery() {
        return p_person_monery;
    }

    public void setP_person_monery(String p_person_monery) {
        this.p_person_monery = p_person_monery;
    }

    public String getP_shifaqianren() {
        return p_shifaqianren;
    }

    public void setP_shifaqianren(String p_shifaqianren) {
        this.p_shifaqianren = p_shifaqianren;
    }

    public String getP_issendmonery() {
        return p_issendmonery;
    }

    public void setP_issendmonery(String p_issendmonery) {
        this.p_issendmonery = p_issendmonery;
    }
}
