/**
 * VisitRecordBean.java
 * Created by com.genesis.util.BeanCreator
 *         on 2022/04/13 18:47:38
 * @author Kevin Koo
 */
package local.beans;

import com.genesis.sql.*;

import java.util.*;

/**
 * JavaBean class for database table 'visit_record'.
 */
public final class VisitRecordBean implements java.io.Serializable {

    // Table name.
    private String _tableName = "visit_record";

    // Fields variable definition.
    private String vr_id            = "";
    private String vr_no            = "";
    private String vr_title         = "";
    private String vr_year          = "";
    private String vr_month         = "";
    private String vr_upcategory    = "";
    private String vr_age           = "";
    private String vr_gender        = "";
    private String vr_group         = "";
    private String vr_town          = "";
    private String vr_record        = "";
    private String vr_info          = "";
    private int    vr_people        = 0;
    private String vr_category      = "";
    private String vr_content       = "";
    private String vr_display       = "";
    private int    vr_showseq       = 0;
    private String vr_emitdate      = "";
    private String vr_restdate      = "";
    private String vr_lang          = "";
    private String vr_code          = "";
    private String vr_robots        = "";
    private String vr_revisit_after = "";
    private String vr_keywords      = "";
    private String vr_description   = "";
    private String vr_copyright     = "";
    private String vr_seo_track     = "";
    private String vr_createdate    = "";
    private String vr_createuser    = "";
    private String vr_modifydate    = "";
    private String vr_modifyuser    = "";

    // Default constructor.
    public VisitRecordBean() {}

    // Setters definitions
    public void setVr_id(String vr_id) {
        this.vr_id = vr_id;
    }

    public void setVr_no(String vr_no) {
        this.vr_no = vr_no;
    }

    public void setVr_title(String vr_title) {
        this.vr_title = vr_title;
    }

    public void setVr_year(String vr_year) {
        this.vr_year = vr_year;
    }

    public void setVr_month(String vr_month) {
        this.vr_month = vr_month;
    }

    public void setVr_upcategory(String vr_upcategory) {
        this.vr_upcategory = vr_upcategory;
    }

    public void setVr_age(String vr_age) {
        this.vr_age = vr_age;
    }

    public void setVr_gender(String vr_gender) {
        this.vr_gender = vr_gender;
    }

    public void setVr_group(String vr_group) {
        this.vr_group = vr_group;
    }

    public void setVr_town(String vr_town) {
        this.vr_town = vr_town;
    }

    public void setVr_record(String vr_record) {
        this.vr_record = vr_record;
    }

    public void setVr_info(String vr_info) {
        this.vr_info = vr_info;
    }

    public void setVr_people(int vr_people) {
        this.vr_people = vr_people;
    }

    public void setVr_category(String vr_category) {
        this.vr_category = vr_category;
    }

    public void setVr_content(String vr_content) {
        this.vr_content = vr_content;
    }

    public void setVr_display(String vr_display) {
        this.vr_display = vr_display;
    }

    public void setVr_showseq(int vr_showseq) {
        this.vr_showseq = vr_showseq;
    }

    public void setVr_emitdate(String vr_emitdate) {
        this.vr_emitdate = vr_emitdate;
    }

    public void setVr_restdate(String vr_restdate) {
        this.vr_restdate = vr_restdate;
    }

    public void setVr_lang(String vr_lang) {
        this.vr_lang = vr_lang;
    }

    public void setVr_code(String vr_code) {
        this.vr_code = vr_code;
    }

    public void setVr_robots(String vr_robots) {
        this.vr_robots = vr_robots;
    }

    public void setVr_revisit_after(String vr_revisit_after) {
        this.vr_revisit_after = vr_revisit_after;
    }

    public void setVr_keywords(String vr_keywords) {
        this.vr_keywords = vr_keywords;
    }

    public void setVr_description(String vr_description) {
        this.vr_description = vr_description;
    }

    public void setVr_copyright(String vr_copyright) {
        this.vr_copyright = vr_copyright;
    }

    public void setVr_seo_track(String vr_seo_track) {
        this.vr_seo_track = vr_seo_track;
    }

    public void setVr_createdate(String vr_createdate) {
        this.vr_createdate = vr_createdate;
    }

