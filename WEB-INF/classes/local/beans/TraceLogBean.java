/**
 * TraceLogBean.java
 * Created by com.genesis.util.BeanCreator
 *         on 2022/03/18 17:55:45
 * @author Kevin Koo
 */
package local.beans;

import com.genesis.sql.*;

import java.util.*;

/**
 * JavaBean class for database table 'trace_log'.
 */
public final class TraceLogBean implements java.io.Serializable {

    // Table name.
    private String _tableName = "trace_log";

    // Fields variable definition.
    private String tl_id         = "";
    private String at_id         = "";
    private String tl_ip         = "";
    private String tl_location   = "";
    private String tl_pagecode   = "";
    private String tl_time       = "";
    private String tl_device     = "";
    private String tl_country    = "";
    private String tl_memo       = "";
    private String tl_maccode    = "";
    private String tl_code       = "";
    private String tl_createdate = "";
    private String tl_createuser = "";
    private String tl_modifydate = "";
    private String tl_modifyuser = "";

    // Default constructor.
    public TraceLogBean() {}

    // Setters definitions
    public void setTl_id(String tl_id) {
        this.tl_id = tl_id;
    }

    public void setAt_id(String at_id) {
        this.at_id = at_id;
    }

    public void setTl_ip(String tl_ip) {
        this.tl_ip = tl_ip;
    }

    public void setTl_location(String tl_location) {
        this.tl_location = tl_location;
    }

    public void setTl_pagecode(String tl_pagecode) {
        this.tl_pagecode = tl_pagecode;
    }

    public void setTl_time(String tl_time) {
        this.tl_time = tl_time;
    }

    public void setTl_device(String tl_device) {
        this.tl_device = tl_device;
    }

    public void setTl_country(String tl_country) {
        this.tl_country = tl_country;
    }

    public void setTl_memo(String tl_memo) {
        this.tl_memo = tl_memo;
    }

    public void setTl_maccode(String tl_maccode) {
        this.tl_maccode = tl_maccode;
    }

    public void setTl_code(String tl_code) {
        this.tl_code = tl_code;
    }

    public void setTl_createdate(String tl_createdate) {
        this.tl_createdate = tl_createdate;
    }

    public void setTl_createuser(String tl_createuser) {
        this.tl_createuser = tl_createuser;
    }

    public void setTl_modifydate(String tl_modifydate) {
        this.tl_modifydate = tl_modifydate;
    }

    public void setTl_modifyuser(String tl_modifyuser) {
        this.tl_modifyuser = tl_modifyuser;
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
        vc.add(tl_id);
        vc.add(at_id);
        vc.add(tl_ip);
        vc.add(tl_location);
        vc.add(tl_pagecode);
        vc.add(tl_time);
        vc.add(tl_device);
        vc.add(tl_country);
        vc.add(tl_memo);
        vc.add(tl_maccode);
        vc.add(tl_code);
        vc.add(tl_createdate);
        vc.add(tl_createuser);
        vc.add(tl_modifydate);
        vc.add(tl_modifyuser);
        content.add(vc);
        return content;
    }

    // Getters definitions
    public String getTl_id() {
        return tl_id;
    }

    public String getAt_id() {
        return at_id;
    }

    public String getTl_ip() {
        return tl_ip;
    }

    public String getTl_location() {
        return tl_location;
    }

    public String getTl_pagecode() {
        return tl_pagecode;
    }

    public String getTl_time() {
        return tl_time;
    }

    public String getTl_device() {
        return tl_device;
    }

    public String getTl_country() {
        return tl_country;
    }

    public String getTl_memo() {
        return tl_memo;
    }

    public String getTl_maccode() {
        return tl_maccode;
    }

    public String getTl_code() {
        return tl_code;
    }

    public String getTl_createdate() {
        return tl_createdate;
    }

    public String getTl_createuser() {
        return tl_createuser;
    }

    public String getTl_modifydate() {
        return tl_modifydate;
    }

    public String getTl_modifyuser() {
        return tl_modifyuser;
    }

    // Get the table's name.
    public String tableName() {
        return _tableName;
    }

    // The field names.
    private String[] _fnames = new String[] {
        "tl_id", "at_id", "tl_ip", "tl_location", 
        "tl_pagecode", "tl_time", "tl_device", "tl_country", 
        "tl_memo", "tl_maccode", "tl_code", "tl_createdate", 
        "tl_createuser", "tl_modifydate", "tl_modifyuser" };

    // The field java types.
    private String[] _ftypes = new String[] {
        "String", "String", "String", "String", "String", "String", "String", 
        "String", "String", "String", "String", "String", "String", "String", 
        "String" };
}
