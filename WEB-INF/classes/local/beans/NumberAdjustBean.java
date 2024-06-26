/**
 * NumberAdjustBean.java
 * Created by com.genesis.util.BeanCreator
 *         on 2022/10/28 11:51:52
 * @author Kevin Koo
 */
package local.beans;

import com.genesis.sql.*;

import java.util.*;

/**
 * JavaBean class for database table 'number_adjust'.
 */
public final class NumberAdjustBean implements java.io.Serializable {

    // Table name.
    private String _tableName = "number_adjust";

    // Fields variable definition.
    private String na_id             = "";
    private int    na_member         = 0;
    private int    na_apply          = 0;
    private int    na_learn          = 0;
    private int    na_highschool     = 0;
    private int    na_fiveyear       = 0;
    private int    na_university     = 0;
    private int    na_article        = 0;
    private int    na_video          = 0;
    private int    na_forest_login   = 0;
    private int    na_forest_anom    = 0;
    private int    na_brick_login    = 0;
    private int    na_brick_anom     = 0;
    private int    na_flower_login   = 0;
    private int    na_flower_anom    = 0;
    private int    na_build_login    = 0;
    private int    na_build_anom     = 0;
    private int    na_shipping_login = 0;
    private int    na_shipping_anom  = 0;
    private int    na_aircraft_login = 0;
    private int    na_aircraft_anom  = 0;
    private int    na_wisdom_login   = 0;
    private int    na_wisdom_anom    = 0;
    private int    na_dream_login    = 0;
    private int    na_dream_anom     = 0;
    private int    na_paradise_login = 0;
    private int    na_paradise_anom  = 0;
    private int    na_farming_login  = 0;
    private int    na_farming_anom   = 0;
    private int    na_fishing_login  = 0;
    private int    na_fishing_anom   = 0;
    private int    na_drone_login    = 0;
    private int    na_drone_anom     = 0;
    private int    na_imp1           = 0;
    private int    na_imp2           = 0;
    private int    na_imp3           = 0;
    private int    na_imp2_1         = 0;
    private int    na_imp2_2         = 0;
    private int    na_imp2_3         = 0;
    private int    na_news           = 0;
    private int    na_career         = 0;
    private int    na_activity       = 0;
    private int    na_technical      = 0;
    private int    na_contact        = 0;
    private int    na_showseq        = 0;
    private String na_emitdate       = "";
    private String na_restdate       = "";
    private String na_lang           = "";
    private String na_code           = "";
    private String na_createdate     = "";
    private String na_createuser     = "";
    private String na_modifydate     = "";
    private String na_modifyuser     = "";

    // Default constructor.
    public NumberAdjustBean() {}

    // Setters definitions
    public void setNa_id(String na_id) {
        this.na_id = na_id;
    }

    public void setNa_member(int na_member) {
        this.na_member = na_member;
    }

    public void setNa_apply(int na_apply) {
        this.na_apply = na_apply;
    }

    public void setNa_learn(int na_learn) {
        this.na_learn = na_learn;
    }

    public void setNa_highschool(int na_highschool) {
        this.na_highschool = na_highschool;
    }

    public void setNa_fiveyear(int na_fiveyear) {
        this.na_fiveyear = na_fiveyear;
    }

    public void setNa_university(int na_university) {
        this.na_university = na_university;
    }

    public void setNa_article(int na_article) {
        this.na_article = na_article;
    }

    public void setNa_video(int na_video) {
        this.na_video = na_video;
    }

    public void setNa_forest_login(int na_forest_login) {
        this.na_forest_login = na_forest_login;
    }

    public void setNa_forest_anom(int na_forest_anom) {
        this.na_forest_anom = na_forest_anom;
    }

    public void setNa_brick_login(int na_brick_login) {
        this.na_brick_login = na_brick_login;
    }

    public void setNa_brick_anom(int na_brick_anom) {
        this.na_brick_anom = na_brick_anom;
    }

    public void setNa_flower_login(int na_flower_login) {
        this.na_flower_login = na_flower_login;
    }

