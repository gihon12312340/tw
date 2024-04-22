/**
 * NewsProfileBean.java
 * Created by com.genesis.util.BeanCreator
 *         on 2022/06/06 14:14:45
 * @author Kevin Koo
 */
package local.beans;

import com.genesis.sql.*;

import java.util.*;

/**
 * JavaBean class for database table 'news_profile'.
 */
public final class NewsProfileBean implements java.io.Serializable {

    // Table name.
    private String _tableName = "news_profile";

    // Fields variable definition.
    private String np_id             = "";
    private String np_no             = "";
    private String np_title          = "";
    private String np_status         = "";
    private String np_desc           = "";
    private String np_upcategory     = "";
    private String np_category       = "";
    private String np_content        = "";
    private String np_class_date     = "";
    private String np_class_enddate  = "";
    private String np_class_time     = "";
    private String np_class_local    = "";
    private String np_teacher        = "";
    private String np_event_category = "";
    private String np_service_unit   = "";
    private String np_active         = "";
    private String np_contact_preson = "";
    private String np_contact        = "";
    private String np_apply          = "";
    private String np_file_link      = "";
    private String np_file_name      = "";
    private String np_image          = "";
    private String np_mobile         = "";
    private String np_file           = "";
    private String np_alt            = "";
    private String np_url            = "";
    private String np_target         = "";
    private String np_display        = "";
    private int    np_showseq        = 0;
    private String np_emitdate       = "";
    private String np_restdate       = "";
    private String np_lang           = "";
    private String np_code           = "";
    private String np_robots         = "";
    private String np_revisit_after  = "";
    private String np_keywords       = "";
    private String np_description    = "";
    private String np_copyright      = "";
    private String np_seo_track      = "";
    private int    np_click          = 0;
    private String np_createdate     = "";
    private String np_createuser     = "";
    private String np_modifydate     = "";
    private String np_modifyuser     = "";

    // Default constructor.
    public NewsProfileBean() {}

    // Setters definitions
    public void setNp_id(String np_id) {
        this.np_id = np_id;
    }

    public void setNp_no(String np_no) {
        this.np_no = np_no;
    }

    public void setNp_title(String np_title) {
        this.np_title = np_title;
    }

    public void setNp_status(String np_status) {
        this.np_status = np_status;
    }

    public void setNp_desc(String np_desc) {
        this.np_desc = np_desc;
    }

    public void setNp_upcategory(String np_upcategory) {
        this.np_upcategory = np_upcategory;
    }

    public void setNp_category(String np_category) {
        this.np_category = np_category;
    }

    public void setNp_content(String np_content) {
        this.np_content = np_content;
    }

    public void setNp_class_date(String np_class_date) {
        this.np_class_date = np_class_date;
    }

    public void setNp_class_enddate(String np_class_enddate) {
        this.np_class_enddate = np_class_enddate;
    }

    public void setNp_class_time(String np_class_time) {
        this.np_class_time = np_class_time;
    }

    public void setNp_class_local(String np_class_local) {
        this.np_class_local = np_class_local;
    }

    public void setNp_teacher(String np_teacher) {
        this.np_teacher = np_teacher;
    }

    public void setNp_event_category(String np_event_category) {
        this.np_event_category = np_event_category;
    }

    public void setNp_service_unit(String np_service_unit) {
        this.np_service_unit = np_service_unit;
    }

    public void setNp_active(String np_active) {
        this.np_active = np_active;
    }

    public void setNp_contact_preson(String np_contact_preson) {
        this.np_contact_preson = np_contact_preson;
    }

    public void setNp_contact(String np_contact) {
        this.np_contact = np_contact;
    }

    public void setNp_apply(String np_apply) {
        this.np_apply = np_apply;
    }

    public void setNp_file_link(String np_file_link) {
        this.np_file_link = np_file_link;
    }

    public void setNp_file_name(String np_file_name) {
        this.np_file_name = np_file_name;
    }

    public void setNp_image(String np_image) {
        this.np_image = np_image;
    }

    public void setNp_mobile(String np_mobile) {
        this.np_mobile = np_mobile;
    }

    public void setNp_file(String np_file) {
        this.np_file = np_file;
    }

    public void setNp_alt(String np_alt) {
        this.np_alt = np_alt;
    }

    public void setNp_url(String np_url) {
        this.np_url = np_url;
    }

    public void setNp_target(String np_target) {
        this.np_target = np_target;
    }

    public void setNp_display(String np_display) {
        this.np_display = np_display;
    }

    public void setNp_showseq(int np_showseq) {
        this.np_showseq = np_showseq;
    }

    public void setNp_emitdate(String np_emitdate) {
        this.np_emitdate = np_emitdate;
    }

    public void setNp_restdate(String np_restdate) {
        this.np_restdate = np_restdate;
    }

    public void setNp_lang(String np_lang) {
        this.np_lang = np_lang;
    }

    public void setNp_code(String np_code) {
        this.np_code = np_code;
    }

    public void setNp_robots(String np_robots) {
        this.np_robots = np_robots;
    }

    public void setNp_revisit_after(String np_revisit_after) {
        this.np_revisit_after = np_revisit_after;
    }

    public void setNp_keywords(String np_keywords) {
        this.np_keywords = np_keywords;
    }

    public void setNp_description(String np_description) {
        this.np_description = np_description;
    }

    public void setNp_copyright(String np_copyright) {
        this.np_copyright = np_copyright;
    }

    public void setNp_seo_track(String np_seo_track) {
        this.np_seo_track = np_seo_track;
    }

    public void setNp_click(int np_click) {
        this.np_click = np_click;
    }

