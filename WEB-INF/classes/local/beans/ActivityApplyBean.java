/**
 * ActivityApplyBean.java
 * Created by com.genesis.util.BeanCreator
 *         on 2022/04/19 16:13:28
 * @author Kevin Koo
 */
package local.beans;

import com.genesis.sql.*;

import java.util.*;

/**
 * JavaBean class for database table 'activity_apply'.
 */
public final class ActivityApplyBean implements java.io.Serializable {

    // Table name.
    private String _tableName = "activity_apply";

    // Fields variable definition.
    private String aa_id         = "";
    private String ai_id         = "";
    private String aa_name       = "";
    private String aa_phone      = "";
    private String aa_email      = "";
    private String aa_gender     = "";
    private String aa_county     = "";
    private String aa_city       = "";
    private String aa_zipcode    = "";
    private String aa_address    = "";
    private String aa_status     = "";
    private String cp_id         = "";
    private String aa_category   = "";
    private String aa_title      = "";
    private String aa_content    = "";
    private String aa_reply      = "";
    private String aa_code       = "";
    private String aa_lang       = "";
    private String aa_createdate = "";
    private String aa_createuser = "";
    private String aa_modifydate = "";
    private String aa_modifyuser = "";

    // Default constructor.
    public ActivityApplyBean() {}

    // Setters definitions
    public void setAa_id(String aa_id) {
        this.aa_id = aa_id;
    }

    public void setAi_id(String ai_id) {
        this.ai_id = ai_id;
    }

    public void setAa_name(String aa_name) {
        this.aa_name = aa_name;
    }

    public void setAa_phone(String aa_phone) {
        this.aa_phone = aa_phone;
    }

    public void setAa_email(String aa_email) {
        this.aa_email = aa_email;
    }

    public void setAa_gender(String aa_gender) {
        this.aa_gender = aa_gender;
    }

    public void setAa_county(String aa_county) {
        this.aa_county = aa_county;
    }

    public void setAa_city(String aa_city) {
        this.aa_city = aa_city;
    }

    public void setAa_zipcode(String aa_zipcode) {
        this.aa_zipcode = aa_zipcode;
    }

    public void setAa_address(String aa_address) {
        this.aa_address = aa_address;
    }

    public void setAa_status(String aa_status) {
        this.aa_status = aa_status;
    }

    public void setCp_id(String cp_id) {
        this.cp_id = cp_id;
    }

    public void setAa_category(String aa_category) {
        this.aa_category = aa_category;
    }

    public void setAa_title(String aa_title) {
        this.aa_title = aa_title;
    }

    public void setAa_content(String aa_content) {
        this.aa_content = aa_content;
    }

    public void setAa_reply(String aa_reply) {
        this.aa_reply = aa_reply;
    }

    public void setAa_code(String aa_code) {
        this.aa_code = aa_code;
    }

    public void setAa_lang(String aa_lang) {
        this.aa_lang = aa_lang;
    }

    public void setAa_createdate(String aa_createdate) {
        this.aa_createdate = aa_createdate;
    }

    public void setAa_createuser(String aa_createuser) {
        this.aa_createuser = aa_createuser;
    }

    public void setAa_modifydate(String aa_modifydate) {
        this.aa_modifydate = aa_modifydate;
    }

    public void setAa_modifyuser(String aa_modifyuser) {
        this.aa_modifyuser = aa_modifyuser;
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
        vc.add(aa_id);
        vc.add(ai_id);
        vc.add(aa_name);
        vc.add(aa_phone);
        vc.add(aa_email);
        vc.add(aa_gender);
        vc.add(aa_county);
        vc.add(aa_city);
        vc.add(aa_zipcode);
        vc.add(aa_address);
        vc.add(aa_status);
        vc.add(cp_id);
        vc.add(aa_category);
        vc.add(aa_title);
        vc.add(aa_content);
        vc.add(aa_reply);
        vc.add(aa_code);
        vc.add(aa_lang);
        vc.add(aa_createdate);
        vc.add(aa_createuser);
        vc.add(aa_modifydate);
        vc.add(aa_modifyuser);
        content.add(vc);
        return content;
    }

    // Getters definitions
    public String getAa_id() {
        return aa_id;
    }

    public String getAi_id() {
        return ai_id;
    }

    public String getAa_name() {
        return aa_name;
    }

    public String getAa_phone() {
        return aa_phone;
    }

    public String getAa_email() {
        return aa_email;
    }

    public String getAa_gender() {
        return aa_gender;
    }

    public String getAa_county() {
        return aa_county;
    }

    public String getAa_city() {
        return aa_city;
    }

    public String getAa_zipcode() {
        return aa_zipcode;
    }

    public String getAa_address() {
        return aa_address;
    }

    public String getAa_status() {
        return aa_status;
    }

    public String getCp_id() {
        return cp_id;
    }

    public String getAa_category() {
        return aa_category;
    }

    public String getAa_title() {
        return aa_title;
    }

    public String getAa_content() {
        return aa_content;
    }

    public String getAa_reply() {
        return aa_reply;
    }

    public String getAa_code() {
        return aa_code;
    }

    public String getAa_lang() {
        return aa_lang;
    }

    public String getAa_createdate() {
        return aa_createdate;
    }

    public String getAa_createuser() {
        return aa_createuser;
    }

    public String getAa_modifydate() {
        return aa_modifydate;
    }

    public String getAa_modifyuser() {
        return aa_modifyuser;
    }

    // Get the table's name.
    public String tableName() {
        return _tableName;
    }

    // The field names.
    private String[] _fnames = new String[] {
        "aa_id", "ai_id", "aa_name", "aa_phone", 
        "aa_email", "aa_gender", "aa_county", "aa_city", 
        "aa_zipcode", "aa_address", "aa_status", "cp_id", 
        "aa_category", "aa_title", "aa_content", "aa_reply", 
        "aa_code", "aa_lang", "aa_createdate", "aa_createuser", 
        "aa_modifydate", "aa_modifyuser" };

    // The field java types.
    private String[] _ftypes = new String[] {
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "String", "String", 
        "String" };
}