    public void setNa_flower_anom(int na_flower_anom) {
        this.na_flower_anom = na_flower_anom;
    }

    public void setNa_build_login(int na_build_login) {
        this.na_build_login = na_build_login;
    }

    public void setNa_build_anom(int na_build_anom) {
        this.na_build_anom = na_build_anom;
    }

    public void setNa_shipping_login(int na_shipping_login) {
        this.na_shipping_login = na_shipping_login;
    }

    public void setNa_shipping_anom(int na_shipping_anom) {
        this.na_shipping_anom = na_shipping_anom;
    }

    public void setNa_aircraft_login(int na_aircraft_login) {
        this.na_aircraft_login = na_aircraft_login;
    }

    public void setNa_aircraft_anom(int na_aircraft_anom) {
        this.na_aircraft_anom = na_aircraft_anom;
    }

    public void setNa_wisdom_login(int na_wisdom_login) {
        this.na_wisdom_login = na_wisdom_login;
    }

    public void setNa_wisdom_anom(int na_wisdom_anom) {
        this.na_wisdom_anom = na_wisdom_anom;
    }

    public void setNa_dream_login(int na_dream_login) {
        this.na_dream_login = na_dream_login;
    }

    public void setNa_dream_anom(int na_dream_anom) {
        this.na_dream_anom = na_dream_anom;
    }

    public void setNa_paradise_login(int na_paradise_login) {
        this.na_paradise_login = na_paradise_login;
    }

    public void setNa_paradise_anom(int na_paradise_anom) {
        this.na_paradise_anom = na_paradise_anom;
    }

    public void setNa_farming_login(int na_farming_login) {
        this.na_farming_login = na_farming_login;
    }

    public void setNa_farming_anom(int na_farming_anom) {
        this.na_farming_anom = na_farming_anom;
    }

    public void setNa_fishing_login(int na_fishing_login) {
        this.na_fishing_login = na_fishing_login;
    }

    public void setNa_fishing_anom(int na_fishing_anom) {
        this.na_fishing_anom = na_fishing_anom;
    }

    public void setNa_drone_login(int na_drone_login) {
        this.na_drone_login = na_drone_login;
    }

    public void setNa_drone_anom(int na_drone_anom) {
        this.na_drone_anom = na_drone_anom;
    }

    public void setNa_imp1(int na_imp1) {
        this.na_imp1 = na_imp1;
    }

    public void setNa_imp2(int na_imp2) {
        this.na_imp2 = na_imp2;
    }

    public void setNa_imp3(int na_imp3) {
        this.na_imp3 = na_imp3;
    }

    public void setNa_imp2_1(int na_imp2_1) {
        this.na_imp2_1 = na_imp2_1;
    }

    public void setNa_imp2_2(int na_imp2_2) {
        this.na_imp2_2 = na_imp2_2;
    }

    public void setNa_imp2_3(int na_imp2_3) {
        this.na_imp2_3 = na_imp2_3;
    }

    public void setNa_news(int na_news) {
        this.na_news = na_news;
    }

    public void setNa_career(int na_career) {
        this.na_career = na_career;
    }

    public void setNa_activity(int na_activity) {
        this.na_activity = na_activity;
    }

    public void setNa_technical(int na_technical) {
        this.na_technical = na_technical;
    }

    public void setNa_contact(int na_contact) {
        this.na_contact = na_contact;
    }

    public void setNa_showseq(int na_showseq) {
        this.na_showseq = na_showseq;
    }

    public void setNa_emitdate(String na_emitdate) {
        this.na_emitdate = na_emitdate;
    }

    public void setNa_restdate(String na_restdate) {
        this.na_restdate = na_restdate;
    }

    public void setNa_lang(String na_lang) {
        this.na_lang = na_lang;
    }

    public void setNa_code(String na_code) {
        this.na_code = na_code;
    }

    public void setNa_createdate(String na_createdate) {
        this.na_createdate = na_createdate;
    }

    public void setNa_createuser(String na_createuser) {
        this.na_createuser = na_createuser;
    }

    public void setNa_modifydate(String na_modifydate) {
        this.na_modifydate = na_modifydate;
    }

