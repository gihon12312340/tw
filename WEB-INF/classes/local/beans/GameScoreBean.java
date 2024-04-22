/**
 * GameScoreBean.java
 * Created by com.genesis.util.BeanCreator
 *         on 2022/10/28 11:51:52
 * @author Kevin Koo
 */
package local.beans;

import com.genesis.sql.*;

import java.util.*;

/**
 * JavaBean class for database table 'game_score'.
 */
public final class GameScoreBean implements java.io.Serializable {

    // Table name.
    private String _tableName = "game_score";

    // Fields variable definition.
    private String gs_id              = "";
    private String gs_no              = "";
    private String gs_account         = "";
    private String gs_name            = "";
    private String gs_recipe_id       = "";
    private int    gs_handwash_score  = 0;
    private String gs_handwash_id     = "";
    private String gs_image           = "";
    private int    gs_chicken_score   = 0;
    private int    gs_fish_score      = 0;
    private int    gs_fish_count      = 0;
    private int    gs_drone_score     = 0;
    private int    gs_drone_color     = 0;
    private int    gs_shipping_score1 = 0;
    private int    gs_shipping_score2 = 0;
    private int    gs_aircraft_score  = 0;
    private int    gs_paint_score     = 0;
    private int    gs_build_score1    = 0;
    private int    gs_build_score2    = 0;
    private int    gs_flower_score1   = 0;
    private int    gs_flower_score2   = 0;
    private int    gs_flower_score3   = 0;
    private String gs_flower_id       = "";
    private String gs_user_image      = "";
    private String gs_car_image       = "";
    private int    gs_brick_score     = 0;
    private int    gs_forest_score1   = 0;
    private int    gs_forest_score2   = 0;
    private int    gs_showseq         = 0;
    private String gs_lang            = "";
    private String gs_code            = "";
    private String gs_createdate      = "";
    private String gs_createuser      = "";
    private String gs_modifydate      = "";
    private String gs_modifyuser      = "";

    // Default constructor.
    public GameScoreBean() {}

    // Setters definitions
    public void setGs_id(String gs_id) {
        this.gs_id = gs_id;
    }

    public void setGs_no(String gs_no) {
        this.gs_no = gs_no;
    }

    public void setGs_account(String gs_account) {
        this.gs_account = gs_account;
    }

    public void setGs_name(String gs_name) {
        this.gs_name = gs_name;
    }

    public void setGs_recipe_id(String gs_recipe_id) {
        this.gs_recipe_id = gs_recipe_id;
    }

    public void setGs_handwash_score(int gs_handwash_score) {
        this.gs_handwash_score = gs_handwash_score;
    }

    public void setGs_handwash_id(String gs_handwash_id) {
        this.gs_handwash_id = gs_handwash_id;
    }

    public void setGs_image(String gs_image) {
        this.gs_image = gs_image;
    }

    public void setGs_chicken_score(int gs_chicken_score) {
        this.gs_chicken_score = gs_chicken_score;
    }

    public void setGs_fish_score(int gs_fish_score) {
        this.gs_fish_score = gs_fish_score;
    }

    public void setGs_fish_count(int gs_fish_count) {
        this.gs_fish_count = gs_fish_count;
    }

    public void setGs_drone_score(int gs_drone_score) {
        this.gs_drone_score = gs_drone_score;
    }

    public void setGs_drone_color(int gs_drone_color) {
        this.gs_drone_color = gs_drone_color;
    }

    public void setGs_shipping_score1(int gs_shipping_score1) {
        this.gs_shipping_score1 = gs_shipping_score1;
    }

    public void setGs_shipping_score2(int gs_shipping_score2) {
        this.gs_shipping_score2 = gs_shipping_score2;
    }

    public void setGs_aircraft_score(int gs_aircraft_score) {
        this.gs_aircraft_score = gs_aircraft_score;
    }

    public void setGs_paint_score(int gs_paint_score) {
        this.gs_paint_score = gs_paint_score;
    }

    public void setGs_build_score1(int gs_build_score1) {
        this.gs_build_score1 = gs_build_score1;
    }

    public void setGs_build_score2(int gs_build_score2) {
        this.gs_build_score2 = gs_build_score2;
    }

    public void setGs_flower_score1(int gs_flower_score1) {
        this.gs_flower_score1 = gs_flower_score1;
    }

    public void setGs_flower_score2(int gs_flower_score2) {
        this.gs_flower_score2 = gs_flower_score2;
    }

    public void setGs_flower_score3(int gs_flower_score3) {
        this.gs_flower_score3 = gs_flower_score3;
    }

    public void setGs_flower_id(String gs_flower_id) {
        this.gs_flower_id = gs_flower_id;
    }

    public void setGs_user_image(String gs_user_image) {
        this.gs_user_image = gs_user_image;
    }

    public void setGs_car_image(String gs_car_image) {
        this.gs_car_image = gs_car_image;
    }

    public void setGs_brick_score(int gs_brick_score) {
        this.gs_brick_score = gs_brick_score;
    }

    public void setGs_forest_score1(int gs_forest_score1) {
        this.gs_forest_score1 = gs_forest_score1;
    }

    public void setGs_forest_score2(int gs_forest_score2) {
        this.gs_forest_score2 = gs_forest_score2;
    }

    public void setGs_showseq(int gs_showseq) {
        this.gs_showseq = gs_showseq;
    }

    public void setGs_lang(String gs_lang) {
        this.gs_lang = gs_lang;
    }

    public void setGs_code(String gs_code) {
        this.gs_code = gs_code;
    }

    public void setGs_createdate(String gs_createdate) {
        this.gs_createdate = gs_createdate;
    }