    public void setVr_createuser(String vr_createuser) {
        this.vr_createuser = vr_createuser;
    }

    public void setVr_modifydate(String vr_modifydate) {
        this.vr_modifydate = vr_modifydate;
    }

    public void setVr_modifyuser(String vr_modifyuser) {
        this.vr_modifyuser = vr_modifyuser;
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
        vc.add(vr_id);
        vc.add(vr_no);
        vc.add(vr_title);
        vc.add(vr_year);
        vc.add(vr_month);
        vc.add(vr_upcategory);
        vc.add(vr_age);
        vc.add(vr_gender);
        vc.add(vr_group);
        vc.add(vr_town);
        vc.add(vr_record);
        vc.add(vr_info);
        vc.add(new Integer(vr_people));
        vc.add(vr_category);
        vc.add(vr_content);
        vc.add(vr_display);
        vc.add(new Integer(vr_showseq));
        vc.add(vr_emitdate);
        vc.add(vr_restdate);
        vc.add(vr_lang);
        vc.add(vr_code);
        vc.add(vr_robots);
        vc.add(vr_revisit_after);
        vc.add(vr_keywords);
        vc.add(vr_description);
        vc.add(vr_copyright);
        vc.add(vr_seo_track);
        vc.add(vr_createdate);
        vc.add(vr_createuser);
        vc.add(vr_modifydate);
        vc.add(vr_modifyuser);
        content.add(vc);
        return content;
    }

    // Getters definitions
    public String getVr_id() {
        return vr_id;
    }

    public String getVr_no() {
        return vr_no;
    }

    public String getVr_title() {
        return vr_title;
    }

    public String getVr_year() {
        return vr_year;
    }

    public String getVr_month() {
        return vr_month;
    }

    public String getVr_upcategory() {
        return vr_upcategory;
    }

    public String getVr_age() {
        return vr_age;
    }

    public String getVr_gender() {
        return vr_gender;
    }

    public String getVr_group() {
        return vr_group;
    }

    public String getVr_town() {
        return vr_town;
    }

    public String getVr_record() {
        return vr_record;
    }

    public String getVr_info() {
        return vr_info;
    }

    public int getVr_people() {
        return vr_people;
    }

    public String getVr_category() {
        return vr_category;
    }

    public String getVr_content() {
        return vr_content;
    }

    public String getVr_display() {
        return vr_display;
    }

    public int getVr_showseq() {
        return vr_showseq;
    }

    public String getVr_emitdate() {
        return vr_emitdate;
    }

    public String getVr_restdate() {
        return vr_restdate;
    }

    public String getVr_lang() {
        return vr_lang;
    }

    public String getVr_code() {
        return vr_code;
    }

    public String getVr_robots() {
        return vr_robots;
    }

    public String getVr_revisit_after() {
        return vr_revisit_after;
    }

    public String getVr_keywords() {
        return vr_keywords;
    }

    public String getVr_description() {
        return vr_description;
    }

    public String getVr_copyright() {
        return vr_copyright;
    }

    public String getVr_seo_track() {
        return vr_seo_track;
    }

    public String getVr_createdate() {
        return vr_createdate;
    }

    public String getVr_createuser() {
        return vr_createuser;
    }

    public String getVr_modifydate() {
        return vr_modifydate;
    }

    public String getVr_modifyuser() {
        return vr_modifyuser;
    }

    // Get the table's name.
    public String tableName() {
        return _tableName;
    }

    // The field names.
    private String[] _fnames = new String[] {
        "vr_id", "vr_no", "vr_title", "vr_year", 
        "vr_month", "vr_upcategory", "vr_age", "vr_gender", 
        "vr_group", "vr_town", "vr_record", "vr_info", 
        "vr_people", "vr_category", "vr_content", "vr_display", 
        "vr_showseq", "vr_emitdate", "vr_restdate", "vr_lang", 
        "vr_code", "vr_robots", "vr_revisit_after", "vr_keywords", 
        "vr_description", "vr_copyright", "vr_seo_track", "vr_createdate", 
        "vr_createuser", "vr_modifydate", "vr_modifyuser" };

    // The field java types.
    private String[] _ftypes = new String[] {
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "int", "String", 
        "String", "String", "int", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String" };
}