    public void setNa_modifyuser(String na_modifyuser) {
        this.na_modifyuser = na_modifyuser;
    }

    // Convert the fields name, type, value into a Vector.
    public Vector beanContent() {
        Vector content = new Vector();
        // Field names.
        content.add(_fnames);
        // Field java types.
        content.add(_ftypes);
        // Field values.
        Vector vc = new Vector();
        vc.add(na_id);
        vc.add(new Integer(na_member));
        vc.add(new Integer(na_apply));
        vc.add(new Integer(na_learn));
        vc.add(new Integer(na_highschool));
        vc.add(new Integer(na_fiveyear));
        vc.add(new Integer(na_university));
        vc.add(new Integer(na_article));
        vc.add(new Integer(na_video));
        vc.add(new Integer(na_forest_login));
        vc.add(new Integer(na_forest_anom));
        vc.add(new Integer(na_brick_login));
        vc.add(new Integer(na_brick_anom));
        vc.add(new Integer(na_flower_login));
        vc.add(new Integer(na_flower_anom));
        vc.add(new Integer(na_build_login));
        vc.add(new Integer(na_build_anom));
        vc.add(new Integer(na_shipping_login));
        vc.add(new Integer(na_shipping_anom));
        vc.add(new Integer(na_aircraft_login));
        vc.add(new Integer(na_aircraft_anom));
        vc.add(new Integer(na_wisdom_login));
        vc.add(new Integer(na_wisdom_anom));
        vc.add(new Integer(na_dream_login));
        vc.add(new Integer(na_dream_anom));
        vc.add(new Integer(na_paradise_login));
        vc.add(new Integer(na_paradise_anom));
        vc.add(new Integer(na_farming_login));
        vc.add(new Integer(na_farming_anom));
        vc.add(new Integer(na_fishing_login));
        vc.add(new Integer(na_fishing_anom));
        vc.add(new Integer(na_drone_login));
        vc.add(new Integer(na_drone_anom));
        vc.add(new Integer(na_imp1));
        vc.add(new Integer(na_imp2));
        vc.add(new Integer(na_imp3));
        vc.add(new Integer(na_imp2_1));
        vc.add(new Integer(na_imp2_2));
        vc.add(new Integer(na_imp2_3));
        vc.add(new Integer(na_news));
        vc.add(new Integer(na_career));
        vc.add(new Integer(na_activity));
        vc.add(new Integer(na_technical));
        vc.add(new Integer(na_contact));
        vc.add(new Integer(na_showseq));
        vc.add(na_emitdate);
        vc.add(na_restdate);
        vc.add(na_lang);
        vc.add(na_code);
        vc.add(na_createdate);
        vc.add(na_createuser);
        vc.add(na_modifydate);
        vc.add(na_modifyuser);
        content.add(vc);
        return content;
    }

    // Getters definitions
    public String getNa_id() {
        return na_id;
    }

    public int getNa_member() {
        return na_member;
    }

    public int getNa_apply() {
        return na_apply;
    }

    public int getNa_learn() {
        return na_learn;
    }

    public int getNa_highschool() {
        return na_highschool;
    }

    public int getNa_fiveyear() {
        return na_fiveyear;
    }

    public int getNa_university() {
        return na_university;
    }

    public int getNa_article() {
        return na_article;
    }

    public int getNa_video() {
        return na_video;
    }

    public int getNa_forest_login() {
        return na_forest_login;
    }

    public int getNa_forest_anom() {
        return na_forest_anom;
    }

    public int getNa_brick_login() {
        return na_brick_login;
    }

    public int getNa_brick_anom() {
        return na_brick_anom;
    }

    public int getNa_flower_login() {
        return na_flower_login;
    }

    public int getNa_flower_anom() {
        return na_flower_anom;
    }

    public int getNa_build_login() {
        return na_build_login;
    }

    public int getNa_build_anom() {
        return na_build_anom;
    }

    public int getNa_shipping_login() {
        return na_shipping_login;
    }

    public int getNa_shipping_anom() {
        return na_shipping_anom;
    }