    public void setNp_createdate(String np_createdate) {
        this.np_createdate = np_createdate;
    }

    public void setNp_createuser(String np_createuser) {
        this.np_createuser = np_createuser;
    }

    public void setNp_modifydate(String np_modifydate) {
        this.np_modifydate = np_modifydate;
    }

    public void setNp_modifyuser(String np_modifyuser) {
        this.np_modifyuser = np_modifyuser;
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
        vc.add(np_id);
        vc.add(np_no);
        vc.add(np_title);
        vc.add(np_status);
        vc.add(np_desc);
        vc.add(np_upcategory);
        vc.add(np_category);
        vc.add(np_content);
        vc.add(np_class_date);
        vc.add(np_class_enddate);
        vc.add(np_class_time);
        vc.add(np_class_local);
        vc.add(np_teacher);
        vc.add(np_event_category);
        vc.add(np_service_unit);
        vc.add(np_active);
        vc.add(np_contact_preson);
        vc.add(np_contact);
        vc.add(np_apply);
        vc.add(np_file_link);
        vc.add(np_file_name);
        vc.add(np_image);
        vc.add(np_mobile);
        vc.add(np_file);
        vc.add(np_alt);
        vc.add(np_url);
        vc.add(np_target);
        vc.add(np_display);
        vc.add(new Integer(np_showseq));
        vc.add(np_emitdate);
        vc.add(np_restdate);
        vc.add(np_lang);
        vc.add(np_code);
        vc.add(np_robots);
        vc.add(np_revisit_after);
        vc.add(np_keywords);
        vc.add(np_description);
        vc.add(np_copyright);
        vc.add(np_seo_track);
        vc.add(new Integer(np_click));
        vc.add(np_createdate);
        vc.add(np_createuser);
        vc.add(np_modifydate);
        vc.add(np_modifyuser);
        content.add(vc);
        return content;
    }

    // Getters definitions
    public String getNp_id() {
        return np_id;
    }

    public String getNp_no() {
        return np_no;
    }

    public String getNp_title() {
        return np_title;
    }

    public String getNp_status() {
        return np_status;
    }

    public String getNp_desc() {
        return np_desc;
    }

    public String getNp_upcategory() {
        return np_upcategory;
    }

    public String getNp_category() {
        return np_category;
    }

    public String getNp_content() {
        return np_content;
    }

    public String getNp_class_date() {
        return np_class_date;
    }

    public String getNp_class_enddate() {
        return np_class_enddate;
    }

    public String getNp_class_time() {
        return np_class_time;
    }

    public String getNp_class_local() {
        return np_class_local;
    }

    public String getNp_teacher() {
        return np_teacher;
    }

    public String getNp_event_category() {
        return np_event_category;
    }

    public String getNp_service_unit() {
        return np_service_unit;
    }

    public String getNp_active() {
        return np_active;
    }

    public String getNp_contact_preson() {
        return np_contact_preson;
    }

    public String getNp_contact() {
        return np_contact;
    }

    public String getNp_apply() {
        return np_apply;
    }

    public String getNp_file_link() {
        return np_file_link;
    }

    public String getNp_file_name() {
        return np_file_name;
    }

    public String getNp_image() {
        return np_image;
    }

    public String getNp_mobile() {
        return np_mobile;
    }

    public String getNp_file() {
        return np_file;
    }

    public String getNp_alt() {
        return np_alt;
    }

    public String getNp_url() {
        return np_url;
    }

    public String getNp_target() {
        return np_target;
    }

    public String getNp_display() {
        return np_display;
    }

    public int getNp_showseq() {
        return np_showseq;
    }

    public String getNp_emitdate() {
        return np_emitdate;
    }

    public String getNp_restdate() {
        return np_restdate;
    }

    public String getNp_lang() {
        return np_lang;
    }

    public String getNp_code() {
        return np_code;
    }

    public String getNp_robots() {
        return np_robots;
    }

    public String getNp_revisit_after() {
        return np_revisit_after;
    }

    public String getNp_keywords() {
        return np_keywords;
    }

    public String getNp_description() {
        return np_description;
    }

    public String getNp_copyright() {
        return np_copyright;
    }

    public String getNp_seo_track() {
        return np_seo_track;
    }

    public int getNp_click() {
        return np_click;
    }

    public String getNp_createdate() {
        return np_createdate;
    }

    public String getNp_createuser() {
        return np_createuser;
    }

    public String getNp_modifydate() {
        return np_modifydate;
    }

    public String getNp_modifyuser() {
        return np_modifyuser;
    }

    // Get the table's name.
    public String tableName() {
        return _tableName;
    }

    // The field names.
    private String[] _fnames = new String[] {
        "np_id", "np_no", "np_title", "np_status", 
        "np_desc", "np_upcategory", "np_category", "np_content", 
        "np_class_date", "np_class_enddate", "np_class_time", "np_class_local", 
        "np_teacher", "np_event_category", "np_service_unit", "np_active", 
        "np_contact_preson", "np_contact", "np_apply", "np_file_link", 
        "np_file_name", "np_image", "np_mobile", "np_file", 
        "np_alt", "np_url", "np_target", "np_display", 
        "np_showseq", "np_emitdate", "np_restdate", "np_lang", 
        "np_code", "np_robots", "np_revisit_after", "np_keywords", 
        "np_description", "np_copyright", "np_seo_track", "np_click", 
        "np_createdate", "np_createuser", "np_modifydate", "np_modifyuser" };

    // The field java types.
    private String[] _ftypes = new String[] {
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "String", "String", 
        "int", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "int", "String", "String", 
        "String", "String" };
}