    public void setGs_createuser(String gs_createuser) {
        this.gs_createuser = gs_createuser;
    }

    public void setGs_modifydate(String gs_modifydate) {
        this.gs_modifydate = gs_modifydate;
    }

    public void setGs_modifyuser(String gs_modifyuser) {
        this.gs_modifyuser = gs_modifyuser;
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
        vc.add(gs_id);
        vc.add(gs_no);
        vc.add(gs_account);
        vc.add(gs_name);
        vc.add(gs_recipe_id);
        vc.add(new Integer(gs_handwash_score));
        vc.add(gs_handwash_id);
        vc.add(gs_image);
        vc.add(new Integer(gs_chicken_score));
        vc.add(new Integer(gs_fish_score));
        vc.add(new Integer(gs_fish_count));
        vc.add(new Integer(gs_drone_score));
        vc.add(new Integer(gs_drone_color));
        vc.add(new Integer(gs_shipping_score1));
        vc.add(new Integer(gs_shipping_score2));
        vc.add(new Integer(gs_aircraft_score));
        vc.add(new Integer(gs_paint_score));
        vc.add(new Integer(gs_build_score1));
        vc.add(new Integer(gs_build_score2));
        vc.add(new Integer(gs_flower_score1));
        vc.add(new Integer(gs_flower_score2));
        vc.add(new Integer(gs_flower_score3));
        vc.add(gs_flower_id);
        vc.add(gs_user_image);
        vc.add(gs_car_image);
        vc.add(new Integer(gs_brick_score));
        vc.add(new Integer(gs_forest_score1));
        vc.add(new Integer(gs_forest_score2));
        vc.add(new Integer(gs_showseq));
        vc.add(gs_lang);
        vc.add(gs_code);
        vc.add(gs_createdate);
        vc.add(gs_createuser);
        vc.add(gs_modifydate);
        vc.add(gs_modifyuser);
        content.add(vc);
        return content;
    }

    // Getters definitions
    public String getGs_id() {
        return gs_id;
    }

    public String getGs_no() {
        return gs_no;
    }

    public String getGs_account() {
        return gs_account;
    }

    public String getGs_name() {
        return gs_name;
    }

    public String getGs_recipe_id() {
        return gs_recipe_id;
    }

    public int getGs_handwash_score() {
        return gs_handwash_score;
    }

    public String getGs_handwash_id() {
        return gs_handwash_id;
    }

    public String getGs_image() {
        return gs_image;
    }

    public int getGs_chicken_score() {
        return gs_chicken_score;
    }

    public int getGs_fish_score() {
        return gs_fish_score;
    }

    public int getGs_fish_count() {
        return gs_fish_count;
    }

    public int getGs_drone_score() {
        return gs_drone_score;
    }

    public int getGs_drone_color() {
        return gs_drone_color;
    }

    public int getGs_shipping_score1() {
        return gs_shipping_score1;
    }

    public int getGs_shipping_score2() {
        return gs_shipping_score2;
    }

    public int getGs_aircraft_score() {
        return gs_aircraft_score;
    }

    public int getGs_paint_score() {
        return gs_paint_score;
    }

    public int getGs_build_score1() {
        return gs_build_score1;
    }

    public int getGs_build_score2() {
        return gs_build_score2;
    }

    public int getGs_flower_score1() {
        return gs_flower_score1;
    }

    public int getGs_flower_score2() {
        return gs_flower_score2;
    }

    public int getGs_flower_score3() {
        return gs_flower_score3;
    }

    public String getGs_flower_id() {
        return gs_flower_id;
    }

    public String getGs_user_image() {
        return gs_user_image;
    }

    public String getGs_car_image() {
        return gs_car_image;
    }

    public int getGs_brick_score() {
        return gs_brick_score;
    }

    public int getGs_forest_score1() {
        return gs_forest_score1;
    }

    public int getGs_forest_score2() {
        return gs_forest_score2;
    }

    public int getGs_showseq() {
        return gs_showseq;
    }

    public String getGs_lang() {
        return gs_lang;
    }

    public String getGs_code() {
        return gs_code;
    }

    public String getGs_createdate() {
        return gs_createdate;
    }

    public String getGs_createuser() {
        return gs_createuser;
    }

    public String getGs_modifydate() {
        return gs_modifydate;
    }

    public String getGs_modifyuser() {
        return gs_modifyuser;
    }

    // Get the table's name.
    public String tableName() {
        return _tableName;
    }

    // The field names.
    private String[] _fnames = new String[] {
        "gs_id", "gs_no", "gs_account", "gs_name", 
        "gs_recipe_id", "gs_handwash_score", "gs_handwash_id", "gs_image", 
        "gs_chicken_score", "gs_fish_score", "gs_fish_count", "gs_drone_score", 
        "gs_drone_color", "gs_shipping_score1", "gs_shipping_score2", "gs_aircraft_score", 
        "gs_paint_score", "gs_build_score1", "gs_build_score2", "gs_flower_score1", 
        "gs_flower_score2", "gs_flower_score3", "gs_flower_id", "gs_user_image", 
        "gs_car_image", "gs_brick_score", "gs_forest_score1", "gs_forest_score2", 
        "gs_showseq", "gs_lang", "gs_code", "gs_createdate", 
        "gs_createuser", "gs_modifydate", "gs_modifyuser" };

    // The field java types.
    private String[] _ftypes = new String[] {
        "String", "String", "String", "String", "String", "int", "String", 
        "String", "int", "int", "int", "int", "int", "int", 
        "int", "int", "int", "int", "int", "int", "int", 
        "int", "String", "String", "String", "int", "int", "int", 
        "int", "String", "String", "String", "String", "String", "String" };
}