    public int getNa_aircraft_login() {
        return na_aircraft_login;
    }

    public int getNa_aircraft_anom() {
        return na_aircraft_anom;
    }

    public int getNa_wisdom_login() {
        return na_wisdom_login;
    }

    public int getNa_wisdom_anom() {
        return na_wisdom_anom;
    }

    public int getNa_dream_login() {
        return na_dream_login;
    }

    public int getNa_dream_anom() {
        return na_dream_anom;
    }

    public int getNa_paradise_login() {
        return na_paradise_login;
    }

    public int getNa_paradise_anom() {
        return na_paradise_anom;
    }

    public int getNa_farming_login() {
        return na_farming_login;
    }

    public int getNa_farming_anom() {
        return na_farming_anom;
    }

    public int getNa_fishing_login() {
        return na_fishing_login;
    }

    public int getNa_fishing_anom() {
        return na_fishing_anom;
    }

    public int getNa_drone_login() {
        return na_drone_login;
    }

    public int getNa_drone_anom() {
        return na_drone_anom;
    }

    public int getNa_imp1() {
        return na_imp1;
    }

    public int getNa_imp2() {
        return na_imp2;
    }

    public int getNa_imp3() {
        return na_imp3;
    }

    public int getNa_imp2_1() {
        return na_imp2_1;
    }

    public int getNa_imp2_2() {
        return na_imp2_2;
    }

    public int getNa_imp2_3() {
        return na_imp2_3;
    }

    public int getNa_news() {
        return na_news;
    }

    public int getNa_career() {
        return na_career;
    }

    public int getNa_activity() {
        return na_activity;
    }

    public int getNa_technical() {
        return na_technical;
    }

    public int getNa_contact() {
        return na_contact;
    }

    public int getNa_showseq() {
        return na_showseq;
    }

    public String getNa_emitdate() {
        return na_emitdate;
    }

    public String getNa_restdate() {
        return na_restdate;
    }

    public String getNa_lang() {
        return na_lang;
    }

    public String getNa_code() {
        return na_code;
    }

    public String getNa_createdate() {
        return na_createdate;
    }

    public String getNa_createuser() {
        return na_createuser;
    }

    public String getNa_modifydate() {
        return na_modifydate;
    }

    public String getNa_modifyuser() {
        return na_modifyuser;
    }

    // Get the table's name.
    public String tableName() {
        return _tableName;
    }

    // The field names.
    private String[] _fnames = new String[] {
        "na_id", "na_member", "na_apply", "na_learn", 
        "na_highschool", "na_fiveyear", "na_university", "na_article", 
        "na_video", "na_forest_login", "na_forest_anom", "na_brick_login", 
        "na_brick_anom", "na_flower_login", "na_flower_anom", "na_build_login", 
        "na_build_anom", "na_shipping_login", "na_shipping_anom", "na_aircraft_login", 
        "na_aircraft_anom", "na_wisdom_login", "na_wisdom_anom", "na_dream_login", 
        "na_dream_anom", "na_paradise_login", "na_paradise_anom", "na_farming_login", 
        "na_farming_anom", "na_fishing_login", "na_fishing_anom", "na_drone_login", 
        "na_drone_anom", "na_imp1", "na_imp2", "na_imp3", 
        "na_imp2_1", "na_imp2_2", "na_imp2_3", "na_news", 
        "na_career", "na_activity", "na_technical", "na_contact", 
        "na_showseq", "na_emitdate", "na_restdate", "na_lang", 
        "na_code", "na_createdate", "na_createuser", "na_modifydate", 
        "na_modifyuser" };

    // The field java types.
    private String[] _ftypes = new String[] {
        "String", "int", "int", "int", "int", "int", "int", 
        "int", "int", "int", "int", "int", "int", "int", 
        "int", "int", "int", "int", "int", "int", "int", 
        "int", "int", "int", "int", "int", "int", "int", 
        "int", "int", "int", "int", "int", "int", "int", 
        "int", "int", "int", "int", "int", "int", "int", 
        "int", "int", "int", "String", "String", "String", "String", 
        "String", "String", "String", "String" };
}
