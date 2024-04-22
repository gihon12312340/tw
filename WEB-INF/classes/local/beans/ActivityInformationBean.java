/**
 * ActivityInformationBean.java
 * Created by com.genesis.util.BeanCreator
 *         on 2022/04/19 16:13:28
 * @author Kevin Koo
 */
package local.beans;

import com.genesis.sql.*;

import java.util.*;

/**
 * JavaBean class for database table 'activity_information'.
 */
public final class ActivityInformationBean implements java.io.Serializable {

    // Table name.
    private String _tableName = "activity_information";

    // Fields variable definition.
    private String ai_id            = "";
    private String ai_no            = "";
    private String ai_title         = "";
    private String ai_desc          = "";
    private String ai_status        = "";
    private String ai_upcategory    = "";
    private String ai_category      = "";
    private String ai_content       = "";
    private String ai_image         = "";
    private String ai_mobile        = "";
    private String ai_file          = "";
    private String ai_alt           = "";
    private String ai_video         = "";
    private String ai_url           = "";
    private String ai_target        = "";
    private String ai_display       = "";
    private int    ai_showseq       = 0;
    private String ai_emitdate      = "";
    private String ai_restdate      = "";
    private String ai_lang          = "";
    private String ai_code          = "";
    private String ai_robots        = "";
    private String ai_revisit_after = "";
    private String ai_keywords      = "";
    private String ai_description   = "";
    private String ai_copyright     = "";
    private String ai_seo_track     = "";
    private String ai_createdate    = "";
    private String ai_createuser    = "";
    private String ai_modifydate    = "";
    private String ai_modifyuser    = "";

    // Default constructor.
    public ActivityInformationBean() {}

    // Setters definitions
    public void setAi_id(String ai_id) {
        this.ai_id = ai_id;
    }

    public void setAi_no(String ai_no) {
        this.ai_no = ai_no;
    }

    public void setAi_title(String ai_title) {
        this.ai_title = ai_title;
    }

    public void setAi_desc(String ai_desc) {
        this.ai_desc = ai_desc;
    }

    public void setAi_status(String ai_status) {
        this.ai_status = ai_status;
    }

    public void setAi_upcategory(String ai_upcategory) {
        this.ai_upcategory = ai_upcategory;
    }

    public void setAi_category(String ai_category) {
        this.ai_category = ai_category;
    }

    public void setAi_content(String ai_content) {
        this.ai_content = ai_content;
    }

    public void setAi_image(String ai_image) {
        this.ai_image = ai_image;
    }

    public void setAi_mobile(String ai_mobile) {
        this.ai_mobile = ai_mobile;
    }

    public void setAi_file(String ai_file) {
        this.ai_file = ai_file;
    }

    public void setAi_alt(String ai_alt) {
        this.ai_alt = ai_alt;
    }

    public void setAi_video(String ai_video) {
        this.ai_video = ai_video;
    }

    public void setAi_url(String ai_url) {
        this.ai_url = ai_url;
    }

    public void setAi_target(String ai_target) {
        this.ai_target = ai_target;
    }

    public void setAi_display(String ai_display) {
        this.ai_display = ai_display;
    }

    public void setAi_showseq(int ai_showseq) {
        this.ai_showseq = ai_showseq;
    }

    public void setAi_emitdate(String ai_emitdate) {
        this.ai_emitdate = ai_emitdate;
    }

    public void setAi_restdate(String ai_restdate) {
        this.ai_restdate = ai_restdate;
    }

    public void setAi_lang(String ai_lang) {
        this.ai_lang = ai_lang;
    }

    public void setAi_code(String ai_code) {
        this.ai_code = ai_code;
    }

    public void setAi_robots(String ai_robots) {
        this.ai_robots = ai_robots;
    }

    public void setAi_revisit_after(String ai_revisit_after) {
        this.ai_revisit_after = ai_revisit_after;
    }

    public void setAi_keywords(String ai_keywords) {
        this.ai_keywords = ai_keywords;
    }

    public void setAi_description(String ai_description) {
        this.ai_description = ai_description;
    }

    public void setAi_copyright(String ai_copyright) {
        this.ai_copyright = ai_copyright;
    }

    public void setAi_seo_track(String ai_seo_track) {
        this.ai_seo_track = ai_seo_track;
    }

    public void setAi_createdate(String ai_createdate) {
        this.ai_createdate = ai_createdate;
    }

    public void setAi_createuser(String ai_createuser) {
        this.ai_createuser = ai_createuser;
    }

    public void setAi_modifydate(String ai_modifydate) {
        this.ai_modifydate = ai_modifydate;
    }

    public void setAi_modifyuser(String ai_modifyuser) {
        this.ai_modifyuser = ai_modifyuser;
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
        vc.add(ai_id);
        vc.add(ai_no);
        vc.add(ai_title);
        vc.add(ai_desc);
        vc.add(ai_status);
        vc.add(ai_upcategory);
        vc.add(ai_category);
        vc.add(ai_content);
        vc.add(ai_image);
        vc.add(ai_mobile);
        vc.add(ai_file);
        vc.add(ai_alt);
        vc.add(ai_video);
        vc.add(ai_url);
        vc.add(ai_target);
        vc.add(ai_display);
        vc.add(new Integer(ai_showseq));
        vc.add(ai_emitdate);
        vc.add(ai_restdate);
        vc.add(ai_lang);
        vc.add(ai_code);
        vc.add(ai_robots);
        vc.add(ai_revisit_after);
        vc.add(ai_keywords);
        vc.add(ai_description);
        vc.add(ai_copyright);
        vc.add(ai_seo_track);
        vc.add(ai_createdate);
        vc.add(ai_createuser);
        vc.add(ai_modifydate);
        vc.add(ai_modifyuser);
        content.add(vc);
        return content;
    }

    // Getters definitions
    public String getAi_id() {
        return ai_id;
    }

    public String getAi_no() {
        return ai_no;
    }

    public String getAi_title() {
        return ai_title;
    }

    public String getAi_desc() {
        return ai_desc;
    }

    public String getAi_status() {
        return ai_status;
    }

    public String getAi_upcategory() {
        return ai_upcategory;
    }

    public String getAi_category() {
        return ai_category;
    }

    public String getAi_content() {
        return ai_content;
    }

    public String getAi_image() {
        return ai_image;
    }

    public String getAi_mobile() {
        return ai_mobile;
    }

    public String getAi_file() {
        return ai_file;
    }

    public String getAi_alt() {
        return ai_alt;
    }

    public String getAi_video() {
        return ai_video;
    }

    public String getAi_url() {
        return ai_url;
    }

    public String getAi_target() {
        return ai_target;
    }

    public String getAi_display() {
        return ai_display;
    }

    public int getAi_showseq() {
        return ai_showseq;
    }

    public String getAi_emitdate() {
        return ai_emitdate;
    }

    public String getAi_restdate() {
        return ai_restdate;
    }

    public String getAi_lang() {
        return ai_lang;
    }

    public String getAi_code() {
        return ai_code;
    }

    public String getAi_robots() {
        return ai_robots;
    }

    public String getAi_revisit_after() {
        return ai_revisit_after;
    }

    public String getAi_keywords() {
        return ai_keywords;
    }

    public String getAi_description() {
        return ai_description;
    }

    public String getAi_copyright() {
        return ai_copyright;
    }

    public String getAi_seo_track() {
        return ai_seo_track;
    }

    public String getAi_createdate() {
        return ai_createdate;
    }

    public String getAi_createuser() {
        return ai_createuser;
    }

    public String getAi_modifydate() {
        return ai_modifydate;
    }

    public String getAi_modifyuser() {
        return ai_modifyuser;
    }

    // Get the table's name.
    public String tableName() {
        return _tableName;
    }

    // The field names.
    private String[] _fnames = new String[] {
        "ai_id", "ai_no", "ai_title", "ai_desc", 
        "ai_status", "ai_upcategory", "ai_category", "ai_content", 
        "ai_image", "ai_mobile", "ai_file", "ai_alt", 
        "ai_video", "ai_url", "ai_target", "ai_display", 
        "ai_showseq", "ai_emitdate", "ai_restdate", "ai_lang", 
        "ai_code", "ai_robots", "ai_revisit_after", "ai_keywords", 
        "ai_description", "ai_copyright", "ai_seo_track", "ai_createdate", 
        "ai_createuser", "ai_modifydate", "ai_modifyuser" };

    // The field java types.
    private String[] _ftypes = new String[] {
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "int", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String" };
}
