(function () {
  var e = {
      4635: function (e, i, t) {
        "use strict";
        var o = t(9242),
          s = t(3396);
        const n = { ref: "capture", id: "capture", class: "image-content" },
          l = {
            class: "content",
            ref: "addImage",
            id: "addImage",
            style: { display: "none" },
          };
        function a(e, i, t, a, c, r) {
          const d = (0, s.up)("rightmenu"),
            h = (0, s.up)("login"),
            x = (0, s.up)("getlion"),
            b = (0, s.up)("question"),
            p = (0, s.up)("introducePage"),
            f = (0, s.up)("gamescene"),
            u = (0, s.up)("settingpage"),
            _ = (0, s.up)("faqpage"),
            w = (0, s.up)("servicenprivacy"),
            v = (0, s.up)("informpage"),
            m = (0, s.up)("friendshippage"),
            g = (0, s.up)("giftboxpage"),
            k = (0, s.up)("sharepage"),
            y = (0, s.up)("mobileh"),
            C = (0, s.up)("windowh");
          return (
            (0, s.wg)(),
            (0, s.iD)(
              s.HY,
              null,
              [
                (0, s.Wm)(
                  d,
                  {
                    ref: "rightmenu",
                    onSetting_btn: i[0] || (i[0] = (e) => r.settingbtnfun(e)),
                    onInfo_btn: i[1] || (i[1] = (e) => r.infofun(e)),
                    onFriend_btn: i[2] || (i[2] = (e) => r.friendfun(e)),
                    onGift_btn: i[3] || (i[3] = (e) => r.giftfun(e)),
                    onLog_out: i[4] || (i[4] = (e) => r.changefun(e)),
                    onShare_btn: i[5] || (i[5] = (e) => r.sharefun(e)),
                  },
                  null,
                  512
                ),
                "login" === c.activecard
                  ? ((0, s.wg)(),
                    (0, s.j4)(h, {
                      key: 0,
                      onLoginmember: i[6] || (i[6] = (e) => r.changefun(e)),
                    }))
                  : (0, s.kq)("", !0),
                "getlion" === c.activecard
                  ? ((0, s.wg)(),
                    (0, s.j4)(x, {
                      key: 1,
                      onTeststart: i[7] || (i[7] = (e) => r.toquestionfun(e)),
                    }))
                  : (0, s.kq)("", !0),
                "question" === c.activecard
                  ? ((0, s.wg)(), (0, s.j4)(b, { key: 2 }))
                  : (0, s.kq)("", !0),
                (0, s.wy)(
                  (0, s.Wm)(
                    p,
                    {
                      ref: "introducepage",
                      onIntroduce_btn: i[8] || (i[8] = (e) => r.changefun(e)),
                      onBack_to_question:
                        i[9] || (i[9] = (e) => r.backtoquestionfun(e)),
                    },
                    null,
                    512
                  ),
                  [[o.F8, c.introducebool]]
                ),
                (0, s._)(
                  "div",
                  n,
                  [
                    (0, s.wy)(
                      (0, s.Wm)(
                        f,
                        {
                          ref: "gamescene",
                          onGamescene: i[10] || (i[10] = (e) => r.alert(e)),
                        },
                        null,
                        512
                      ),
                      [[o.F8, c.gamescenebool]]
                    ),
                  ],
                  512
                ),
                (0, s.Wm)(
                  u,
                  {
                    ref: "settingpage",
                    onSetting_close:
                      i[11] || (i[11] = (e) => r.settingbtnfun(e)),
                    onOpenpage: i[12] || (i[12] = (e) => r.toser_pr(e)),
                    onTofaq: i[13] || (i[13] = (e) => r.faqbtnfun(e)),
                  },
                  null,
                  512
                ),
                (0, s.wy)(
                  (0, s.Wm)(
                    _,
                    {
                      ref: "faqpage",
                      onFaq_close: i[14] || (i[14] = (e) => r.faqbtnfun(e)),
                    },
                    null,
                    512
                  ),
                  [[o.F8, c.faqbool]]
                ),
                (0, s.wy)(
                  (0, s.Wm)(
                    w,
                    {
                      ref: "sernpripage",
                      onFaq_close: i[15] || (i[15] = (e) => r.backfaqfun(e)),
                    },
                    null,
                    512
                  ),
                  [[o.F8, c.servicenprivacybool]]
                ),
                (0, s.wy)(
                  (0, s.Wm)(
                    v,
                    {
                      ref: "informpage",
                      onInfo_close: i[16] || (i[16] = (e) => r.infofun(e)),
                    },
                    null,
                    512
                  ),
                  [[o.F8, c.infobool]]
                ),
                (0, s.wy)(
                  (0, s.Wm)(
                    m,
                    {
                      ref: "friendshippage",
                      onFriend_close: i[17] || (i[17] = (e) => r.friendfun(e)),
                    },
                    null,
                    512
                  ),
                  [[o.F8, c.friendshipbool]]
                ),
                (0, s.wy)(
                  (0, s.Wm)(
                    g,
                    {
                      ref: "giftboxpage",
                      onGifbox_close: i[18] || (i[18] = (e) => r.giftfun(e)),
                    },
                    null,
                    512
                  ),
                  [[o.F8, c.giftboxbool]]
                ),
                (0, s.wy)(
                  (0, s.Wm)(
                    k,
                    {
                      ref: "sharepage",
                      onShare_close: i[19] || (i[19] = (e) => r.sharefun(e)),
                      onShare_save:
                        i[20] || (i[20] = (e) => r.generatorImage(e)),
                    },
                    null,
                    512
                  ),
                  [[o.F8, c.sharebool]]
                ),
                (0, s.wy)((0, s.Wm)(y, null, null, 512), [
                  [o.F8, c.mobilehbool],
                ]),
                (0, s.wy)((0, s.Wm)(C, null, null, 512), [
                  [o.F8, c.windowhbool],
                ]),
                (0, s._)("div", l, null, 512),
              ],
              64
            )
          );
        }
        const c = { id: "btn_group" },
          r = { id: "redDot" },
          d = { id: "redDot" };
        function h(e, i, t, n, l, a) {
          return (
            (0, s.wg)(),
            (0, s.iD)("div", c, [
              (0, s._)("div", {
                class: "setBtn",
                id: "btn_set",
                onClick: i[0] || (i[0] = (e) => n.setting_btn(!0)),
              }),
              l.loginbool
                ? ((0, s.wg)(),
                  (0, s.iD)(
                    "div",
                    {
                      key: 0,
                      class: "mailBtn",
                      id: "btn_mail",
                      onClick: i[1] || (i[1] = (e) => n.info_btn(!0)),
                    },
                    [
                      (0, s.wy)((0, s._)("div", r, null, 512), [
                        [o.F8, l.infodotbool],
                      ]),
                    ]
                  ))
                : (0, s.kq)("", !0),
              l.loginbool
                ? ((0, s.wg)(),
                  (0, s.iD)("div", {
                    key: 1,
                    class: "personBtn",
                    id: "btn_person",
                    onClick: i[2] || (i[2] = (e) => n.friend_btn(!0)),
                  }))
                : (0, s.kq)("", !0),
              l.loginbool
                ? ((0, s.wg)(),
                  (0, s.iD)(
                    "div",
                    {
                      key: 2,
                      class: "giftBtn",
                      id: "btn_gift",
                      onClick: i[3] || (i[3] = (e) => n.gift_btn(!0)),
                    },
                    [
                      (0, s.wy)((0, s._)("div", d, null, 512), [
                        [o.F8, l.giftboxdotbool],
                      ]),
                    ]
                  ))
                : (0, s.kq)("", !0),
              l.loginbool
                ? ((0, s.wg)(),
                  (0, s.iD)("div", {
                    key: 3,
                    class: "shareBtn",
                    id: "btn_share",
                    onClick: i[4] || (i[4] = (e) => n.share_btn(!0)),
                  }))
                : (0, s.kq)("", !0),
              l.loginbool
                ? ((0, s.wg)(),
                  (0, s.iD)("div", {
                    key: 4,
                    class: "logOutBtn",
                    id: "btn_logOut",
                    onClick: i[5] || (i[5] = (e) => n.log_out("login")),
                  }))
                : (0, s.kq)("", !0),
            ])
          );
        }
        var x = {
            name: "right_menu",
            emits: [
              "setting_btn",
              "info_btn",
              "friend_btn",
              "gift_btn",
              "share_btn",
              "btn_group",
              "log_out",
            ],
            setup(e, { emit: i }) {
              function t(e) {
                i("setting_btn", e);
              }
              function o(e) {
                i("info_btn", e);
              }
              function s(e) {
                i("friend_btn", e);
              }
              function n(e) {
                i("gift_btn", e);
              }
              function l(e) {
                i("share_btn", e);
              }
              function a(e) {
                i("btn_group", e);
              }
              function c(e) {
                i("log_out", e);
              }
              return {
                setting_btn: t,
                info_btn: o,
                friend_btn: s,
                gift_btn: n,
                share_btn: l,
                btn_group: a,
                log_out: c,
              };
            },
            data() {
              return { loginbool: !1, infodotbool: !1, giftboxdotbool: !1 };
            },
            methods: {
              showornotbtn(e) {
                (this.loginbool = e), console.log(this.loginbool);
              },
            },
          },
          b = t(89);
        const p = (0, b.Z)(x, [
          ["render", h],
          ["__scopeId", "data-v-26dbc8d8"],
        ]);
        var f = p,
          u = t(7139);
        const _ = (e) => (
            (0, s.dD)("data-v-16908646"), (e = e()), (0, s.Cn)(), e
          ),
          w = { id: "setting_page" },
          v = _(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          m = { class: "box" },
          g = _(() =>
            (0, s._)(
              "div",
              { class: "flexbox", style: { flex: "2" } },
              null,
              -1
            )
          ),
          k = { class: "setting_frame parentbox" },
          y = { class: "flexbox w-100 h-100 flex-c" },
          C = { class: "flexbox w-100 position-r" },
          j = { class: "flexbox voiceBtn w-100" },
          $ = _(() =>
            (0, s._)(
              "input",
              {
                id: "music",
                type: "checkbox",
                name: "musicBtn",
                value: "1",
                class: "pointer",
              },
              null,
              -1
            )
          ),
          W = { for: "musicBtn", style: { width: "100%", height: "100%" } },
          B = _(() =>
            (0, s._)(
              "input",
              {
                id: "sound",
                type: "checkbox",
                checked: "",
                name: "soundeffectBtn",
                value: "2",
                class: "pointer",
              },
              null,
              -1
            )
          ),
          q = { for: "soundBtn", style: { width: "100%", height: "100%" } },
          H = { class: "flexbox w-100 h-100 flex-r" },
          F = _(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          D = _(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          T = { class: "flexbox w-100 items" },
          I = _(() =>
            (0, s._)(
              "div",
              { class: "flexbox", style: { flex: "2" } },
              null,
              -1
            )
          ),
          M = _(() => (0, s._)("div", { class: "flexbox" }, null, -1));
        function L(e, i, t, n, l, a) {
          return (0, s.wy)(
            ((0, s.wg)(),
            (0, s.iD)(
              "div",
              w,
              [
                v,
                (0, s._)("div", m, [
                  g,
                  (0, s._)("div", k, [
                    (0, s._)(
                      "div",
                      {
                        class: "h-100",
                        style: (0, u.j5)({ width: l.se_outbox_w + "px" }),
                      },
                      null,
                      4
                    ),
                    (0, s._)("div", y, [
                      (0, s._)(
                        "div",
                        {
                          class: "w-100",
                          style: (0, u.j5)({ height: l.se_outbox_h + "px" }),
                        },
                        null,
                        4
                      ),
                      (0, s._)("div", C, [
                        (0, s._)("div", {
                          class: "close_btn pointer",
                          onClick: i[0] || (i[0] = (e) => n.setting_close(!1)),
                        }),
                      ]),
                      (0, s._)("div", j, [
                        $,
                        (0, s._)("label", W, [
                          (0, s._)("span", {
                            onClick: i[1] || (i[1] = (e) => a.settingmusic()),
                          }),
                        ]),
                        B,
                        (0, s._)("label", q, [
                          (0, s._)("span", {
                            onClick: i[2] || (i[2] = (e) => a.settingsound()),
                          }),
                        ]),
                      ]),
                      (0, s._)("div", H, [
                        F,
                        (0, s._)("div", {
                          class: "flexbox faqBtn pointer",
                          style: { flex: "2" },
                          onClick: i[3] || (i[3] = (e) => n.tofaq(!0)),
                        }),
                        D,
                      ]),
                      (0, s._)("div", T, [
                        (0, s._)(
                          "div",
                          {
                            class: "flexbox pointer contact",
                            onClick: i[4] || (i[4] = (e) => a.sendemail()),
                          },
                          " 聯絡我們 "
                        ),
                        (0, s._)(
                          "div",
                          {
                            class: "flexbox pointer service",
                            onClick:
                              i[5] || (i[5] = (e) => n.openpage("service")),
                          },
                          " 服務條款 "
                        ),
                        (0, s._)(
                          "div",
                          {
                            class: "flexbox pointer privacy",
                            onClick:
                              i[6] || (i[6] = (e) => n.openpage("privacy")),
                          },
                          " 隱私權政策 "
                        ),
                      ]),
                      (0, s._)(
                        "div",
                        {
                          class: "w-100",
                          style: (0, u.j5)({ height: l.se_outbox_h + "px" }),
                        },
                        null,
                        4
                      ),
                    ]),
                    (0, s._)(
                      "div",
                      {
                        class: "h-100",
                        style: (0, u.j5)({ width: l.se_outbox_w + "px" }),
                      },
                      null,
                      4
                    ),
                  ]),
                  I,
                ]),
                M,
              ],
              512
            )),
            [[o.F8, l.settingshow]]
          );
        }
        var S = t(4665),
          z = t(7067),
          O = {},
          E = new Audio(S),
          U = new Audio(z);
        (U.loop = !0),
          (O.apiUrl = "https://makers.mindnodeair.com/api/"),
          (O.testwebUrl = "http://lab2.geneinfo.com.tw/twmakers/home.jsp"),
          (O.formalUrl = "https://www.twmakers.com.tw/home.jsp"),
          (O.setCookie = function (e, i) {
            var t = new Date();
            return (
              t.setTime(t.getTime() + 2592e6),
              (document.cookie =
                e + "=" + i + ";expires=" + t.toUTCString() + ";path=/"),
              !0
            );
          }),
          (O.audioplay = function (e) {
            "false" != this.getCookie("sound") &&
              E.paused &&
              (console.log(this.getCookie("sound")), E.play());
          }),
          (O.backgroundmusic = function (e) {
            "true" == this.getCookie("backgroundmusic") &&
              (U.pause(), (U.currentTime = 0)),
              "false" == this.getCookie("backgroundmusic") && U.play();
          }),
          (O.getCookie = function (e) {
            var i = document.cookie.match("(^|;) ?" + e + "=([^;]*)(;|$)");
            return i ? i[2] : null;
          }),
          (O.eraseCookie = function (e) {
            var i = this.getCookie(e);
            return this.setCookie(e, i, "-1"), !0;
          });
        var N = O,
          P = {
            name: "setting_page",
            emits: ["setting_close", "openpage", "tofaq"],
            setup(e, { emit: i }) {
              function t(e) {
                i("setting_close", e);
              }
              function o(e) {
                i("openpage", e);
              }
              function s(e) {
                i("tofaq", e);
              }
              return { setting_close: t, openpage: o, tofaq: s };
            },
            data() {
              return { se_outbox_w: 20, se_outbox_h: 0, settingshow: !1 };
            },
            mounted() {
              N.getCookie("sound")
                ? (document.getElementById("sound").checked = !0)
                : (document.getElementById("sound").checked = !1);
            },
            methods: {
              setwidth() {
                var e, i, t, o, s, n;
                window.innerWidth >= 1440
                  ? ((e = window.innerHeight / 3), (i = window.innerWidth / 5))
                  : window.innerWidth >= 1024 && window.innerWidth < 1440
                  ? ((e = (window.innerHeight / 4) * 2),
                    (i = (window.innerWidth / 7) * 3))
                  : window.innerWidth >= 768 && window.innerWidth < 1024
                  ? ((e = (window.innerHeight / 6) * 4),
                    (i = (window.innerWidth / 7) * 3))
                  : window.innerWidth < 768 &&
                    ((e = (window.innerHeight / 8) * 6),
                    (i = (window.innerWidth / 8.5) * 4.5)),
                  (o = (150 * i) / 166),
                  (t = (166 * e) / 150),
                  (s = (i - t) / 2),
                  (n = (e - o) / 2),
                  (this.se_outbox_w = s > 0 ? s : 0),
                  (this.se_outbox_h = n > 0 ? n : 0);
              },
              sendemail() {
                window.open(
                  "https://mail.google.com/mail/u/0/?fs=1&to=koichiyamamoto@mindnodeair.com&tf=cm",
                  "_blank"
                );
              },
              settingmusic() {
                var e = document.getElementById("music").checked;
                e
                  ? (this.$parent.playmusic(!1),
                    (document.getElementById("music").checked = !1))
                  : (this.$parent.playmusic(!0),
                    (document.getElementById("music").checked = !0)),
                  console.log(e),
                  N.setCookie("backgroundmusic", !e);
              },
              settingsound() {
                var e = document.getElementById("sound").checked;
                (document.getElementById("sound").checked = !e),
                  N.setCookie("sound", !e);
              },
            },
          };
        const Y = (0, b.Z)(P, [
          ["render", L],
          ["__scopeId", "data-v-16908646"],
        ]);
        var V = Y;
        const K = (e) => (
            (0, s.dD)("data-v-e2bba852"), (e = e()), (0, s.Cn)(), e
          ),
          J = { id: "faqgroup" },
          Z = { id: "faq_page" },
          A = K(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          R = { class: "box w-100 h-100", style: { flex: "2" } },
          G = K(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          X = {
            class: "faq_frame flex-c flexbox w-100 h-100",
            style: { flex: "3" },
          },
          Q = { class: "flexbox flex-r w-100 h-100" },
          ee = { class: "flexbox w-100 h-100 flex-c" },
          ie = { class: "flexbox w-100 h-100 position-r" },
          te = { class: "flexbox flex-r w-100 h-100", style: { flex: "3" } },
          oe = K(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          se = K(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          ne = K(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          le = { id: "thirdgroup" },
          ae = K(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          ce = { class: "levelFrame box w-100 h-100", style: { flex: "2" } },
          re = K(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          de = { class: "flexbox w-100 h-100 flex-c", style: { flex: "3" } },
          he = { class: "flexbox w-100 h-100 flex-c" },
          xe = { class: "flexbox w-100 h-100 position-r" },
          be = { class: "title flexbox w-100 h-100" },
          pe = ["innerHTML"],
          fe = K(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          ue = K(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          _e = K(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          );
        function we(e, i, t, n, l, a) {
          return (
            (0, s.wg)(),
            (0, s.iD)("div", J, [
              (0, s.wy)(
                (0, s._)(
                  "div",
                  Z,
                  [
                    A,
                    (0, s._)("div", R, [
                      G,
                      (0, s._)("div", X, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.game_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", Q, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.faq_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", ee, [
                            (0, s._)("div", ie, [
                              (0, s._)("div", {
                                class: "back_btn w-100 h-100 pointer",
                                onClick:
                                  i[0] || (i[0] = (e) => n.faq_close(!1)),
                              }),
                              (0, s._)("div", {
                                class: "close_btn w-100 h-100",
                                onClick:
                                  i[1] || (i[1] = (e) => n.faq_close(!1)),
                              }),
                            ]),
                            (0, s._)("div", te, [
                              (0, s._)("div", {
                                class:
                                  "flexbox w-100 h-100 pointer gameExplanation",
                                onClick:
                                  i[2] || (i[2] = (e) => a.showbox("遊戲說明")),
                              }),
                              (0, s._)("div", {
                                class:
                                  "flexbox w-100 h-100 pointer levelExplanation",
                                onClick:
                                  i[3] || (i[3] = (e) => a.showbox("等級說明")),
                              }),
                              (0, s._)("div", {
                                class:
                                  "flexbox w-100 h-100 pointer characterExplanation",
                                onClick:
                                  i[4] || (i[4] = (e) => a.showbox("角色說明")),
                              }),
                            ]),
                            oe,
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.faq_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.game_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                      ]),
                      se,
                    ]),
                    ne,
                  ],
                  512
                ),
                [[o.F8, l.faqbool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  le,
                  [
                    ae,
                    (0, s._)("div", ce, [
                      re,
                      (0, s._)("div", de, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.game_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", he, [
                          (0, s._)("div", xe, [
                            (0, s._)("div", {
                              class: "back_btn",
                              onClick: i[5] || (i[5] = (e) => a.showbox("faq")),
                            }),
                            (0, s._)("div", {
                              class: "close_btn",
                              onClick: i[6] || (i[6] = (e) => a.showbox("faq")),
                            }),
                          ]),
                          (0, s._)("div", be, (0, u.zw)(l.captionname), 1),
                          (0, s._)(
                            "div",
                            {
                              class: "w-100 h-100 flex-c scrollbar",
                              style: (0, u.j5)([
                                { dispaly: "flex" },
                                { "max-height": l.scrollbox_h + "px" },
                              ]),
                              innerHTML: a.checkcaption(l.captionname),
                            },
                            null,
                            12,
                            pe
                          ),
                          fe,
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.game_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                      ]),
                      ue,
                    ]),
                    _e,
                  ],
                  512
                ),
                [[o.F8, l.groupbool]]
              ),
            ])
          );
        }
        var ve = {
          name: "faq_page",
          emits: ["faq_close"],
          setup(e, { emit: i }) {
            function t(e) {
              i("faq_close", e);
            }
            return { faq_close: t };
          },
          data() {
            return {
              faq_outbox_w: 0,
              game_outbox_h: 20,
              scrollbox_h: 380,
              captionname: "遊戲說明",
              faqbool: !0,
              groupbool: !1,
            };
          },
          methods: {
            setwidth() {
              var e, i, t, o, s, n, l;
              (e = (window.innerHeight / 5) * 3),
                (i = (window.innerWidth / 4) * 2),
                (t = (150 * i) / 252),
                (o = (252 * e) / 150),
                (n = (93 * i) / 252),
                (s = (e - t) / 2),
                (l = (i - o) / 2),
                console.log(e, i, s, n),
                (this.game_outbox_h = s > 0 ? s : 0),
                (this.faq_outbox_w = l < 0 ? 0 : l),
                (this.scrollbox_h = n);
            },
            showbox(e) {
              switch (e) {
                case "faq":
                  (this.faqbool = !0), (this.groupbool = !1);
                  break;
                default:
                  (this.faqbool = !1),
                    (this.groupbool = !0),
                    (this.captionname = e);
                  break;
              }
              console.log("click", e);
            },
            checkcaption(e) {
              var i = "";
              switch (e) {
                case "遊戲說明":
                  i =
                    '\n            <div class="flexbox">\n              加入會員後，選擇性別、填寫性向測驗，依遊戲系統之性向測驗分類技職職群，可以獲得一隻職群原始梅克獅(區分為男女性別，並有\n              小農獅、工程獅、小魚獅職群，共六款原始梅克獅)，透過完成各項網站與實體展場任務，完成任務後獲得食物，將食物餵食梅克獅可\n              成長升級。\n              每次只能從原始獅開始養成一款，至達人獅後完全養成，才可養成下一款梅克獅。例如，選擇女生原始小農獅後，須養成至女生達人\n              小農獅，才可繼續養不同性別職群梅克獅。\n            </div>\n            <div\n              class="flexbox w-100"\n              style="flex: 1.5; margin-top: 5%; margin-bottom: 5%"\n            >\n              <div class="meats flexbox w-100 h-100"></div>\n            </div>\n            <ul class="flexbox flex-c" style="margin: 0; padding: 0">\n              <li>\n                肉存糧表：完成活動和任務，獲得食物會先儲存在這，點擊餵食才會換算成經驗值\n              </li>\n              <li>\n                經驗值表：顯示距離下個Lv還需多少經驗值；超過3天不登入，第4天開始每一天會少10經驗值，養成一款需10500經驗值\n              </li>\n            </ul>\n          ';
                  break;
                case "等級說明":
                  i =
                    '\n                        <div class="levelPart flexbox w-100 h-100 flex-r">\n                <div class="flexbox levelText w-100 h-100"></div>\n                <div class="textbg flexbox w-100 h-100">\n                  <div class="scrollbar2 w-100 h-100">\n                    <p class="normalText">\n                      <span class="titleText">第一階段-</span>\n                      原始梅克獅(Lv1~10)，此階段每50經驗值可升一個Lv\n                    </p>\n\n                    <p class="normalText">\n                      <span class="titleText">第二階段-</span>\n                      學子梅克獅(Lv11~20)，此階段每100經驗值可升一個Lv\n                    </p>\n                    <p class="normalText">\n                      <span class="titleText">第三階段-</span>\n                      菜鳥梅克獅(Lv21~30)，此階段每150經驗值可升一個Lv\n                    </p>\n                    <p class="normalText">\n                      <span class="titleText">第四階段-</span>\n                      匠人梅克獅(Lv31~40)，此階段每200經驗值可升一個Lv\n                    </p>\n                    <p class="normalText">\n                      <span class="titleText">第五階段-</span>\n                      職人梅克獅(Lv41~50)，此階段每250經驗值可升一個Lv\n                    </p>\n                    <p class="normalText">\n                      <span class="titleText">第六階段-</span>\n                      達人梅克獅(Lv51~60)，此階段每300經驗值可升一個Lv\n                    </p>\n                  </div>\n                </div>\n              </div>\n              <div class="block flexbox w-100 h-100 box">\n                <div class="borderBottom w-100 parentbox">\n                  <div class="levelTitle flexbox">原始 Lv1~10</div>\n                  <div class="levelContent flexbox">\n                    對於世界有無盡好奇，父母帶領著孩子去探索。<br />\n                    (學齡前~小學)\n                  </div>\n                </div>\n                <div class="borderBottom w-100 parentbox">\n                  <div class="levelTitle flexbox">學子 Lv11~20</div>\n                  <div class="levelContent flexbox">\n                    開始廣泛地學習各項知識，也透過各種探索和體驗去了解世界，大部分透過老師引領與教育。<br />\n                    (小學~高中)\n                  </div>\n                </div>\n                <div class="borderBottom w-100 parentbox">\n                  <div class="levelTitle flexbox">菜鳥 Lv21~30</div>\n                  <div class="levelContent flexbox">\n                    最青春無敵的年紀，開始知道了自己未來志向，要念書還會打工。畢業後從事第一份正式工作，\n                    在職場上是最青澀的存在，有許多職場前輩教導。<br />\n                    (大學~職場新鮮人)\n                  </div>\n                </div>\n                <div class="borderBottom w-100 parentbox">\n                  <div class="levelTitle flexbox">匠人 Lv31~40</div>\n                  <div class="levelContent flexbox">\n                    從事職業已一段時間，對於工作時熟稔，技藝高超但追求更高的知識、技術或藝術境界。\n                  </div>\n                </div>\n                <div class="borderBottom w-100 parentbox">\n                  <div class="levelTitle flexbox">職人 Lv41~50</div>\n                  <div class="levelContent flexbox">\n                    透過熟練的技術與雙手打造作品/產品，要成為職人，一般需要好幾年，甚至與數十年的時間\n                    專注在領域上，對於自己的作品擁有相當的自信，不因為金錢或時間的限制而妥協。\n                  </div>\n                </div>\n                <div class="borderBottom w-100 parentbox">\n                  <div class="levelTitle flexbox">達人 Lv51~60</div>\n                  <div class="levelContent flexbox">\n                    在某一領域非常專業、擁有許多豐富經驗、技術和知識，是專業領域中出類拔萃的存在，也被稱為專家。\n                  </div>\n                </div>\n              </div>\n          ';
                  break;
                case "角色說明":
                  i =
                    '\n                      <div class="flexbox textbg flex-r">\n              <div class="flexbox scrollbar2 flex-r w-100" style="color: white">\n                我是小農獅，平常喜歡戶外活動、喜歡親近大自然、也喜歡觀察和照顧動植物。<br />\n                <br />#小農獅關鍵字: 愛好冒險、觀察、創意手作<br />\n                <br />血型A: 細心負責、工作腳踏實地、喜歡穩定<br />\n                相關類群: 農業群、食品群\n              </div>\n              <div class="lionPictures_farmer flexbox w-100 h-100"></div>\n            </div>\n            <div class="flexbox textbg flex-r">\n              <div class="scrollbar2 flex-r w-100 h-100" style="color: white">\n                我是工程獅，喜歡尋找解決問題的方法，也對工程、科技有很大的興趣；平常會自己拆組電器。<br />\n                <br />#工程獅關鍵字：邏輯、數理推理、工程科技、手作<br />\n                <br />AB型血：理解速度快、喜歡挑戰、冷靜沈穩<br />\n                相關群類：機械群、動力機械群、電機與電子群、化工群、土木與建築群等\n              </div>\n              <div class="lionPictures_engineer flexbox w-100 h-100"></div>\n            </div>\n            <div class="flexbox textbg flex-r">\n              <div class="scrollbar2 flex-r w-100 h-100" style="color: white">\n                我是小漁狮,喜愛觀察水中自然生態,平常也喜歡去釣魚,夢想是能夠擁有自己的一艘船!<br />\n                <br />#小漁獅關鍵字:觀察、冒險、不怕水、熱愛海洋<br />\n                <br />B型血:討厭一成不變、愛好廣泛、外向樂觀<br />\n                相關群類：水產群、海事群\n              </div>\n              <div class="lionPictures_fisher flexbox w-100 h-100"></div>\n            </div>\n          ';
                  break;
              }
              return i;
            },
          },
        };
        const me = (0, b.Z)(ve, [
          ["render", we],
          ["__scopeId", "data-v-e2bba852"],
        ]);
        var ge = me;
        const ke = (e) => (
            (0, s.dD)("data-v-37647c34"), (e = e()), (0, s.Cn)(), e
          ),
          ye = { id: "service" },
          Ce = ke(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          je = { class: "serviceFrame box w-100 h-100", style: { flex: "2" } },
          $e = {
            class: "flexbox w-100 h-100",
            style: { position: "relative" },
          },
          We = { class: "title flexbox w-100" },
          Be = ["innerHTML"],
          qe = ke(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          );
        function He(e, i, t, o, n, l) {
          return (
            (0, s.wg)(),
            (0, s.iD)("div", ye, [
              Ce,
              (0, s._)("div", je, [
                (0, s._)(
                  "div",
                  {
                    class: "w-100",
                    style: (0, u.j5)({ height: n.outbox_h + "px" }),
                  },
                  null,
                  4
                ),
                (0, s._)("div", $e, [
                  (0, s._)("div", {
                    class: "back_btn w-100 h-100 pointer",
                    onClick: i[0] || (i[0] = (e) => o.faq_close()),
                  }),
                  (0, s._)("div", {
                    class: "close_btn w-100 h-100 pointer",
                    onClick: i[1] || (i[1] = (e) => o.faq_close()),
                  }),
                ]),
                (0, s._)("div", We, (0, u.zw)(n.typename), 1),
                (0, s._)(
                  "div",
                  {
                    id: "content",
                    class: "serviceText scrollbar flex-c w-100",
                    innerHTML: l.contentbox(n.type),
                  },
                  null,
                  8,
                  Be
                ),
                (0, s._)(
                  "div",
                  {
                    class: "w-100",
                    style: (0, u.j5)({ height: n.outbox_h + "px" }),
                  },
                  null,
                  4
                ),
              ]),
              qe,
            ])
          );
        }
        var Fe = {
          name: "faq_page",
          emits: ["faq_close"],
          setup(e, { emit: i }) {
            function t(e) {
              i("faq_close", e);
            }
            return { faq_close: t };
          },
          data() {
            return { type: "service", typename: "服務條款", outbox_h: 20 };
          },
          methods: {
            setwidth() {
              var e = window.innerWidth / 2,
                i = window.innerHeight,
                t = (150 * e) / 252,
                o = (i - t) / 2;
              this.outbox_h = o;
            },
            contentbox(e) {
              console.log(e);
              var i = "";
              switch (e) {
                case "service":
                  (this.typename = "服務條款"),
                    (i =
                      '\n             <div class="flexbox w-100 h-100" style="flex: 2; text-align: left;">\n             <p>\n             為保障會員（以下簡稱為「甲方」）的權益，請在註冊成為梅克獅養成遊戲（以下簡稱為「乙方」）會員，在使用各項會員服務之前，在此特別提醒用戶仔細閱讀本用戶協議中的各個條款，包括但不限於免除或者限制責任的條款、對用戶權利進行限制的條款以及約定爭議解決方式、司法管轄的條款。\n             </p>\n             <p>\n             請您仔細閱讀本《會員協議》（未成年人應當在其法定監護人陪同下閱讀），並選擇接受或者不接受本《會員協議》。您登錄、顯示、操作「梅克獅養成遊戲」，或者使用該遊戲的某項功能、某一部分，或者以其他的方式使用該遊戲的行爲，即視爲您同意並接受本《會員協議》，願意接受本《會員協議》各個條款的約束，即推定甲方已符合相關法令對使用本級別之服務的年齡要求，並同意本契約條款之規定。請您先行審閱本契約三日以上，再按「同意遵守」鍵完成會員註冊程序。\n             </p>\n             <p>會員註冊及遊戲服務之申請，如甲方為無行為能力人，應由其法定代理人為之；如為限制行為能力人，應得法定代理人之同意。您若與本遊戲因此《會員協議》或其補充協議所涉及的有關事宜發生爭議或者糾紛，雙方可以良好協商解決；協商不成，您完全同意將其回報本遊戲所在地的法院訴訟解決。\n             </p>\n              <ul class="ulgroup">\n                <li>定義</br>本條款使用下列各項用語：\n                <ul>\n                  <li>「帳號」係指本單位於用戶開始使用本服務時所發行之用以辨識用戶的文字列或其他標識。其中，本單位基於用戶申請所設定的標識符稱為「用戶ID」。</li>\n                  <li>「個別使用條款」係指與本服務有關而有別於本條款，以「條款」、「準則」、「政策」等名稱由本單位所分發或公布的書面，其中包含本單位所擬定之遊戲管理規則。「遊戲管理規則」係指本單位於遊戲內容資訊或常見問答中所公告或上傳對於限制或禁止使用遊戲之相關準則。</li>\n                  <li>「內容」係指文字、語音、音樂、圖片、影片、軟體、程式、代碼及其他資訊等內容。</li>\n                  <li>「本內容」係指可透過本服務連結的內容。</li>\n                  <li>「投稿內容」係指用戶投稿、傳送、上傳至本服務的內容。</li>\n                </ul>\n                </li>\n                <li>對於本條款的同意表示\n                <ul>\n                  <li>用戶應遵照本條款規定使用本服務。用戶須有效且不可撤銷地同意本條款，方能使用本服務。以下內容視為本條款之一部分，與本條款具有相同之效力：\n                  <ul class="cjkul">\n                    <li>由本單位所為有關本服務之廣告或宣傳內容。</li>\n                    <li>計費制遊戲之收費計算方式及個別使用條款。</li>\n                  </ul>\n                  </li>\n                  <li>如用戶為限制行為能力人，應須經過用戶之法定代理人同意，方能使用本服務。如用戶為無行為能力人，應由用戶之法定代理人代為同意，方能使用本服務。此外，如用戶為業者使用本服務時，亦請於該業者同意本條款後，再使用本服務。另外，若用戶為限制行為能力人或無行為能力人，除應符合前段之規定外，並應於用戶之法定代理人閱讀、瞭解並有效且不可撤銷地同意本條款之所有內容後，方得使用本服務，本條款之內容變更時亦同。</li>\n                  <li>本服務一經用戶實際使用，將視為用戶已有效且不可撤銷地同意本條款。</li>\n                  <li>本服務有個別使用條款時，除本條款外，用戶亦應遵照個別使用條款規定使用本服務。</li>\n                  <li>本條款如有疑義時，應為有利於用戶之解釋。</li>\n                </ul>\n                </li>\n                <li>本條款之變更</br>本單位修改本條款或個別使用條款時，應於本單位官網之首頁、遊戲登入頁面或購買頁面公告之，並依用戶登錄之通訊資料通知用戶。本單位未依前項進行公告及通知者，本條款或個別使用條款之變更無效。用戶於前段通知到達後十五日內，如：\n                <ul class="cjkul">\n                  <li>用戶未為反對之表示者，本單位依本條款或個別使用條款變更後之內容繼續提供本服務。</li>\n                  <li>用戶為反對之表示者，依用戶終止本條款之方式處理。</li>\n                </ul>\n                </li>\n                <li>帳號密碼之使用\n                <ul>\n                  <li>用戶於使用本服務時，如有註冊用戶本身相關資料、通訊資料，應提供真實、正確且完整的資料，並經常進行修改以更新資料。</li>\n                  <li>用戶於使用本服務時，如有註冊密碼，應自行負責嚴密保管，以免遭到不當使用。</li>\n                  <li>用戶未設定用戶ID而使用本服務，或使用無用戶ID設定功能之服務時，若進行通信設備的機種變更等行為，遊戲內貨幣、投稿內容等資料將無法轉移到變更後的通信設備。</li>\n                  <li>符合前項規定時，用戶購買之遊戲內貨幣或其他有償內容相關之資料以及其他所有與本服務相關之資料，可能因以下原因，在不事先通知用戶的情況下消滅：\n                  <ul class="thirdul">\n                    <li>用戶解除安裝本服務等。</li>\n                    <li>用戶進行通信設備之機種變更等。</li>\n                    <li>與本單位或用戶無關，且不具任何理由之原因。</li>\n                  </ul>\n                  </li>\n                  <li>本單位得依第18.4條終止用戶使用本服務之規定，刪除自最後一次連線起超過1年以上之該用戶帳號。</li>\n                  <li>自帳號刪除時起，用戶於本服務的所有使用權不論任何理由均為消滅。</li>\n                  <li>帳號密碼之使用\n                  <ul class="thirdul">\n                    <li>本服務的帳號，專屬於用戶個人。用戶於本服務的所有使用權，均不得轉讓、出借予第三人或使第三人繼承。</li>\n                    <li>用戶得依本單位提供之修改機制變更密碼。本單位人員（含客服人員、遊戲管理員）不得主動詢問用戶之密碼。本單位應於本條款終止後三十日內，保留用戶之帳號與電磁紀錄。</li>\n                    <li>本條款非因可歸責用戶之事由而終止者，用戶於前項期間內辦理續用後，有權繼續使用原帳號及附隨於該帳號之電磁紀錄。</li>\n                    <li>於第4.7.3條期間屆滿，用戶仍未辦理續用者，本單位得刪除該帳號及附隨於該帳號之所有資料，但法令另有規定者不在此限。</li>\n                  </ul>\n                  </li>\n                  <li>帳號密碼遭非法使用之通知與處理\n                  <ul class="thirdul">\n                    <li>任一方如發現用戶之帳號或密碼被非法使用時，應立即通知對方並由本單位進行查證。經本單位確認有前述情事後，得暫停該組帳號或密碼之使用權，更換帳號或密碼予用戶，立即限制第三人就本服務之使用權利，並將相關處理方式揭載於本服務相關遊戲管理規則。</li>\n                    <li>本單位應於暫時限制遊戲使用權利之時起，即刻以官網公告、簡訊、電子郵件、推播或其他雙方約定之方式通知前項之第三人提出 說明。如該第三人未於接獲通知時起七日內提出說明，本單位應直接回復遭不當移轉之電磁紀錄予用戶，如不能回復時可採其他雙方同意之相當補償方式，並於回復後解除對第三人之限制。但如本單位有提供免費安全裝置（如防盜卡、電話鎖等）而用戶不使用或有其他可歸責於用戶之事由，本單位不負回復或補償責任。</li>\n                    <li>前二項所述之第三人不同意本單位前項之處理時，用戶得依報案程序，循司法途徑處理。</li>\n                    <li>本單位依第4.8.1.條規定限制用戶或第三人之使用權時，在限制使用期間內，本單位不得向用戶或第三人收取費用。</li>\n                    <li>用戶如有申告不實之情形致生本單位或第三人權利受損時，應負一切法律責任。</li>\n                  </ul>\n                  </li>\n                </ul>\n                </li>\n              </ul>');
                  break;
                case "privacy":
                  (this.typename = "隱私權政策"),
                    (i =
                      '<p>為保障會員（以下簡稱為「甲方」）的權益，成為梅克獅養成遊戲（以下簡稱為「乙方」）會員，在使用各項會員服務之前，在\n          此特別提醒用戶遵守《隱私權政策》，若為未成年人應當在其法定監護人陪同下閱讀，並遵守本《隱私權政策》。</p>\n          <ul class="ulgroup">\n            <li>隱私權\n                <ul>\n                <li>本服務相關之個人資料由國立高雄科技大學管理。</li>\n                <li>本單位尊重用戶的隱私權。</li>\n                <li>本單位依照技職大玩JOB之梅克獅養成遊戲服務隱私權政策及相關法律，妥善處理及保護用戶的隱私資料與個人資料。</li>\n                <li>本單位將會以安全的方式管理自用戶處蒐集的資料，並對安全管理採取嚴格的措施。</li>\n                </ul>\n            </li>\n            <li>禁止事項\n                <ul>\n                <li>違反法令、法院判決、裁定或命令或具有法令拘束力的行政措施的行為。</li>\n                <li>恐有危害公共秩序或善良風俗的行為。</li>\n                <li>侵害本公司或第三人的著作權、商標權、專利權等智慧財產權、名譽權、隱私權、其他法令或契約規定權利的行為。</li>\n                <li>投稿或傳送內容有過度暴力的表現、性暗示過度露骨的表現、涉及人種、國籍、信仰、性別、社會地位、家世等有關歧視的表現、引誘或助長自殺、自傷行為或濫用藥物的表現、其他有反社會情節使人感到不愉快的表現的行為。</li>\n                <li>偽裝成本公司或第三人的行為或故意散布不實資訊的行為。</li>\n                <li>傳送同一或類似訊息給不特定多數用戶的行為（經本公司同意者除外）、其他本公司判斷為垃圾訊息的行為。</li>\n                <li>藉由本公司規定以外的方式，以本內容的使用權兌換現金、財物或其他經濟利益的行為。</li>\n                <li>以行銷、宣傳、廣告、招攬或其他營利為目的的行為（經本公司同意者除外）、以性行為或猥褻行為為目的的行為、以與未曾謀面的異性認識或交往為目的的行為、以騷擾或毀謗中傷其他用戶為目的的行為、其他基於與本服務訂定的使用目的不同之目的使用本服務的行為。</li>\n                <li>對反社會勢力提供利益或其他協助的行為。</li>\n                <li>勸誘參與宗教活動或宗教團體的行為。</li>\n                <li>不當蒐集、公開或提供他人的個人資料、註冊資料、使用記錄資料等的行為。</li>\n                <li>干擾本服務的伺服器或網路系統的行為、利用BOT、作弊工具、其他技術性手段不當操作服務的行為、故意利用本服務漏洞的行為、以刷機或越獄等方式改變終端 設備後連結本服務的行為、超出必要限度重複同一問題等對本公司提出不當洽詢或要求的行為、其他妨礙本公司經營本服務或其他用戶使用本服務，並製造干擾的行為。</li>\n                <li>不支援或助長符合前述第2.1.條至第2.12條任一行為的行為。</li>\n                <li>其他本公司判斷為不適當的行為。</li>\n                </ul>\n            </li>\n          </ul>\n      ');
                  break;
              }
              return i;
            },
          },
        };
        const De = (0, b.Z)(Fe, [
          ["render", He],
          ["__scopeId", "data-v-37647c34"],
        ]);
        var Te = De;
        const Ie = (e) => (
            (0, s.dD)("data-v-1427a0ed"), (e = e()), (0, s.Cn)(), e
          ),
          Me = { id: "informpage" },
          Le = { id: "informgroup" },
          Se = Ie(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          ze = { class: "infoFrame box w-100 h-100" },
          Oe = Ie(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Ee = { class: "infoHeight flexbox w-100 h-100 flex-c" },
          Ue = { class: "flexbox w-100 h-100 flex-r" },
          Ne = { class: "flexbox w-100 h-100 flex-c" },
          Pe = { class: "flexbox w-100 h-100 position-r" },
          Ye = { class: "flexbox block w-100 h-100", style: { flex: "3.5" } },
          Ve = ["innerHTML"],
          Ke = { class: "flexbox w-100 h-100" },
          Je = Ie(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Ze = { class: "checkBtn flexbox w-100 h-100" },
          Ae = Ie(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Re = Ie(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Ge = Ie(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Xe = { id: "informitem" },
          Qe = Ie(() =>
            (0, s._)(
              "div",
              { class: "flexbox", style: { flex: "2" } },
              null,
              -1
            )
          ),
          ei = { class: "flexSet flexbox w-100 h-100 flex-c" },
          ii = Ie(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          ti = { class: "item_frame flexbox w-100 h-100 flex-c" },
          oi = { class: "flexbox w-100 h-100 flex-r" },
          si = ["innerHTML"],
          ni = Ie(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          li = Ie(() =>
            (0, s._)(
              "div",
              { class: "flexbox", style: { flex: "2" } },
              null,
              -1
            )
          );
        function ai(e, i, t, n, l, a) {
          return (
            (0, s.wg)(),
            (0, s.iD)("div", Me, [
              (0, s._)("div", Le, [
                Se,
                (0, s._)("div", ze, [
                  Oe,
                  (0, s._)("div", Ee, [
                    (0, s._)(
                      "div",
                      {
                        class: "w-100",
                        style: (0, u.j5)({ height: l.outbox_h + "px" }),
                      },
                      null,
                      4
                    ),
                    (0, s._)("div", Ue, [
                      (0, s._)(
                        "div",
                        {
                          class: "h-100",
                          style: (0, u.j5)({ width: l.outbox_w + "px" }),
                        },
                        null,
                        4
                      ),
                      (0, s._)("div", Ne, [
                        (0, s._)("div", Pe, [
                          (0, s._)("div", {
                            class: "back_btn pointer",
                            onClick: i[0] || (i[0] = (e) => n.info_close(!1)),
                          }),
                          (0, s._)("div", {
                            class: "close_btn pointer",
                            onClick: i[1] || (i[1] = (e) => n.info_close(!1)),
                          }),
                        ]),
                        (0, s._)("div", Ye, [
                          (0, s._)(
                            "div",
                            {
                              id: "infoitem",
                              class: "w-100 h-100 d-flex flex-c scrollbar",
                              style: (0, u.j5)({
                                "max-height": l.scrollbox_h + "px",
                              }),
                              innerHTML: a.checkinfo(),
                            },
                            null,
                            12,
                            Ve
                          ),
                        ]),
                        (0, s._)("div", Ke, [
                          Je,
                          (0, s.wy)(
                            (0, s._)(
                              "div",
                              Ze,
                              [
                                (0, s._)(
                                  "button",
                                  {
                                    onClick:
                                      i[2] || (i[2] = (e) => a.openitem()),
                                  },
                                  "查看"
                                ),
                              ],
                              512
                            ),
                            [[o.F8, l.infobool]]
                          ),
                          Ae,
                        ]),
                      ]),
                      (0, s._)(
                        "div",
                        {
                          class: "h-100",
                          style: (0, u.j5)({ width: l.outbox_w + "px" }),
                        },
                        null,
                        4
                      ),
                    ]),
                    (0, s._)(
                      "div",
                      {
                        class: "w-100",
                        style: (0, u.j5)({ height: l.outbox_h + "px" }),
                      },
                      null,
                      4
                    ),
                  ]),
                  Re,
                ]),
                Ge,
              ]),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  Xe,
                  [
                    Qe,
                    (0, s._)("div", ei, [
                      ii,
                      (0, s._)("div", ti, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.item_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", oi, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.item_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)(
                            "div",
                            {
                              id: "itemcontent",
                              class: "flexbox w-100 h-100 flex-c",
                              innerHTML: a.item(l.itemtype),
                              onClick:
                                i[3] ||
                                (i[3] = (...e) =>
                                  a.initemgroup && a.initemgroup(...e)),
                            },
                            null,
                            8,
                            si
                          ),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.item_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.item_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                      ]),
                      ni,
                    ]),
                    li,
                  ],
                  512
                ),
                [[o.F8, l.itembool]]
              ),
            ])
          );
        }
        var ci = {
          name: "in_form",
          emits: ["info_close"],
          setup(e, { emit: i }) {
            function t(e) {
              i("info_close", e);
            }
            return { info_close: t };
          },
          data() {
            return {
              outbox_h: 20,
              outbox_w: 0,
              scrollbox_h: 380,
              item_outbox_h: 20,
              item_outbox_w: 0,
              itemnum: 0,
              itemtype: "achievement",
              itembool: !1,
              infobool: !1,
              clearmission: [],
              friendinvite: [],
              friendgift: [],
              friendindex: null,
            };
          },
          mounted() {},
          methods: {
            setwidth() {
              var e, i, t, o, s, n, l, a, c, r, d, h, x;
              window.innerWidth > 1920
                ? ((e = (window.innerHeight / 5) * 3),
                  (i = (window.innerWidth / 4) * 2),
                  (a = window.innerHeight / 3),
                  (c = window.innerWidth / 5))
                : (window.innerWidth >= 1440 && window.innerWidth < 1920) ||
                  (window.innerWidth >= 1024 && window.innerWidth < 1440)
                ? ((e = (window.innerHeight / 5) * 3),
                  (i = (window.innerWidth / 4) * 2),
                  (a = (window.innerHeight / 4) * 2),
                  (c = (window.innerWidth / 6) * 2))
                : window.innerWidth >= 768 && window.innerWidth < 1024
                ? ((e = (window.innerHeight / 4.5) * 2.5),
                  (i = (window.innerWidth / 4) * 2),
                  (a = (window.innerHeight / 4) * 2),
                  (c = (window.innerWidth / 5.5) * 1.5))
                : window.innerWidth >= 740 && window.innerWidth < 768
                ? ((e = (window.innerHeight / 5) * 3),
                  (i = (window.innerWidth / 4) * 2),
                  (a = (window.innerHeight / 4) * 2),
                  (c = (window.innerWidth / 5.5) * 1.5))
                : (window.innerWidth >= 720 && window.innerWidth < 740) ||
                  (window.innerWidth >= 654 && window.innerWidth < 720)
                ? ((e = (window.innerHeight / 4) * 2),
                  (i = (window.innerWidth / 4) * 2),
                  (a = (window.innerHeight / 4) * 2),
                  (c = (window.innerWidth / 6) * 2))
                : window.innerWidth >= 425 &&
                  window.innerWidth < 654 &&
                  ((e = (window.innerHeight / 4.5) * 2.5),
                  (i = (window.innerWidth / 3.5) * 1.5),
                  (a = (window.innerHeight / 4.5) * 2.5),
                  (c = (window.innerWidth / 5.5) * 1.5)),
                (t = (150 * i) / 252),
                (o = (252 * e) / 150),
                (l = (85 * i) / 252),
                (n = (i - o) / 2),
                (s = (e - t) / 2),
                (this.outbox_h = s < 0 ? 0 : s),
                (this.outbox_w = n < 0 ? 0 : n),
                (this.scrollbox_h = l),
                (d = (178 * a) / 150),
                (r = (150 * c) / 178),
                (x = (c - d) / 2),
                (h = (a - r) / 2),
                (this.item_outbox_h = h < 0 ? 0 : h),
                (this.item_outbox_w = x < 0 ? 0 : x);
            },
            refreshView() {
              this.$http
                .get(N.apiUrl + "players/" + N.getCookie("id") + "/notices", {
                  headers: { authorization: "Bearer " + N.getCookie("token") },
                })
                .then(
                  (e) => {
                    console.log("info", e.data),
                      (this.clearmission.length = 0),
                      (this.friendinvite.length = 0),
                      (this.friendgift.length = 0),
                      (this.itemnum = e.data.length);
                    for (var i = 0; i < e.data.length; i++)
                      switch (e.data[i].type) {
                        case "mission complete":
                          this.clearmission.push(e.data[i]);
                          break;
                        case "friend invitation":
                          this.friendinvite.push(e.data[i]);
                          break;
                        case "receive gift":
                          this.friendgift.push(e.data[i]);
                          break;
                      }
                    0 == this.itemnum
                      ? ((this.infobool = !1),
                        (this.$parent.$refs.rightmenu.infodotbool = !1))
                      : ((this.infobool = !0),
                        (this.$parent.$refs.rightmenu.infodotbool = !0)),
                      this.checkinfo();
                  },
                  (e) => {
                    console.log(e);
                  }
                );
            },
            checkinfo() {
              var e = "";
              if (0 == this.itemnum)
                (e = "您已查看完所有通知!"), (this.infobool = !1);
              else {
                for (var i = 0; i < this.clearmission.length; i++)
                  e += `\n        <div class="heightSet w-100 d-flex">\n        <input id="clearmission${i}" type="radio" name="inforadio" data-type="clearmission" value="${this.clearmission[i].content.mission.title}" />\n          <label for="clearmission${i}">\n            <span>完成「${this.clearmission[i].content.mission.title}」任務通知</span>\n          </label>\n        </div>\n        `;
                for (var t = 0; t < this.friendinvite.length; t++)
                  e += `\n        <div class="heightSet w-100 d-flex">\n        <input id="friendinvite${t}" type="radio" name="inforadio" data-type="friendinvite" data-index="${t}" value="${this.friendinvite[t].content.player.id}" />\n          <label for="friendinvite${t}">\n            <span>收到玩家「${this.friendinvite[t].content.player.account}」的好友邀請</span>\n          </label>\n        </div>\n        `;
                this.friendgift.forEach(function (i, t) {
                  e += `\n        <div class="heightSet w-100 d-flex">\n        <input id="friendgift${t}" type="radio" name="inforadio" data-type="friendgift" data-index="${t}" value="${i.content.player.id}" />\n          <label for="friendgift${t}">\n            <span>收到玩家「${i.content.player.account}」的好友贈禮</span>\n          </label>\n        </div>\n        `;
                }),
                  (this.infobool = !0);
              }
              return e;
            },
            openitem() {
              for (
                var e = document.getElementsByName("inforadio"), i = 0;
                i < e.length;
                i++
              )
                e[i].checked &&
                  (console.log(e[i].id),
                  "clearmission" == e[i].dataset.type
                    ? ((this.itemtype = e[i].value), (this.itembool = !0))
                    : "friendinvite" == e[i].dataset.type
                    ? ((this.itemtype = "friendinvite"),
                      (this.friendindex = e[i].dataset.index),
                      (this.itembool = !0))
                    : "friendgift" == e[i].dataset.type &&
                      ((this.itemtype = "friendgift"),
                      (this.friendindex = e[i].dataset.index),
                      (this.itembool = !0)));
            },
            item(e) {
              var i = "";
              switch (e) {
                case "每日登入":
                case "累積登入":
                case "觀看網站中文章":
                case "觀看網站中影片":
                case "累積觀看網站中文章":
                case "累積觀看網站中影片":
                case "累積觀看線上展覽":
                  i = `\n        <div class="flexbox w-100 h-100"></div>\n        <div class="flexbox w-100 h-100 flex-c">\n            <p>完成「${e}」任務，<br />請至禮物盒領取獎勵</p>\n        </div>\n        <div class="flexbox w-100 h-100">\n            <button class="send_confirmBtn" id="info_check">確認</button>\n        </div>\n          `;
                  break;
                case "誰是航運王":
                  i = `\n        <div class="flexbox w-100 h-100"></div>\n        <div class="flexbox w-100 h-100 pic game7pic" style="flex:2;"></div>\n        <div class="flexbox w-100 h-100 flex-c">\n            <p>完成「${e}」任務，<br />請至禮物盒領取獎勵</p>\n        </div>\n        <div class="flexbox w-100 h-100">\n            <button class="send_confirmBtn" id="info_check">確認</button>\n        </div>\n          `;
                  break;
                case "超級飛修員":
                  i = `\n        <div class="flexbox w-100 h-100"></div>\n        <div class="flexbox w-100 h-100 pic game8pic" style="flex:2;"></div>\n        <div class="flexbox w-100 h-100 flex-c">\n            <p>完成「${e}」任務，<br />請至禮物盒領取獎勵</p>\n        </div>\n        <div class="flexbox w-100 h-100">\n            <button class="send_confirmBtn" id="info_check">確認</button>\n        </div>\n          `;
                  break;
                case "無人商店採購":
                  i = `\n        <div class="flexbox w-100 h-100"></div>\n        <div class="flexbox w-100 h-100 pic game1pic" style="flex:2;"></div>\n        <div class="flexbox w-100 h-100 flex-c">\n            <p>完成「${e}」任務，<br />請至禮物盒領取獎勵</p>\n        </div>\n        <div class="flexbox w-100 h-100">\n            <button class="send_confirmBtn" id="info_check">確認</button>\n        </div>\n          `;
                  break;
                case "智慧製造洗手乳":
                  i = `\n        <div class="flexbox w-100 h-100"></div>\n        <div class="flexbox w-100 h-100 pic game2pic" style="flex:2;"></div>\n        <div class="flexbox w-100 h-100 flex-c">\n            <p>完成「${e}」任務，<br />請至禮物盒領取獎勵</p>\n        </div>\n        <div class="flexbox w-100 h-100">\n            <button class="send_confirmBtn" id="info_check">確認</button>\n        </div>\n          `;
                  break;
                case "彩繪技職樂園":
                  i = `\n        <div class="flexbox w-100 h-100"></div>\n        <div class="flexbox w-100 h-100 pic game3pic" style="flex:2;"></div>\n        <div class="flexbox w-100 h-100 flex-c">\n            <p>完成「${e}」任務，<br />請至禮物盒領取獎勵</p>\n        </div>\n        <div class="flexbox w-100 h-100">\n            <button class="send_confirmBtn" id="info_check">確認</button>\n        </div>\n          `;
                  break;
                case "智能雞舍":
                  i = `\n        <div class="flexbox w-100 h-100"></div>\n        <div class="flexbox w-100 h-100 pic game4pic" style="flex:2;"></div>\n        <div class="flexbox w-100 h-100 flex-c">\n            <p>完成「${e}」任務，<br />請至禮物盒領取獎勵</p>\n        </div>\n        <div class="flexbox w-100 h-100">\n            <button class="send_confirmBtn" id="info_check">確認</button>\n        </div>\n          `;
                  break;
                case "灑網抓魚感測":
                  i = `\n        <div class="flexbox w-100 h-100"></div>\n        <div class="flexbox w-100 h-100 pic game5pic" style="flex:2;"></div>\n        <div class="flexbox w-100 h-100 flex-c">\n            <p>完成「${e}」任務，<br />請至禮物盒領取獎勵</p>\n        </div>\n        <div class="flexbox w-100 h-100">\n            <button class="send_confirmBtn" id="info_check">確認</button>\n        </div>\n          `;
                  break;
                case "農業小幫手":
                  i = `\n        <div class="flexbox w-100 h-100"></div>\n        <div class="flexbox w-100 h-100 pic game6pic" style="flex:2;"></div>\n        <div class="flexbox w-100 h-100 flex-c">\n            <p>完成「${e}」任務，<br />請至禮物盒領取獎勵</p>\n        </div>\n        <div class="flexbox w-100 h-100">\n            <button class="send_confirmBtn" id="info_check">確認</button>\n        </div>\n          `;
                  break;
                case "花卉實驗室":
                case "建築師的一天":
                case "積木樂園":
                case "救援代號：台灣黑熊":
                  i = `\n        <div class="flexbox w-100 h-100"></div>\n        <div class="flexbox w-100 h-100 pic giftpic" style="flex:2;"></div>\n        <div class="flexbox w-100 h-100 flex-c">\n            <p>完成「${e}」任務，<br />請至禮物盒領取獎勵</p>\n        </div>\n        <div class="flexbox w-100 h-100">\n            <button class="send_confirmBtn" id="info_check">確認</button>\n        </div>\n          `;
                  break;
                case "觀看線上展覽":
                  i = `\n        <div class="flexbox w-100 h-100"></div>\n        <div class="flexbox w-100 h-100 pic showpic" style="flex:2;"></div>\n        <div class="flexbox w-100 h-100 flex-c">\n            <p>完成「${e}」任務，<br />請至禮物盒領取獎勵</p>\n        </div>\n        <div class="flexbox w-100 h-100">\n            <button class="send_confirmBtn" id="info_check">確認</button>\n        </div>\n          `;
                  break;
                case "friendinvite":
                  i = `\n        <div class="flexbox w-100 position-r">\n          <div class="close_btn pointer" id="invite_close"></div>\n        </div>\n        <div class="informtitle flexbox w-100 h-100">\n          交友邀請\n        </div>\n        <div class="flexbox w-100 h-100 flex-r" style="flex:3;">\n          <div class="lionIcon flexbox w-100 h-100"></div>\n          <div class="dataText lexbox h-100 flex-c">\n            <p class="stage">${this.mailnewline(
                    this.friendinvite[this.friendindex].content.player.account
                  )}</p>\n          </div>\n        </div>\n        <div class="widthSet flexbox w-100 h-100 flex-r">\n          <div class="flexbox w-100 h-100">\n            <button class="rejectBtn" id="invite_refuse">拒絕</button>\n          </div>\n          <div class="flexbox w-100 h-100">\n            <button class="acceptBtn" id="invite_accept">接受</button>\n          </div>\n        </div>\n\n        `;
                  break;
                case "friendgift":
                  i = `\n        <div class="flexbox w-100 h-100"></div>\n        <div class="flexbox w-100 h-100 flex-c">\n            <p>收到「${
                    this.friendgift[this.friendindex].content.player.account
                  }」的禮物，<br />請至禮物盒領取獎勵</p>\n        </div>\n        <div class="flexbox w-100 h-100">\n            <button class="send_confirmBtn" id="send_check">確認</button>\n        </div>\n        `;
                  break;
              }
              return i;
            },
            mailnewline(e) {
              var i = e.split("@");
              return i[0] + "<br />@" + i[1];
            },
            initemgroup(e) {
              if (
                (console.log(e.target.id),
                null != e.target.id ||
                  "" != e.target.id ||
                  void 0 != e.target.id)
              ) {
                let r = e.target.id;
                switch (r) {
                  case "info_check":
                    for (var i, t = 0; t < this.clearmission.length; t++)
                      this.itemtype ==
                        this.clearmission[t].content.mission.title &&
                        (i = this.clearmission[t].id);
                    this.$http
                      .patch(
                        N.apiUrl +
                          "players/" +
                          N.getCookie("id") +
                          "/notices/" +
                          i,
                        { player: N.getCookie("id"), notice: i },
                        {
                          emulateJSON: !0,
                          headers: {
                            authorization: "Bearer " + N.getCookie("token"),
                          },
                        }
                      )
                      .then(
                        (e) => {
                          this.refreshView();
                        },
                        (e) => {
                          console.log(e);
                        }
                      );
                    break;
                  case "invite_refuse":
                    for (var o, s = 0; s < this.friendinvite.length; s++)
                      this.friendindex == s && (o = this.friendinvite[s].id);
                    this.$http
                      .patch(
                        N.apiUrl +
                          "players/" +
                          N.getCookie("id") +
                          "/notices/" +
                          o,
                        { player: N.getCookie("id"), notice: o },
                        {
                          emulateJSON: !0,
                          headers: {
                            authorization: "Bearer " + N.getCookie("token"),
                          },
                        }
                      )
                      .then(
                        (e) => {
                          (this.itemtype = ""), this.refreshView();
                        },
                        (e) => {
                          console.log(e);
                        }
                      );
                    break;
                  case "invite_accept":
                    for (var n, l, a = 0; a < this.friendinvite.length; a++)
                      this.friendindex == a &&
                        ((l = this.friendinvite[a].id),
                        (n = this.friendinvite[a].content.player.id));
                    this.$http
                      .post(
                        N.apiUrl +
                          "players/" +
                          N.getCookie("id") +
                          "/confirmFriend/" +
                          n,
                        { notice_id: l },
                        {
                          emulateJSON: !0,
                          headers: {
                            authorization: "Bearer " + N.getCookie("token"),
                          },
                        }
                      )
                      .then(
                        (e) => {
                          this.refreshView();
                        },
                        (e) => {
                          console.log(e);
                        }
                      );
                    break;
                  case "send_check":
                    var c;
                    (c = this.friendgift[this.friendindex].id),
                      this.$http
                        .patch(
                          N.apiUrl +
                            "players/" +
                            N.getCookie("id") +
                            "/notices/" +
                            c,
                          { player: N.getCookie("id"), notice: c },
                          {
                            emulateJSON: !0,
                            headers: {
                              authorization: "Bearer " + N.getCookie("token"),
                            },
                          }
                        )
                        .then(
                          (e) => {
                            this.refreshView();
                          },
                          (e) => {
                            console.log(e);
                          }
                        );
                    break;
                }
                this.itembool = !1;
              }
            },
          },
        };
        const ri = (0, b.Z)(ci, [
          ["render", ai],
          ["__scopeId", "data-v-1427a0ed"],
        ]);
        var di = ri;
        const hi = (e) => (
            (0, s.dD)("data-v-f78c9ffc"), (e = e()), (0, s.Cn)(), e
          ),
          xi = { id: "friendpage" },
          bi = { id: "friendgroup" },
          pi = hi(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          fi = { class: "friendFrame box w-100 h-100" },
          ui = hi(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          _i = { class: "contentFrame flexbox w-100 h-100 flex-c" },
          wi = { class: "flexbox w-100 h-100 flex-r" },
          vi = { class: "flexbox w-100 h-100 flex-c" },
          mi = { class: "flexbox w-100 h-100 position-r" },
          gi = { class: "w-100 h-100 flexbox" },
          ki = {
            class: "find_bg",
            type: "text",
            placeholder: "搜尋已加入好友",
            ref: "searchinput",
            id: "searchinput",
          },
          yi = { class: "w-100 h-100 flexbox flex-r" },
          Ci = hi(() =>
            (0, s._)("div", { class: "w-100 h-100 flexbox" }, null, -1)
          ),
          ji = { class: "myFriend h-100 flexbox" },
          $i = hi(() =>
            (0, s._)(
              "input",
              {
                id: "listradio",
                type: "radio",
                name: "friendradio",
                value: "list",
                checked: "",
              },
              null,
              -1
            )
          ),
          Wi = { for: "listradio", style: { width: "100%", height: "100%" } },
          Bi = { class: "ranking h-100 flexbox" },
          qi = hi(() =>
            (0, s._)(
              "input",
              {
                id: "rankradio",
                type: "radio",
                name: "friendradio",
                value: "rank",
              },
              null,
              -1
            )
          ),
          Hi = { for: "rankradio", style: { width: "100%", height: "100%" } },
          Fi = hi(() =>
            (0, s._)("div", { class: "w-100 h-100 flexbox" }, null, -1)
          ),
          Di = { class: "findFriend_textbg w-100" },
          Ti = ["innerHTML"],
          Ii = ["innerHTML"],
          Mi = { class: "w-100 h-60" },
          Li = ["innerHTML"],
          Si = hi(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          zi = hi(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Oi = hi(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Ei = { id: "friendsend" },
          Ui = hi(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Ni = { class: "friendFrame box w-100 h-100" },
          Pi = hi(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Yi = { class: "contentFrame flexbox w-100 h-100 flex-c" },
          Vi = { class: "flexbox w-100 h-100 flex-r" },
          Ki = { class: "flexbox w-100 h-100 flex-c" },
          Ji = { class: "flexbox w-100 h-100 position-r" },
          Zi = hi(() =>
            (0, s._)(
              "div",
              { class: "chooseGift w-100 h-100 flexbox" },
              "選擇贈送禮物...",
              -1
            )
          ),
          Ai = { class: "gray_bg w-100 h-100" },
          Ri = ["onClick"],
          Gi = ["id", "value"],
          Xi = ["for"],
          Qi = { class: "position-r" },
          et = { class: "number_bg", style: { "text-align": "center" } },
          it = ["onClick"],
          tt = ["id", "value"],
          ot = ["for"],
          st = { class: "position-r" },
          nt = { class: "number_bg", style: { "text-align": "center" } },
          lt = { class: "flexbox w-100 h-100" },
          at = hi(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          ct = { class: "flexbox w-100 h-100" },
          rt = hi(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          dt = hi(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          ht = hi(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          xt = { id: "frienditem" },
          bt = hi(() =>
            (0, s._)(
              "div",
              { class: "flexbox", style: { flex: "2" } },
              null,
              -1
            )
          ),
          pt = { class: "itemFrame flexbox w-100 h-100 flex-c" },
          ft = hi(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          ut = { class: "item_frame flexbox w-100 h-100 flex-c" },
          _t = { class: "flexbox w-100 h-100 flex-r" },
          wt = ["innerHTML"],
          vt = hi(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          mt = hi(() =>
            (0, s._)(
              "div",
              { class: "flexbox", style: { flex: "2" } },
              null,
              -1
            )
          );
        function gt(e, i, t, n, l, a) {
          return (
            (0, s.wg)(),
            (0, s.iD)("div", xi, [
              (0, s.wy)(
                (0, s._)(
                  "div",
                  bi,
                  [
                    pi,
                    (0, s._)("div", fi, [
                      ui,
                      (0, s._)("div", _i, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", wi, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({ width: l.outbox_w + "px" }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", vi, [
                            (0, s._)("div", mi, [
                              (0, s._)("div", {
                                class: "back_btn w-100 pointer",
                                onClick:
                                  i[0] || (i[0] = (e) => a.friend_back()),
                              }),
                              (0, s._)("div", {
                                class: "close_btn pointer",
                                onClick:
                                  i[1] || (i[1] = (e) => n.friend_close(!1)),
                              }),
                            ]),
                            (0, s._)("div", gi, [
                              (0, s._)("input", ki, null, 512),
                              (0, s._)("button", {
                                type: "button",
                                id: "searchbutton",
                                onClick: i[2] || (i[2] = (e) => a.searchfun()),
                              }),
                            ]),
                            (0, s._)("div", yi, [
                              Ci,
                              (0, s.wy)(
                                (0, s._)(
                                  "div",
                                  ji,
                                  [
                                    $i,
                                    (0, s._)("label", Wi, [
                                      (0, s._)(
                                        "span",
                                        {
                                          onClick:
                                            i[3] ||
                                            (i[3] = (e) =>
                                              a.clicktab(
                                                "list",
                                                "搜尋已加入好友"
                                              )),
                                        },
                                        "我的好友"
                                      ),
                                    ]),
                                  ],
                                  512
                                ),
                                [[o.F8, l.list_rankbool]]
                              ),
                              (0, s.wy)(
                                (0, s._)(
                                  "div",
                                  Bi,
                                  [
                                    qi,
                                    (0, s._)("label", Hi, [
                                      (0, s._)(
                                        "span",
                                        {
                                          onClick:
                                            i[4] ||
                                            (i[4] = (e) =>
                                              a.clicktab("rank", "增加好友")),
                                        },
                                        "排行榜"
                                      ),
                                    ]),
                                  ],
                                  512
                                ),
                                [[o.F8, l.list_rankbool]]
                              ),
                              Fi,
                            ]),
                            (0, s.wy)(
                              (0, s._)(
                                "div",
                                Di,
                                [
                                  "list" == l.friendscene
                                    ? ((0, s.wg)(),
                                      (0, s.iD)(
                                        "div",
                                        {
                                          key: 0,
                                          id: "friendbox",
                                          class:
                                            "w-100 h-100 d-flex flex-r scrollbar",
                                          style: (0, u.j5)({
                                            "max-height": l.scrollbox_h + "px",
                                          }),
                                          innerHTML: a.friendlistfun(),
                                          onClick:
                                            i[5] ||
                                            (i[5] = (...e) =>
                                              a.sendfun && a.sendfun(...e)),
                                        },
                                        null,
                                        12,
                                        Ti
                                      ))
                                    : (0, s.kq)("", !0),
                                  "rank" == l.friendscene
                                    ? ((0, s.wg)(),
                                      (0, s.iD)(
                                        "div",
                                        {
                                          key: 1,
                                          id: "rankbox",
                                          class:
                                            "w-100 h-100 d-flex flex-r scrollbar",
                                          style: (0, u.j5)({
                                            "max-height": l.scrollbox_h + "px",
                                          }),
                                          innerHTML: a.ranklistfun(l.rankarr),
                                        },
                                        null,
                                        12,
                                        Ii
                                      ))
                                    : (0, s.kq)("", !0),
                                ],
                                512
                              ),
                              [[o.F8, l.list_rankbool]]
                            ),
                            (0, s.wy)(
                              (0, s._)(
                                "div",
                                Mi,
                                [
                                  (0, s._)(
                                    "div",
                                    {
                                      id: "searchbox",
                                      class:
                                        "w-100 h-100 d-flex flex-r scrollbar justify-center",
                                      style: (0, u.j5)({
                                        "max-height": l.scrollbox_h + "px",
                                      }),
                                      innerHTML: l.searchobj,
                                      onClick:
                                        i[6] ||
                                        (i[6] = (...e) =>
                                          a.inputsearchfun &&
                                          a.inputsearchfun(...e)),
                                    },
                                    null,
                                    12,
                                    Li
                                  ),
                                ],
                                512
                              ),
                              [[o.F8, l.searchbool]]
                            ),
                            Si,
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({ width: l.outbox_w + "px" }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                      ]),
                      zi,
                    ]),
                    Oi,
                  ],
                  512
                ),
                [[o.F8, l.friendlist]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  Ei,
                  [
                    Ui,
                    (0, s._)("div", Ni, [
                      Pi,
                      (0, s._)("div", Yi, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", Vi, [
                          (0, s._)(
                            "div",
                            {
                              class: "w-100",
                              style: (0, u.j5)({ width: l.outbox_w + "px" }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", Ki, [
                            (0, s._)("div", Ji, [
                              (0, s._)("div", {
                                class: "close_btn pointer",
                                onClick:
                                  i[7] || (i[7] = (e) => a.closefriendsend()),
                              }),
                            ]),
                            Zi,
                            (0, s._)("div", Ai, [
                              (0, s._)(
                                "div",
                                {
                                  class: "w-100 h-100 flex-c scrollbar",
                                  style: (0, u.j5)([
                                    { "text-align": "left" },
                                    { "max-height": l.scrollbox_h + "px" },
                                  ]),
                                },
                                [
                                  ((0, s.wg)(!0),
                                  (0, s.iD)(
                                    s.HY,
                                    null,
                                    (0, s.Ko)(
                                      l.sendlist,
                                      (e, i) => (
                                        (0, s.wg)(),
                                        (0, s.iD)(
                                          "div",
                                          {
                                            onClick: (e) => a.chooseItem(i, 0),
                                            class: (0, u.C_)(
                                              e.item.data.name + " senditem"
                                            ),
                                            style: {
                                              width: "25%",
                                              display: "inline-block",
                                              "margin-bottom": "30px",
                                            },
                                            key: e.value,
                                          },
                                          [
                                            (0, s._)(
                                              "input",
                                              {
                                                id: i + "radio",
                                                type: "radio",
                                                name: "meatradio",
                                                value: e.item.data.name,
                                              },
                                              null,
                                              8,
                                              Gi
                                            ),
                                            (0, s._)(
                                              "label",
                                              {
                                                for: i + "radio",
                                                class: "h-100 flexbox",
                                              },
                                              [
                                                (0, s._)("span", Qi, [
                                                  (0, s._)(
                                                    "div",
                                                    et,
                                                    (0, u.zw)(e.quantity),
                                                    1
                                                  ),
                                                ]),
                                              ],
                                              8,
                                              Xi
                                            ),
                                          ],
                                          10,
                                          Ri
                                        )
                                      )
                                    ),
                                    128
                                  )),
                                  ((0, s.wg)(!0),
                                  (0, s.iD)(
                                    s.HY,
                                    null,
                                    (0, s.Ko)(
                                      l.sendlistcloth,
                                      (e, i) => (
                                        (0, s.wg)(),
                                        (0, s.iD)(
                                          "div",
                                          {
                                            onClick: (e) => a.chooseItem(i, 1),
                                            class: (0, u.C_)(
                                              e.cloth.data.name + " senditem"
                                            ),
                                            style: {
                                              width: "25%",
                                              display: "inline-block",
                                              "margin-bottom": "30px",
                                            },
                                            key: e.value,
                                          },
                                          [
                                            (0, s._)(
                                              "input",
                                              {
                                                id:
                                                  l.sendlist.length +
                                                  i +
                                                  "radio",
                                                type: "radio",
                                                name: "meatradio",
                                                value: e.cloth.data.name,
                                              },
                                              null,
                                              8,
                                              tt
                                            ),
                                            (0, s._)(
                                              "label",
                                              {
                                                for:
                                                  l.sendlist.length +
                                                  i +
                                                  "radio",
                                                class: "h-100 flexbox",
                                              },
                                              [
                                                (0, s._)("span", st, [
                                                  (0, s._)(
                                                    "div",
                                                    nt,
                                                    (0, u.zw)(e.quantity),
                                                    1
                                                  ),
                                                ]),
                                              ],
                                              8,
                                              ot
                                            ),
                                          ],
                                          10,
                                          it
                                        )
                                      )
                                    ),
                                    128
                                  )),
                                ],
                                4
                              ),
                            ]),
                            (0, s._)("div", lt, [
                              at,
                              (0, s._)("div", ct, [
                                (0, s._)(
                                  "button",
                                  {
                                    class: "chooseGift_confirm",
                                    onClick:
                                      i[8] || (i[8] = (e) => a.choosesendfun()),
                                  },
                                  " 確認 "
                                ),
                              ]),
                              rt,
                            ]),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "w-100",
                              style: (0, u.j5)({ width: l.outbox_w + "px" }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                      ]),
                      dt,
                    ]),
                    ht,
                  ],
                  512
                ),
                [[o.F8, l.friendsendbool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  xt,
                  [
                    bt,
                    (0, s._)("div", pt, [
                      ft,
                      (0, s._)("div", ut, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.item_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", _t, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.item_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)(
                            "div",
                            {
                              id: "itemcontent",
                              class: "flexbox w-100 h-100 flex-c",
                              innerHTML: a.item(l.itemtype),
                              onClick:
                                i[9] ||
                                (i[9] = (...e) =>
                                  a.itemscenefun && a.itemscenefun(...e)),
                            },
                            null,
                            8,
                            wt
                          ),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.item_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.item_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                      ]),
                      vt,
                    ]),
                    mt,
                  ],
                  512
                ),
                [[o.F8, l.itembool]]
              ),
            ])
          );
        }
        var kt = {
          name: "friend_ship",
          emits: ["friend_close"],
          setup(e, { emit: i }) {
            function t(e) {
              i("friend_close", e);
            }
            return { friend_close: t };
          },
          data() {
            return {
              outbox_h: 20,
              outbox_w: 0,
              scrollbox_h: 380,
              item_outbox_h: 20,
              item_outbox_w: 0,
              friendlist: !0,
              friendsendbool: !1,
              itembool: !1,
              list_rankbool: !0,
              searchbool: !1,
              friendscene: "list",
              searchobj: "",
              itemtype: "",
              objname: "牛肉",
              objcss: "beef",
              beefnum: 20,
              chickennum: 20,
              pignum: 20,
              sendnum: 5,
              rankarr: [],
              friendarr: [],
              playerlist: [],
              addplayer: [],
              sendlist: [],
              sendlistcloth: [],
              choosetype: 0,
              chooseindex: 0,
              sendUser: 0,
            };
          },
          mounted() {
            this.refreshView();
          },
          methods: {
            setwidth() {
              var e, i, t, o, s, n, l, a, c, r, d, h, x;
              window.innerWidth > 1920
                ? ((e = (window.innerHeight / 5) * 3),
                  (i = (window.innerWidth / 4) * 2),
                  (a = window.innerHeight / 3),
                  (c = window.innerWidth / 5))
                : (window.innerWidth >= 1440 && window.innerWidth < 1920) ||
                  (window.innerWidth >= 1024 && window.innerWidth < 1440)
                ? ((e = (window.innerHeight / 5) * 3),
                  (i = (window.innerWidth / 4) * 2),
                  (a = (window.innerHeight / 4) * 2),
                  (c = (window.innerWidth / 6) * 2))
                : (window.innerWidth >= 768 && window.innerWidth < 1024) ||
                  (window.innerWidth >= 740 && window.innerWidth < 768)
                ? ((e = (window.innerHeight / 5) * 3),
                  (i = (window.innerWidth / 4) * 2),
                  (a = (window.innerHeight / 4) * 2),
                  (c = (window.innerWidth / 5.5) * 1.5))
                : window.innerWidth >= 720 && window.innerWidth < 740
                ? ((e = (window.innerHeight / 5) * 3),
                  (i = (window.innerWidth / 4.5) * 2),
                  (a = (window.innerHeight / 4) * 2),
                  (c = (window.innerWidth / 6) * 2))
                : window.innerWidth >= 654 && window.innerWidth < 720
                ? ((e = (window.innerHeight / 5) * 3),
                  (i = (window.innerWidth / 4) * 2),
                  (a = (window.innerHeight / 4) * 2),
                  (c = (window.innerWidth / 6) * 2))
                : window.innerWidth >= 425 &&
                  window.innerWidth < 654 &&
                  ((e = (window.innerHeight / 5) * 3),
                  (i = (window.innerWidth / 3.5) * 1.5),
                  (a = (window.innerHeight / 4.5) * 2.5),
                  (c = (window.innerWidth / 5.5) * 1.5)),
                (t = (150 * i) / 252),
                (o = (252 * e) / 150),
                (l = (85 * i) / 252),
                (n = (i - o) / 2),
                (s = (e - t) / 2),
                console.log(
                  window.innerHeight,
                  window.innerWidth,
                  e,
                  i,
                  t,
                  o,
                  s,
                  n
                ),
                (this.outbox_h = s < 0 ? 0 : s),
                (this.outbox_w = n < 0 ? 0 : n),
                (this.scrollbox_h = l),
                (d = (178 * a) / 150),
                (r = (150 * c) / 178),
                (x = (c - d) / 2),
                (h = (a - r) / 2),
                console.log(h),
                (this.item_outbox_w = x < 0 ? 0 : x),
                h < 0 ? (this.item_outbox_w = 0) : (this.item_outbox_h = h);
            },
            closefriendsend() {
              (this.friendsendbool = !1),
                (this.itembool = !1),
                (this.friendlist = !0);
            },
            chooseItem(e, i) {
              (this.chooseindex = e), (this.choosetype = i);
            },
            friend_back() {
              this.list_rankbool
                ? this.friend_close(!1)
                : ((this.list_rankbool = !0),
                  (this.searchbool = !1),
                  (document.getElementById("searchinput").value = ""));
            },
            refreshView() {
              this.$http
                .get(N.apiUrl + "leaderboard", {
                  headers: { authorization: "Bearer " + N.getCookie("token") },
                })
                .then(
                  (e) => {
                    (this.rankarr.length = 0),
                      console.log(e.data),
                      (this.rankarr = e.data);
                  },
                  (e) => {}
                ),
                this.$http
                  .get(N.apiUrl + "players/" + N.getCookie("id") + "/friends", {
                    headers: {
                      authorization: "Bearer " + N.getCookie("token"),
                    },
                  })
                  .then(
                    (e) => {
                      (this.friendarr.length = 0),
                        console.log(e.data),
                        (this.friendarr = e.data);
                    },
                    (e) => {}
                  ),
                this.$http
                  .get(
                    N.apiUrl +
                      "players/" +
                      N.getCookie("id") +
                      "/sendableGifts",
                    {
                      headers: {
                        authorization: "Bearer " + N.getCookie("token"),
                      },
                    }
                  )
                  .then((e) => {
                    (this.sendlist = e.data.backpack),
                      (this.sendlistcloth = e.data.closet),
                      console.log("#####", this.sendlistcloth, this.sendlist);
                  });
            },
            clicktab(e, i) {
              (this.friendscene = e),
                (document.getElementById("searchinput").placeholder = i);
            },
            ranklistfun(e) {
              for (var i = "", t = 0; t < e.length; t++)
                i += `\n                  <div class="wrapWidth w-100 h-60 d-flex flex-r">\n                    <div class="picHeight flex-c">\n                      <div\n                        class="${this.setrankcss(
                  t
                )} flexbox h-100"></div>\n                      <div class="rankNum_${this.setrankfontcss(
                  t
                )} flexbox">\n                        ${
                  t + 1
                }\n                      </div>\n                    </div>\n                    <div class="nameText h-100 flexbox flex-c" style="align-items: start;">\n                      <p style="margin: 0">${
                  e[t].name
                }</p>\n                      <p class="changLine d-flex" style="margin: 0; font-size: 1.7vmin;">${this.mailnewline(
                  e[t].player.account
                )}</p>\n                      <p class="stageName" style="margin: 0">LV ${
                  e[t].level
                }</p>\n                      <div class="dotPos flexbox">\n                        <span class="full"></span>\n                        <span class="nofull"></span>\n                        <span class="nofull"></span>\n                      </div>\n                    </div>\n                  </div>\n        `;
              return i;
            },
            setrankcss(e) {
              var i = "";
              switch (e) {
                case 0:
                  i = "first";
                  break;
                case 1:
                  i = "second";
                  break;
                case 2:
                  i = "third";
                  break;
                default:
                  i = "other";
                  break;
              }
              return i;
            },
            setrankfontcss(e) {
              var i = "";
              return (i = e < 3 ? "black" : "white"), i;
            },
            friendlistfun() {
              for (var e = "", i = 0; i < this.friendarr.length; i++)
                e += `\n                  <div class="wrapWidth w-100 h-60 d-flex flex-r">\n                    <div class="picHeight flex-c">\n                      <div\n                        class="lionPic w-100 h-100 flexbox"\n                        style="flex: 2"\n                      ></div>\n                      <div class="sendgiftBtn flexbox" data-id="${
                  this.friendarr[i].id
                }">\n                        贈送禮物\n                      </div>\n                    </div>\n                    <div class="nameText h-100 flexbox flex-c" style="align-items: start;">\n                      <p style="margin: 0">${
                  this.friendarr[i].lions[0].name
                }</p>\n                      <p style="margin: 0">${this.mailnewline(
                  this.friendarr[i].account
                )}</p>\n                      <p class="stageName" style="margin: 0;">LV ${
                  this.friendarr[i].lions[0].level
                }</p>\n                      <div class="dotPos flexbox">\n                        <span class="full"></span>\n                        <span class="nofull"></span>\n                        <span class="nofull"></span>\n                      </div>\n                    </div>\n                  </div>\n        `;
              return e;
            },
            searchfun() {
              for (
                var e = document.getElementsByName("friendradio"),
                  i = document.getElementById("searchinput").value,
                  t = "",
                  o = 0;
                o < e.length;
                o++
              )
                if (e[o].checked)
                  if ("rank" == e[o].value)
                    this.$http
                      .get(N.apiUrl + "players", {
                        headers: {
                          authorization: "Bearer " + N.getCookie("token"),
                        },
                      })
                      .then(
                        (e) => {
                          console.log("playerslist", e.data),
                            (this.playerlist = e.data);
                          for (var o = 0; o < this.playerlist.length; o++)
                            -1 != this.playerlist[o].account.indexOf(i) &&
                              (t += `\n                      <div class="black_bg d-flex w-100 h-100 flex-c">\n                        <div class="addFriend_bg flexbox" style="flex:2;"></div>\n                        <div class="nameText flexbox flex-c w-100" style="flex:2;">\n                          <p style="margin: 0;white-space: pre-line;">${this.mailnewline(
                                this.playerlist[o].account
                              )}</p>\n                        </div>\n                        <div class="flexbox w-100">\n                          <div class="flexbox w-100 h-100"></div>\n                          <div class="addBtn flexbox" style="flex:2;" id="inputaddbtn" data-id="${
                                this.playerlist[o].id
                              }">加入好友</div>\n                          <div class="flexbox w-100 h-100"></div>\n                        </div>\n                      </div>\n                    `);
                          (this.searchobj = t),
                            (this.list_rankbool = !1),
                            (this.searchbool = !0);
                        },
                        (e) => {
                          console.log(e);
                        }
                      );
                  else if ("list" == e[o].value) {
                    for (var s = 0; s < this.friendarr.length; s++)
                      1 != this.friendarr[s].lions[0].name.indexOf(i) &&
                        (t += `<div class="findblack_bg flex-c">\n          <div class="newFriend_bg flexbox w-100" style="flex:2;"></div>\n          <div class="nameText flexbox w-100 flex-c" style="flex:2;">\n            <p style="margin: 0">${
                          this.friendarr[s].lions[0].name
                        }</p>\n            <p style="margin: 0">${this.mailnewline(
                          this.friendarr[s].account
                        )}</p>\n            <p style="margin: 0">LV ${
                          this.friendarr[s].lions[0].level
                        }</p>\n          </div>\n          <div class="flexbox w-100">\n            <div class="flexbox w-100 h-100"></div>\n            <div class="sendgiftBtn flexbox w-100 h-100" style="flex:2;">贈送禮物</div>\n            <div class="flexbox w-100 h-100"></div>\n          </div>\n        </div>`);
                    (this.searchobj = t),
                      (this.list_rankbool = !1),
                      (this.searchbool = !0);
                  }
            },
            mailnewline(e) {
              var i = e.split("@");
              return i[0] + "<br />@" + i[1];
            },
            friendgroup(e) {
              var i = "";
              switch (e) {
                case "search":
                  i =
                    '\n        <div class="flexbox w-100 h-100 flex-r">\n        <div class="findblack_bg flex-c">\n          <div class="newFriend_bg flexbox w-100" style="flex:2;"></div>\n          <div class="nameText flexbox w-100 flex-c" style="flex:2;">\n            <p style="margin: 0">小明獅</p>\n            <p style="margin: 0">LV.51</p>\n            <p class="stageName" style="margin: 0">小漁獅-達人</p>\n          </div>\n          <div class="flexbox w-100">\n            <div class="flexbox w-100 h-100"></div>\n            <div class="sendgiftBtn flexbox w-100 h-100" style="flex:2;">贈送禮物</div>\n            <div class="flexbox w-100 h-100"></div>\n          </div>\n        </div>\n        <div class="findblack_bg flex-c">\n          <div class="newFriend_bg flexbox w-100" style="flex:2;"></div>\n          <div class="nameText flexbox w-100 flex-c" style="flex:2;">\n            <p style="margin: 0">小明獅</p>\n            <p style="margin: 0">LV.51</p>\n            <p class="stageName" style="margin: 0">小漁獅-達人</p>\n          </div>\n          <div class="flexbox w-100">\n            <div class="flexbox w-100 h-100"></div>\n            <div class="sendgiftBtn flexbox w-100 h-100" style="flex:2;">贈送禮物</div>\n            <div class="flexbox w-100 h-100"></div>\n          </div>\n        </div>\n        <div class="findblack_bg flex-c">\n          <div class="newFriend_bg flexbox w-100" style="flex:2;"></div>\n          <div class="nameText flexbox w-100 flex-c" style="flex:2;">\n            <p style="margin: 0">小明獅</p>\n            <p style="margin: 0">LV.51</p>\n            <p class="stageName" style="margin: 0">小漁獅-達人</p>\n          </div>\n          <div class="flexbox w-100">\n            <div class="flexbox w-100 h-100"></div>\n            <div class="sendgiftBtn flexbox w-100 h-100" style="flex:2;">贈送禮物</div>\n            <div class="flexbox w-100 h-100"></div>\n          </div>\n        </div>\n        </div>\n        \n        ';
                  break;
                case "add":
                  i =
                    '\n        <div class="flexbox w-100 h-100 flex-r">\n        <div class="flexbox w-100 h-100 flex-c"></div>\n        <div class="black_bg lexbox w-100 h-100 flex-c">\n          <div class="addFriend_bg flexbox" style="flex:2;"></div>\n          <div class="nameText flexbox flex-c w-100" style="flex:2;">\n            <p style="margin: 0">新加獅</p>\n            <p style="margin: 0">LV.54</p>\n            <p class="stageName" style="margin: 0">小漁獅-達人</p>\n          </div>\n          <div class="flexbox w-100">\n            <div class="flexbox w-100 h-100"></div>\n            <div class="addBtn flexbox" style="flex:2;" id="inputaddbtn">加入好友</div>\n            <div class="flexbox w-100 h-100"></div>\n          </div>\n        </div>\n        <div class="flexbox w-100 h-100 flex-c"></div>\n        </div>\n        \n        ';
                  break;
              }
              return i;
            },
            sendfun(e) {
              for (var i = e.target.classList, t = 0; t < i.length; t++)
                "sendgiftBtn" == i[t] &&
                  ((this.friendlist = !1),
                  (this.friendsendbool = !0),
                  (this.sendUser = e.target.getAttribute("data-id")));
            },
            inputsearchfun(e) {
              console.log(e.target.id);
              var i = e.target.id;
              switch (i) {
                case "inputaddbtn":
                  for (
                    var t = e.target.dataset.id, o = 0;
                    o < this.playerlist.length;
                    o++
                  )
                    this.playerlist[o].id == t &&
                      (this.addplayer = this.playerlist[o]);
                  (this.itemtype = "addfriend"), (this.itembool = !0);
                  break;
                case "":
                  break;
              }
              document.getElementById("searchinput").value = "";
            },
            choosesendfun() {
              0 == this.choosetype
                ? ((this.objcss =
                    this.sendlist[this.chooseindex].item.data.name),
                  (this.objname = this.sendlist[this.chooseindex].item.name))
                : ((this.objcss =
                    this.sendlistcloth[this.chooseindex].cloth.data.name),
                  (this.objname =
                    this.sendlistcloth[this.chooseindex].cloth.name)),
                (this.itembool = !0),
                (this.itemtype = "send");
            },
            item(e) {
              var i = "";
              switch (e) {
                case "addfriend":
                  i = `\n        <div class="flexbox w-100 h-100">\n        </div>\n        <div class="flexbox w-100 h-100 flex-r" style="flex:3;">\n          <div class="lionIcon flexbox w-100 h-100"></div>\n          <div class="dataText flexbox w-100 h-100 flex-c">\n            <p>${this.mailnewline(
                    this.addplayer.account
                  )}</p>\n          </div>\n        </div>\n        <div class="flexbox w-100 h-100 flex-r">\n          <div class="flexbox w-100 h-100">\n            <button class="cancelBtn" id="cancelBtn">取消</button>\n          </div>\n          <div class="flexbox w-100 h-100">\n            <button class="addBtn" id="addBtn">加入好友</button>\n          </div>\n        </div>\n        `;
                  break;
                case "sendsuccess":
                  i = `\n        <div class="flexbox w-100 h-100"></div>\n        <div class="flexbox w-100 h-100 flex-c" style="flex:3;">\n          <div class="flexbox w-100 h-100" style="flex:2;">\n            <div class="flexbox w-100 h-100"></div>\n            <div class="itemPos flexbox w-100 h-100 flex-c position-r">\n              <div class="itemPic_${this.objcss} w-100 h-100"></div>\n              <div class="num_bg">${this.sendnum}</div>\n            </div>\n            <div class="flexbox w-100 h-100"></div>\n          </div>\n          <div class="sendSuccess flexbox w-100 h-100">\n            <p>成功贈送</p>\n          </div>\n        </div>\n        <div class="sendSuccess_confirm flexbox w-100 h-100">\n            <button id="success_checkbtn">確認</button>\n        </div>\n        `;
                  break;
                case "send":
                  i = `\n        <div class="flexbox w-100"></div>\n        <div class="itemName flexbox w-100 h-100">\n          ${
                    this.objname
                  }\n        </div>\n        <div class="flexbox w-100 h-100 flex-c" style="flex:3;">\n          <div class="flexbox w-100 h-100" style="flex:2;">\n            <div class="flexbox w-100 h-100"></div>\n            <div class="itemPic_${
                    this.objcss
                  } flexbox w-100 h-100 flex-c position-r">\n              <div class="w-100 h-100"></div>\n              <div class="num_bg">${this.objnumfun()}</div>\n            </div>\n            <div class="flexbox w-100 h-100"></div>\n\n          </div>\n          <div class="flexbox w-100 h-100 flex-r">\n            <div class="flexbox w-100 h-100"></div>\n            <div class="posSet flexbox w-100 h-100">\n              <input type="button" value="" class="minus" id="minusnum">\n              <input type="number" id="friendsendnum" step="1" min="1" max="${this.objnumfun()}" name="quantity" value="1" pattern="" inputmode="">\n              <input type="button" value="" class="plus" id="plusnum">\n            </div>\n            <div class="flexbox w-100 h-100"></div>\n          </div>\n        </div>\n        <div class="flexbox w-100 h-100">\n          <div class="flexbox w-100 h-100">\n            <button class="cancelBtn" id="send_cancel">取消</button>\n          </div>\n          <div class="flexbox w-100 h-100">\n            <button class="sendBtn" id="send_send">贈送</button>\n          </div>\n        </div>\n        `;
                  break;
              }
              return i;
            },
            objnumfun() {
              return 0 == this.choosetype
                ? this.sendlist[this.chooseindex].quantity
                : this.sendlistcloth[this.chooseindex].quantity;
            },
            itemscenefun(e) {
              var i = e.target.id;
              switch ((console.log(i), i)) {
                case "addBtn":
                  var t = {
                    player: N.getCookie("id"),
                    receiver: this.addplayer.id,
                  };
                  this.$http
                    .post(
                      N.apiUrl +
                        "players/" +
                        N.getCookie("id") +
                        "/friendInvitation/" +
                        this.addplayer.id,
                      t,
                      {
                        headers: {
                          authorization: "Bearer " + N.getCookie("token"),
                        },
                      }
                    )
                    .then(
                      (e) => {
                        console.log(e.data),
                          (this.itembool = !1),
                          (this.list_rankbool = !0),
                          (this.searchbool = !1);
                      },
                      (e) => {
                        console.log(e);
                      }
                    );
                  break;
                case "cancelBtn":
                  (this.itembool = !1),
                    (this.list_rankbool = !0),
                    (this.searchbool = !1);
                  break;
                case "plusnum":
                  document.getElementById("friendsendnum").stepUp(),
                    console.log(document.getElementById("friendsendnum").value);
                  break;
                case "minusnum":
                  document.getElementById("friendsendnum").stepDown(),
                    console.log(document.getElementById("friendsendnum").value);
                  break;
                case "send_cancel":
                  (document.getElementById("friendsendnum").value = 1),
                    (this.itembool = !1);
                  break;
                case "send_send":
                  this.sendnum = document.getElementById("friendsendnum").value;
                  var o = null;
                  (o =
                    1 == this.choosetype
                      ? {
                          closet_id: this.sendlistcloth[this.chooseindex].id,
                          quantity: this.sendnum,
                        }
                      : {
                          backpack_id: this.sendlist[this.chooseindex].id,
                          quantity: this.sendnum,
                        }),
                    this.$http
                      .post(
                        N.apiUrl +
                          "players/" +
                          N.getCookie("id") +
                          "/sendGift/" +
                          this.sendUser,
                        o,
                        {
                          headers: {
                            authorization: "Bearer " + N.getCookie("token"),
                          },
                        }
                      )
                      .then(
                        (e) => {
                          console.log(e.data),
                            (this.itemtype = "sendsuccess"),
                            (document.getElementById(
                              "friendsendnum"
                            ).value = 1);
                        },
                        (e) => {
                          console.log(e);
                        }
                      );
                  break;
                case "success_checkbtn":
                  (this.itembool = !1),
                    (this.friendlist = !0),
                    (this.friendsendbool = !1);
                  break;
              }
            },
          },
        };
        const yt = (0, b.Z)(kt, [
          ["render", gt],
          ["__scopeId", "data-v-f78c9ffc"],
        ]);
        var Ct = yt;
        const jt = (e) => (
            (0, s.dD)("data-v-3f245e0c"), (e = e()), (0, s.Cn)(), e
          ),
          $t = { id: "giftbox_group" },
          Wt = { id: "giftbox_page" },
          Bt = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          qt = { class: "box w-100 h-100", style: { flex: "2" } },
          Ht = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Ft = {
            class: "giftbox_frame flex-c flexbox w-100 h-100",
            style: { flex: "3" },
          },
          Dt = { class: "flexbox flex-r w-100 h-100" },
          Tt = { class: "flexbox w-100 h-100 flex-c" },
          It = { class: "flexbox w-100 h-100 position-r" },
          Mt = { class: "flexbox flex-r w-100 h-100", style: { flex: "3" } },
          Lt = { key: 0, id: "redDot" },
          St = { key: 0, id: "redDot" },
          zt = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Ot = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Et = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Ut = { id: "propsbox" },
          Nt = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Pt = { class: "giftbox_frame box w-100 h-100", style: { flex: "2" } },
          Yt = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Vt = { class: "flexbox w-100 h-100 flex-c", style: { flex: "3" } },
          Kt = { class: "flexbox w-100 h-100 flex-c" },
          Jt = { class: "flexbox w-100 h-100 position-r" },
          Zt = ["innerHTML"],
          At = { class: "flexbox w-100 h-100 flex-r" },
          Rt = { class: "flexbox w-100 h-100" },
          Gt = { class: "flexbox w-100 h-100" },
          Xt = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Qt = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          eo = { id: "clothbox" },
          io = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          to = { class: "giftbox_frame box w-100 h-100", style: { flex: "2" } },
          oo = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          so = { class: "flexbox w-100 h-100 flex-c", style: { flex: "3" } },
          no = { class: "flexbox w-100 h-100 flex-c" },
          lo = { class: "flexbox w-100 h-100 position-r" },
          ao = ["innerHTML"],
          co = { class: "flexbox w-100 h-100 flex-r" },
          ro = { class: "flexbox w-100 h-100" },
          ho = { class: "flexbox w-100 h-100" },
          xo = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          bo = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          po = { id: "promoCodebox" },
          fo = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          uo = {
            class: "promoCodeFrame box w-100 h-100",
            style: { flex: "2" },
          },
          _o = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          wo = { class: "flexbox w-100 h-100 flex-c", style: { flex: "3" } },
          vo = { class: "flexbox w-100 h-100 flex-c" },
          mo = { class: "flexbox w-100 h-100 position-r" },
          go = jt(() =>
            (0, s._)(
              "div",
              { class: "flexbox w-100 h-100", style: { flex: "3" } },
              null,
              -1
            )
          ),
          ko = jt(() =>
            (0, s._)(
              "div",
              { class: "textStyle flexbox w-100 h-100" },
              "您的優惠碼:",
              -1
            )
          ),
          yo = jt(() =>
            (0, s._)(
              "div",
              { class: "flexbox w-100 h-100" },
              [
                (0, s._)("input", {
                  class: "enter_bg",
                  type: "text",
                  name: "",
                  id: "codebox",
                  maxlength: "16",
                }),
              ],
              -1
            )
          ),
          Co = { class: "flexbox w-100 h-100", style: { flex: "3" } },
          jo = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          $o = jt(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Wo = { id: "giftboxitem" },
          Bo = jt(() =>
            (0, s._)(
              "div",
              { class: "flexbox", style: { flex: "2" } },
              null,
              -1
            )
          ),
          qo = { class: "flexSet flexbox w-100 h-100 flex-c" },
          Ho = jt(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Fo = { class: "item_frame flexbox w-100 h-100 flex-c" },
          Do = { class: "flexbox w-100 h-100 flex-r" },
          To = ["innerHTML"],
          Io = jt(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Mo = jt(() =>
            (0, s._)(
              "div",
              { class: "flexbox", style: { flex: "2" } },
              null,
              -1
            )
          );
        function Lo(e, i, t, n, l, a) {
          return (
            (0, s.wg)(),
            (0, s.iD)("div", $t, [
              (0, s.wy)(
                (0, s._)(
                  "div",
                  Wt,
                  [
                    Bt,
                    (0, s._)("div", qt, [
                      Ht,
                      (0, s._)("div", Ft, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", Dt, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({ width: l.outbox_w + "px" }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", Tt, [
                            (0, s._)("div", It, [
                              (0, s._)("div", {
                                class: "back_btn w-100 h-100 pointer",
                                onClick:
                                  i[0] || (i[0] = (e) => n.gifbox_close(!1)),
                              }),
                              (0, s._)("div", {
                                class: "close_btn w-100 h-100",
                                onClick:
                                  i[1] || (i[1] = (e) => n.gifbox_close(!1)),
                              }),
                            ]),
                            (0, s._)("div", Mt, [
                              (0, s._)(
                                "div",
                                {
                                  class: "flexbox w-100 h-100 pointer propsbtn",
                                  onClick:
                                    i[2] || (i[2] = (e) => a.showbox("props")),
                                },
                                [
                                  l.propsdotbool
                                    ? ((0, s.wg)(), (0, s.iD)("div", Lt))
                                    : (0, s.kq)("", !0),
                                ]
                              ),
                              (0, s._)(
                                "div",
                                {
                                  class: "flexbox w-100 h-100 pointer clothbtn",
                                  onClick:
                                    i[3] || (i[3] = (e) => a.showbox("cloth")),
                                },
                                [
                                  l.clothdotbool
                                    ? ((0, s.wg)(), (0, s.iD)("div", St))
                                    : (0, s.kq)("", !0),
                                ]
                              ),
                              (0, s._)("div", {
                                class:
                                  "flexbox w-100 h-100 pointer promoCodebtn",
                                onClick:
                                  i[4] ||
                                  (i[4] = (e) => a.showbox("promoCode")),
                              }),
                            ]),
                            zt,
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({ width: l.outbox_w + "px" }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                      ]),
                      Ot,
                    ]),
                    Et,
                  ],
                  512
                ),
                [[o.F8, l.giftboxbool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  Ut,
                  [
                    Nt,
                    (0, s._)("div", Pt, [
                      Yt,
                      (0, s._)("div", Vt, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", Kt, [
                          (0, s._)("div", Jt, [
                            (0, s._)("div", {
                              class: "back_btn",
                              onClick:
                                i[5] || (i[5] = (e) => a.showbox("giftbox")),
                            }),
                            (0, s._)("div", {
                              class: "close_btn",
                              onClick:
                                i[6] || (i[6] = (e) => a.showbox("giftbox")),
                            }),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "w-100 h-100 flex-c scrollbar d-flex",
                              style: (0, u.j5)({
                                "max-height": l.scrollbox_h + "px",
                              }),
                              innerHTML: a.checkprops(),
                            },
                            null,
                            12,
                            Zt
                          ),
                          (0, s._)("div", At, [
                            (0, s._)("div", Rt, [
                              (0, s._)(
                                "button",
                                {
                                  class: "getBtn",
                                  onClick:
                                    i[7] ||
                                    (i[7] = (e) => a.getgift("propsboxradio")),
                                },
                                " 領取 "
                              ),
                            ]),
                            (0, s._)("div", Gt, [
                              (0, s._)(
                                "button",
                                {
                                  class: "sendBtn",
                                  onClick: i[8] || (i[8] = (e) => a.sendgift()),
                                },
                                "贈送"
                              ),
                            ]),
                          ]),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                      ]),
                      Xt,
                    ]),
                    Qt,
                  ],
                  512
                ),
                [[o.F8, l.propsbool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  eo,
                  [
                    io,
                    (0, s._)("div", to, [
                      oo,
                      (0, s._)("div", so, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", no, [
                          (0, s._)("div", lo, [
                            (0, s._)("div", {
                              class: "back_btn",
                              onClick:
                                i[9] || (i[9] = (e) => a.showbox("giftbox")),
                            }),
                            (0, s._)("div", {
                              class: "close_btn",
                              onClick:
                                i[10] || (i[10] = (e) => a.showbox("giftbox")),
                            }),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "w-100 h-100 flex-c scrollbar d-flex",
                              style: (0, u.j5)({
                                "max-height": l.scrollbox_h + "px",
                              }),
                              innerHTML: a.checkcloth(),
                            },
                            null,
                            12,
                            ao
                          ),
                          (0, s._)("div", co, [
                            (0, s._)("div", ro, [
                              (0, s._)(
                                "button",
                                {
                                  class: "getBtn",
                                  onClick:
                                    i[11] ||
                                    (i[11] = (e) => a.getgift("clothboxradio")),
                                },
                                " 領取 "
                              ),
                            ]),
                            (0, s._)("div", ho, [
                              (0, s._)(
                                "button",
                                {
                                  class: "sendBtn",
                                  onClick:
                                    i[12] || (i[12] = (e) => a.sendgift()),
                                },
                                "贈送"
                              ),
                            ]),
                          ]),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                      ]),
                      xo,
                    ]),
                    bo,
                  ],
                  512
                ),
                [[o.F8, l.clothbool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  po,
                  [
                    fo,
                    (0, s._)("div", uo, [
                      _o,
                      (0, s._)("div", wo, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", vo, [
                          (0, s._)("div", mo, [
                            (0, s._)("div", {
                              class: "back_btn",
                              onClick:
                                i[13] || (i[13] = (e) => a.showbox("giftbox")),
                            }),
                            (0, s._)("div", {
                              class: "close_btn",
                              onClick:
                                i[14] || (i[14] = (e) => a.showbox("giftbox")),
                            }),
                          ]),
                          go,
                          ko,
                          yo,
                          (0, s._)("div", Co, [
                            (0, s._)(
                              "button",
                              {
                                class: "checkBtn",
                                onClick: i[15] || (i[15] = (e) => a.getcode()),
                              },
                              "確認"
                            ),
                          ]),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                      ]),
                      jo,
                    ]),
                    $o,
                  ],
                  512
                ),
                [[o.F8, l.promoCodebool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  Wo,
                  [
                    Bo,
                    (0, s._)("div", qo, [
                      Ho,
                      (0, s._)("div", Fo, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.item_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", Do, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.item_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)(
                            "div",
                            {
                              id: "itemcontent",
                              class: "flexbox w-100 h-100 flex-c",
                              innerHTML: a.item(
                                l.giftitemname,
                                l.giftitemquantity
                              ),
                              onClick:
                                i[16] ||
                                (i[16] = (...e) =>
                                  a.initemgroup && a.initemgroup(...e)),
                            },
                            null,
                            8,
                            To
                          ),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.item_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.item_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                      ]),
                      Io,
                    ]),
                    Mo,
                  ],
                  512
                ),
                [[o.F8, l.itembool]]
              ),
            ])
          );
        }
        var So = {
          name: "gift_box",
          emits: ["gifbox_close"],
          setup(e, { emit: i }) {
            function t(e) {
              i("gifbox_close", e);
            }
            return { gifbox_close: t };
          },
          data() {
            return {
              outbox_h: 20,
              outbox_w: 0,
              scrollbox_h: 280,
              item_outbox_h: 20,
              item_outbox_w: 0,
              giftboxbool: !0,
              propsbool: !1,
              clothbool: !1,
              promoCodebool: !1,
              itembool: !1,
              propsdotbool: !1,
              clothdotbool: !1,
              getprops: [],
              getcloth: [],
              getfriendgift: [],
              itemtype: "",
              itemnum: 0,
              giftitemname: "",
              giftitemquantity: 0,
            };
          },
          mounted() {},
          methods: {
            setwidth() {
              var e, i, t, o, s, n, l, a, c, r, d, h, x;
              window.innerWidth > 1920
                ? ((e = (window.innerHeight / 5) * 3),
                  (i = (window.innerWidth / 4) * 2),
                  (a = window.innerHeight / 3),
                  (c = window.innerWidth / 5))
                : window.innerWidth >= 1440 && window.innerWidth < 1920
                ? ((e = (window.innerHeight / 5) * 3),
                  (i = (window.innerWidth / 4) * 2),
                  (a = (window.innerHeight / 4) * 2),
                  (c = (window.innerWidth / 6) * 2))
                : window.innerWidth >= 1024 && window.innerWidth < 1440
                ? ((e = (window.innerHeight / 5) * 3),
                  (i = (window.innerWidth / 4) * 2),
                  (a = (window.innerHeight / 3) * 2),
                  (c = (window.innerWidth / 6) * 2))
                : window.innerWidth >= 768 && window.innerWidth < 1024
                ? ((e = (window.innerHeight / 4.5) * 2.5),
                  (i = (window.innerWidth / 4) * 2),
                  (a = (window.innerHeight / 4) * 2),
                  (c = (window.innerWidth / 5.5) * 1.5))
                : window.innerWidth >= 740 && window.innerWidth < 768
                ? ((e = (window.innerHeight / 5) * 3),
                  (i = (window.innerWidth / 4) * 2),
                  (a = (window.innerHeight / 4) * 2),
                  (c = (window.innerWidth / 5.5) * 1.5))
                : (window.innerWidth >= 720 && window.innerWidth < 740) ||
                  (window.innerWidth >= 654 && window.innerWidth < 720)
                ? ((e = (window.innerHeight / 4) * 2),
                  (i = (window.innerWidth / 4) * 2),
                  (a = (window.innerHeight / 4) * 2),
                  (c = (window.innerWidth / 6) * 2))
                : window.innerWidth >= 425 &&
                  window.innerWidth < 654 &&
                  ((e = (window.innerHeight / 4.5) * 2.5),
                  (i = (window.innerWidth / 3.5) * 1.5),
                  (a = (window.innerHeight / 4.5) * 2.5),
                  (c = (window.innerWidth / 5.5) * 1.5)),
                (t = (150 * i) / 252),
                (o = (252 * e) / 150),
                (l = (93 * i) / 252),
                (s = (e - t) / 2),
                (n = (i - o) / 2),
                (d = (178 * a) / 150),
                (r = (150 * c) / 178),
                (x = (c - d) / 2),
                (h = (a - r) / 2),
                console.log(e, i, s, h, x),
                (this.outbox_h = s > 0 ? s : 0),
                (this.outbox_w = n < 0 ? 0 : n),
                (this.scrollbox_h = l),
                (this.item_outbox_h = h < 0 ? 0 : h),
                (this.item_outbox_w = x < 0 ? 0 : x);
            },
            refreshView() {
              this.$http
                .get(N.apiUrl + "players/" + N.getCookie("id") + "/giftBox", {
                  headers: { authorization: "Bearer " + N.getCookie("token") },
                })
                .then(
                  (e) => {
                    console.log("giftBox", e.data),
                      (this.getprops = []),
                      (this.getfriendgift = []),
                      (this.getcloth = []),
                      (this.itemnum = e.data.length);
                    for (var i = 0; i < e.data.length; i++)
                      switch (e.data[i].type) {
                        case "mission complete":
                          "cloth" == e.data[i].content.present.type
                            ? this.getcloth.push(e.data[i])
                            : this.getprops.push(e.data[i]);
                          break;
                        case "receive gift":
                          "cloth" == e.data[i].content.present.type
                            ? this.getcloth.push(e.data[i])
                            : this.getfriendgift.push(e.data[i]);
                          break;
                      }
                    console.log(this.getprops),
                      this.getprops.length + this.getfriendgift.length != 0
                        ? (this.propsdotbool = !0)
                        : (this.propsdotbool = !1),
                      this.getcloth.length > 0
                        ? (this.clothdotbool = !0)
                        : (this.clothdotbool = !1),
                      0 == this.itemnum
                        ? (this.$parent.$refs.rightmenu.giftboxdotbool = !1)
                        : (this.$parent.$refs.rightmenu.giftboxdotbool = !0);
                  },
                  (e) => {
                    console.log(e);
                  }
                );
            },
            showbox(e) {
              switch (e) {
                case "giftbox":
                  (this.giftboxbool = !0),
                    (this.propsbool = !1),
                    (this.clothbool = !1),
                    (this.promoCodebool = !1);
                  break;
                case "props":
                  (this.giftboxbool = !1),
                    (this.propsbool = !0),
                    (this.clothbool = !1),
                    (this.promoCodebool = !1);
                  break;
                case "cloth":
                  (this.giftboxbool = !1),
                    (this.propsbool = !1),
                    (this.clothbool = !0),
                    (this.promoCodebool = !1);
                  break;
                case "promoCode":
                  (this.giftboxbool = !1),
                    (this.propsbool = !1),
                    (this.clothbool = !1),
                    (this.promoCodebool = !0);
                  break;
              }
            },
            checkprops() {
              for (
                var e = "", i = this.getprops.length, t = 0;
                t < this.getprops.length;
                t++
              )
                e += `\n                    <div class="heightSet w-100 flexbox">\n                        <input id="getprops${t}" type="radio" name="propsboxradio" value="${this.getprops[t].id}" />\n                        <label for="getprops${t}" class="w-100">\n                            <span class="white">獲得通關「${this.getprops[t].content.mission.title}」任務道具</span>\n                        </label>\n                    </div>\n                `;
              return (
                this.getfriendgift.forEach(function (t, o) {
                  e += `\n                    <div class="heightSet w-100 flexbox">\n                        <input id="getprops${
                    i + o
                  }" type="radio" name="propsboxradio" value="${
                    t.id
                  }" />\n                        <label for="getprops${
                    i + o
                  }" class="w-100">\n                            <span class="white">獲得玩家「${
                    t.content.player.account
                  }」的好友贈禮</span>\n                        </label>\n                    </div>\n                `;
                }),
                e
              );
            },
            checkcloth() {
              for (var e = "", i = 0; i < this.getcloth.length; i++)
                e += `\n                    <div class="heightSet w-100 flexbox">\n                        <input id="getcloth${i}" type="radio" name="clothboxradio" value="${this.getcloth[i].content.present.cloth.name}" />\n                        <label for="getcloth${i}" class="w-100">\n                            <span class="white">獲得「${this.getcloth[i].content.present.cloth.name}」特殊服飾</span>\n                        </label>\n                    </div>\n                `;
              return e;
            },
            getgift(e) {
              for (
                var i, t = document.getElementsByName(e), o = 0;
                o < t.length;
                o++
              )
                if (t[o].checked)
                  if (
                    (console.log(t[o].value),
                    "" != t[o].value && "propsboxradio" == e)
                  ) {
                    for (var s = 0; s < this.getprops.length; s++)
                      this.getprops[s].id == t[o].value &&
                        ((i = this.getprops[s].id),
                        (this.giftitemname =
                          this.getprops[s].content.present.item.data.name),
                        (this.giftitemquantity =
                          this.getprops[s].content.present.quantity),
                        this.$http
                          .patch(
                            N.apiUrl +
                              "players/" +
                              N.getCookie("id") +
                              "/giftBox/" +
                              i,
                            { player: parseInt(N.getCookie("id")), giftBox: i },
                            {
                              emulateJSON: !0,
                              headers: {
                                authorization: "Bearer " + N.getCookie("token"),
                              },
                            }
                          )
                          .then(
                            (e) => {
                              this.itembool = !0;
                            },
                            (e) => {
                              console.log(e);
                            }
                          ));
                    for (var n = 0; n < this.getfriendgift.length; n++)
                      parseInt(t[o].value) == this.getfriendgift[n].id &&
                        ((i = this.getfriendgift[n].id),
                        console.log(
                          i,
                          this.getfriendgift[n].content.present.item.data.name,
                          this.getfriendgift[n].content.present.quantity
                        ),
                        (this.giftitemname =
                          this.getfriendgift[n].content.present.item.data.name),
                        (this.giftitemquantity =
                          this.getfriendgift[n].content.present.quantity),
                        this.$http
                          .patch(
                            N.apiUrl +
                              "players/" +
                              N.getCookie("id") +
                              "/giftBox/" +
                              i,
                            { player: parseInt(N.getCookie("id")), giftBox: i },
                            {
                              emulateJSON: !0,
                              headers: {
                                authorization: "Bearer " + N.getCookie("token"),
                              },
                            }
                          )
                          .then(
                            (e) => {
                              this.itembool = !0;
                            },
                            (e) => {
                              console.log(e);
                            }
                          ));
                  } else if ("" != t[o].value && "clothboxradio" == e)
                    for (var l = 0; l < this.getcloth.length; l++)
                      t[o].value ==
                        this.getcloth[l].content.present.cloth.name &&
                        ((i = this.getcloth[l].id),
                        (this.giftitemname =
                          this.getcloth[l].content.present.cloth.data.name),
                        (this.giftitemquantity =
                          this.getcloth[l].content.present.quantity),
                        this.$http
                          .patch(
                            N.apiUrl +
                              "players/" +
                              N.getCookie("id") +
                              "/giftBox/" +
                              i,
                            { player: parseInt(N.getCookie("id")), giftBox: i },
                            {
                              emulateJSON: !0,
                              headers: {
                                authorization: "Bearer " + N.getCookie("token"),
                              },
                            }
                          )
                          .then(
                            (e) => {
                              this.itembool = !0;
                            },
                            (e) => {
                              console.log(e);
                            }
                          ));
            },
            sendgift() {
              alert("請先領取!");
            },
            item(e, i) {
              var t = "";
              return (
                (t = `\n                <div class="flexbox w-100 h-100"></div>\n                <div class="picSet flexbox w-100 h-100 position-r pic ${e}pic">\n                    <div class="number_bg">${i}</div>\n                </div>\n                <div class="flexbox w-100 h-100 flex-c">\n                    <p class="success">領取成功</p>\n                </div>\n                <div class="flexbox w-100 h-100">\n                    <button class="send_confirmBtn" id="giftbox_check">確認</button>\n                </div>\n            `),
                t
              );
            },
            initemgroup(e) {
              let i = e.target.id;
              switch (i) {
                case "giftbox_check":
                  this.itembool = !1;
                  break;
              }
              this.refreshView();
            },
            getcode() {
              var e = document.getElementById("codebox").value;
              this.$http
                .patch(
                  N.apiUrl + "players/" + N.getCookie("id") + "/exchange",
                  { code: e },
                  {
                    headers: {
                      authorization: "Bearer " + N.getCookie("token"),
                    },
                  }
                )
                .then(
                  (e) => {
                    console.log(e.data),
                      (document.getElementById("codebox").value = ""),
                      alert("兌換成功，請至禮物盒領取");
                  },
                  (e) => {
                    console.log(e.response),
                      422 == e.response.status &&
                        (42202 == e.response.data.code
                          ? alert("此優惠碼已被使用過!")
                          : 42201 == e.response.data.code &&
                            alert("查無此優惠碼號碼"));
                  }
                );
            },
          },
        };
        const zo = (0, b.Z)(So, [
          ["render", Lo],
          ["__scopeId", "data-v-3f245e0c"],
        ]);
        var Oo = zo;
        const Eo = (e) => (
            (0, s.dD)("data-v-0ae8bd28"), (e = e()), (0, s.Cn)(), e
          ),
          Uo = { id: "sharepage", class: "d-flex flex-c" },
          No = {
            class: "flexbox w-100 h-100 position-r",
            style: { flex: "1.5" },
          },
          Po = { class: "flexbox flex-r w-100 h-100", style: { flex: "1.75" } },
          Yo = Eo(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Vo = Eo(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Ko = Eo(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Jo = Eo(() =>
            (0, s._)(
              "canvas",
              { id: "canvas", style: { display: "none" } },
              null,
              -1
            )
          ),
          Zo = Eo(() => (0, s._)("div", { id: "alpha_picture" }, null, -1)),
          Ao = Eo(() => (0, s._)("div", { id: "sample_picture" }, null, -1));
        function Ro(e, i, t, o, n, l) {
          return (
            (0, s.wg)(),
            (0, s.iD)("div", null, [
              (0, s._)("div", Uo, [
                (0, s._)("div", No, [
                  (0, s._)("div", {
                    class: "back_btn w-100 pointer",
                    onClick: i[0] || (i[0] = (e) => o.share_close(!1)),
                  }),
                  (0, s._)("div", {
                    class: "close_btn pointer",
                    onClick: i[1] || (i[1] = (e) => o.share_close(!1)),
                  }),
                ]),
                (0, s._)("div", Po, [
                  Yo,
                  (0, s._)("div", {
                    class: "flexbox w-100 h-100 downloadbox pointer",
                    style: { flex: "2" },
                    onClick: i[2] || (i[2] = (e) => o.share_save(!0)),
                  }),
                  (0, s._)("div", {
                    class: "flexbox w-100 h-100 sharebox pointer",
                    style: { flex: "2" },
                    onClick: i[3] || (i[3] = (e) => o.share_save(!1)),
                  }),
                  Vo,
                ]),
                Ko,
              ]),
              Jo,
              Zo,
              Ao,
            ])
          );
        }
        var Go = {
          name: "share_page",
          emits: ["share_close", "share_save", "share_share"],
          setup(e, { emit: i }) {
            function t(e) {
              i("share_close", e);
            }
            function o(e) {
              i("share_save", e);
            }
            function s() {
              i("share_share");
            }
            return { share_close: t, share_save: o, share_share: s };
          },
          data() {
            return {};
          },
          methods: {
            downloadfun() {
              alert("尚未開放!");
            },
          },
        };
        const Xo = (0, b.Z)(Go, [
          ["render", Ro],
          ["__scopeId", "data-v-0ae8bd28"],
        ]);
        var Qo = Xo;
        const es = (e) => (
            (0, s.dD)("data-v-354cce20"), (e = e()), (0, s.Cn)(), e
          ),
          is = { id: "logIn_page" },
          ts = es(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          os = { class: "logIn_frame parentbox" },
          ss = es(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          ns = es(() =>
            (0, s._)(
              "div",
              { class: "start_game_text flexbox2" },
              "開始遊戲",
              -1
            )
          ),
          ls = es(() =>
            (0, s._)("p", { class: "btn_text" }, "登入/加入會員", -1)
          ),
          as = [ls],
          cs = es(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          rs = es(() => (0, s._)("div", { class: "flexbox" }, null, -1));
        function ds(e, i, t, o, n, l) {
          return (
            (0, s.wg)(),
            (0, s.iD)("div", is, [
              ts,
              (0, s._)("div", os, [
                ss,
                ns,
                (0, s._)(
                  "div",
                  {
                    class: "start_btn flexbox",
                    onClick: i[0] || (i[0] = (e) => l.goToLogin()),
                  },
                  as
                ),
                cs,
              ]),
              rs,
            ])
          );
        }
        var hs = {
          name: "log_in",
          emits: ["loginmember"],
          setup(e, { emit: i }) {
            function t(e) {
              i("loginmember", e);
            }
            return { loginmember: t };
          },
          methods: {
            goToLogin() {
              location.href = N.webUrl;
            },
          },
        };
        const xs = (0, b.Z)(hs, [
          ["render", ds],
          ["__scopeId", "data-v-354cce20"],
        ]);
        var bs = xs;
        const ps = (e) => (
            (0, s.dD)("data-v-04f76ff5"), (e = e()), (0, s.Cn)(), e
          ),
          fs = { id: "getLion" },
          us = ps(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          _s = { class: "parentbox getlion_frame" },
          ws = ps(() => (0, s._)("div", { class: "flexbox4" }, null, -1)),
          vs = ps(() =>
            (0, s._)("div", { class: "log_successe flexbox" }, "登入成功!", -1)
          ),
          ms = ps(() =>
            (0, s._)(
              "div",
              { class: "context flexbox5" },
              [
                (0, s.Uk)(" 你尚未養成任何梅克獅，"),
                (0, s._)("br"),
                (0, s.Uk)("快來養一隻屬於你的小獅子吧! "),
              ],
              -1
            )
          ),
          gs = ps(() => (0, s._)("p", { class: "get_text" }, "獲得梅克獅", -1)),
          ks = [gs],
          ys = ps(() => (0, s._)("div", { class: "flexbox4" }, null, -1)),
          Cs = ps(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          js = { id: "getLion_for425px" },
          $s = ps(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Ws = { class: "parentbox getlion_frame" },
          Bs = ps(() => (0, s._)("div", { class: "flexbox4" }, null, -1)),
          qs = ps(() =>
            (0, s._)("div", { class: "log_successe flexbox2" }, "登入成功!", -1)
          ),
          Hs = ps(() =>
            (0, s._)(
              "div",
              { class: "context flexbox2" },
              [
                (0, s.Uk)(" 你尚未養成任何梅克獅，"),
                (0, s._)("br"),
                (0, s.Uk)("快來養一隻屬於你的小獅子吧! "),
              ],
              -1
            )
          ),
          Fs = ps(() => (0, s._)("p", { class: "get_text" }, "獲得梅克獅", -1)),
          Ds = [Fs],
          Ts = ps(() => (0, s._)("div", { class: "flexbox4" }, null, -1)),
          Is = ps(() => (0, s._)("div", { class: "flexbox" }, null, -1));
        function Ms(e, i, t, o, n, l) {
          return (
            (0, s.wg)(),
            (0, s.iD)(
              s.HY,
              null,
              [
                (0, s._)("div", fs, [
                  us,
                  (0, s._)("div", _s, [
                    ws,
                    vs,
                    ms,
                    (0, s._)(
                      "div",
                      {
                        class: "get_btn flexbox",
                        onClick:
                          i[0] || (i[0] = (e) => o.teststart("question")),
                      },
                      ks
                    ),
                    ys,
                  ]),
                  Cs,
                ]),
                (0, s._)("div", js, [
                  $s,
                  (0, s._)("div", Ws, [
                    Bs,
                    qs,
                    Hs,
                    (0, s._)(
                      "div",
                      {
                        class: "get_btn flexbox",
                        onClick:
                          i[1] || (i[1] = (e) => o.teststart("question")),
                      },
                      Ds
                    ),
                    Ts,
                  ]),
                  Is,
                ]),
              ],
              64
            )
          );
        }
        var Ls = {
          name: "get_lion",
          emits: ["teststart"],
          setup(e, { emit: i }) {
            function t(e) {
              i("teststart", e);
            }
            return { teststart: t };
          },
          methods: {},
        };
        const Ss = (0, b.Z)(Ls, [
          ["render", Ms],
          ["__scopeId", "data-v-04f76ff5"],
        ]);
        var zs = Ss;
        const Os = (e) => (
            (0, s.dD)("data-v-2b4769a6"), (e = e()), (0, s.Cn)(), e
          ),
          Es = { id: "question_page" },
          Us = Os(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Ns = { class: "flexbox centerbox" },
          Ps = Os(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Ys = ["innerHTML"],
          Vs = Os(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Ks = Os(() => (0, s._)("div", { class: "flexbox" }, null, -1));
        function Js(e, i, t, o, n, l) {
          return (
            (0, s.wg)(),
            (0, s.iD)("div", Es, [
              Us,
              (0, s._)("div", Ns, [
                Ps,
                (0, s._)(
                  "div",
                  {
                    innerHTML: l.questiontopic(n.questionnum),
                    class: "qs_frame box",
                    id: "questiondiv",
                    onClick:
                      i[0] || (i[0] = (...e) => l.point && l.point(...e)),
                  },
                  null,
                  8,
                  Ys
                ),
                Vs,
              ]),
              Ks,
            ])
          );
        }
        var Zs = JSON.parse(
            '[{"liontype":"farmer","topic":"你發現朋友在哭泣，會怎麼做呢？","options":["默默坐在他旁邊，給他面紙","先在旁邊看，等待朋友不哭了，再過去詢問他怎麼了","馬上過去問：「發生甚麼事了、我幫你想辦法！」"],"answer":0},{"liontype":"farmer","topic":"美好的周末，你喜歡如何度過假日呢？","options":["約好朋友出門去逛街、打球......等等","去學自己很喜歡的才藝，例如：圍棋、吉他、畫漫畫......等等","獨自做自己喜歡的事，無論是戶外運動或是在家裡看電視"],"answer":0},{"liontype":"farmer","topic":"去購物的時候，看到新口味的點心和零食，你會怎麼想？","options":["如果預算許可，會想嘗試一下","比較堅持原本的口味，嘗鮮的意願不大","雖然不在購物清單裡，但常忍不住好奇心買回家"],"answer":1},{"liontype":"farmer","topic":"班上要策劃一齣話劇演出，你想要扮演什麼角色？","options":["配角，例如：登場幾次卻很重要的巫師、幫助主角的人物、主角的親友......等等","故事主人翁，勇者、旅人，或其他正方陣營的人物","反派大魔王！大怪獸！"],"answer":0},{"liontype":"farmer","topic":"在園遊會看到送養動物的公益動保單位，裡面有很多可愛的狗狗貓貓......等等，你會？","options":["接近看看就好，頂多拍拍照","寧願站遠遠的看。因為比較擔憂小動物或顧攤人員太熱情，不知道怎麼回應","會駐足和小動物互動玩一會兒"],"answer":2},{"liontype":"farmer","topic":"下雨了，你的心情是？","options":["在內心吶喊：「不！！出門不方便！」","不怕下雨，因為自己有很多方法應對雨天","下雨好啊！這樣才有水喝的樂天派"],"answer":2},{"liontype":"farmer","topic":"電腦使用到一半，當機故障了，你會採取什麼作法？","options":["按照自己所知所學範圍，試著自己排除故障","重新開機幾次還是沒辦法的話，打電話找人送修","還有備用的電腦，壞掉的就不急著修理"],"answer":1},{"liontype":"farmer","topic":"你和朋友們煮一鍋神秘湯，而且不知道彼此放了什麼食材，你會放什麼？","options":["特殊食材、少見的蔬菜水果","洋蔥、馬鈴薯、萵苣、肉片......等等，常見的食材","嘿嘿嘿，加一點開鍋驚喜。放入黑暗料理食材，墨魚醬、米糰、皮蛋......等等食物"],"answer":1},{"liontype":"farmer","topic":"認識的人請你幫忙，就算你已經有預定的計劃要做，也會全力幫忙他嗎？","options":["是","否"],"answer":0},{"liontype":"farmer","topic":"看影片時，就算是虛構的，也很容易被劇中人物的遭遇感動？","options":["是","否"],"answer":0},{"liontype":"engineer","topic":"如果現在你要到一家公司實習，會選擇先進入哪個部門？","options":["業務部","技術部","企劃部"],"answer":1},{"liontype":"engineer","topic":"阿姨搬新家，邀請你去家裡作客，她請你幫忙，你會選擇?","options":["教表弟數學","整理衣服","搬東西"],"answer":0},{"liontype":"engineer","topic":"因應彈性放假，老師提前問大家，補課那天要上什麼課，你會選擇?","options":["美術課","會計課","機械操作課"],"answer":2},{"liontype":"engineer","topic":"明天是戶外教學，準備去露營，老師開始分配工作，而你會選擇什麼工作?","options":["活動帶領統籌","搭帳篷","設計遊戲"],"answer":2},{"liontype":"engineer","topic":"學校預計要辦演講，邀請學長姐回來分享經驗，而你最期待聽到哪種職業的學長姐講座?","options":["公務人員","工程員","業務經理"],"answer":1},{"liontype":"engineer","topic":"某天，老師臨時派了一個任務給你，你會優先選擇哪個任務?","options":["急救挑戰","維修挑戰","繪圖挑戰"],"answer":1},{"liontype":"engineer","topic":"你是否喜歡瀏覽火車時刻表、電話簿，或字典?","options":["是","否"],"answer":0},{"liontype":"engineer","topic":"你是否認為自己是一個膽大、喜歡冒險的人?","options":["是","否"],"answer":1},{"liontype":"engineer","topic":"你是否喜歡到處旅遊去體驗不同的人事物?","options":["是","否"],"answer":1},{"liontype":"engineer","topic":"你是否喜歡參與聚會時主動找別人聊天?","options":["是","否"],"answer":1},{"liontype":"fisher","topic":"別人認為你的行動難以捉摸嗎？","options":["是","否"],"answer":0},{"liontype":"fisher","topic":"你經常覺得有保持身體健康的需要嗎？","options":["是","否"],"answer":0},{"liontype":"fisher","topic":"你會容易地對他人的談話感到興趣嗎？","options":["是","否"],"answer":0},{"liontype":"fisher","topic":"你是否在一個團體裡會主動爭取擔任領導者?","options":["是","否"],"answer":1},{"liontype":"fisher","topic":"你是否喜歡花心力去做一些需要長時間才能完成的事情?","options":["是","否"],"answer":0},{"liontype":"fisher","topic":"你在寫作業、做作品的時候，通常接近哪一種情況？","options":["全神貫注地完成，外面打雷颳風都不受影響","做到一定程度就會不知不覺進入冥想或沉思，過一會兒又回神繼續做下去","一會兒做這個、一會兒做那個；如果碰到瓶頸了，就先做別的，或許等一下回來就想出法子了"],"answer":1},{"liontype":"fisher","topic":"需要找資料的時候，會傾向優先從哪邊下手？","options":["先查找同一個領域，但不同人撰寫的文章或自媒體資料","從學校或學術機構的線上文獻庫、電子圖書館借閱下手","先把想知道的東西羅列下來，向想得到可能幫得上忙的人尋求解答或意見"],"answer":2},{"liontype":"fisher","topic":"和朋友們出遊一起規畫，會傾向建議甚麼樣的行程？","options":["有完善休息區、洗手間、座位這類便民設施的景點","轉乘路線稍微複雜，但是比較少人打卡的私房景點或小秘境","尋找目的地有什麼期間限定的活動，例如：慶典市集、巡迴影展、變妝遊行"],"answer":2},{"liontype":"fisher","topic":"假如你中了發票頭獎，你的反應是?","options":["先慶祝一下再說，之後再想怎麼運用這筆錢","打開所有帳本和存摺，檢查一下自己有多少錢，再想一下有沒有即將支出的大筆費用","告訴最親密、最信任的人，一起討論如何運用這筆錢"],"answer":1},{"liontype":"fisher","topic":"你在設計一張海報，風格完全任你喜好發揮，你會選擇什麼風格?","options":["極簡主義，色塊和粗體大字就是我喜歡的表達方式","有實景或實物的照片比較好，會在海報試著融入真實的影像","賞心悅目優先；注重色彩和裝飾圖案的運用，資訊量偏少也沒關係"],"answer":1}]'
          ),
          As = {
            name: "question_page",
            emits: ["question_backbtn"],
            setup(e, { emit: i }) {
              function t(e) {
                i("question_backbtn", e);
              }
              return { question_backbtn: t };
            },
            data() {
              return {
                jsongroup: Zs,
                questiongroup: [],
                answergroup: [],
                fishernum: 0,
                farmernum: 0,
                engineernum: 0,
                questionnum: null,
                outbox_h: 80,
              };
            },
            created() {
              window.addEventListener("resize", this.setwidth);
            },
            unmounted() {
              window.removeEventListener("resize", this.setwidth);
            },
            mounted() {
              this.$http
                .get(N.apiUrl + "questions/" + N.getCookie("id"), {
                  headers: { authorization: "Bearer " + N.getCookie("token") },
                })
                .then((e) => {
                  console.log(e.data),
                    (this.questiongroup = e.data),
                    (this.questionnum = 0);
                }),
                this.setwidth(),
                window.addEventListener("resize", this.setwidth);
            },
            methods: {
              getquestionfun() {
                this.$http
                  .get(N.apiUrl + "questions/" + N.getCookie("id"), {
                    headers: {
                      authorization: "Bearer " + N.getCookie("token"),
                    },
                  })
                  .then((e) => {
                    console.log(e.data),
                      (this.questiongroup = e.data),
                      (this.questionnum = 0);
                  });
              },
              setwidth() {
                var e = (window.innerHeight / 6) * 4,
                  i = (window.innerWidth / 4) * 2,
                  t = i,
                  o = (150 * t) / 252,
                  s = (e - o) / 2;
                console.log(e, t, o, s), (this.outbox_h = s);
              },
              checktypegroup(e) {
                var i = this.checktype(e.engineer),
                  t = this.checktype(e.farmer),
                  o = this.checktype(e.fisher),
                  s = "";
                return (
                  i
                    ? (s = "engineer")
                    : t
                    ? (s = "farmer")
                    : o && (s = "fisher"),
                  s
                );
              },
              checktype(e) {
                for (var i = 0; i < e.length; i++) if (1 == e[i]) return !0;
                return !1;
              },
              checkanswergroup(e) {
                var i,
                  t = this.checkanswer(e.engineer),
                  o = this.checkanswer(e.farmer),
                  s = this.checkanswer(e.fisher);
                return (
                  0 != t ? (i = t) : 0 != o ? (i = o) : 0 != s && (i = s), i
                );
              },
              checkanswer(e) {
                for (var i = 0; i < e.length; i++) if (1 == e[i]) return i;
                return 0;
              },
              questiontopic(e) {
                if (0 != this.questiongroup.length) {
                  for (
                    var i = "",
                      t = this.questiongroup[e].choice,
                      o = this.questiongroup[e].choice.length,
                      s = this.checktypegroup(this.questiongroup[e].scores),
                      n = this.checkanswergroup(this.questiongroup[e].scores),
                      l = "",
                      a = "",
                      c = "",
                      r = 0;
                    r < o;
                    r++
                  )
                    switch (r) {
                      case 0:
                        l =
                          r == n
                            ? `<div class="answer1" id="answer1" data-type="${s}">A ${t[r]}</div>`
                            : `<div class="answer1" id="answer1" data-type="0">A ${t[r]}</div>`;
                        break;
                      case 1:
                        a =
                          r == n
                            ? `<div class="answer2" id="answer2" data-type="${s}">B ${t[r]}</div>`
                            : `<div class="answer2" id="answer2" data-type="0">B ${t[r]}</div>`;
                        break;
                      case 2:
                        c =
                          r == n
                            ? `<div class="answer3" id="answer3" data-type="${s}">C ${t[r]}</div>`
                            : `<div class="answer3" id="answer3" data-type="0">C ${t[r]}</div>`;
                        break;
                    }
                  return (
                    (i = `\n      <div style="height:${
                      this.outbox_h
                    }px"></div>\n      <div class="flexbox" style="position:relative;">\n        <div class="back_btn" id="q_back_btn"></div>\n        <div class="close_btn" id="q_close_btn"></div>\n      </div>\n      <div class="qs_group">\n      <div class="flexbox" style="height:100%;"></div>\n        <div class="flexbox5">\n          <div class="context3 flexbox">在養成梅克獅之前，飼育員有幾個問題想要問你:</div>\n          <div class="context2 flexbox">Q${
                      e + 1
                    } ${
                      this.questiongroup[e].content
                    }</div>\n          <div class="answers flexbox">\n              ${
                      l + a + c
                    }\n          </div>\n        </div>\n        <div class="flexbox" style="height:100%;"></div>\n      </div>\n      <div style="height:${
                      this.outbox_h
                    }px"></div>\n    `),
                    i
                  );
                }
              },
              point(e) {
                let i = e.target.id;
                if ("answer1" == i || "answer2" == i || "answer3" == i) {
                  let e = document.getElementById(i).dataset.type;
                  if (void 0 !== e || null !== e) {
                    switch ((this.answergroup.push(e), e)) {
                      case "fisher":
                        this.fishernum++;
                        break;
                      case "farmer":
                        this.farmernum++;
                        break;
                      case "engineer":
                        this.engineernum++;
                        break;
                    }
                    if (14 == this.questionnum) {
                      console.log("question over", this.answergroup);
                      var t = 0,
                        o = "";
                      this.fishernum >= this.farmernum
                        ? ((t = this.fishernum), (o = "fisher"))
                        : ((t = this.farmernum), (o = "farmer")),
                        t < this.engineernum &&
                          ((t = this.engineernum), (o = "engineer")),
                        (this.fishernum = 0),
                        (this.farmernum = 0),
                        (this.engineernum = 0),
                        (this.answergroup.length = 0),
                        (this.questiongroup.length = 0),
                        console.log(
                          "fishernum:",
                          this.fishernum,
                          "farmernum:",
                          this.farmernum,
                          "engineernum:",
                          this.engineernum,
                          "answergroup:",
                          this.answergroup,
                          "questiongroup:",
                          this.questiongroup
                        ),
                        this.$parent.tointroducefun("introduce", o);
                    } else
                      this.questionnum++,
                        console.log(
                          "fisher:" +
                            this.fishernum +
                            ",farmer:" +
                            this.farmernum +
                            ",engineer:" +
                            this.engineernum
                        );
                  }
                } else
                  "q_back_btn" == i
                    ? this.previousfun()
                    : "q_close_btn" == i && this.closebtnfun();
              },
              previousfun() {
                if (0 == this.questionnum)
                  this.$parent.changefun("getlion"),
                    (this.questiongroup.length = 0);
                else {
                  var e = [];
                  switch (
                    (this.questionnum--, this.answergroup[this.questionnum])
                  ) {
                    case "fisher":
                      this.fishernum--;
                      break;
                    case "farmer":
                      this.farmernum--;
                      break;
                    case "engineer":
                      this.engineernum--;
                      break;
                  }
                  for (var i = 0; i < this.questionnum; i++)
                    e[i] = this.answergroup[i];
                  (this.answergroup = e),
                    console.log(this.answergroup, this.questionnum),
                    console.log(
                      "fisher:" +
                        this.fishernum +
                        ",farmer:" +
                        this.farmernum +
                        ",engineer:" +
                        this.engineernum
                    );
                }
              },
              closebtnfun() {
                (this.questiongroup.length = 0),
                  this.$parent.changefun("getlion");
              },
            },
          };
        const Rs = (0, b.Z)(As, [
          ["render", Js],
          ["__scopeId", "data-v-2b4769a6"],
        ]);
        var Gs = Rs;
        const Xs = (e) => (
            (0, s.dD)("data-v-283bcbf1"), (e = e()), (0, s.Cn)(), e
          ),
          Qs = { class: "group" },
          en = { id: "introduce_page" },
          tn = Xs(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          on = Xs(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          sn = { class: "flexbox contextgroup" },
          nn = { class: "btn_pos" },
          ln = {
            class: "flexbox",
            style: { flex: "2", "flex-direction": "row" },
          },
          an = {
            class: "flexbox flex_2",
            style: { "flex-direction": "column" },
          },
          cn = { class: "context flexbox" },
          rn = ["innerHTML"],
          dn = Xs(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          hn = Xs(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          xn = {
            class: "buttons flexbox",
            style: { "flex-direction": "row", width: "100%" },
          },
          bn = Xs(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          pn = Xs(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          fn = { id: "name_window" },
          un = Xs(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          _n = { class: "window_bg flexbox" },
          wn = Xs(() => (0, s._)("div", { class: "name_flex" }, null, -1)),
          vn = { class: "flexbox" },
          mn = {
            class: "flexbox",
            style: { flex: "3", "flex-direction": "column" },
          },
          gn = (0, s.uE)(
            '<div class="flexbox" data-v-283bcbf1></div><div class="context flexbox" data-v-283bcbf1>幫它取名字</div><div class="context2 flexbox" data-v-283bcbf1>我的梅克獅叫:</div><div class="flexbox" data-v-283bcbf1><input id="name_input" type="text" maxlength="8" placeholder="名字最多8個字唷" data-v-283bcbf1></div><div class="gender_btn flexbox" data-v-283bcbf1><div class="flexbox" data-v-283bcbf1><input id="boy" checked="checked" type="radio" name="radio1" value="1" data-v-283bcbf1><label for="boy" style="width:100%;height:100%;" data-v-283bcbf1><span data-v-283bcbf1></span></label></div><div class="flexbox" data-v-283bcbf1><input id="girl" type="radio" name="radio1" value="2" data-v-283bcbf1><label for="girl" style="width:100%;height:100%;" data-v-283bcbf1><span data-v-283bcbf1></span></label></div></div>',
            5
          ),
          kn = {
            class: "flexbox",
            style: { "margin-top": "3% flex-direction:row" },
          },
          yn = Xs(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Cn = Xs(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          jn = Xs(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          $n = Xs(() => (0, s._)("div", { class: "name_flex" }, null, -1)),
          Wn = Xs(() => (0, s._)("div", { class: "flexbox" }, null, -1));
        function Bn(e, i, t, n, l, a) {
          return (
            (0, s.wg)(),
            (0, s.iD)("div", Qs, [
              (0, s._)("div", en, [
                tn,
                (0, s._)(
                  "div",
                  { class: (0, u.C_)(["result box", l.setliontype]) },
                  [
                    on,
                    (0, s._)("div", sn, [
                      (0, s._)(
                        "div",
                        { style: (0, u.j5)({ height: l.in_outbox_h + "px" }) },
                        null,
                        4
                      ),
                      (0, s._)("div", nn, [
                        (0, s._)("div", {
                          class: "close_btn",
                          onClick:
                            i[0] || (i[0] = (e) => n.introduce_btn("getlion")),
                        }),
                      ]),
                      (0, s._)("div", ln, [
                        (0, s._)("div", an, [
                          (0, s._)(
                            "div",
                            cn,
                            "你是 " + (0, u.zw)(l.job_type),
                            1
                          ),
                          (0, s._)(
                            "div",
                            {
                              class: "context2 flexbox scrollbar",
                              innerHTML: l.content,
                            },
                            null,
                            8,
                            rn
                          ),
                          dn,
                        ]),
                        hn,
                      ]),
                      (0, s._)("div", xn, [
                        (0, s._)("div", {
                          class: "retest flexbox",
                          id: "retestbtn",
                          onClick:
                            i[1] ||
                            (i[1] = (e) => n.back_to_question("question")),
                        }),
                        (0, s._)("div", {
                          class: "name flexbox",
                          id: "namebtn",
                          onClick:
                            i[2] || (i[2] = (e) => (l.nameshowbool = !0)),
                        }),
                      ]),
                      (0, s._)(
                        "div",
                        { style: (0, u.j5)({ height: l.in_outbox_h + "px" }) },
                        null,
                        4
                      ),
                    ]),
                    bn,
                  ],
                  2
                ),
                pn,
              ]),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  fn,
                  [
                    un,
                    (0, s._)("div", _n, [
                      wn,
                      (0, s._)("div", vn, [
                        (0, s._)(
                          "div",
                          {
                            style: (0, u.j5)([
                              { height: "100%", position: "relative" },
                              { width: l.n_outbox_w + "px" },
                            ]),
                          },
                          [
                            (0, s._)("div", {
                              class: "back_btn",
                              onClick: i[3] || (i[3] = (e) => a.backfun()),
                            }),
                          ],
                          4
                        ),
                        (0, s._)("div", mn, [
                          gn,
                          (0, s._)("div", kn, [
                            yn,
                            (0, s._)(
                              "div",
                              {
                                class: "confirm flexbox",
                                onClick:
                                  i[4] || (i[4] = (e) => a.createlionfun()),
                              },
                              "確認"
                            ),
                            Cn,
                          ]),
                          jn,
                        ]),
                        (0, s._)(
                          "div",
                          { style: (0, u.j5)({ width: l.n_outbox_w + "px" }) },
                          null,
                          4
                        ),
                      ]),
                      $n,
                    ]),
                    Wn,
                  ],
                  512
                ),
                [[o.F8, l.nameshowbool]]
              ),
            ])
          );
        }
        var qn = {
          name: "IntroducePage",
          emits: ["introduce_btn", "back_to_question"],
          setup(e, { emit: i }) {
            function t(e) {
              i("introduce_btn", e);
            }
            function o(e) {
              i("back_to_question", e);
            }
            return { introduce_btn: t, back_to_question: o };
          },
          data() {
            return {
              in_outbox_h: 30,
              n_outbox_w: 10,
              setliontype: "farmer",
              occupation_id: "1",
              lion_type: [],
              job_type: "社會型/實作型",
              content:
                "刻苦耐勞、率真、有耐心，每天辛勤的從家裡到農場照顧農作物以及動物們，日出出門、日落回家，一年365天無論颳風下雨都始終如一。",
              nameshowbool: !1,
            };
          },
          mounted() {
            this.$http.get(N.apiUrl + "occupations").then((e) => {
              console.log(e.data), (this.lion_type = e.data);
            });
          },
          methods: {
            setwidth() {
              var e, i, t, o, s, n, l, a, c, r;
              window.innerWidth < 1439 && window.innerWidth >= 1024
                ? ((e = (window.innerHeight / 7) * 5),
                  (i = (window.innerWidth / 9) * 5),
                  (t = i),
                  (o = (1106 * t) / 1885),
                  (s = (e - o) / 2),
                  (n = (window.innerHeight / 4) * 2),
                  (l = window.innerWidth / 2),
                  (a = n),
                  (c = (178 * a) / 150),
                  (r = (l - c) / 2))
                : window.innerWidth < 1023 && window.innerWidth >= 768
                ? ((e = (window.innerHeight / 12) * 10),
                  (i = (window.innerWidth / 5) * 3),
                  (t = i),
                  (o = (1106 * t) / 1885),
                  (s = (e - o) / 2),
                  (n = (window.innerHeight / 4) * 2),
                  (l = window.innerWidth / 3),
                  (a = n),
                  (c = (178 * a) / 150),
                  (r = (l - c) / 2))
                : window.innerWidth < 739 && window.innerWidth >= 720
                ? ((e = (window.innerHeight / 7) * 5),
                  (i = (window.innerWidth / 4.5) * 2.5),
                  (t = i),
                  (o = (1106 * t) / 1885),
                  (s = (e - o) / 2),
                  (n = (window.innerHeight / 4) * 2),
                  (l = window.innerWidth / 2),
                  (a = n),
                  (c = (178 * a) / 150),
                  (r = (l - c) / 2))
                : window.innerWidth <= 653
                ? ((e = (window.innerHeight / 20) * 18),
                  (i = (window.innerWidth / 5) * 3),
                  (t = i),
                  (o = (1106 * t) / 1885),
                  (s = (e - o) / 2),
                  (n = (window.innerHeight / 4) * 2),
                  (l = window.innerWidth / 3),
                  (a = n),
                  (c = (178 * a) / 150),
                  (r = (l - c) / 2))
                : ((e = (window.innerHeight / 7) * 5),
                  (i = (window.innerWidth / 9) * 5),
                  (t = i),
                  (o = (1106 * t) / 1885),
                  (s = (e - o) / 2),
                  (n = (window.innerHeight / 4) * 2),
                  (l = window.innerWidth / 3),
                  (a = n),
                  (c = (178 * a) / 150),
                  (r = (l - c) / 2)),
                console.log(n, l, a, c, r),
                (this.n_outbox_w = r < 0 ? 0 : r),
                (this.in_outbox_h = s < 0 ? 0 : s);
            },
            setliontypefun(e) {
              this.setliontype = e;
              for (var i = 0; i < this.lion_type.length; i++) {
                var t = this.lion_type[i];
                e == t.name &&
                  ((this.occupation_id = t.id), (this.content = t.description));
              }
            },
            backfun() {
              (this.nameshowbool = !1),
                (document.getElementById("name_input").value = "");
            },
            createlionfun() {
              var e = document.getElementById("name_input").value,
                i = document.getElementById("boy").checked,
                t = document.getElementById("girl").checked;
              if (
                (console.log(t),
                (document.getElementById("name_input").value = ""),
                console.log(this.occupation_id),
                "" != e)
              ) {
                var o = {
                  name: e,
                  gender: i ? "boy" : "girl",
                  occupation_id: this.occupation_id,
                  player_id: N.getCookie("id"),
                };
                this.$http
                  .post(N.apiUrl + "lions", o, {
                    emulateJSON: !0,
                    headers: {
                      authorization: "Bearer " + N.getCookie("token"),
                    },
                  })
                  .then(
                    (e) => {
                      this.$parent.togamescenefun(
                        "gamescene",
                        this.setliontype,
                        i ? "boy" : "girl",
                        e.data
                      ),
                        console.log(e);
                    },
                    (e) => {
                      this.$parent.alert("網路連線問題，請再試一次!"),
                        console.log(e);
                    }
                  );
              } else this.$parent.alert("請幫梅克獅取名字!");
            },
          },
        };
        const Hn = (0, b.Z)(qn, [
          ["render", Bn],
          ["__scopeId", "data-v-283bcbf1"],
        ]);
        var Fn = Hn;
        const Dn = (e) => (
            (0, s.dD)("data-v-92fdf210"), (e = e()), (0, s.Cn)(), e
          ),
          Tn = { class: "group position-r" },
          In = { class: "box", style: { flex: "2" } },
          Mn = { id: "level_tag", class: "flexbox w-100 h-100 flex-c" },
          Ln = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Sn = { class: "flexbox w-100 h-100 flex-c" },
          zn = Dn(() =>
            (0, s._)(
              "div",
              { class: "flexbox2", style: { flex: "2.5" } },
              null,
              -1
            )
          ),
          On = { class: "level_num" },
          En = { class: "lionData_position" },
          Un = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Nn = Dn(() => (0, s._)("span", null, null, -1)),
          Pn = {
            class: "progress_bar",
            style: { position: "relative", "justify-content": "left" },
          },
          Yn = { style: { position: "absolute", width: "100%" } },
          Vn = { class: "now_data flexbox w-100 h-100" },
          Kn = { class: "data_text" },
          Jn = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Zn = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          An = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Rn = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Gn = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Xn = { id: "lion", class: "flexbox w-100 h-100 position-r" },
          Qn = { class: "liondeco", id: "maskdeco" },
          el = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          il = { id: "choosen", class: "box", style: { flex: "1" } },
          tl = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          ol = { id: "redDot" },
          sl = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          nl = { class: "box", style: { flex: "2" } },
          ll = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          al = {
            id: "backpagebox",
            class: "flexbox unclosebox w-100 h-100 boxbg flex-c",
            style: { flex: "3" },
          },
          cl = { class: "d-flex unclosebox w-100 flex-r" },
          rl = Dn(() =>
            (0, s._)("div", { class: "flexbox unclosebox" }, null, -1)
          ),
          dl = { class: "flexbox unclosebox w-100 h-100 boxradiogroup" },
          hl = ["id", "value", "checked"],
          xl = ["for"],
          bl = ["onClick"],
          pl = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          fl = {
            key: 0,
            class: "w-100 scrollbar unclosebox d-flex flex-r flex-wrap",
          },
          ul = ["id", "value"],
          _l = ["for"],
          wl = ["onClick"],
          vl = { class: "number_bg unclosebox" },
          ml = ["id"],
          gl = ["for"],
          kl = Dn(() => (0, s._)("span", { class: "unclosebox" }, null, -1)),
          yl = [kl],
          Cl = {
            key: 1,
            class: "w-100 scrollbar unclosebox d-flex flex-r flex-wrap",
          },
          jl = ["id", "value"],
          $l = ["for"],
          Wl = ["onClick"],
          Bl = { class: "number_bg unclosebox" },
          ql = ["id"],
          Hl = ["for"],
          Fl = Dn(() => (0, s._)("span", { class: "unclosebox" }, null, -1)),
          Dl = [Fl],
          Tl = {
            key: 2,
            class: "w-100 scrollbar unclosebox d-flex flex-r flex-wrap",
          },
          Il = ["id", "value"],
          Ml = ["for"],
          Ll = ["onClick"],
          Sl = ["id"],
          zl = ["for"],
          Ol = Dn(() => (0, s._)("span", { class: "unclosebox" }, null, -1)),
          El = [Ol],
          Ul = {
            key: 3,
            class: "w-100 scrollbar unclosebox d-flex flex-r flex-wrap",
          },
          Nl = ["id", "value"],
          Pl = ["for"],
          Yl = ["onClick"],
          Vl = ["id"],
          Kl = ["for"],
          Jl = Dn(() => (0, s._)("span", { class: "unclosebox" }, null, -1)),
          Zl = [Jl],
          Al = {
            id: "clothgroupbox",
            class: "flexbox w-100 h-100 boxbg flex-c unclosebox",
            style: { flex: "3" },
          },
          Rl = { class: "d-flex w-100 flex-r unclosebox" },
          Gl = Dn(() =>
            (0, s._)("div", { class: "flexbox unclosebox" }, null, -1)
          ),
          Xl = { class: "flexbox w-100 h-100 boxradiogroup unclosebox" },
          Ql = ["id", "value", "checked"],
          ea = ["for"],
          ia = ["onClick"],
          ta = Dn(() =>
            (0, s._)("div", { class: "flexbox unclosebox" }, null, -1)
          ),
          oa = {
            key: 0,
            class: "w-100 scrollbar unclosebox d-flex flex-r flex-wrap",
          },
          sa = ["id", "value"],
          na = ["for"],
          la = ["onClick"],
          aa = ["id"],
          ca = ["for"],
          ra = Dn(() => (0, s._)("span", { class: "unclosebox" }, null, -1)),
          da = [ra],
          ha = {
            key: 1,
            class: "w-100 scrollbar unclosebox d-flex flex-r flex-wrap",
          },
          xa = ["id", "value"],
          ba = ["for"],
          pa = ["onClick"],
          fa = ["id"],
          ua = ["for"],
          _a = Dn(() => (0, s._)("span", { class: "unclosebox" }, null, -1)),
          wa = [_a],
          va = {
            key: 2,
            class: "w-100 scrollbar unclosebox d-flex flex-r flex-wrap",
          },
          ma = ["id", "value"],
          ga = ["for"],
          ka = ["onClick"],
          ya = ["id"],
          Ca = ["for"],
          ja = Dn(() => (0, s._)("span", { class: "unclosebox" }, null, -1)),
          $a = [ja],
          Wa = {
            key: 3,
            class: "w-100 scrollbar unclosebox d-flex flex-r flex-wrap",
          },
          Ba = ["id", "value"],
          qa = ["for"],
          Ha = ["onClick"],
          Fa = ["id"],
          Da = ["for"],
          Ta = Dn(() => (0, s._)("span", { class: "unclosebox" }, null, -1)),
          Ia = [Ta],
          Ma = {
            key: 4,
            class: "w-100 scrollbar unclosebox d-flex flex-r flex-wrap",
          },
          La = ["id", "value"],
          Sa = ["for"],
          za = ["onClick"],
          Oa = ["id"],
          Ea = ["for"],
          Ua = Dn(() => (0, s._)("span", { class: "unclosebox" }, null, -1)),
          Na = [Ua],
          Pa = {
            key: 5,
            class: "w-100 scrollbar unclosebox d-flex flex-r flex-wrap",
          },
          Ya = ["id", "value"],
          Va = ["for"],
          Ka = ["onClick"],
          Ja = ["id"],
          Za = ["for"],
          Aa = Dn(() => (0, s._)("span", { class: "unclosebox" }, null, -1)),
          Ra = [Aa],
          Ga = {
            id: "missionbox",
            class: "flexbox w-100 h-100 boxbg flex-c unclosebox",
            style: { flex: "3" },
          },
          Xa = {
            class: "missionHeight d-flex w-100 scrollbar unclosebox flex-c",
          },
          Qa = ["id", "value"],
          ec = ["for"],
          ic = ["onClick"],
          tc = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          oc = { class: "topscene" },
          sc = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          nc = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          lc = { class: "flexbox w-100 h-100 flex-c", style: { flex: "3" } },
          ac = { class: "flexbox w-100 h-100 flex-r" },
          cc = { class: "flexbox w-100 h-100 flex-c" },
          rc = { class: "flexbox w-100 h-100 position-r" },
          dc = { class: "flexbox block w-100 h-100", style: { flex: "3.5" } },
          hc = { class: "w-100 h-100 d-flex flex-c" },
          xc = { class: "flexbox w-100 h-100" },
          bc = ["innerHTML"],
          pc = { class: "flexbox w-100 h-100" },
          fc = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          uc = { class: "cancelBtn flexbox w-100 h-100" },
          _c = { class: "sendBtn flexbox w-100 h-100" },
          wc = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          vc = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          mc = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          gc = { class: "topscene" },
          kc = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          yc = { class: "box w-100 h-100 frame flex-c propsframe" },
          Cc = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          jc = { class: "flexbox w-100 h-100 flex-c", style: { flex: "3" } },
          $c = { class: "flexbox w-100 h-100 flex-r" },
          Wc = { class: "flexbox w-100 h-100 flex-c" },
          Bc = { class: "flexbox w-100 h-100 position-r" },
          qc = { class: "flexbox block w-100 h-100", style: { flex: "3.5" } },
          Hc = { class: "w-100 h-100 d-flex flex-c" },
          Fc = { class: "flexbox w-100 h-100" },
          Dc = ["src"],
          Tc = { class: "flexbox w-100 h-100" },
          Ic = ["innerHTML"],
          Mc = { class: "flexbox w-100 h-100" },
          Lc = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Sc = { class: "sendBtn flexbox w-100 h-100" },
          zc = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Oc = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Ec = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Uc = { class: "topscene" },
          Nc = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Pc = { class: "box w-100 h-100 frame flex-c badgeframe" },
          Yc = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Vc = { class: "flexbox w-100 h-100 flex-c", style: { flex: "3" } },
          Kc = { class: "flexbox w-100 h-100 flex-r" },
          Jc = { class: "flexbox w-100 h-100 flex-c" },
          Zc = { class: "flexbox w-100 h-100 position-r" },
          Ac = { class: "flexbox block w-100 h-100", style: { flex: "3.5" } },
          Rc = { class: "w-100 h-100 d-flex flex-c" },
          Gc = { class: "flexbox w-100 h-100" },
          Xc = ["innerHTML"],
          Qc = { class: "number_bg", style: { color: "white" } },
          er = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          ir = { class: "flexbox w-100 h-100" },
          tr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          or = { class: "sendBtn flexbox w-100 h-100" },
          sr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          nr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          lr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          ar = { class: "topscene" },
          cr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          rr = { class: "box w-100 h-100 frame flex-c foodframe" },
          dr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          hr = { class: "flexbox w-100 h-100 flex-c", style: { flex: "3" } },
          xr = { class: "flexbox w-100 h-100 flex-r" },
          br = { class: "flexbox w-100 h-100 flex-c" },
          pr = { class: "flexbox w-100 h-100 position-r" },
          fr = { class: "flexbox block w-100 h-100", style: { flex: "3.5" } },
          ur = { class: "w-100 h-100 d-flex flex-c" },
          _r = { class: "flexbox w-100 h-100" },
          wr = ["innerHTML"],
          vr = { class: "number_bg", style: { color: "white" } },
          mr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          gr = { class: "flexbox w-100 h-100" },
          kr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          yr = { class: "cancelBtn flexbox w-100 h-100" },
          Cr = { class: "sendBtn flexbox w-100 h-100" },
          jr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          $r = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Wr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Br = { class: "topscene" },
          qr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Hr = { class: "box w-100 h-100 frame flex-c badgeframe" },
          Fr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Dr = { class: "flexbox w-100 h-100 flex-c", style: { flex: "3" } },
          Tr = { class: "flexbox w-100 h-100 flex-r" },
          Ir = { class: "flexbox w-100 h-100 flex-c" },
          Mr = { class: "flexbox w-100 h-100 position-r" },
          Lr = { class: "flexbox block w-100 h-100", style: { flex: "3.5" } },
          Sr = { class: "w-100 h-100 d-flex flex-c" },
          zr = { class: "flexbox w-100 h-100" },
          Or = ["innerHTML"],
          Er = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Ur = { class: "flexbox w-100 h-100" },
          Nr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Pr = { class: "sendBtn flexbox w-100 h-100" },
          Yr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Vr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Kr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Jr = { class: "topscene" },
          Zr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Ar = { class: "box w-100 h-100 frame flex-c bookframe" },
          Rr = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Gr = { class: "flexbox w-100 h-100 flex-c", style: { flex: "3" } },
          Xr = { class: "flexbox w-100 h-100 flex-r" },
          Qr = { class: "flexbox w-100 h-100 flex-c" },
          ed = { class: "flexbox w-100 h-100 position-r" },
          id = { class: "flexbox w-100 h-100 d-flex flex-c scrollbarSet" },
          td = {
            class: "flexbox block h-100",
            style: { flex: "2.5", width: "90%", "margin-bottom": "5%" },
          },
          od = { class: "w-100 h-100 d-flex flex-r" },
          sd = ["innerHTML"],
          nd = ["innerHTML"],
          ld = ["innerHTML"],
          ad = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          cd = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          rd = { class: "topscene" },
          dd = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          hd = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          xd = { class: "flexbox w-100 h-100 flex-c", style: { flex: "3" } },
          bd = { class: "flexbox w-100 h-100 flex-r" },
          pd = { class: "flexbox w-100 h-100 flex-c" },
          fd = { class: "flexbox w-100 h-100 position-r" },
          ud = { class: "flexbox block w-100 h-100", style: { flex: "3.5" } },
          _d = { class: "w-100 h-100 d-flex flex-c" },
          wd = { class: "flexbox w-100 h-100" },
          vd = ["innerHTML"],
          md = { class: "flexbox w-100 h-100" },
          gd = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          kd = { class: "sendBtn flexbox w-100 h-100" },
          yd = { key: 0, class: "sendBtn flexbox w-100 h-100" },
          Cd = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          jd = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          $d = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Wd = { class: "topscene" },
          Bd = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          qd = { class: "box w-100 h-100 frame flex-c gamemissionframe" },
          Hd = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Fd = { class: "flexbox w-100 h-100 flex-c", style: { flex: "3" } },
          Dd = { class: "flexbox w-100 h-100 flex-r" },
          Td = { class: "flexbox w-100 h-100 flex-c" },
          Id = { class: "flexbox w-100 h-100 position-r" },
          Md = { class: "flexbox block w-100 h-100", style: { flex: "3.5" } },
          Ld = { class: "w-100 h-100 d-flex flex-c" },
          Sd = { class: "flexbox w-100 h-100" },
          zd = ["innerHTML"],
          Od = { class: "flexbox w-100 h-100" },
          Ed = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Ud = { class: "sendBtn flexbox w-100 h-100" },
          Nd = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Pd = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Yd = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Vd = { class: "topscene" },
          Kd = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Jd = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Zd = { class: "flexbox w-100 h-100 flex-c", style: { flex: "3" } },
          Ad = { class: "flexbox w-100 h-100 flex-r" },
          Rd = { class: "flexbox w-100 h-100 flex-c" },
          Gd = { class: "flexbox w-100 h-100 position-r" },
          Xd = { class: "flexbox block w-100 h-100", style: { flex: "3.5" } },
          Qd = { class: "w-100 h-100 flexbox" },
          eh = ["innerHTML"],
          ih = { class: "flexbox w-100 h-100" },
          th = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          oh = { class: "sendBtn flexbox w-100 h-100" },
          sh = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          nh = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          lh = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          ah = { class: "topscene" },
          ch = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          rh = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          dh = { class: "bigHeight flexbox w-100 h-100 flex-c" },
          hh = { class: "flexbox w-100 h-100 flex-r" },
          xh = { class: "flexbox w-100 h-100 flex-c" },
          bh = { class: "flexbox w-100 h-100 position-r" },
          ph = ["innerHTML"],
          fh = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          uh = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          _h = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          wh = { class: "topscene" },
          vh = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          mh = { class: "box w-100 h-100 frame flex-c showmissionframe" },
          gh = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          kh = { class: "flexbox w-100 h-100 flex-c", style: { flex: "3" } },
          yh = { class: "flexbox w-100 h-100 flex-r" },
          Ch = { class: "flexbox w-100 h-100 flex-c" },
          jh = { class: "flexbox w-100 h-100 position-r" },
          $h = { class: "flexbox block w-100 h-100", style: { flex: "3.5" } },
          Wh = { class: "w-100 h-100 d-flex flex-c" },
          Bh = { class: "flexbox w-100 h-100" },
          qh = ["innerHTML"],
          Hh = { class: "flexbox w-100 h-100" },
          Fh = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Dh = { class: "sendBtn flexbox w-100 h-100" },
          Th = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Ih = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Mh = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Lh = { class: "topitemscene" },
          Sh = Dn(() =>
            (0, s._)(
              "div",
              { class: "flexbox", style: { flex: "2" } },
              null,
              -1
            )
          ),
          zh = { class: "flexSet flexbox w-100 h-100 flex-c" },
          Oh = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Eh = { class: "item_frame flexbox w-100 h-100 flex-c" },
          Uh = { class: "flexbox w-100 h-100 flex-r" },
          Nh = {
            id: "itemcontent",
            class: "flexbox w-100 h-100 flex-c position-r",
          },
          Ph = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Yh = { class: "flexbox w-100 h-100" },
          Vh = { class: "fontSize", style: { margin: "0", color: "white" } },
          Kh = { class: "flexbox w-100 h-100" },
          Jh = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Zh = Dn(() =>
            (0, s._)(
              "div",
              { class: "flexbox", style: { flex: "2" } },
              null,
              -1
            )
          ),
          Ah = { class: "topitemscene" },
          Rh = Dn(() =>
            (0, s._)(
              "div",
              { class: "flexbox", style: { flex: "2" } },
              null,
              -1
            )
          ),
          Gh = { class: "flexSet flexbox w-100 h-100 flex-c" },
          Xh = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Qh = { class: "item_frame flexbox w-100 h-100 flex-c" },
          ex = { class: "flexbox w-100 h-100 flex-r" },
          ix = {
            id: "itemcontent",
            class: "flexbox w-100 h-100 flex-c position-r",
          },
          tx = {
            class: "flexbox w-100 h-100 fontSize",
            style: { margin: "0", color: "white" },
          },
          ox = {
            class: "number_bg",
            style: { color: "white", "font-size": "2vmin" },
          },
          sx = { class: "flexbox w-100 h-100 flex-r" },
          nx = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          lx = { class: "posSet flexbox w-100 h-100" },
          ax = ["max"],
          cx = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          rx = { class: "flexbox w-100 h-100 flex-r" },
          dx = { class: "flexbox w-100 h-100" },
          hx = { class: "flexbox w-100 h-100" },
          xx = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          bx = Dn(() =>
            (0, s._)(
              "div",
              { class: "flexbox", style: { flex: "2" } },
              null,
              -1
            )
          ),
          px = { class: "topitemscene" },
          fx = Dn(() =>
            (0, s._)(
              "div",
              { class: "flexbox", style: { flex: "2" } },
              null,
              -1
            )
          ),
          ux = { class: "flexSet flexbox w-100 h-100 flex-c" },
          _x = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          wx = { class: "item_frame flexbox w-100 h-100 flex-c" },
          vx = { class: "flexbox w-100 h-100 flex-r" },
          mx = {
            id: "itemcontent",
            class: "flexbox w-100 h-100 flex-c position-r",
          },
          gx = Dn(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          kx = {
            class: "number_bg",
            style: { color: "white", "font-size": "2vmin" },
          },
          yx = { class: "flexbox w-100 h-100" },
          Cx = ["innerHTML"],
          jx = { class: "flexbox w-100 h-100" },
          $x = Dn(() => (0, s._)("div", { class: "flexbox" }, null, -1)),
          Wx = Dn(() =>
            (0, s._)(
              "div",
              { class: "flexbox", style: { flex: "2" } },
              null,
              -1
            )
          );
        function Bx(e, i, t, n, l, a) {
          const c = (0, s.up)("maskpage");
          return (
            (0, s.wg)(),
            (0, s.iD)("div", Tn, [
              (0, s._)(
                "div",
                {
                  class: "parentbox",
                  onClick:
                    i[3] || (i[3] = (...e) => a.closebox && a.closebox(...e)),
                },
                [
                  (0, s._)("div", In, [
                    (0, s._)("div", Mn, [
                      Ln,
                      (0, s._)(
                        "div",
                        {
                          class: (0, u.C_)([
                            "level_bg",
                            "medal_" + l.liontype + "_original",
                          ]),
                        },
                        [
                          (0, s._)(
                            "div",
                            { style: (0, u.j5)(l.outbox_w) },
                            null,
                            4
                          ),
                          (0, s._)("div", Sn, [
                            zn,
                            (0, s._)("p", On, "LV." + (0, u.zw)(l.level), 1),
                          ]),
                          (0, s._)("div", En, [
                            Un,
                            (0, s._)(
                              "div",
                              {
                                class: (0, u.C_)([
                                  "lion_name",
                                  l.male + "_icon",
                                ]),
                              },
                              [Nn, (0, s.Uk)((0, u.zw)(l.name), 1)],
                              2
                            ),
                            (0, s._)("div", Pn, [
                              (0, s._)(
                                "div",
                                {
                                  class: "exp_progress",
                                  style: (0, u.j5)({ width: l.progress + "%" }),
                                },
                                null,
                                4
                              ),
                              (0, s._)(
                                "span",
                                Yn,
                                "EXP:" + (0, u.zw)(l.progress) + "%",
                                1
                              ),
                            ]),
                            (0, s._)("div", Vn, [
                              (0, s._)(
                                "p",
                                Kn,
                                (0, u.zw)(l.liontype_tw) +
                                  " - " +
                                  (0, u.zw)(l.lionclass_tw),
                                1
                              ),
                            ]),
                            Jn,
                          ]),
                          (0, s._)(
                            "div",
                            { style: (0, u.j5)(l.outbox_w) },
                            null,
                            4
                          ),
                        ],
                        2
                      ),
                      Zn,
                    ]),
                    An,
                    Rn,
                  ]),
                  (0, s._)(
                    "div",
                    { class: "box", style: (0, u.j5)({ flex: l.lionflex }) },
                    [
                      Gn,
                      (0, s._)("div", Xn, [
                        (0, s._)(
                          "div",
                          { class: (0, u.C_)(["lion_body", l.male + l.grow]) },
                          null,
                          2
                        ),
                        (0, s._)(
                          "div",
                          {
                            class: (0, u.C_)([
                              "lionshoes",
                              l.liontype + l.shoes,
                            ]),
                          },
                          null,
                          2
                        ),
                        (0, s._)(
                          "div",
                          {
                            class: (0, u.C_)([
                              "lionpants",
                              l.liontype + l.pants,
                            ]),
                          },
                          null,
                          2
                        ),
                        (0, s.wy)(
                          (0, s._)(
                            "div",
                            {
                              class: (0, u.C_)([
                                "liondeco",
                                l.liontype + l.deco + l.male,
                              ]),
                            },
                            null,
                            2
                          ),
                          [[o.F8, !l.maskdecobool]]
                        ),
                        (0, s.wy)((0, s._)("div", Qn, null, 512), [
                          [o.F8, l.maskdecobool],
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: (0, u.C_)([
                              "lioncloth",
                              l.liontype + l.cloth,
                            ]),
                          },
                          null,
                          2
                        ),
                        (0, s._)(
                          "div",
                          {
                            class: (0, u.C_)([
                              "lionjumpsuit",
                              l.liontype + l.jumpsuit,
                            ]),
                          },
                          null,
                          2
                        ),
                        (0, s._)(
                          "div",
                          {
                            class: (0, u.C_)(["lioncoat", l.liontype + l.coat]),
                          },
                          null,
                          2
                        ),
                      ]),
                      el,
                    ],
                    4
                  ),
                  (0, s._)("div", il, [
                    tl,
                    (0, s._)("div", {
                      id: "backpackbtn",
                      class: "backpack_icon unclosebox flexbox w-100 h-100",
                      onClick: i[0] || (i[0] = (e) => a.boxclick("backpage")),
                    }),
                    (0, s._)("div", {
                      id: "clothgroupbtn",
                      class: "clothset_icon unclosebox flexbox w-100 h-100",
                      onClick: i[1] || (i[1] = (e) => a.boxclick("clothgroup")),
                    }),
                    (0, s._)(
                      "div",
                      {
                        id: "missionbtn",
                        class: "mission_icon unclosebox flexbox w-100 h-100",
                        onClick: i[2] || (i[2] = (e) => a.boxclick("mission")),
                      },
                      [
                        (0, s.wy)((0, s._)("div", ol, null, 512), [
                          [o.F8, l.reddotbool],
                        ]),
                      ]
                    ),
                    sl,
                  ]),
                  (0, s.wy)(
                    (0, s._)(
                      "div",
                      nl,
                      [
                        ll,
                        (0, s.wy)(
                          (0, s._)(
                            "div",
                            al,
                            [
                              (0, s._)("div", cl, [
                                rl,
                                (0, s._)("div", dl, [
                                  ((0, s.wg)(!0),
                                  (0, s.iD)(
                                    s.HY,
                                    null,
                                    (0, s.Ko)(
                                      l.boxtypearr,
                                      (e, i) => (
                                        (0, s.wg)(),
                                        (0, s.iD)(
                                          "div",
                                          {
                                            class: "h-100 flexbox unclosebox",
                                            key: e.value,
                                          },
                                          [
                                            (0, s._)(
                                              "input",
                                              {
                                                id: e.value + "radio",
                                                type: "radio",
                                                name: "boxradio",
                                                value: e.value,
                                                class: "unclosebox",
                                                checked: 0 == i,
                                              },
                                              null,
                                              8,
                                              hl
                                            ),
                                            (0, s._)(
                                              "label",
                                              {
                                                for: e.value + "radio",
                                                class: "w-100 h-100 unclosebox",
                                              },
                                              [
                                                (0, s._)(
                                                  "span",
                                                  {
                                                    class: "unclosebox",
                                                    onClick: (i) =>
                                                      a.changebackpagefun(
                                                        e.value
                                                      ),
                                                  },
                                                  (0, u.zw)(e.name),
                                                  9,
                                                  bl
                                                ),
                                              ],
                                              8,
                                              xl
                                            ),
                                          ]
                                        )
                                      )
                                    ),
                                    128
                                  )),
                                ]),
                                pl,
                              ]),
                              "props" == l.boxradiotype
                                ? ((0, s.wg)(),
                                  (0, s.iD)("div", fl, [
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        l.propsarr,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth unclosebox w-100 h-60 d-flex",
                                              key: e,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id:
                                                    e.item.data.name + "Props",
                                                  type: "radio",
                                                  name: "propsradio",
                                                  value: e.item.data.name,
                                                  class: (0, u.C_)(
                                                    e.item.data.name +
                                                      "Props unclosebox"
                                                  ),
                                                },
                                                null,
                                                10,
                                                ul
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for:
                                                    e.item.data.name + "Props",
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                [
                                                  (0, s._)(
                                                    "span",
                                                    {
                                                      class:
                                                        "unclosebox position-r",
                                                      onClick: (i) =>
                                                        a.clickitem(e),
                                                    },
                                                    [
                                                      (0, s._)(
                                                        "div",
                                                        vl,
                                                        (0, u.zw)(e.quantity),
                                                        1
                                                      ),
                                                    ],
                                                    8,
                                                    wl
                                                  ),
                                                ],
                                                8,
                                                _l
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        24 - l.propsarr.length,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth otherObj unclosebox w-100 h-60 d-flex",
                                              key: e,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id: "objNone" + e,
                                                  type: "radio",
                                                  name: "objradio",
                                                  value: "obj",
                                                  class: "unclosebox",
                                                  disabled: "",
                                                },
                                                null,
                                                8,
                                                ml
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for: "objNone" + e,
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                yl,
                                                8,
                                                gl
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                  ]))
                                : (0, s.kq)("", !0),
                              "food" == l.boxradiotype
                                ? ((0, s.wg)(),
                                  (0, s.iD)("div", Cl, [
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        l.foodarr,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth unclosebox w-100 h-60 d-flex",
                                              key: e.item.name,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id: e.item.data.name + "Meat",
                                                  type: "radio",
                                                  name: "meatradio",
                                                  value: e.item.name,
                                                  class: (0, u.C_)(
                                                    e.item.data.name +
                                                      " unclosebox"
                                                  ),
                                                },
                                                null,
                                                10,
                                                jl
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for:
                                                    e.item.data.name + "Meat",
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                [
                                                  (0, s._)(
                                                    "span",
                                                    {
                                                      class:
                                                        "position-r unclosebox",
                                                      onClick: (i) =>
                                                        a.clickfooditem(
                                                          e.item.data.name,
                                                          e.quantity,
                                                          e
                                                        ),
                                                    },
                                                    [
                                                      (0, s._)(
                                                        "div",
                                                        Bl,
                                                        (0, u.zw)(e.quantity),
                                                        1
                                                      ),
                                                    ],
                                                    8,
                                                    Wl
                                                  ),
                                                ],
                                                8,
                                                $l
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        24 - l.foodarr.length,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth otherObj unclosebox w-100 h-60 d-flex",
                                              key: e,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id: "objNone" + e,
                                                  type: "radio",
                                                  name: "objradio",
                                                  value: "obj",
                                                  class: "unclosebox",
                                                  disabled: "",
                                                },
                                                null,
                                                8,
                                                ql
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for: "objNone" + e,
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                Dl,
                                                8,
                                                Hl
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                  ]))
                                : (0, s.kq)("", !0),
                              "badge" == l.boxradiotype
                                ? ((0, s.wg)(),
                                  (0, s.iD)("div", Tl, [
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        l.badgearr,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth unclosebox w-100 h-60 d-flex",
                                              key: e.item.class,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id:
                                                    e.item.occupation +
                                                    e.item.class +
                                                    "Badge",
                                                  type: "radio",
                                                  name: "badgeradio",
                                                  value: e.item.class,
                                                  class: (0, u.C_)(
                                                    e.item.occupation +
                                                      e.item.class +
                                                      "Badge unclosebox"
                                                  ),
                                                },
                                                null,
                                                10,
                                                Il
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for:
                                                    e.item.occupation +
                                                    e.item.class +
                                                    "Badge",
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                [
                                                  (0, s._)(
                                                    "span",
                                                    {
                                                      class: "unclosebox",
                                                      onClick: (i) =>
                                                        a.clickbadgeitem(e),
                                                    },
                                                    null,
                                                    8,
                                                    Ll
                                                  ),
                                                ],
                                                8,
                                                Ml
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        24 - l.badgearr.length,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth otherObj unclosebox w-100 h-60 d-flex",
                                              key: e,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id: "objNone" + e,
                                                  type: "radio",
                                                  name: "objradio",
                                                  value: "obj",
                                                  class: "unclosebox",
                                                  disabled: "",
                                                },
                                                null,
                                                8,
                                                Sl
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for: "objNone" + e,
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                El,
                                                8,
                                                zl
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                  ]))
                                : (0, s.kq)("", !0),
                              "book" == l.boxradiotype
                                ? ((0, s.wg)(),
                                  (0, s.iD)("div", Ul, [
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        l.bookarr,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth unclosebox w-100 h-60 d-flex",
                                              key: e.value,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id: e.value + "Book",
                                                  type: "radio",
                                                  name: "bookradio",
                                                  value: e.value,
                                                  class: (0, u.C_)(
                                                    e.value + "Book unclosebox"
                                                  ),
                                                },
                                                null,
                                                10,
                                                Nl
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for: e.value + "Book",
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                [
                                                  (0, s._)(
                                                    "span",
                                                    {
                                                      class: "unclosebox",
                                                      onClick: (i) =>
                                                        a.clickbookitem(e),
                                                    },
                                                    null,
                                                    8,
                                                    Yl
                                                  ),
                                                ],
                                                8,
                                                Pl
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        18 - l.bookarr.length,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth otherObj unclosebox w-100 h-60 d-flex",
                                              key: e,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id: "objNone" + e,
                                                  type: "radio",
                                                  name: "objradio",
                                                  value: "obj",
                                                  class: "unclosebox",
                                                  disabled: "",
                                                },
                                                null,
                                                8,
                                                Vl
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for: "objNone" + e,
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                Zl,
                                                8,
                                                Kl
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                  ]))
                                : (0, s.kq)("", !0),
                            ],
                            512
                          ),
                          [[o.F8, l.backpagebool]]
                        ),
                        (0, s.wy)(
                          (0, s._)(
                            "div",
                            Al,
                            [
                              (0, s._)("div", Rl, [
                                Gl,
                                (0, s._)("div", Xl, [
                                  ((0, s.wg)(!0),
                                  (0, s.iD)(
                                    s.HY,
                                    null,
                                    (0, s.Ko)(
                                      l.clothtypearr,
                                      (e, i) => (
                                        (0, s.wg)(),
                                        (0, s.iD)(
                                          "div",
                                          {
                                            class: "h-100 flexbox unclosebox",
                                            key: e.value,
                                          },
                                          [
                                            (0, s._)(
                                              "input",
                                              {
                                                id: e.value + "radio",
                                                type: "radio",
                                                name: "clothgroupradio",
                                                value: e.value,
                                                class: "unclosebox",
                                                checked: 0 == i,
                                              },
                                              null,
                                              8,
                                              Ql
                                            ),
                                            (0, s._)(
                                              "label",
                                              {
                                                for: e.value + "radio",
                                                class: "w-100 h-100 unclosebox",
                                              },
                                              [
                                                (0, s._)(
                                                  "span",
                                                  {
                                                    class: "unclosebox",
                                                    onClick: (i) =>
                                                      a.chagneclothgroupfun(
                                                        e.value
                                                      ),
                                                  },
                                                  (0, u.zw)(e.name),
                                                  9,
                                                  ia
                                                ),
                                              ],
                                              8,
                                              ea
                                            ),
                                          ]
                                        )
                                      )
                                    ),
                                    128
                                  )),
                                ]),
                                ta,
                              ]),
                              "cloth" == l.clothgroupradiotype
                                ? ((0, s.wg)(),
                                  (0, s.iD)("div", oa, [
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        l.clotharr,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth unclosebox w-100 h-60 d-flex",
                                              key: e.cloth.data.name,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id:
                                                    l.liontype +
                                                    e.cloth.data.name +
                                                    "Cloth",
                                                  type: "radio",
                                                  name: "clothradio",
                                                  value:
                                                    l.liontype +
                                                    e.cloth.data.name,
                                                  class: (0, u.C_)(
                                                    l.liontype +
                                                      e.cloth.data.name +
                                                      "Cloth unclosebox"
                                                  ),
                                                },
                                                null,
                                                10,
                                                sa
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for:
                                                    l.liontype +
                                                    e.cloth.data.name +
                                                    "Cloth",
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                [
                                                  (0, s._)(
                                                    "span",
                                                    {
                                                      class: "unclosebox",
                                                      onClick: (i) =>
                                                        a.clickclothitem(e),
                                                    },
                                                    null,
                                                    8,
                                                    la
                                                  ),
                                                ],
                                                8,
                                                na
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        24 - l.clotharr.length,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth otherObj unclosebox w-100 h-60 d-flex",
                                              key: e,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id: "objNone" + e,
                                                  type: "radio",
                                                  name: "objradio",
                                                  value: "obj",
                                                  class: "unclosebox",
                                                  disabled: "",
                                                },
                                                null,
                                                8,
                                                aa
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for: "objNone" + e,
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                da,
                                                8,
                                                ca
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                  ]))
                                : (0, s.kq)("", !0),
                              "coat" == l.clothgroupradiotype
                                ? ((0, s.wg)(),
                                  (0, s.iD)("div", ha, [
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        l.coatarr,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth unclosebox w-100 h-60 d-flex",
                                              key: e.cloth.data.name,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id:
                                                    l.liontype +
                                                    e.cloth.data.name +
                                                    "Coat",
                                                  type: "radio",
                                                  name: "coatradio",
                                                  value:
                                                    l.liontype +
                                                    e.cloth.data.name,
                                                  class: (0, u.C_)(
                                                    l.liontype +
                                                      e.cloth.data.name +
                                                      "Coat unclosebox"
                                                  ),
                                                },
                                                null,
                                                10,
                                                xa
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for:
                                                    l.liontype +
                                                    e.cloth.data.name +
                                                    "Coat",
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                [
                                                  (0, s._)(
                                                    "span",
                                                    {
                                                      class: "unclosebox",
                                                      onClick: (i) =>
                                                        a.clickcoatitem(e),
                                                    },
                                                    null,
                                                    8,
                                                    pa
                                                  ),
                                                ],
                                                8,
                                                ba
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        24 - l.coatarr.length,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth otherObj unclosebox w-100 h-60 d-flex",
                                              key: e,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id: "objNone" + e,
                                                  type: "radio",
                                                  name: "objradio",
                                                  value: "obj",
                                                  class: "unclosebox",
                                                  disabled: "",
                                                },
                                                null,
                                                8,
                                                fa
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for: "objNone" + e,
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                wa,
                                                8,
                                                ua
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                  ]))
                                : (0, s.kq)("", !0),
                              "pants" == l.clothgroupradiotype
                                ? ((0, s.wg)(),
                                  (0, s.iD)("div", va, [
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        l.pantsarr,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth unclosebox w-100 h-60 d-flex",
                                              key: e.cloth.data.name,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id:
                                                    l.liontype +
                                                    e.cloth.data.name +
                                                    "Pants",
                                                  type: "radio",
                                                  name: "pantsradio",
                                                  value:
                                                    l.liontype +
                                                    e.cloth.data.name,
                                                  class: (0, u.C_)(
                                                    l.liontype +
                                                      e.cloth.data.name +
                                                      "Pants unclosebox"
                                                  ),
                                                },
                                                null,
                                                10,
                                                ma
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for:
                                                    l.liontype +
                                                    e.cloth.data.name +
                                                    "Pants",
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                [
                                                  (0, s._)(
                                                    "span",
                                                    {
                                                      class: "unclosebox",
                                                      onClick: (i) =>
                                                        a.clickpantsitem(e),
                                                    },
                                                    null,
                                                    8,
                                                    ka
                                                  ),
                                                ],
                                                8,
                                                ga
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        24 - l.pantsarr.length,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth otherObj unclosebox w-100 h-60 d-flex",
                                              key: e,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id: "objNone" + e,
                                                  type: "radio",
                                                  name: "objradio",
                                                  value: "obj",
                                                  class: "unclosebox",
                                                  disabled: "",
                                                },
                                                null,
                                                8,
                                                ya
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for: "objNone" + e,
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                $a,
                                                8,
                                                Ca
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                  ]))
                                : (0, s.kq)("", !0),
                              "jumpsuit" == l.clothgroupradiotype
                                ? ((0, s.wg)(),
                                  (0, s.iD)("div", Wa, [
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        l.jumpsuitarr,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth unclosebox w-100 h-60 d-flex",
                                              key: e.cloth.data.name,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id:
                                                    l.liontype +
                                                    e.cloth.data.name +
                                                    "Jumpsuit",
                                                  type: "radio",
                                                  name: "jumpsuitradio",
                                                  value:
                                                    l.liontype +
                                                    e.cloth.data.name,
                                                  class: (0, u.C_)(
                                                    l.liontype +
                                                      e.cloth.data.name +
                                                      "Jumpsuit unclosebox"
                                                  ),
                                                },
                                                null,
                                                10,
                                                Ba
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for:
                                                    l.liontype +
                                                    e.cloth.data.name +
                                                    "Jumpsuit",
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                [
                                                  (0, s._)(
                                                    "span",
                                                    {
                                                      class: "unclosebox",
                                                      onClick: (i) =>
                                                        a.clickjumpsuititem(e),
                                                    },
                                                    null,
                                                    8,
                                                    Ha
                                                  ),
                                                ],
                                                8,
                                                qa
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        24 - l.jumpsuitarr.length,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth otherObj unclosebox w-100 h-60 d-flex",
                                              key: e,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id: "objNone" + e,
                                                  type: "radio",
                                                  name: "objradio",
                                                  value: "obj",
                                                  class: "unclosebox",
                                                  disabled: "",
                                                },
                                                null,
                                                8,
                                                Fa
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for: "objNone" + e,
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                Ia,
                                                8,
                                                Da
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                  ]))
                                : (0, s.kq)("", !0),
                              "shoes" == l.clothgroupradiotype
                                ? ((0, s.wg)(),
                                  (0, s.iD)("div", Ma, [
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        l.shoesarr,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth unclosebox w-100 h-60 d-flex",
                                              key: e.cloth.data.name,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id:
                                                    l.liontype +
                                                    e.cloth.data.name +
                                                    "Shoes",
                                                  type: "radio",
                                                  name: "shoesradio",
                                                  value:
                                                    l.liontype +
                                                    e.cloth.data.name,
                                                  class: (0, u.C_)(
                                                    l.liontype +
                                                      e.cloth.data.name +
                                                      "Shoes unclosebox"
                                                  ),
                                                },
                                                null,
                                                10,
                                                La
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for:
                                                    l.liontype +
                                                    e.cloth.data.name +
                                                    "Shoes",
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                [
                                                  (0, s._)(
                                                    "span",
                                                    {
                                                      class: "unclosebox",
                                                      onClick: (i) =>
                                                        a.clickshoesitem(e),
                                                    },
                                                    null,
                                                    8,
                                                    za
                                                  ),
                                                ],
                                                8,
                                                Sa
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        24 - l.shoesarr.length,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth otherObj unclosebox w-100 h-60 d-flex",
                                              key: e,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id: "objNone" + e,
                                                  type: "radio",
                                                  name: "objradio",
                                                  value: "obj",
                                                  class: "unclosebox",
                                                  disabled: "",
                                                },
                                                null,
                                                8,
                                                Oa
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for: "objNone" + e,
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                Na,
                                                8,
                                                Ea
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                  ]))
                                : (0, s.kq)("", !0),
                              "deco" == l.clothgroupradiotype
                                ? ((0, s.wg)(),
                                  (0, s.iD)("div", Pa, [
                                    ((0, s.wg)(!0),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(
                                        l.decoarr,
                                        (e) => (
                                          (0, s.wg)(),
                                          (0, s.iD)(
                                            "div",
                                            {
                                              class:
                                                "pixelWidth unclosebox w-100 h-60 d-flex",
                                              key: e.item.data.name,
                                            },
                                            [
                                              (0, s._)(
                                                "input",
                                                {
                                                  id: e.item.data.name + "Deco",
                                                  type: "radio",
                                                  name: "decoradio",
                                                  value: e.item.data.name,
                                                  class: (0, u.C_)(
                                                    e.item.data.name +
                                                      "Deco unclosebox"
                                                  ),
                                                },
                                                null,
                                                10,
                                                Ya
                                              ),
                                              (0, s._)(
                                                "label",
                                                {
                                                  for:
                                                    e.item.data.name + "Deco",
                                                  class:
                                                    "h-100 flexbox unclosebox",
                                                },
                                                [
                                                  (0, s._)(
                                                    "span",
                                                    {
                                                      class: "unclosebox",
                                                      onClick: (i) =>
                                                        a.clickdecoitem(e),
                                                    },
                                                    null,
                                                    8,
                                                    Ka
                                                  ),
                                                ],
                                                8,
                                                Va
                                              ),
                                            ]
                                          )
                                        )
                                      ),
                                      128
                                    )),
                                    ((0, s.wg)(),
                                    (0, s.iD)(
                                      s.HY,
                                      null,
                                      (0, s.Ko)(24, (e) =>
                                        (0, s._)(
                                          "div",
                                          {
                                            class:
                                              "pixelWidth otherObj unclosebox w-100 h-60 d-flex",
                                            key: e,
                                          },
                                          [
                                            (0, s._)(
                                              "input",
                                              {
                                                id: "objNone" + e,
                                                type: "radio",
                                                name: "objradio",
                                                value: "obj",
                                                class: "unclosebox",
                                                disabled: "",
                                              },
                                              null,
                                              8,
                                              Ja
                                            ),
                                            (0, s._)(
                                              "label",
                                              {
                                                for: "objNone" + e,
                                                class:
                                                  "h-100 flexbox unclosebox",
                                              },
                                              Ra,
                                              8,
                                              Za
                                            ),
                                          ]
                                        )
                                      ),
                                      64
                                    )),
                                  ]))
                                : (0, s.kq)("", !0),
                            ],
                            512
                          ),
                          [[o.F8, l.clothbool]]
                        ),
                        (0, s.wy)(
                          (0, s._)(
                            "div",
                            Ga,
                            [
                              (0, s._)("div", Xa, [
                                ((0, s.wg)(!0),
                                (0, s.iD)(
                                  s.HY,
                                  null,
                                  (0, s.Ko)(
                                    l.missionarr,
                                    (e, i) => (
                                      (0, s.wg)(),
                                      (0, s.iD)(
                                        "div",
                                        {
                                          class:
                                            "heightSet w-100 d-flex unclosebox",
                                          key: e.title,
                                        },
                                        [
                                          (0, s._)(
                                            "input",
                                            {
                                              id: "mission" + (i + 1),
                                              type: "radio",
                                              name: "missionradio",
                                              value: "mission" + (i + 1),
                                              class: "unclosebox",
                                            },
                                            null,
                                            8,
                                            Qa
                                          ),
                                          (0, s._)(
                                            "label",
                                            {
                                              for: "mission" + (i + 1),
                                              class: "unclosebox w-100",
                                            },
                                            [
                                              (0, s._)(
                                                "span",
                                                {
                                                  class: "unclosebox",
                                                  onClick: (i) =>
                                                    a.clickmission(e),
                                                },
                                                (0, u.zw)(e.title),
                                                9,
                                                ic
                                              ),
                                            ],
                                            8,
                                            ec
                                          ),
                                        ]
                                      )
                                    )
                                  ),
                                  128
                                )),
                              ]),
                            ],
                            512
                          ),
                          [[o.F8, l.missionbool]]
                        ),
                        tc,
                      ],
                      512
                    ),
                    [[o.F8, l.boxbool]]
                  ),
                ]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  oc,
                  [
                    sc,
                    (0, s._)(
                      "div",
                      {
                        class: (0, u.C_)([
                          "box w-100 h-100 frame flex-c",
                          l.frame + "frame",
                        ]),
                      },
                      [
                        nc,
                        (0, s._)("div", lc, [
                          (0, s._)(
                            "div",
                            {
                              class: "w-100",
                              style: (0, u.j5)({
                                height: l.top_outbox_h + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", ac, [
                            (0, s._)(
                              "div",
                              {
                                class: "h-100",
                                style: (0, u.j5)({
                                  width: l.top_outbox_w + "px",
                                }),
                              },
                              null,
                              4
                            ),
                            (0, s._)("div", cc, [
                              (0, s._)("div", rc, [
                                (0, s._)("div", {
                                  class: "close_btn pointer",
                                  onClick:
                                    i[4] || (i[4] = (e) => a.top_closebtn()),
                                }),
                              ]),
                              (0, s._)("div", dc, [
                                (0, s._)("div", hc, [
                                  (0, s._)(
                                    "div",
                                    {
                                      class: (0, u.C_)([
                                        "flexbox w-100 h-100 pic",
                                        l.liontype + l.pic + "pic",
                                      ]),
                                    },
                                    null,
                                    2
                                  ),
                                  (0, s._)("div", xc, [
                                    (0, s._)(
                                      "p",
                                      {
                                        class: "fontSize",
                                        style: { margin: "0", color: "white" },
                                        innerHTML: l.top_content,
                                      },
                                      null,
                                      8,
                                      bc
                                    ),
                                  ]),
                                ]),
                              ]),
                              (0, s._)("div", pc, [
                                fc,
                                (0, s._)("div", uc, [
                                  (0, s._)(
                                    "button",
                                    {
                                      onClick:
                                        i[5] || (i[5] = (e) => a.top_leftbtn()),
                                    },
                                    (0, u.zw)(l.top_contentc_btn),
                                    1
                                  ),
                                ]),
                                (0, s._)("div", _c, [
                                  (0, s._)(
                                    "button",
                                    {
                                      onClick:
                                        i[6] ||
                                        (i[6] = (e) => a.top_itemscene()),
                                    },
                                    (0, u.zw)(l.top_contentg_btn),
                                    1
                                  ),
                                ]),
                                wc,
                              ]),
                            ]),
                            (0, s._)(
                              "div",
                              {
                                class: "h-100",
                                style: (0, u.j5)({
                                  width: l.top_outbox_w + "px",
                                }),
                              },
                              null,
                              4
                            ),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "w-100",
                              style: (0, u.j5)({
                                height: l.top_outbox_h + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        vc,
                      ],
                      2
                    ),
                    mc,
                  ],
                  512
                ),
                [[o.F8, l.topscenebool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  gc,
                  [
                    kc,
                    (0, s._)("div", yc, [
                      Cc,
                      (0, s._)("div", jc, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.top_outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", $c, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.top_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", Wc, [
                            (0, s._)("div", Bc, [
                              (0, s._)("div", {
                                class: "close_btn pointer",
                                onClick:
                                  i[7] || (i[7] = (e) => a.top_closebtn()),
                              }),
                            ]),
                            (0, s._)("div", qc, [
                              (0, s._)("div", Hc, [
                                (0, s._)("div", Fc, [
                                  (0, s._)(
                                    "img",
                                    {
                                      src: l.pic,
                                      style: { "background-color": "white" },
                                    },
                                    null,
                                    8,
                                    Dc
                                  ),
                                ]),
                                (0, s._)("div", Tc, [
                                  (0, s._)(
                                    "p",
                                    {
                                      class: "fontSize",
                                      style: { margin: "0", color: "white" },
                                      innerHTML: l.top_content,
                                    },
                                    null,
                                    8,
                                    Ic
                                  ),
                                ]),
                              ]),
                            ]),
                            (0, s._)("div", Mc, [
                              Lc,
                              (0, s._)("div", Sc, [
                                (0, s._)(
                                  "button",
                                  {
                                    onClick:
                                      i[8] || (i[8] = (e) => a.top_closebtn()),
                                  },
                                  " 確認 "
                                ),
                              ]),
                              zc,
                            ]),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.top_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.top_outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                      ]),
                      Oc,
                    ]),
                    Ec,
                  ],
                  512
                ),
                [[o.F8, l.qrcodebool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  Uc,
                  [
                    Nc,
                    (0, s._)("div", Pc, [
                      Yc,
                      (0, s._)("div", Vc, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.top_outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", Kc, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.top_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", Jc, [
                            (0, s._)("div", Zc, [
                              (0, s._)("div", {
                                class: "close_btn pointer",
                                onClick:
                                  i[9] || (i[9] = (e) => a.top_closebtn()),
                              }),
                            ]),
                            (0, s._)("div", Ac, [
                              (0, s._)("div", Rc, [
                                (0, s._)("div", Gc, [
                                  (0, s._)(
                                    "p",
                                    {
                                      class: "fontSize",
                                      style: { margin: "0", color: "white" },
                                      innerHTML: l.top_content,
                                    },
                                    null,
                                    8,
                                    Xc
                                  ),
                                ]),
                                (0, s._)(
                                  "div",
                                  {
                                    class: (0, u.C_)([
                                      "meatWidth flexbox w-100 h-100 pic position-r",
                                      l.pic + "pic",
                                    ]),
                                    style: { margin: "auto" },
                                  },
                                  [
                                    (0, s._)(
                                      "div",
                                      Qc,
                                      (0, u.zw)(l.foodnum),
                                      1
                                    ),
                                  ],
                                  2
                                ),
                                er,
                              ]),
                            ]),
                            (0, s._)("div", ir, [
                              tr,
                              (0, s._)("div", or, [
                                (0, s._)(
                                  "button",
                                  {
                                    onClick:
                                      i[10] ||
                                      (i[10] = (e) => a.top_closebtn()),
                                  },
                                  "贈送"
                                ),
                              ]),
                              sr,
                            ]),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.top_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.top_outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                      ]),
                      nr,
                    ]),
                    lr,
                  ],
                  512
                ),
                [[o.F8, l.specialbool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  ar,
                  [
                    cr,
                    (0, s._)("div", rr, [
                      dr,
                      (0, s._)("div", hr, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.top_outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", xr, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.top_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", br, [
                            (0, s._)("div", pr, [
                              (0, s._)("div", {
                                class: "close_btn pointer",
                                onClick:
                                  i[11] || (i[11] = (e) => a.top_closebtn()),
                              }),
                            ]),
                            (0, s._)("div", fr, [
                              (0, s._)("div", ur, [
                                (0, s._)("div", _r, [
                                  (0, s._)(
                                    "p",
                                    {
                                      style: {
                                        margin: "0",
                                        color: "white",
                                        "font-size": "3vmin",
                                      },
                                      innerHTML: l.top_content,
                                    },
                                    null,
                                    8,
                                    wr
                                  ),
                                ]),
                                (0, s._)(
                                  "div",
                                  {
                                    class: (0, u.C_)([
                                      "meatWidth flexbox w-100 h-100 pic position-r",
                                      l.pic + "pic",
                                    ]),
                                    style: { margin: "auto" },
                                  },
                                  [
                                    (0, s._)(
                                      "div",
                                      vr,
                                      (0, u.zw)(l.foodnum),
                                      1
                                    ),
                                  ],
                                  2
                                ),
                                mr,
                              ]),
                            ]),
                            (0, s._)("div", gr, [
                              kr,
                              (0, s._)("div", yr, [
                                (0, s._)(
                                  "button",
                                  {
                                    onClick:
                                      i[12] || (i[12] = (e) => a.top_feedbtn()),
                                  },
                                  "餵食"
                                ),
                              ]),
                              (0, s._)("div", Cr, [
                                (0, s._)(
                                  "button",
                                  {
                                    onClick:
                                      i[13] ||
                                      (i[13] = (e) => a.top_itemscene()),
                                  },
                                  "贈送"
                                ),
                              ]),
                              jr,
                            ]),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.top_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.top_outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                      ]),
                      $r,
                    ]),
                    Wr,
                  ],
                  512
                ),
                [[o.F8, l.foodbool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  Br,
                  [
                    qr,
                    (0, s._)("div", Hr, [
                      Fr,
                      (0, s._)("div", Dr, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.top_outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", Tr, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.top_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", Ir, [
                            (0, s._)("div", Mr, [
                              (0, s._)("div", {
                                class: "close_btn pointer",
                                onClick:
                                  i[14] || (i[14] = (e) => a.top_closebtn()),
                              }),
                            ]),
                            (0, s._)("div", Lr, [
                              (0, s._)("div", Sr, [
                                (0, s._)("div", zr, [
                                  (0, s._)(
                                    "p",
                                    {
                                      class: "fontSize",
                                      style: { margin: "0", color: "white" },
                                      innerHTML: l.top_content,
                                    },
                                    null,
                                    8,
                                    Or
                                  ),
                                ]),
                                l.isShowPic
                                  ? ((0, s.wg)(),
                                    (0, s.iD)(
                                      "div",
                                      {
                                        key: 0,
                                        class: (0, u.C_)([
                                          "flexbox w-100 h-100 pic",
                                          l.pic + "pic",
                                        ]),
                                      },
                                      null,
                                      2
                                    ))
                                  : (0, s.kq)("", !0),
                                Er,
                              ]),
                            ]),
                            (0, s._)("div", Ur, [
                              Nr,
                              (0, s._)("div", Pr, [
                                (0, s._)(
                                  "button",
                                  {
                                    onClick:
                                      i[15] ||
                                      (i[15] = (e) => a.top_closebtn()),
                                  },
                                  "確認"
                                ),
                              ]),
                              Yr,
                            ]),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.top_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.top_outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                      ]),
                      Vr,
                    ]),
                    Kr,
                  ],
                  512
                ),
                [[o.F8, l.badgebool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  Jr,
                  [
                    Zr,
                    (0, s._)("div", Ar, [
                      Rr,
                      (0, s._)("div", Gr, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.top_outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", Xr, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.top_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", Qr, [
                            (0, s._)("div", ed, [
                              (0, s._)("div", {
                                class: "close_btn pointer",
                                onClick:
                                  i[16] || (i[16] = (e) => a.top_closebtn()),
                              }),
                            ]),
                            (0, s._)("div", id, [
                              (0, s._)("div", td, [
                                (0, s._)("div", od, [
                                  (0, s._)(
                                    "div",
                                    {
                                      class:
                                        "pokedexFont flexbox w-100 h-100 flex-c",
                                      innerHTML: l.bookitemleft,
                                    },
                                    null,
                                    8,
                                    sd
                                  ),
                                  (0, s._)(
                                    "div",
                                    {
                                      class: (0, u.C_)([
                                        "flexbox w-100 h-100 pic",
                                        l.pic + "pic",
                                      ]),
                                      style: { flex: "2" },
                                    },
                                    null,
                                    2
                                  ),
                                  (0, s._)(
                                    "div",
                                    {
                                      class:
                                        "pokedexFont flexbox w-100 h-100 flex-c",
                                      innerHTML: l.bookitemright,
                                    },
                                    null,
                                    8,
                                    nd
                                  ),
                                ]),
                              ]),
                              (0, s._)(
                                "div",
                                {
                                  class: "flexbox h-100",
                                  style: { width: "90%" },
                                  id: "bookitembottom",
                                  innerHTML: l.bookitembottom,
                                  onClick:
                                    i[17] ||
                                    (i[17] = (...e) =>
                                      a.changebookitem &&
                                      a.changebookitem(...e)),
                                },
                                null,
                                8,
                                ld
                              ),
                            ]),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.top_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.top_outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                      ]),
                      ad,
                    ]),
                    cd,
                  ],
                  512
                ),
                [[o.F8, l.bookbool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  rd,
                  [
                    dd,
                    (0, s._)(
                      "div",
                      {
                        class: (0, u.C_)([
                          "box w-100 h-100 frame flex-c",
                          l.bigmission + "frame",
                        ]),
                      },
                      [
                        hd,
                        (0, s._)("div", xd, [
                          (0, s._)(
                            "div",
                            {
                              class: "w-100",
                              style: (0, u.j5)({
                                height: l.top_outbox_h + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", bd, [
                            (0, s._)(
                              "div",
                              {
                                class: "h-100",
                                style: (0, u.j5)({
                                  width: l.top_outbox_w + "px",
                                }),
                              },
                              null,
                              4
                            ),
                            (0, s._)("div", pd, [
                              (0, s._)("div", fd, [
                                (0, s._)("div", {
                                  class: "close_btn pointer",
                                  onClick:
                                    i[18] || (i[18] = (e) => a.top_closebtn()),
                                }),
                              ]),
                              (0, s._)("div", ud, [
                                (0, s._)("div", _d, [
                                  l.isShowPic
                                    ? ((0, s.wg)(),
                                      (0, s.iD)(
                                        "div",
                                        {
                                          key: 0,
                                          class: (0, u.C_)([
                                            "flexbox w-100 h-100 pic",
                                            l.pic + "pic",
                                          ]),
                                        },
                                        null,
                                        2
                                      ))
                                    : (0, s.kq)("", !0),
                                  (0, s._)("div", wd, [
                                    (0, s._)(
                                      "p",
                                      {
                                        class: "fontSize",
                                        style: { margin: "0", color: "white" },
                                        innerHTML: l.top_content,
                                      },
                                      null,
                                      8,
                                      vd
                                    ),
                                  ]),
                                ]),
                              ]),
                              (0, s._)("div", md, [
                                gd,
                                (0, s._)("div", kd, [
                                  (0, s._)(
                                    "button",
                                    {
                                      onClick:
                                        i[19] ||
                                        (i[19] = (e) => a.top_closebtn()),
                                    },
                                    "確認"
                                  ),
                                ]),
                                l.isShowPic
                                  ? ((0, s.wg)(),
                                    (0, s.iD)("div", yd, [
                                      (0, s._)(
                                        "button",
                                        {
                                          onClick:
                                            i[20] ||
                                            (i[20] = (e) => a.top_itemscene()),
                                        },
                                        "贈送"
                                      ),
                                    ]))
                                  : (0, s.kq)("", !0),
                                Cd,
                              ]),
                            ]),
                            (0, s._)(
                              "div",
                              {
                                class: "h-100",
                                style: (0, u.j5)({
                                  width: l.top_outbox_w + "px",
                                }),
                              },
                              null,
                              4
                            ),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "w-100",
                              style: (0, u.j5)({
                                height: l.top_outbox_h + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        jd,
                      ],
                      2
                    ),
                    $d,
                  ],
                  512
                ),
                [[o.F8, l.missionshow]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  Wd,
                  [
                    Bd,
                    (0, s._)("div", qd, [
                      Hd,
                      (0, s._)("div", Fd, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.top_outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", Dd, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.top_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", Td, [
                            (0, s._)("div", Id, [
                              (0, s._)("div", {
                                class: "close_btn pointer",
                                onClick:
                                  i[21] || (i[21] = (e) => a.top_closebtn()),
                              }),
                            ]),
                            (0, s._)("div", Md, [
                              (0, s._)("div", Ld, [
                                (0, s._)(
                                  "div",
                                  {
                                    class: (0, u.C_)([
                                      "flexbox w-100 h-100 pic",
                                      l.pic + "pic",
                                    ]),
                                  },
                                  null,
                                  2
                                ),
                                (0, s._)("div", Sd, [
                                  (0, s._)(
                                    "p",
                                    {
                                      class: "fontSize",
                                      style: { margin: "0", color: "white" },
                                      innerHTML: l.top_content,
                                    },
                                    null,
                                    8,
                                    zd
                                  ),
                                ]),
                              ]),
                            ]),
                            (0, s._)("div", Od, [
                              Ed,
                              (0, s._)("div", Ud, [
                                (0, s._)(
                                  "button",
                                  {
                                    onClick:
                                      i[22] ||
                                      (i[22] = (e) => a.togamemission()),
                                  },
                                  "前往網站"
                                ),
                              ]),
                              Nd,
                            ]),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.top_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.top_outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                      ]),
                      Pd,
                    ]),
                    Yd,
                  ],
                  512
                ),
                [[o.F8, l.gamemissionshow]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  Vd,
                  [
                    Kd,
                    (0, s._)(
                      "div",
                      {
                        class: (0, u.C_)([
                          "box w-100 h-100 frame flex-c",
                          l.bigmission + "frame",
                        ]),
                      },
                      [
                        Jd,
                        (0, s._)("div", Zd, [
                          (0, s._)(
                            "div",
                            {
                              class: "w-100",
                              style: (0, u.j5)({
                                height: l.top_outbox_h + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", Ad, [
                            (0, s._)(
                              "div",
                              {
                                class: "h-100",
                                style: (0, u.j5)({
                                  width: l.top_outbox_w + "px",
                                }),
                              },
                              null,
                              4
                            ),
                            (0, s._)("div", Rd, [
                              (0, s._)("div", Gd, [
                                (0, s._)("div", {
                                  class: "close_btn pointer",
                                  onClick:
                                    i[23] || (i[23] = (e) => a.top_closebtn()),
                                }),
                              ]),
                              (0, s._)("div", Xd, [
                                (0, s._)("div", Qd, [
                                  (0, s._)(
                                    "p",
                                    {
                                      class: "fontSize",
                                      style: { margin: "0", color: "white" },
                                      innerHTML: l.top_content,
                                    },
                                    null,
                                    8,
                                    eh
                                  ),
                                ]),
                              ]),
                              (0, s._)("div", ih, [
                                th,
                                (0, s._)("div", oh, [
                                  (0, s._)(
                                    "button",
                                    {
                                      onClick:
                                        i[24] ||
                                        (i[24] = (e) => a.toshowmissionbtn()),
                                    },
                                    "前往任務"
                                  ),
                                ]),
                                sh,
                              ]),
                            ]),
                            (0, s._)(
                              "div",
                              {
                                class: "h-100",
                                style: (0, u.j5)({
                                  width: l.top_outbox_w + "px",
                                }),
                              },
                              null,
                              4
                            ),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "w-100",
                              style: (0, u.j5)({
                                height: l.top_outbox_h + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        nh,
                      ],
                      2
                    ),
                    lh,
                  ],
                  512
                ),
                [[o.F8, l.showmissiondatabool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  ah,
                  [
                    ch,
                    (0, s._)(
                      "div",
                      {
                        class: (0, u.C_)([
                          "bigWidth box w-100 h-100 frame flex-c",
                          l.bigmission + "frame",
                        ]),
                      },
                      [
                        rh,
                        (0, s._)("div", dh, [
                          (0, s._)(
                            "div",
                            {
                              class: "w-100",
                              style: (0, u.j5)({
                                height: l.big_outbox_h + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", hh, [
                            (0, s._)(
                              "div",
                              {
                                class: "h-100",
                                style: (0, u.j5)({
                                  width: l.big_outbox_w + "px",
                                }),
                              },
                              null,
                              4
                            ),
                            (0, s._)("div", xh, [
                              (0, s._)("div", bh, [
                                (0, s._)("div", {
                                  class: "close_btn pointer",
                                  onClick:
                                    i[25] || (i[25] = (e) => a.top_closebtn()),
                                }),
                              ]),
                              (0, s._)(
                                "div",
                                {
                                  class: "flexbox block w-100 h-100",
                                  style: { flex: "5" },
                                  innerHTML: l.bigmissioncontent,
                                },
                                null,
                                8,
                                ph
                              ),
                              fh,
                            ]),
                            (0, s._)(
                              "div",
                              {
                                class: "h-100",
                                style: (0, u.j5)({
                                  width: l.big_outbox_w + "px",
                                }),
                              },
                              null,
                              4
                            ),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "w-100",
                              style: (0, u.j5)({
                                height: l.big_outbox_h + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        uh,
                      ],
                      2
                    ),
                    _h,
                  ],
                  512
                ),
                [[o.F8, l.bigmissionshow]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  wh,
                  [
                    vh,
                    (0, s._)("div", mh, [
                      gh,
                      (0, s._)("div", kh, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.top_outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", yh, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.top_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", Ch, [
                            (0, s._)("div", jh, [
                              (0, s._)("div", {
                                class: "close_btn pointer",
                                onClick:
                                  i[26] || (i[26] = (e) => a.top_closebtn()),
                              }),
                            ]),
                            (0, s._)("div", $h, [
                              (0, s._)("div", Wh, [
                                (0, s._)(
                                  "div",
                                  {
                                    class: (0, u.C_)([
                                      "flexbox w-100 h-100 pic",
                                      l.pic + "pic",
                                    ]),
                                  },
                                  null,
                                  2
                                ),
                                (0, s._)("div", Bh, [
                                  (0, s._)(
                                    "p",
                                    {
                                      class: "fontSize",
                                      style: { margin: "0", color: "white" },
                                      innerHTML: l.top_content,
                                    },
                                    null,
                                    8,
                                    qh
                                  ),
                                ]),
                              ]),
                            ]),
                            (0, s._)("div", Hh, [
                              Fh,
                              (0, s._)("div", Dh, [
                                (0, s._)(
                                  "button",
                                  {
                                    onClick:
                                      i[27] ||
                                      (i[27] = (e) => a.togamemission()),
                                  },
                                  "前往網站"
                                ),
                              ]),
                              Th,
                            ]),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.top_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({ height: l.top_outbox_h + "px" }),
                          },
                          null,
                          4
                        ),
                      ]),
                      Ih,
                    ]),
                    Mh,
                  ],
                  512
                ),
                [[o.F8, l.showmissionbool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  Lh,
                  [
                    Sh,
                    (0, s._)("div", zh, [
                      Oh,
                      (0, s._)("div", Eh, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.item_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", Uh, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.item_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", Nh, [
                            Ph,
                            (0, s._)(
                              "div",
                              {
                                class: (0, u.C_)([
                                  "flexbox w-100 h-100 pic",
                                  l.liontype + l.pic + "pic",
                                ]),
                                style: { flex: "2" },
                              },
                              null,
                              2
                            ),
                            (0, s._)("div", Yh, [
                              (0, s._)(
                                "p",
                                Vh,
                                (0, u.zw)(l.top_item_content),
                                1
                              ),
                            ]),
                            (0, s._)("div", Kh, [
                              (0, s._)(
                                "button",
                                {
                                  class: "send_confirmBtn",
                                  onClick:
                                    i[28] || (i[28] = (e) => a.top_itemcheck()),
                                },
                                " 確認 "
                              ),
                            ]),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.item_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.item_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                      ]),
                      Jh,
                    ]),
                    Zh,
                  ],
                  512
                ),
                [[o.F8, l.itemshowbool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  Ah,
                  [
                    Rh,
                    (0, s._)("div", Gh, [
                      Xh,
                      (0, s._)("div", Qh, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.item_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", ex, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.item_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", ix, [
                            (0, s._)("div", tx, (0, u.zw)(l.top_content), 1),
                            (0, s._)(
                              "div",
                              {
                                class: (0, u.C_)([
                                  "flexbox w-100 h-100 pic position-r",
                                  l.pic + "pic",
                                ]),
                                style: {
                                  flex: "2",
                                  width: "200px",
                                  margin: "auto",
                                },
                              },
                              [(0, s._)("div", ox, (0, u.zw)(l.foodnum), 1)],
                              2
                            ),
                            (0, s._)("div", sx, [
                              nx,
                              (0, s._)("div", lx, [
                                (0, s._)("input", {
                                  type: "button",
                                  value: "",
                                  class: "minus pointer",
                                  id: "minusnum",
                                  onClick:
                                    i[29] ||
                                    (i[29] = (e) => a.top_send_minus()),
                                }),
                                (0, s._)(
                                  "input",
                                  {
                                    type: "number",
                                    id: "sendnum",
                                    step: "1",
                                    min: "1",
                                    max: l.foodnum,
                                    name: "quantity",
                                    value: "1",
                                    pattern: "",
                                    inputmode: "",
                                  },
                                  null,
                                  8,
                                  ax
                                ),
                                (0, s._)("input", {
                                  type: "button",
                                  value: "",
                                  class: "plus pointer",
                                  id: "plusnum",
                                  onClick:
                                    i[30] || (i[30] = (e) => a.top_send_plus()),
                                }),
                              ]),
                              cx,
                            ]),
                            (0, s._)("div", rx, [
                              (0, s._)("div", dx, [
                                (0, s._)(
                                  "button",
                                  {
                                    class: "send_cancelBtn",
                                    style: { width: "70%" },
                                    onClick:
                                      i[31] ||
                                      (i[31] = (e) => a.top_itemcheck()),
                                  },
                                  " 取消 "
                                ),
                              ]),
                              (0, s._)("div", hx, [
                                (0, s._)(
                                  "button",
                                  {
                                    class: "send_confirmBtn",
                                    style: { width: "70%" },
                                    onClick:
                                      i[32] ||
                                      (i[32] = (e) => a.top_feedcheckbtn()),
                                  },
                                  " 確認 "
                                ),
                              ]),
                            ]),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.item_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.item_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                      ]),
                      xx,
                    ]),
                    bx,
                  ],
                  512
                ),
                [[o.F8, l.fooditemshowbool]]
              ),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  px,
                  [
                    fx,
                    (0, s._)("div", ux, [
                      _x,
                      (0, s._)("div", wx, [
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.item_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                        (0, s._)("div", vx, [
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.item_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                          (0, s._)("div", mx, [
                            gx,
                            (0, s._)(
                              "div",
                              {
                                class: (0, u.C_)([
                                  "flexbox w-100 h-100 pic position-r",
                                  l.pic + "pic",
                                ]),
                                style: {
                                  flex: "2",
                                  width: "200px",
                                  margin: "auto",
                                },
                              },
                              [
                                (0, s._)(
                                  "div",
                                  kx,
                                  (0, u.zw)(l.feedfoodnum),
                                  1
                                ),
                              ],
                              2
                            ),
                            (0, s._)("div", yx, [
                              (0, s._)(
                                "p",
                                {
                                  class: "fontSize",
                                  style: { margin: "0", color: "white" },
                                  innerHTML: l.top_content,
                                },
                                null,
                                8,
                                Cx
                              ),
                            ]),
                            (0, s._)("div", jx, [
                              (0, s._)(
                                "button",
                                {
                                  class: "send_confirmBtn",
                                  onClick:
                                    i[33] || (i[33] = (e) => a.top_itemcheck()),
                                },
                                " 確認 "
                              ),
                            ]),
                          ]),
                          (0, s._)(
                            "div",
                            {
                              class: "h-100",
                              style: (0, u.j5)({
                                width: l.item_outbox_w + "px",
                              }),
                            },
                            null,
                            4
                          ),
                        ]),
                        (0, s._)(
                          "div",
                          {
                            class: "w-100",
                            style: (0, u.j5)({
                              height: l.item_outbox_h + "px",
                            }),
                          },
                          null,
                          4
                        ),
                      ]),
                      $x,
                    ]),
                    Wx,
                  ],
                  512
                ),
                [[o.F8, l.feeditemshowbool]]
              ),
              (0, s.wy)(
                (0, s.Wm)(
                  c,
                  {
                    ref: "maskpage",
                    onMask_close: i[34] || (i[34] = (e) => a.clickmaskbtn(e)),
                  },
                  null,
                  512
                ),
                [[o.F8, l.maskbool]]
              ),
            ])
          );
        }
        const qx = (e) => (
            (0, s.dD)("data-v-7625683a"), (e = e()), (0, s.Cn)(), e
          ),
          Hx = { class: "maskpage" },
          Fx = { id: "mask_choose", class: "d-flex flex-c" },
          Dx = {
            class: "flexbox w-100 h-100 position-r",
            style: { flex: "1.5" },
          },
          Tx = { class: "flexbox flex-r w-100 h-100", style: { flex: "1.75" } },
          Ix = qx(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Mx = { class: "flexbox w-100 h-100 pointer", style: { flex: "2" } },
          Lx = ["id", "value"],
          Sx = ["for"],
          zx = qx(() =>
            (0, s._)(
              "span",
              { class: "position-r" },
              [(0, s._)("p", { class: "growStage" }, "幼年獅")],
              -1
            )
          ),
          Ox = [zx],
          Ex = { class: "flexbox w-100 h-100 pointer", style: { flex: "2" } },
          Ux = ["id", "value"],
          Nx = ["for"],
          Px = qx(() =>
            (0, s._)(
              "span",
              { class: "position-r" },
              [(0, s._)("p", { class: "growStage" }, "成年獅")],
              -1
            )
          ),
          Yx = [Px],
          Vx = qx(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Kx = { class: "flexbox w-100 h-100" },
          Jx = qx(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Zx = { class: "flexbox w-100 h-100" },
          Ax = qx(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          Rx = { id: "maskgroup", class: "d-flex flex-r" },
          Gx = qx(() =>
            (0, s._)(
              "div",
              { class: "flexbox w-100 h-100", style: { flex: "0.5" } },
              null,
              -1
            )
          ),
          Xx = { class: "flexbox flex-c w-100 h-100" },
          Qx = qx(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          eb = qx(() =>
            (0, s._)(
              "div",
              { class: "flexbox w-100 h-100 lefttitle" },
              null,
              -1
            )
          ),
          ib = { class: "flexbox w-100 h-100 colorplate flexSetting" },
          tb = ["onClick"],
          ob = ["id", "value", "checked"],
          sb = ["for"],
          nb = qx(() => (0, s._)("span", { class: "pointer" }, null, -1)),
          lb = [nb],
          ab = { class: "flexbox w-100 h-100" },
          cb = qx(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          rb = { class: "flexbox flex-c w-100 h-100", style: { flex: "2" } },
          db = qx(() =>
            (0, s._)(
              "div",
              { class: "titleFont flexbox w-100 h-100" },
              "點擊想要上色的區域",
              -1
            )
          ),
          hb = { class: "flexbox w-100 h-100", style: { flex: "0.5" } },
          xb = { class: "flexbox w-100 h-100" },
          bb = { class: "flexbox w-100 h-100" },
          pb = qx(() =>
            (0, s._)(
              "div",
              { class: "flexbox w-100 h-100", style: { flex: "0.5" } },
              null,
              -1
            )
          ),
          fb = { class: "flexbox flex-c w-100 h-100" },
          ub = qx(() =>
            (0, s._)(
              "div",
              { class: "flexbox w-100 h-100", style: { flex: "0.5" } },
              null,
              -1
            )
          ),
          _b = { class: "stampgroup flexbox w-100 h-100 flex-c" },
          wb = qx(() =>
            (0, s._)(
              "div",
              { class: "titleFont flexbox w-100 h-100" },
              "印章",
              -1
            )
          ),
          vb = ["id", "value"],
          mb = ["for"],
          gb = ["onClick"],
          kb = qx(() =>
            (0, s._)("div", { class: "flexbox w-100 h-100" }, null, -1)
          ),
          yb = qx(() =>
            (0, s._)(
              "div",
              { class: "flexbox w-100 h-100", style: { flex: "0.5" } },
              null,
              -1
            )
          );
        function Cb(e, i, t, n, l, a) {
          return (
            (0, s.wg)(),
            (0, s.iD)("div", Hx, [
              (0, s._)("div", Fx, [
                (0, s._)("div", Dx, [
                  (0, s._)("div", {
                    class: "close_btn pointer",
                    onClick: i[0] || (i[0] = (e) => n.mask_close(!1)),
                  }),
                ]),
                (0, s._)("div", Tx, [
                  Ix,
                  (0, s._)("div", Mx, [
                    (0, s._)(
                      "input",
                      {
                        id: l.male + "childradio",
                        type: "radio",
                        name: "maskradio",
                        class: (0, u.C_)(l.male + "child"),
                        value: l.male + "child",
                        checked: "",
                      },
                      null,
                      10,
                      Lx
                    ),
                    (0, s._)(
                      "label",
                      { for: l.male + "childradio", class: "h-100 flexbox" },
                      Ox,
                      8,
                      Sx
                    ),
                  ]),
                  (0, s._)("div", Ex, [
                    (0, s._)(
                      "input",
                      {
                        id: l.male + "adultradio",
                        type: "radio",
                        name: "maskradio",
                        class: (0, u.C_)(l.male + "adult"),
                        value: l.male + "adult",
                      },
                      null,
                      10,
                      Ux
                    ),
                    (0, s._)(
                      "label",
                      { for: l.male + "adultradio", class: "h-100 flexbox" },
                      Yx,
                      8,
                      Nx
                    ),
                  ]),
                  Vx,
                ]),
                (0, s._)("div", Kx, [
                  Jx,
                  (0, s._)("div", Zx, [
                    (0, s._)(
                      "button",
                      {
                        class: "colorBtn",
                        onClick: i[1] || (i[1] = (e) => a.startdraw()),
                      },
                      "上色"
                    ),
                  ]),
                  Ax,
                ]),
              ]),
              (0, s.wy)(
                (0, s._)(
                  "div",
                  Rx,
                  [
                    Gx,
                    (0, s._)("div", Xx, [
                      Qx,
                      eb,
                      (0, s._)("div", ib, [
                        ((0, s.wg)(!0),
                        (0, s.iD)(
                          s.HY,
                          null,
                          (0, s.Ko)(
                            l.drawarr,
                            (e, i) => (
                              (0, s.wg)(),
                              (0, s.iD)(
                                "div",
                                {
                                  class: "d-flex pointer",
                                  key: e.name,
                                  onClick: (e) => a.changeColor(i),
                                },
                                [
                                  (0, s._)(
                                    "input",
                                    {
                                      id: e.name + "radio",
                                      type: "radio",
                                      name: "drawradio",
                                      class: (0, u.C_)(e.name + "colorplate"),
                                      value: e.name,
                                      checked: 0 == i,
                                    },
                                    null,
                                    10,
                                    ob
                                  ),
                                  (0, s._)(
                                    "label",
                                    {
                                      for: e.name + "radio",
                                      class: "h-100 flexbox",
                                    },
                                    lb,
                                    8,
                                    sb
                                  ),
                                ],
                                8,
                                tb
                              )
                            )
                          ),
                          128
                        )),
                      ]),
                      (0, s._)("div", ab, [
                        (0, s._)("div", {
                          class: "flexbox w-100 maskbackbtn pointer",
                          onClick: i[2] || (i[2] = (e) => a.goTo(-1)),
                        }),
                        (0, s._)("div", {
                          class: "flexbox w-100 masknextbtn pointer",
                          onClick: i[3] || (i[3] = (e) => a.goTo(1)),
                        }),
                      ]),
                      cb,
                    ]),
                    (0, s._)("div", rb, [
                      db,
                      (0, s._)(
                        "canvas",
                        {
                          id: "mask_canvas",
                          onMousedown:
                            i[4] ||
                            (i[4] = (...e) =>
                              a.onCanvasMouseDown && a.onCanvasMouseDown(...e)),
                          onMouseup:
                            i[5] ||
                            (i[5] = (...e) =>
                              a.onCanvasMouseUp && a.onCanvasMouseUp(...e)),
                          onMousemove:
                            i[6] ||
                            (i[6] = (...e) =>
                              a.onCanvasMouseMove && a.onCanvasMouseMove(...e)),
                          onTouchstart:
                            i[7] ||
                            (i[7] = (...e) =>
                              a.onCanvasMouseDown && a.onCanvasMouseDown(...e)),
                          onTouchmove:
                            i[8] ||
                            (i[8] = (...e) =>
                              a.onCanvasMouseMove && a.onCanvasMouseMove(...e)),
                          onTouchend:
                            i[9] ||
                            (i[9] = (...e) =>
                              a.onCanvasMouseUp && a.onCanvasMouseUp(...e)),
                        },
                        null,
                        32
                      ),
                      (0, s._)("div", hb, [
                        (0, s._)("div", xb, [
                          (0, s._)(
                            "button",
                            {
                              class: "cancleOperateBtn pointer",
                              onClick: i[10] || (i[10] = (e) => a.canceldraw()),
                            },
                            " 取消操作 "
                          ),
                        ]),
                        (0, s._)("div", bb, [
                          (0, s._)(
                            "button",
                            {
                              class: "colorBtn pointer",
                              onClick: i[11] || (i[11] = (e) => a.savedraw()),
                            },
                            "確認儲存"
                          ),
                        ]),
                      ]),
                      pb,
                    ]),
                    (0, s._)("div", fb, [
                      ub,
                      (0, s._)("div", _b, [
                        wb,
                        ((0, s.wg)(!0),
                        (0, s.iD)(
                          s.HY,
                          null,
                          (0, s.Ko)(
                            l.stamparr,
                            (e, i) => (
                              (0, s.wg)(),
                              (0, s.iD)(
                                "div",
                                { class: "flexbox w-100 pointer", key: e },
                                [
                                  (0, s._)(
                                    "input",
                                    {
                                      id: e + "radio",
                                      type: "radio",
                                      name: "stampradio",
                                      class: (0, u.C_)(e),
                                      value: e,
                                    },
                                    null,
                                    10,
                                    vb
                                  ),
                                  (0, s._)(
                                    "label",
                                    {
                                      for: e + "radio",
                                      class: "h-100 flexbox",
                                    },
                                    [
                                      (0, s._)(
                                        "span",
                                        {
                                          class: "pointer",
                                          onClick: (e) => a.changeStamp(i),
                                        },
                                        null,
                                        8,
                                        gb
                                      ),
                                    ],
                                    8,
                                    mb
                                  ),
                                ]
                              )
                            )
                          ),
                          128
                        )),
                      ]),
                      kb,
                    ]),
                    yb,
                  ],
                  512
                ),
                [[o.F8, l.maskdrawbool]]
              ),
            ])
          );
        }
        var jb = {
          name: "mask_page",
          emits: ["mask_close"],
          setup(e, { emit: i }) {
            function t(e) {
              i("mask_close", e);
            }
            return { mask_close: t };
          },
          data() {
            return {
              male: "boy",
              maletype: "boychild",
              maskid: 0,
              maskdrawbool: !1,
              drawarr: [
                { name: "red", color: "#c30d23" },
                { name: "malelion", color: "#edd87b" },
                { name: "orange", color: "#ea5513" },
                { name: "femalelion", color: "#f0d296" },
                { name: "yellow", color: "#faef01" },
                { name: "brown", color: "#c9793c" },
                { name: "green", color: "#016934" },
                { name: "deepbrown", color: "#8b631e" },
                { name: "blue", color: "#046eb8" },
                { name: "black", color: "#231816" },
                { name: "purple", color: "#611987" },
                { name: "white", color: "#ffffff" },
              ],
              canvas: null,
              ctx: null,
              stampIndex: 1,
              isDrawing: !1,
              isStamp: !1,
              stamparr: ["heart", "star", "flower"],
              canvasheightarr: [500, 350, 250, 227],
              canvaswidtharr: [534, 376, 267, 243],
            };
          },
          mounted() {
            (this.canvas = document.getElementById("mask_canvas")),
              window.innerWidth >= 1440
                ? ((this.canvas.width = 534), (this.canvas.height = 500))
                : window.innerWidth < 1440 && window.innerWidth >= 1024
                ? ((this.canvas.width = 376), (this.canvas.height = 350))
                : window.innerWidth < 1024 && window.innerWidth >= 768
                ? ((this.canvas.width = 267), (this.canvas.height = 250))
                : ((this.canvas.width = 243), (this.canvas.height = 227)),
              (this.ctx = this.canvas.getContext("2d"));
            var e = this.ctx.getImageData(
              0,
              0,
              this.canvas.width,
              this.canvas.height
            );
            function i(e) {
              var i = document.getElementById("mask_canvas"),
                t = i.getContext("2d");
              t.clearRect(0, 0, i.width, i.height),
                e.state && t.putImageData(e.state, 0, 0);
            }
            window.history.pushState(e, null),
              window.addEventListener("popstate", i, !1),
              (this.ctx.strokeStyle = this.drawarr[0].color),
              (this.isDrawing = !1),
              (document.onselectstart = function () {
                return !1;
              });
          },
          methods: {
            goTo(e) {
              window.history.go(e);
            },
            getMousePos(e, i) {
              var t = this.canvas.getBoundingClientRect();
              return "undefined" != typeof i.targetTouches
                ? {
                    x: i.targetTouches[0].pageX - t.left,
                    y: i.targetTouches[0].pageY - t.top,
                  }
                : { x: i.clientX - t.left, y: i.clientY - t.top };
            },
            onCanvasMouseDown(e) {
              var i = this.getMousePos(this.canvas, e);
              if (this.isStamp) {
                var o = new Image();
                let e = this;
                return (
                  (o.src = t(3602)("./stamp_no_" + this.stampIndex + ".svg")),
                  void (o.onload = function () {
                    e.ctx.drawImage(o, i.x - 25, i.y - 25, 50, 50);
                  })
                );
              }
              (this.isDrawing = !0),
                this.ctx.beginPath(),
                this.ctx.moveTo(i.x, i.y),
                (this.ctx.lineWidth = 10),
                (this.ctx.lineCap = "round");
            },
            onCanvasMouseUp(e) {
              this.isDrawing = !1;
              var i = this.ctx.getImageData(
                0,
                0,
                this.canvas.width,
                this.canvas.height
              );
              window.history.pushState(i, null);
            },
            onCanvasMouseMove(e) {
              if (this.isDrawing) {
                var i = this.getMousePos(this.canvas, e);
                console.log(i), this.ctx.lineTo(i.x, i.y), this.ctx.stroke();
              }
            },
            changeColor(e) {
              (this.isStamp = !1),
                (this.ctx.strokeStyle = this.drawarr[e].color);
            },
            changeStamp(e) {
              (this.isStamp = !0),
                (this.stampIndex = e + 1),
                console.log("stamp");
            },
            startdraw() {
              for (
                var e = document.getElementsByName("maskradio"), i = 0;
                i < e.length;
                i++
              )
                if (e[i].checked) {
                  this.maletype = e[i].value;
                  var o = new Image(),
                    s = this;
                  switch (this.maletype) {
                    case "boychild":
                      o.src = t(347);
                      break;
                    case "boyadult":
                      o.src = t(1525);
                      break;
                    case "girlchild":
                      o.src = t(2653);
                      break;
                    case "girladult":
                      o.src = t(1561);
                      break;
                  }
                  o.onload = function () {
                    s.ctx.drawImage(o, 0, 0, s.canvas.width, s.canvas.height),
                      console.log(o.src);
                  };
                }
              this.maskdrawbool = !0;
            },
            canceldraw() {
              (this.maskdrawbool = !1),
                this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
            },
            savedraw() {
              this.$parent.name;
              var e = new Date(),
                i =
                  (e.getFullYear(),
                  e.getMonth(),
                  e.getDate(),
                  e.getHours(),
                  e.getMinutes(),
                  e.getSeconds(),
                  new Image()),
                o = this,
                s = document.createElement("canvas"),
                n = s.getContext("2d");
              s.id = "savecanvas";
              var l = document.createElement("canvas"),
                a = l.getContext("2d");
              switch (
                ((l.width = 823),
                (l.height = 601),
                a.drawImage(o.canvas, 322, 53, 249, 233),
                this.male)
              ) {
                case "boy":
                  i.src = t(9086);
                  break;
                case "girl":
                  i.src = t(3852);
                  break;
              }
              console.log("saveclick"),
                (i.onload = function () {
                  (s.width = 823),
                    (s.height = 601),
                    n.drawImage(i, 0, 0, s.width, s.height),
                    n.drawImage(l, 0, 0, s.width, s.height),
                    o.$http
                      .post(
                        N.apiUrl + "backpack/" + o.maskid + "/mask",
                        { image: s.toDataURL("image/png") },
                        {
                          headers: {
                            authorization: "Bearer " + N.getCookie("token"),
                          },
                        }
                      )
                      .then(
                        (e) => {
                          console.log(e),
                            (o.maskdrawbool = !1),
                            (o.$parent.maskbool = !1);
                        },
                        (e) => {
                          console.log(e);
                        }
                      );
                });
            },
          },
        };
        const $b = (0, b.Z)(jb, [
          ["render", Cb],
          ["__scopeId", "data-v-7625683a"],
        ]);
        var Wb = $b,
          Bb = {
            name: "game_scene",
            emits: ["gamescene"],
            setup(e, { emit: i }) {
              function t(e) {
                i("gamescene", e);
              }
              return { gamescene: t };
            },
            components: { maskpage: Wb },
            data() {
              return {
                liontype: "farmer",
                lionclass: "",
                male: "boy",
                name: "lion",
                level: 0,
                shoes: "originalfemale",
                pants: "original",
                cloth: "original",
                coat: "",
                jumpsuit: "",
                deco: "",
                grow: "child",
                progress: 0,
                exp: 0,
                lion: null,
                lionflex: 5,
                liontype_tw: "小農獅",
                lionclass_tw: "原始",
                isShowPic: !0,
                reddotbool: !1,
                outbox_w: { width: "66px" },
                clothes: null,
                boxradiotype: "props",
                clothgroupradiotype: "cloth",
                top_outbox_w: 0,
                top_outbox_h: 20,
                big_outbox_w: 0,
                big_outbox_h: 20,
                item_outbox_h: 20,
                item_outbox_w: 0,
                frame: "porps",
                boxbool: !1,
                backpagebool: !1,
                nchangeClothes: null,
                feeditem: null,
                boxtypearr: [
                  { name: "道具", value: "props" },
                  { name: "食物", value: "food" },
                  { name: "徽章", value: "badge" },
                  { name: "養成圖鑑", value: "book" },
                ],
                propsarr: [],
                propscss: [],
                specialitemarr: [],
                specialclotharr: [],
                foodarr: [],
                badgearr: [],
                bookarr: [
                  { name: "小農獅養成圖鑑", value: "farmer" },
                  { name: "小漁獅養成圖鑑", value: "fisher" },
                  { name: "工程獅養成圖鑑", value: "engineer" },
                ],
                farmeritemarr: [],
                fisheritemarr: [],
                engineeritemarr: [],
                bookitemarr: [],
                clothbool: !1,
                clothtypearr: [
                  { name: "上衣", value: "cloth" },
                  { name: "外套", value: "coat" },
                  { name: "褲子", value: "pants" },
                  { name: "連身裝", value: "jumpsuit" },
                  { name: "鞋子", value: "shoes" },
                  { name: "配件", value: "deco" },
                ],
                clotharr: [],
                coatarr: [],
                pantsarr: [],
                jumpsuitarr: [],
                shoesarr: [],
                decoarr: [],
                missionbool: !1,
                missionarr: [],
                topscenebool: !1,
                qrcodebool: !1,
                specialbool: !1,
                itemshowbool: !1,
                fooditemshowbool: !1,
                bookbool: !1,
                missionshow: !1,
                gamemissionshow: !1,
                badgebool: !1,
                foodbool: !1,
                bigmissionshow: !1,
                showmissiondatabool: !1,
                showmissionbool: !1,
                feeditemshowbool: !1,
                foodnum: 20,
                feedfoodnum: 0,
                clothgrouptype: "cloth",
                pic: "seed",
                top_content: "這是種子包，快拿取它，<br />到田裡種東西",
                top_contentc_btn: "確認",
                top_contentg_btn: "贈送",
                top_item_content: "成功贈送",
                top_gameurl: "",
                bigmission: "writing",
                bigmissioncontent: "",
                bookitemleft: "",
                bookitemcenter: "",
                bookitemright: "",
                bookitembottom: "",
                bookliontype: "farmer",
                contentarr: [
                  "對於世界有無盡好奇，父母帶領著孩子去探索。<br />(學齡前~小學)",
                  "開始廣泛地學習各項知識，也透過各種探索和體驗去了解世界，大部分透過老師引領與教育。<br />(小學~高中)",
                  "最青春無敵的年紀，開始知道了自己未來志向，要念書還會打工。畢業後從事第一份正式工作，在職場上是最青澀的存在，有許多職場前輩教導。<br />(大學~職場新鮮人)",
                  "從事職業已一段時間，對於工作時熟稔，技藝高超但追求更高的知識、技術或藝術境界。",
                  "透過熟練的技術與雙手打造作品/產品，要成為職人，一般需要好幾年，甚至與數十年的時間專注在領域上，對於自己的作品擁有相當的自信，不因為金錢或時間的限制而妥協。",
                  "在某一領域非常專業、擁有許多豐富經驗、技術和知識，是專業領域中出類拔萃的存在，也被稱為專家。",
                ],
                maskbool: !1,
                checkwriting: null,
                checkvideo: null,
                videourl: "",
                getvideolength: 0,
                videolengtharr: [55e3, 304e3, 301e3, 58e3, 52e3],
                maskdecobool: !1,
              };
            },
            mounted() {
              this.$http
                .get(N.apiUrl + "players/" + N.getCookie("id") + "/missions", {
                  headers: { authorization: "Bearer " + N.getCookie("token") },
                })
                .then(
                  (e) => {
                    (this.missionarr.length = 0), console.log(e.data);
                    for (var i = 0; i < e.data.length; i++)
                      (("once" == e.data[i].type && 1 != e.data[i].finish) ||
                        "accumulative" == e.data[i].type) &&
                        this.missionarr.push(e.data[i]);
                    (this.reddotbool = this.checkoncemission()),
                      console.log(this.reddotbool);
                  },
                  (e) => {
                    console.log(e);
                  }
                );
            },
            methods: {
              setliondata(e, i, t) {
                switch (
                  ((this.male = i),
                  (this.name = t.name),
                  (this.progress = t.exp),
                  (this.level = t.level),
                  (this.liontype = e),
                  (this.lion = t),
                  this.refreshView(),
                  this.male)
                ) {
                  case "boy":
                    this.shoes = "originalmale";
                    break;
                  case "girl":
                    this.shoes = "originalfemale";
                    break;
                }
                switch (e) {
                  case "farmer":
                    this.liontype_tw = "小農獅";
                    break;
                  case "engineer":
                    this.liontype_tw = "工程獅";
                    break;
                  case "fisher":
                    this.liontype_tw = "小漁獅";
                    break;
                }
              },
              changelionclass() {
                this.level <= 10
                  ? (this.lionclass_tw = "原始")
                  : this.level <= 20
                  ? (this.lionclass_tw = "學子")
                  : this.level <= 30
                  ? (this.lionclass_tw = "菜鳥")
                  : this.level <= 40
                  ? (this.lionclass_tw = "匠人")
                  : this.level <= 50
                  ? (this.lionclass_tw = "職人")
                  : this.level <= 60 && (this.lionclass_tw = "達人");
              },
              refreshView() {
                this.changelionclass(),
                  this.$http
                    .get(N.apiUrl + "lions/" + this.lion.id + "/backpack", {
                      headers: {
                        authorization: "Bearer " + N.getCookie("token"),
                      },
                    })
                    .then(
                      (e) => {
                        (this.propsarr.length = 0),
                          (this.propsarr = e.data),
                          console.log("prop", this.propsarr);
                      },
                      (e) => {}
                    ),
                  this.$http
                    .get(N.apiUrl + "lions/" + this.lion.id + "/foodBag", {
                      headers: {
                        authorization: "Bearer " + N.getCookie("token"),
                      },
                    })
                    .then(
                      (e) => {
                        (this.foodarr.length = 0),
                          console.log(e.data),
                          (this.foodarr = e.data);
                      },
                      (e) => {
                        console.log(e);
                      }
                    ),
                  this.$http
                    .get(N.apiUrl + "lions/" + this.lion.id, {
                      headers: {
                        authorization: "Bearer " + N.getCookie("token"),
                      },
                    })
                    .then(
                      (e) => {
                        if (
                          (console.log(e.data),
                          (this.exp = e.data.exp),
                          (this.level = e.data.level),
                          this.levelupfun(),
                          (this.clothes = e.data.clothes),
                          (this.lionclass = e.data.class),
                          Object.prototype.hasOwnProperty.call(
                            this.clothes,
                            "cloth"
                          ) && 0 != this.clothes.cloth.length)
                        ) {
                          var i = this.clothes.cloth.cloth.data.name;
                          (this.cloth = i), (this.jumpsuit = "");
                        }
                        if (
                          Object.prototype.hasOwnProperty.call(
                            this.clothes,
                            "pants"
                          ) &&
                          0 != this.clothes.pants.length
                        ) {
                          var t = this.clothes.pants.cloth.data.name;
                          (this.pants = t), (this.jumpsuit = "");
                        }
                        if (0 != this.clothes.shoes.length) {
                          var o = this.clothes.shoes.cloth.data.name;
                          if ("original" == this.clothes.shoes.cloth.class)
                            switch (this.male) {
                              case "boy":
                                this.shoes = o + "male";
                                break;
                              case "girl":
                                this.shoes = o + "female";
                                break;
                            }
                          else this.shoes = o;
                        }
                        if (
                          Object.prototype.hasOwnProperty.call(
                            this.clothes,
                            "jumpsuit"
                          ) &&
                          0 != this.clothes.jumpsuit.length
                        ) {
                          var s = this.clothes.jumpsuit.cloth.data.name;
                          (this.jumpsuit = s),
                            (this.cloth = ""),
                            (this.pants = "");
                        }
                        if (
                          Object.prototype.hasOwnProperty.call(
                            this.clothes,
                            "coat"
                          ) &&
                          0 != this.clothes.coat.length
                        ) {
                          var n = this.clothes.coat.cloth.data.name;
                          this.coat = n;
                        }
                        if (0 != this.clothes.deco.length)
                          if ("臉譜(已繪製)" != this.clothes.deco.item.name) {
                            var l = this.clothes.deco.item.data.name;
                            (this.deco = l),
                              this.level <= 30
                                ? (this.grow = "child")
                                : (this.grow = "adult"),
                              (this.maskdecobool = !1);
                          } else {
                            (this.grow = "nohead"), (this.maskdecobool = !0);
                            var a = document.getElementById("maskdeco"),
                              c = JSON.parse(this.clothes.deco.data).image;
                            a.style.backgroundImage = `url(${c})`;
                          }
                      },
                      (e) => {}
                    ),
                  this.$http
                    .get(N.apiUrl + "lions/" + this.lion.id + "/closet", {
                      headers: {
                        authorization: "Bearer " + N.getCookie("token"),
                      },
                    })
                    .then(
                      (e) => {
                        (this.clotharr = []),
                          (this.pantsarr = []),
                          (this.coatarr = []),
                          (this.shoesarr = []),
                          (this.coatarr = []),
                          (this.jumpsuitarr = []),
                          console.log(e.data);
                        for (var i = 0; i < e.data.length; i++)
                          switch (e.data[i].cloth.type) {
                            case "cloth":
                              this.clotharr.push(e.data[i]);
                              break;
                            case "coat":
                              this.coatarr.push(e.data[i]);
                              break;
                            case "pants":
                              this.pantsarr.push(e.data[i]);
                              break;
                            case "shoes":
                              this.shoesarr.push(e.data[i]);
                              break;
                            case "jumpsuit":
                              this.jumpsuitarr.push(e.data[i]);
                              break;
                          }
                      },
                      (e) => {
                        console.log(e);
                      }
                    ),
                  this.$http
                    .get(N.apiUrl + "lions/" + this.lion.id + "/deco", {
                      headers: {
                        authorization: "Bearer " + N.getCookie("token"),
                      },
                    })
                    .then(
                      (e) => {
                        (this.decoarr.length = 0), console.log("deco", e.data);
                        for (var i = 0; i < e.data.length; i++)
                          "special" == e.data[i].item.class &&
                            e.data[i].quantity,
                            this.decoarr.push(e.data[i]);
                      },
                      (e) => {
                        console.log(e);
                      }
                    ),
                  this.$http
                    .get(N.apiUrl + "lions/" + this.lion.id + "/badges", {
                      headers: {
                        authorization: "Bearer " + N.getCookie("token"),
                      },
                    })
                    .then(
                      (e) => {
                        console.log(e.data),
                          (this.badgearr = e.data),
                          (this.bookitemarr.length = 0);
                        var i = [
                            "original",
                            "student",
                            "rookie",
                            "craftsman",
                            "shokunin",
                            "master",
                          ],
                          t = ["farmer", "fisher", "engineer"];
                        (this.bookitemarr.length = 0),
                          (this.farmeritemarr.length = 0),
                          (this.fisheritemarr.length = 0),
                          (this.engineeritemarr.length = 0);
                        for (var o = 0; o < t.length; o++)
                          for (var s = 0; s < i.length; s++)
                            switch (t[o]) {
                              case "farmer":
                                this.farmeritemarr.push({
                                  class: i[s],
                                  get: !1,
                                  occupation: t[o],
                                });
                                break;
                              case "fisher":
                                this.fisheritemarr.push({
                                  class: i[s],
                                  get: !1,
                                  occupation: t[o],
                                });
                                break;
                              case "engineer":
                                this.engineeritemarr.push({
                                  class: i[s],
                                  get: !1,
                                  occupation: t[o],
                                });
                                break;
                            }
                        for (var n = 0; n < e.data.length; n++)
                          switch (e.data[n].item.type) {
                            case "badge":
                              switch (e.data[n].item.occupation) {
                                case "farmer":
                                  this.farmeritemarr.forEach(function (i) {
                                    i.class == e.data[n].item.class &&
                                      i.occupation ==
                                        e.data[n].item.occupation &&
                                      (i.get = !0);
                                  });
                                  break;
                                case "fisher":
                                  this.fisheritemarr.forEach(function (i) {
                                    i.class == e.data[n].item.class &&
                                      i.occupation ==
                                        e.data[n].item.occupation &&
                                      (i.get = !0);
                                  });
                                  break;
                                case "engineer":
                                  this.engineeritemarr.forEach(function (i) {
                                    i.class == e.data[n].item.class &&
                                      i.occupation ==
                                        e.data[n].item.occupation &&
                                      (i.get = !0);
                                  });
                                  break;
                              }
                              break;
                          }
                        console.log("book", this.bookitemarr);
                      },
                      (e) => {
                        console.log(e);
                      }
                    ),
                  this.$http
                    .get(
                      N.apiUrl + "players/" + N.getCookie("id") + "/missions",
                      {
                        headers: {
                          authorization: "Bearer " + N.getCookie("token"),
                        },
                      }
                    )
                    .then(
                      (e) => {
                        console.log(e.data), (this.missionarr.length = 0);
                        for (var i = 0; i < e.data.length; i++)
                          (("once" == e.data[i].type &&
                            1 != e.data[i].finish) ||
                            "accumulative" == e.data[i].type) &&
                            this.missionarr.push(e.data[i]);
                        this.reddotbool = this.checkoncemission();
                      },
                      (e) => {
                        console.log(e);
                      }
                    ),
                  this.$parent.$refs.informpage.refreshView(),
                  this.$parent.$refs.giftboxpage.refreshView();
              },
              setwidth() {
                var e,
                  i,
                  t,
                  o,
                  s,
                  n,
                  l,
                  a,
                  c,
                  r,
                  d,
                  h,
                  x,
                  b,
                  p,
                  f,
                  u,
                  _,
                  w = (window.innerHeight / 8) * 2,
                  v = (w / 6) * 4,
                  m = (0.9 * window.innerWidth) / 3,
                  g = (300 * v) / 114,
                  k = (m - g) / 2;
                console.log(v, g, k),
                  (this.outbox_w = k < 0 ? { width: 0 } : { width: k + "px" }),
                  (e = (window.innerHeight / 5) * 3),
                  (i = (window.innerWidth / 4) * 2),
                  (t = (150 * i) / 252),
                  (o = (252 * e) / 150),
                  (n = (i - o) / 2),
                  (s = (e - t) / 2),
                  window.innerWidth > 1920
                    ? ((l = (window.innerHeight / 9) * 7),
                      (a = (window.innerWidth / 6) * 4))
                    : (window.innerWidth >= 1440 && window.innerWidth < 1920) ||
                      (window.innerWidth >= 1024 && window.innerWidth < 1440)
                    ? ((l = (window.innerHeight / 9) * 7),
                      (a = (window.innerWidth / 7) * 5))
                    : window.innerWidth >= 768 && window.innerWidth < 1024
                    ? ((l = (window.innerHeight / 8) * 6),
                      (a = (window.innerWidth / 5) * 3))
                    : window.innerWidth >= 740 && window.innerWidth < 768
                    ? ((l = (window.innerHeight / 7) * 5),
                      (a = (window.innerWidth / 5) * 3))
                    : window.innerWidth >= 720 && window.innerWidth < 740
                    ? ((l = (window.innerHeight / 9) * 7),
                      (a = (window.innerWidth / 7) * 5))
                    : window.innerWidth >= 654 && window.innerWidth < 720
                    ? ((l = (window.innerHeight / 7.5) * 5.5),
                      (a = (window.innerWidth / 7) * 5))
                    : window.innerWidth >= 425 &&
                      window.innerWidth < 654 &&
                      ((l = (window.innerHeight / 10) * 8),
                      (a = (window.innerWidth / 5) * 3)),
                  (c = (150 * a) / 262),
                  (r = (262 * l) / 150),
                  (h = (a - r) / 2),
                  (d = (l - c) / 2),
                  (x = window.innerHeight / 3),
                  (b = window.innerWidth / 5),
                  (f = (178 * x) / 150),
                  (p = (150 * b) / 178),
                  (_ = (b - f) / 2),
                  (u = (x - p) / 2),
                  (this.top_outbox_h = s < 0 ? 0 : s),
                  (this.top_outbox_w = n < 0 ? 0 : n),
                  (this.big_outbox_h = d < 0 ? 0 : d),
                  (this.big_outbox_w = h < 0 ? 0 : h),
                  (this.item_outbox_h = u < 0 ? 0 : u),
                  (this.item_outbox_w = _ < 0 ? 0 : _);
              },
              setpropsclass(e) {
                for (var i = "", t = 0; t < this.propscss.length; t++)
                  e == this.propscss[t].name && (i = this.propscss[t].cssname);
                return i;
              },
              changebackpagefun(e) {
                this.boxradiotype = e;
              },
              chagneclothgroupfun(e) {
                this.clothgroupradiotype = e;
              },
              boxclick(e) {
                switch ((N.audioplay(), this.refreshView(), e)) {
                  case "backpage":
                    for (
                      var i = document.getElementsByName("boxradio"), t = 0;
                      t < i.length;
                      t++
                    )
                      i[t].checked = !1;
                    (i[0].checked = !0),
                      (this.boxradiotype = "props"),
                      (this.backpagebool = !0),
                      (this.clothbool = !1),
                      (this.missionbool = !1);
                    break;
                  case "clothgroup":
                    for (
                      var o = document.getElementsByName("clothgroupradio"),
                        s = 0;
                      s < o.length;
                      s++
                    )
                      o[s].checked = !1;
                    (o[0].checked = !0),
                      (this.clothgroupradiotype = "cloth"),
                      (this.backpagebool = !1),
                      (this.clothbool = !0),
                      (this.missionbool = !1);
                    break;
                  case "mission":
                    for (
                      var n = document.getElementsByName("missionradio"), l = 0;
                      l < n.length;
                      l++
                    )
                      n[l].checked = !1;
                    (this.backpagebool = !1),
                      (this.clothbool = !1),
                      (this.missionbool = !0),
                      (this.reddotbool = this.checkoncemission());
                    break;
                }
                (this.boxbool = !0), (this.lionflex = 3);
              },
              checkoncemission() {
                for (var e = 0; e < this.missionarr.length; e++)
                  if ("once" == this.missionarr[e].type) return !0;
                return !1;
              },
              closebox(e) {
                N.audioplay();
                var i = e.target.classList;
                this.checkclick(i) &&
                  ((this.boxbool = !1),
                  (this.lionflex = 5),
                  console.log("!click"));
              },
              checkclick(e) {
                N.audioplay();
                for (var i = "unclosebox", t = 0; t < e.length; t++)
                  if (e[t] == i) return !1;
                return !0;
              },
              clickmission(e) {
                switch ((N.audioplay(), e.title)) {
                  case "每日登入":
                    var i,
                      t = new Date(),
                      o = t.getHours();
                    o < 11
                      ? (i = "早安")
                      : o >= 11 && o <= 17
                      ? (i = "午安")
                      : o >= 17 && o <= 23 && (i = "晚安"),
                      (this.bigmission = "mission"),
                      (this.missionshow = !0),
                      o < 7 || o > 23
                        ? ((this.isShowPic = !1),
                          (this.top_content =
                            "獅獅睡著了，<br>早上7點再來看牠吧！"))
                        : ((this.isShowPic = !0),
                          (this.pic = "chicken"),
                          (this.top_content =
                            i +
                            "!<br>歡迎來到養成梅克獅，<br>恭喜你獲得一塊雞肉"));
                    break;
                  case "累積登入":
                    (this.top_content =
                      e.content + "<br />目前進度" + e.state + "/7(天)"),
                      (this.bigmission = "mission"),
                      (this.missionshow = !0),
                      (this.isShowPic = !1);
                    break;
                  case "累積觀看網站中文章":
                    (this.top_content =
                      e.content + "<br />目前進度" + e.state + "/5(次)"),
                      (this.bigmission = "writing"),
                      (this.missionshow = !0),
                      (this.isShowPic = !1);
                    break;
                  case "累積觀看網站中影片":
                    (this.top_content =
                      e.content + "<br />目前進度" + e.state + "/5(次)"),
                      (this.bigmission = "video"),
                      (this.missionshow = !0),
                      (this.isShowPic = !1);
                    break;
                  case "累積觀看線上展覽":
                    (this.top_content =
                      e.content + "<br />目前進度" + e.state + "/5(個)"),
                      (this.bigmission = "showmission"),
                      (this.missionshow = !0),
                      (this.isShowPic = !1);
                    break;
                  case "誰是航運王":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game7"),
                      (this.gamemissionshow = !0);
                    break;
                  case "超級飛修員":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game8"),
                      (this.gamemissionshow = !0);
                    break;
                  case "無人商店採購":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game1"),
                      (this.gamemissionshow = !0);
                    break;
                  case "智慧製造洗手乳":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game2"),
                      (this.gamemissionshow = !0);
                    break;
                  case "彩繪技職樂園":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game3"),
                      (this.gamemissionshow = !0);
                    break;
                  case "智能雞舍":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game4"),
                      (this.gamemissionshow = !0);
                    break;
                  case "灑網抓魚感測":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game5"),
                      (this.gamemissionshow = !0);
                    break;
                  case "農業小幫手":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game6"),
                      (this.gamemissionshow = !0);
                    break;
                  case "花卉實驗室":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game10"),
                      (this.gamemissionshow = !0);
                    break;
                  case "建築師的一天":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game9"),
                      (this.gamemissionshow = !0);
                    break;
                  case "積木樂園":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game11"),
                      (this.gamemissionshow = !0);
                    break;
                  case "救援代號：台灣黑熊":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game12"),
                      (this.gamemissionshow = !0);
                    break;
                  case "觀看網站中文章":
                    var s = e.data.url[Math.floor(5 * Math.random())];
                    (this.bigmissioncontent = `<iframe src="${s}" frameborder="0" width="90%" height="100%"></iframe>`),
                      (this.bigmission = "writing"),
                      (this.top_content = e.content),
                      (this.showmissiondatabool = !0);
                    break;
                  case "觀看網站中影片":
                    var n = Math.floor(5 * Math.random());
                    (this.videourl = e.data.url[n]),
                      (this.getvideolength = this.videolengtharr[n]),
                      (this.bigmission = "video"),
                      (this.top_content = e.content),
                      (this.showmissiondatabool = !0);
                    break;
                  case "觀看線上展覽":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "show"),
                      (this.showmissionbool = !0);
                    break;
                  case "經營大亨":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game14"),
                      (this.gamemissionshow = !0);
                    break;
                  case "魔法寶石大冒險":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game15"),
                      (this.gamemissionshow = !0);
                    break;
                  case "快門冒險":
                    (this.top_content = e.content),
                      (this.top_gameurl = e.data.url),
                      (this.pic = "game16"),
                      (this.gamemissionshow = !0);
                    break;
                }
              },
              toshowmissionbtn() {
                "writing" == this.bigmission
                  ? (this.checkwriting = setInterval(
                      () => this.checkwritingmission(),
                      6e4
                    ))
                  : "video" == this.bigmission &&
                    ((this.bigmissioncontent = `<iframe id="ytplayer" width="90%" height="100%" src="${this.videourl}?autoplay=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>`),
                    (this.checkvideo = setInterval(
                      () => this.checkvideomission(),
                      0.9 * this.getvideolength
                    ))),
                  (this.bigmissionshow = !0),
                  (this.showmissiondatabool = !1);
              },
              checkwritingmission() {
                this.$http
                  .post(
                    N.apiUrl + "players/" + N.getCookie("id") + "/missions/13",
                    { player: N.getCookie("id"), mission: 13 },
                    {
                      emulateJSON: !0,
                      headers: {
                        authorization: "Bearer " + N.getCookie("token"),
                      },
                    }
                  )
                  .then(
                    (e) => {
                      console.log(e),
                        clearInterval(this.checkwriting),
                        this.refreshView();
                    },
                    (e) => {
                      console.log(e);
                    }
                  );
              },
              checkvideomission() {
                this.$http
                  .post(
                    N.apiUrl + "players/" + N.getCookie("id") + "/missions/11",
                    { player: N.getCookie("id"), mission: 11 },
                    {
                      emulateJSON: !0,
                      headers: {
                        authorization: "Bearer " + N.getCookie("token"),
                      },
                    }
                  )
                  .then(
                    (e) => {
                      console.log(e), this.refreshView();
                    },
                    (e) => {
                      console.log(e);
                    }
                  );
              },
              togamemission() {
                N.audioplay(),
                  "gift" != this.pic
                    ? window.open(this.top_gameurl, "_blank").focus()
                    : alert("尚未開放!"),
                  this.showmissionbool &&
                    this.$http
                      .post(
                        N.apiUrl +
                          "players/" +
                          N.getCookie("id") +
                          "/missions/15",
                        { player: N.getCookie("id"), mission: 15 },
                        {
                          emulateJSON: !0,
                          headers: {
                            authorization: "Bearer " + N.getCookie("token"),
                          },
                        }
                      )
                      .then(
                        (e) => {
                          console.log(e);
                        },
                        (e) => {
                          console.log(e);
                        }
                      ),
                  (this.gamemissionshow = !1),
                  (this.showmissionbool = !1),
                  (this.boxbool = !1),
                  (this.lionflex = 5),
                  this.refreshView();
              },
              clickitem(e) {
                N.audioplay(),
                  "qrcode" != e.item.data.name
                    ? ((this.frame = "props"),
                      (this.top_content = e.item.name),
                      (this.pic = e.item.data.name),
                      "臉譜(未繪製)" != e.item.data.name &&
                        (this.$refs.maskpage.maskid = e.id),
                      (this.top_contentc_btn = "使用"),
                      (this.top_contentg_btn = "贈送"),
                      (this.topscenebool = !0))
                    : ((this.top_content = e.item.description),
                      this.$http
                        .post(
                          N.apiUrl + "backpack/" + e.id + "/qrcode",
                          { backpack: e.id },
                          {
                            emulateJSON: !0,
                            headers: {
                              authorization: "Bearer " + N.getCookie("token"),
                            },
                          }
                        )
                        .then(
                          (e) => {
                            console.log(e.data),
                              (this.pic = e.data.qrcode),
                              (this.qrcodebool = !0);
                          },
                          (e) => {
                            console.log(e);
                          }
                        ));
              },
              clickmaskbtn(e) {
                console.log(e),
                  (this.maskbool = e),
                  (this.$refs.maskpage.male = this.male);
              },
              clickspecialitem(e) {
                (this.pic = e.item.data.name),
                  (this.top_content = e.item.name),
                  (this.specialbool = !0);
              },
              clickfooditem(e, i, t) {
                N.audioplay(),
                  (this.top_content = t.name),
                  (this.fooditem = t),
                  (this.foodnum = i),
                  (this.pic = e),
                  (this.foodbool = !0);
              },
              getgender(e) {
                var i = "";
                return (i = "boy" == e ? "男性" : "女性"), i;
              },
              clickbookitem(e) {
                switch (
                  (console.log(e),
                  (this.bookliontype = e.value),
                  (this.bookitemarr.length = 0),
                  (this.bookitembottom = ""),
                  this.bookliontype)
                ) {
                  case "farmer":
                    this.bookitemarr = this.farmeritemarr;
                    break;
                  case "fisher":
                    this.bookitemarr = this.fisheritemarr;
                    break;
                  case "engineer":
                    this.bookitemarr = this.engineeritemarr;
                    break;
                }
                this.bookitemarr[0].get
                  ? ((this.bookitemleft = `\n        <p class="pokedexFont">狀態:小孩1/3</p>\n        <p class="pokedexFont">職級狀態:原始獅</p>\n        <p class="pokedexFont">性別:${this.getgender(
                      this.male
                    )}</p>\n        `),
                    (this.bookitemright = `\n        <div class="scrollbar w-100 h-100">\n        <p class="pokedexFont">目前等級:${this.level}級</p>\n        <p class="pokedexFont">1-10級為原始獅</p>\n        <p class="pokedexFont">${this.contentarr[0]}</p>\n        </div>\n        `))
                  : ((this.bookitemleft =
                      '\n        <p class="pokedexFont">狀態:?????</p>\n        <p class="pokedexFont">職級狀態:?????</p>\n        '),
                    (this.bookitemright =
                      '\n        <p class="pokedexFont">1-10級為?????</p>\n        <p class="pokedexFont">?????</p>\n        ')),
                  (this.pic =
                    this.bookliontype +
                    this.bookitemarr[0].class +
                    this.male +
                    this.bookitemarr[0].get);
                for (var i = 0; i < this.bookitemarr.length; i++)
                  this.bookitembottom +=
                    0 == i
                      ? `\n        <div class="flexbox w-100 h-100">\n          <input id="bookitem${i}" type="radio" name="bookitemradio" checked data-type="${
                          this.bookliontype
                        }" data-get="${this.bookitemarr[i].get}" value="${
                          this.bookitemarr[i].class
                        }" class="${
                          this.bookliontype +
                          this.bookitemarr[i].class +
                          this.bookitemarr[i].get +
                          this.male
                        }Book" />\n          <label for="bookitem${i}" class="h-100 flexbox">\n            <span></span>\n          </label>\n        </div>`
                      : `\n        <div class="flexbox w-100 h-100">\n          <input id="bookitem${i}" type="radio" name="bookitemradio" data-type="${
                          this.bookliontype
                        }" data-get="${this.bookitemarr[i].get}" value="${
                          this.bookitemarr[i].class
                        }" class="${
                          this.bookliontype +
                          this.bookitemarr[i].class +
                          this.bookitemarr[i].get +
                          this.male
                        }Book" />\n          <label for="bookitem${i}" class="h-100 flexbox">\n            <span></span>\n          </label>\n        </div>`;
                this.bookbool = !0;
              },
              changebookitem(e) {
                var i = e.target.id,
                  t = e.target.value,
                  o = e.target.dataset.get;
                if ((console.log(i, o, t), "" != i))
                  switch (t) {
                    case "original":
                      "true" == o
                        ? ((this.bookitemleft = `\n            <p class="pokedexFont">狀態:小孩1/3</p>\n            <p class="pokedexFont">職級狀態:原始獅</p>\n            <p class="pokedexFont">性別:${this.getgender(
                            this.male
                          )}</p>\n            `),
                          (this.bookitemright = `\n              <div class="scrollbar w-100 h-100">\n                          <p class="pokedexFont">目前等級:${this.level}級</p>\n            <p class="pokedexFont">1-10級為原始獅</p>\n            <p class="pokedexFont">${this.contentarr[0]}</p></div>\n\n            `))
                        : ((this.bookitemleft =
                            '\n            <p class="pokedexFont">狀態:?????</p>\n            <p class="pokedexFont">職級狀態:?????</p>\n            '),
                          (this.bookitemright =
                            '\n            <p class="pokedexFont">1-10級為?????</p>\n            <p class="pokedexFont">?????</p>')),
                        (this.pic = this.bookliontype + t + this.male + o);
                      break;
                    case "student":
                      "true" == o
                        ? ((this.bookitemleft = `\n            <p class="pokedexFont">狀態:小孩2/3</p>\n            <p class="pokedexFont">職級狀態:學子獅</p>\n            <p class="pokedexFont">性別:${this.getgender(
                            this.male
                          )}</p>\n            `),
                          (this.bookitemright = `\n               <div class="scrollbar w-100 h-100">\n            <p class="pokedexFont">目前等級:${this.level}級</p>\n            <p class="pokedexFont">11-20級為學子獅</p>\n            <p class="pokedexFont">${this.contentarr[1]}</p>\n            </div>\n            `))
                        : ((this.bookitemleft =
                            '\n            <p class="pokedexFont">狀態:?????</p>\n            <p class="pokedexFont">職級狀態:?????</p>\n            '),
                          (this.bookitemright =
                            '\n            <p class="pokedexFont">11-20級為?????</p>\n            <p class="pokedexFont">?????</p>\n            ')),
                        (this.pic = this.bookliontype + t + this.male + o);
                      break;
                    case "rookie":
                      "true" == o
                        ? ((this.bookitemleft = `\n            <p class="pokedexFont">狀態:小孩3/3</p>\n            <p class="pokedexFont">職級狀態:菜鳥獅</p>\n            <p class="pokedexFont">性別:${this.getgender(
                            this.male
                          )}</p>\n            `),
                          (this.bookitemright = `\n               <div class="scrollbar w-100 h-100">\n            <p class="pokedexFont">目前等級:${this.level}級</p>\n            <p class="pokedexFont">21-30級為菜鳥獅</p>\n            <p class="pokedexFont">${this.contentarr[2]}</p>\n            </div>\n            `))
                        : ((this.bookitemleft =
                            '\n            <p class="pokedexFont">狀態:?????</p>\n            <p class="pokedexFont">職級狀態:?????</p>\n            '),
                          (this.bookitemright =
                            '\n            <p class="pokedexFont">21-30級為?????</p>\n            <p class="pokedexFont">?????</p>\n            ')),
                        (this.pic = this.bookliontype + t + this.male + o);
                      break;
                    case "craftsman":
                      "true" == o
                        ? ((this.bookitemleft = `\n            <p class="pokedexFont">狀態:成人1/3</p>\n            <p class="pokedexFont">職級狀態:匠人獅</p>\n            <p class="pokedexFont">性別:${this.getgender(
                            this.male
                          )}</p>\n            `),
                          (this.bookitemright = `\n              <div class="scrollbar w-100 h-100">\n            <p class="pokedexFont">目前等級:${this.level}級</p>\n            <p class="pokedexFont">31-40級為匠人獅</p>\n            <p class="pokedexFont">${this.contentarr[3]}</p>\n            </div>\n            `))
                        : ((this.bookitemleft =
                            '\n            <p class="pokedexFont">狀態:?????</p>\n            <p class="pokedexFont">職級狀態:?????</p>\n            '),
                          (this.bookitemright =
                            '\n            <p class="pokedexFont">31-40級為?????</p>\n            <p class="pokedexFont">?????</p>')),
                        (this.pic = this.bookliontype + t + this.male + o);
                      break;
                    case "shokunin":
                      "true" == o
                        ? ((this.bookitemleft = `\n            <p class="pokedexFont">狀態:成人2/3</p>\n            <p class="pokedexFont">職級狀態:職人獅</p>\n            <p class="pokedexFont">性別:${this.getgender(
                            this.male
                          )}</p>\n            `),
                          (this.bookitemright = `\n              <div class="scrollbar w-100 h-100">\n            <p class="pokedexFont">目前等級:${this.level}級</p>\n            <p class="pokedexFont">41-50級為職人獅</p>\n            <p class="pokedexFont">${this.contentarr[4]}</p>\n            </div>\n            `))
                        : ((this.bookitemleft =
                            '\n            <p class="pokedexFont">狀態:?????</p>\n            <p class="pokedexFont">職級狀態:?????</p>\n            '),
                          (this.bookitemright =
                            '\n            <p class="pokedexFont">41-50級為?????</p>\n            <p class="pokedexFont">?????</p>')),
                        (this.pic = this.bookliontype + t + this.male + o);
                      break;
                    case "master":
                      "true" == o
                        ? ((this.bookitemleft = `\n            <p class="pokedexFont">狀態:成人3/3</p>\n            <p class="pokedexFont">職級狀態:達人獅</p>\n            <p class="pokedexFont">性別:${this.getgender(
                            this.male
                          )}</p>\n            `),
                          (this.bookitemright = `\n              <div class="scrollbar w-100 h-100">\n            <p class="pokedexFont">目前等級:${this.level}級</p>\n            <p class="pokedexFont">51-60級為達人獅</p>\n            <p class="pokedexFont">${this.contentarr[5]}</p>\n            </div>\n            `))
                        : ((this.bookitemleft =
                            '\n            <p class="pokedexFont">狀態:?????</p>\n            <p class="pokedexFont">職級狀態:?????</p>\n            '),
                          (this.bookitemright =
                            '\n            <p class="pokedexFont">51-60級為?????</p>\n            <p class="pokedexFont">?????</p>\n            ')),
                        (this.pic = this.bookliontype + t + this.male + o);
                      break;
                  }
              },
              top_feedbtn() {
                this.fooditemshowbool = !0;
              },
              top_send_plus() {
                document.querySelector("input[type=number]").stepUp();
              },
              top_send_minus() {
                document.querySelector("input[type=number]").stepDown();
              },
              top_feedcheckbtn() {
                (this.feedfoodnum = document.getElementById("sendnum").value),
                  (this.fooditemshowbool = !1),
                  (this.feeditemshowbool = !0);
                var e;
                switch (this.pic) {
                  case "beef":
                    this.top_content = `餵食牛肉X${
                      this.feedfoodnum
                    }<br />經驗值+${30 * this.feedfoodnum}`;
                    break;
                  case "chicken":
                    (this.top_content = `餵食雞肉X${
                      this.feedfoodnum
                    }<br />經驗值+${10 * this.feedfoodnum}`),
                      1;
                    break;
                  case "pig":
                    this.top_content = `餵食豬肉X${
                      this.feedfoodnum
                    }<br />經驗值+${20 * this.feedfoodnum}`;
                    break;
                }
                (e = {
                  backpack_id: this.fooditem.id,
                  quantity: parseInt(this.feedfoodnum),
                }),
                  this.$http
                    .patch(N.apiUrl + "lions/" + this.lion.id + "/feed", e, {
                      emulateJSON: !0,
                      headers: {
                        authorization: "Bearer " + N.getCookie("token"),
                      },
                    })
                    .then(
                      (e) => {
                        this.refreshView();
                      },
                      (e) => {
                        console.log(e),
                          this.$parent.alert("網路連線問題，請再試一次!");
                      }
                    ),
                  (document.getElementById("sendnum").value = 1);
              },
              levelupfun() {
                this.level < 10 && (this.progress = 2 * this.exp),
                  this.level > 10 &&
                    this.level < 20 &&
                    (this.progress = this.exp),
                  this.level > 20 &&
                    this.level < 30 &&
                    (this.progress = (this.exp / 150) * 100),
                  this.level > 30 &&
                    this.level < 40 &&
                    (this.progress = this.exp / 2),
                  this.level > 40 &&
                    this.level < 50 &&
                    (this.progress = (this.exp / 250) * 100),
                  this.level > 50 &&
                    this.level < 60 &&
                    (this.progress = this.exp / 3),
                  this.level >= 60 && (this.progress = 100);
              },
              clickbadgeitem(e) {
                N.audioplay(),
                  (this.frame = "badge"),
                  (this.top_content = e.item.name),
                  (this.pic = e.item.occupation + e.item.class + "Badge"),
                  (this.badgebool = !0);
              },
              clickclothitem(e) {
                N.audioplay(),
                  (this.top_content = e.cloth.name),
                  (this.clothgrouptype = "cloth"),
                  (this.frame = "cloth"),
                  (this.pic = e.cloth.data.name + "Cloth"),
                  (this.top_contentc_btn = "取消"),
                  (this.top_contentg_btn = "更換"),
                  (this.topscenebool = !0),
                  (this.nchangeClothes = e);
              },
              clickcoatitem(e) {
                N.audioplay(),
                  (this.top_content = e.cloth.name),
                  (this.clothgrouptype = "cloth"),
                  (this.frame = "cloth"),
                  (this.pic = e.cloth.data.name + "Coat"),
                  (this.top_contentc_btn = "取消"),
                  (this.top_contentg_btn = "更換"),
                  (this.topscenebool = !0),
                  (this.nchangeClothes = e);
              },
              clickpantsitem(e) {
                (this.top_content = e.cloth.name),
                  (this.clothgrouptype = "pants"),
                  (this.frame = "cloth"),
                  (this.pic = e.cloth.data.name + "Pants"),
                  (this.top_contentc_btn = "取消"),
                  (this.top_contentg_btn = "更換"),
                  (this.badgebool = !1),
                  (this.topscenebool = !0),
                  (this.nchangeClothes = e);
              },
              clickjumpsuititem(e) {
                (this.top_content = e.cloth.name),
                  (this.clothgrouptype = "jumpsuit"),
                  (this.frame = "cloth"),
                  (this.pic = e.cloth.data.name + "Jumpsuit"),
                  (this.top_contentc_btn = "取消"),
                  (this.top_contentg_btn = "更換"),
                  (this.badgebool = !1),
                  (this.topscenebool = !0),
                  (this.nchangeClothes = e);
              },
              clickshoesitem(e) {
                (this.top_content = e.cloth.name),
                  (this.clothgrouptype = "shoes"),
                  (this.frame = "cloth"),
                  (this.pic = e.cloth.data.name + "Shoes"),
                  (this.top_contentc_btn = "取消"),
                  (this.top_contentg_btn = "更換"),
                  (this.badgebool = !1),
                  (this.topscenebool = !0),
                  (this.nchangeClothes = e);
              },
              clickdecoitem(e) {
                (this.top_content = e.item.name),
                  (this.clothgrouptype = "deco"),
                  (this.frame = "cloth"),
                  (this.pic = e.item.data.name + "Deco"),
                  (this.top_contentc_btn = "取消"),
                  (this.top_contentg_btn = "更換"),
                  (this.badgebool = !1),
                  (this.topscenebool = !0),
                  (this.nchangeClothes = e);
              },
              top_leftbtn() {
                "使用" == this.top_contentc_btn &&
                "臉譜(未繪製)" != this.top_content &&
                "兌換券" != this.top_content
                  ? alert("前往衣櫃→配件穿戴")
                  : "使用" == this.top_contentc_btn &&
                    "臉譜(未繪製)" == this.top_content
                  ? (this.clickmaskbtn(!0), (this.topscenebool = !1))
                  : "使用" == this.top_contentc_btn &&
                    "兌換券" == this.top_content
                  ? alert("尚未開放")
                  : ((this.topscenebool = !1),
                    (this.missionshow = !1),
                    (this.badgebool = !1),
                    (this.foodbool = !1),
                    (this.gamemissionshow = !1),
                    (this.bookbool = !1),
                    (this.specialbool = !1),
                    (this.showmissiondatabool = !1),
                    (this.bigmissionshow = !1),
                    (this.showmissionbool = !1),
                    (this.top_contentc_btn = "確認"),
                    (this.top_contentg_btn = "贈送"));
              },
              top_closebtn() {
                (this.topscenebool = !1),
                  (this.missionshow = !1),
                  (this.badgebool = !1),
                  (this.foodbool = !1),
                  (this.gamemissionshow = !1),
                  (this.bookbool = !1),
                  (this.specialbool = !1),
                  (this.showmissiondatabool = !1),
                  (this.bigmissionshow = !1),
                  (this.showmissionbool = !1),
                  (this.qrcodebool = !1),
                  (this.top_contentc_btn = "確認"),
                  (this.top_contentg_btn = "贈送"),
                  clearInterval(this.checkwriting),
                  clearInterval(this.checkvideo),
                  (this.bigmissioncontent = "");
              },
              top_itemscene() {
                switch (this.top_contentg_btn) {
                  case "贈送":
                    ("使用" == this.top_contentc_btn &&
                      "臉譜(未繪製)" == this.top_content) ||
                    ("使用" == this.top_contentc_btn &&
                      "臉譜(已繪製)" == this.top_content)
                      ? alert("此道具不可贈送!")
                      : alert("請至好友列表贈送");
                    break;
                  case "更換":
                    var e = null;
                    if (
                      (console.log(this.nchangeClothes),
                      Object.prototype.hasOwnProperty.call(
                        this.nchangeClothes,
                        "cloth"
                      ))
                    ) {
                      switch (this.nchangeClothes.cloth.type) {
                        case "cloth":
                          Object.prototype.hasOwnProperty.call(
                            this.clothes,
                            "cloth"
                          ) && (e = this.clothes.cloth.id);
                          break;
                        case "pants":
                          Object.prototype.hasOwnProperty.call(
                            this.clothes,
                            "pants"
                          ) && (e = this.clothes.pants.id);
                          break;
                        case "shoes":
                          e = this.clothes.shoes.id;
                          break;
                        case "jumpsuit":
                          Object.prototype.hasOwnProperty.call(
                            this.clothes,
                            "jumpsuit"
                          ) && (e = this.clothes.jumpsuit.id);
                          break;
                        case "coat":
                          Object.prototype.hasOwnProperty.call(
                            this.clothes,
                            "coat"
                          ) && (e = this.clothes.coat.id);
                          break;
                      }
                      var i;
                      if (
                        (console.log(e),
                        (i =
                          null == e
                            ? { on_closet_id: this.nchangeClothes.id }
                            : {
                                on_closet_id: this.nchangeClothes.id,
                                off_closet_id: e,
                              }),
                        e == this.nchangeClothes.id)
                      )
                        return void alert("已經穿在身上了!");
                      console.log(i),
                        this.$http
                          .patch(
                            N.apiUrl + "lions/" + this.lion.id + "/wear",
                            i,
                            {
                              emulateJSON: !0,
                              headers: {
                                authorization: "Bearer " + N.getCookie("token"),
                              },
                            }
                          )
                          .then(
                            (e) => {
                              (this.top_item_content = "更換成功"),
                                (this.itemshowbool = !0),
                                this.refreshView();
                            },
                            (e) => {
                              console.log(e), console.log(i);
                            }
                          );
                    } else {
                      if (
                        ((e = this.clothes.deco.id),
                        (i = {
                          on_deco_id: this.nchangeClothes.id,
                          off_deco_id: e,
                        }),
                        e == this.nchangeClothes.id)
                      )
                        return void alert("已經穿在身上了!");
                      this.$http
                        .patch(
                          N.apiUrl + "lions/" + this.lion.id + "/wearDeco",
                          i,
                          {
                            emulateJSON: !0,
                            headers: {
                              authorization: "Bearer " + N.getCookie("token"),
                            },
                          }
                        )
                        .then(
                          (e) => {
                            (this.top_item_content = "更換成功"),
                              (this.itemshowbool = !0),
                              this.refreshView();
                          },
                          (e) => {
                            console.log(e), console.log(i);
                          }
                        );
                    }
                    break;
                }
              },
              top_itemcheck() {
                (this.itemshowbool = !1),
                  (this.topscenebool = !1),
                  (this.badgebool = !1),
                  (this.missionshow = !1),
                  (this.foodbool = !1),
                  (this.specialbool = !1),
                  (this.fooditemshowbool = !1),
                  (this.feeditemshowbool = !1),
                  (this.top_contentc_btn = "確認"),
                  (this.top_contentg_btn = "贈送");
              },
            },
          };
        const qb = (0, b.Z)(Bb, [
          ["render", Bx],
          ["__scopeId", "data-v-92fdf210"],
        ]);
        var Hb = qb;
        const Fb = { id: "mobilev_mobile" };
        function Db(e, i) {
          return (0, s.wg)(), (0, s.iD)("div", Fb);
        }
        const Tb = {},
          Ib = (0, b.Z)(Tb, [
            ["render", Db],
            ["__scopeId", "data-v-1a973b7c"],
          ]);
        var Mb = Ib;
        const Lb = { id: "mobilev_window" };
        function Sb(e, i) {
          return (0, s.wg)(), (0, s.iD)("div", Lb);
        }
        const zb = {},
          Ob = (0, b.Z)(zb, [
            ["render", Sb],
            ["__scopeId", "data-v-d7ae6076"],
          ]);
        var Eb = Ob,
          Ub = t(2269),
          Nb = t.n(Ub),
          Pb = {
            data() {
              return {
                activecard: "gamescene",
                loginbool: !0,
                getlionbool: !1,
                questionbool: !0,
                introducebool: !1,
                gamescenebool: !1,
                mobilehbool: !1,
                windowhbool: !1,
                faqbool: !1,
                servicenprivacybool: !1,
                infobool: !1,
                friendshipbool: !1,
                giftboxbool: !1,
                sharebool: !1,
                info: "test",
                userinfo: null,
                interval: null,
                saveimg: null,
              };
            },
            components: {
              rightmenu: f,
              settingpage: V,
              faqpage: ge,
              servicenprivacy: Te,
              informpage: di,
              friendshippage: Ct,
              giftboxpage: Oo,
              sharepage: Qo,
              login: bs,
              getlion: zs,
              question: Gs,
              introducePage: Fn,
              gamescene: Hb,
              mobileh: Mb,
              windowh: Eb,
            },
            created() {
              window.addEventListener("resize", this.myEventHandler);
            },
            unmounted() {
              window.removeEventListener("resize", this.myEventHandler);
            },
            mounted() {
              if (N.getCookie("uid")) {
                var e = { account: N.getCookie("uid") };
                this.$http
                  .post(N.apiUrl + "players/login", e, { emulateJSON: !0 })
                  .then(
                    (e) => {
                      if (
                        (console.log(e.data),
                        N.setCookie("token", e.data.access_token),
                        N.setCookie("id", e.data.player.id),
                        (this.userinfo = e.data),
                        e.data.player.lions.length > 0)
                      ) {
                        var i = e.data.player.lions[0];
                        this.togamescenefun(
                          "gamescene",
                          i.occupation,
                          i.gender,
                          i
                        );
                      } else this.changefun("getlion");
                    },
                    (e) => {
                      console.error(e);
                    }
                  ),
                  this.isMobile(),
                  this.$refs.introducepage.setwidth(),
                  this.$refs.gamescene.setwidth(),
                  this.$refs.settingpage.setwidth(),
                  this.$refs.faqpage.setwidth(),
                  this.$refs.sernpripage.setwidth(),
                  this.$refs.informpage.setwidth(),
                  this.$refs.friendshippage.setwidth(),
                  this.$refs.giftboxpage.setwidth(),
                  window.addEventListener("resize", this.myEventHandler);
              } else location.href = N.formalUrl;
            },
            methods: {
              myEventHandler(e) {
                console.log(e),
                  this.isMobile(),
                  this.$refs.introducepage.setwidth(),
                  this.$refs.gamescene.setwidth(),
                  this.$refs.settingpage.setwidth(),
                  this.$refs.faqpage.setwidth(),
                  this.$refs.sernpripage.setwidth(),
                  this.$refs.informpage.setwidth(),
                  this.$refs.friendshippage.setwidth(),
                  this.$refs.giftboxpage.setwidth();
              },
              isMobile() {
                console.log("in", window.innerHeight, window.innerWidth),
                  /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(
                    navigator.userAgent
                  ) && window.innerHeight > window.innerWidth
                    ? ((this.mobilehbool = !0), (this.windowhbool = !1))
                    : /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(
                        navigator.userAgent
                      )
                    ? ((this.mobilehbool = !1), (this.windowhbool = !1))
                    : window.innerHeight >= window.innerWidth ||
                      window.innerWidth <= 1060 ||
                      window.innerHeight <= 560
                    ? ((this.mobilehbool = !1), (this.windowhbool = !0))
                    : ((this.mobilehbool = !1), (this.windowhbool = !1));
              },
              alert(e) {
                alert(e);
              },
              settingbtnfun(e) {
                N.audioplay(),
                  (this.$refs.settingpage.settingshow = e),
                  e &&
                    ((this.faqbool = !1),
                    this.backfaqfun(),
                    this.infofun(!1),
                    this.friendfun(!1),
                    this.giftfun(!1));
              },
              playmusic(e) {
                N.backgroundmusic();
              },
              changefun(e) {
                N.audioplay(),
                  console.log(e),
                  "login" == e
                    ? (this.$refs.rightmenu.showornotbtn(!1),
                      console.log("logout"),
                      this.$http
                        .get(N.apiUrl + "players/logout", {
                          headers: {
                            authorization: "Bearer " + N.getCookie("token"),
                          },
                        })
                        .then((e) => {}),
                      (location.href = N.formalUrl))
                    : this.$refs.rightmenu.showornotbtn(!0),
                  "introduce" != e &&
                    ((this.introducebool = !1),
                    console.log("no introducebool")),
                  "question" != e && (this.questionbool = !1),
                  "gamescene" != e && (this.gamescenebool = !1),
                  (this.activecard = e);
              },
              toquestionfun(e) {
                N.audioplay(),
                  this.changefun(e),
                  (this.questionbool = !0),
                  console.log("questionbool:", this.questionbool);
              },
              backtoquestionfun(e) {
                N.audioplay(), this.changefun(e), (this.questionbool = !0);
              },
              tointroducefun(e, i) {
                N.audioplay(),
                  this.changefun(e),
                  console.log(i),
                  (this.introducebool = !0),
                  this.$refs.introducepage.setliontypefun(i);
              },
              togamescenefun(e, i, t, o) {
                N.audioplay(),
                  (this.gamescenebool = !0),
                  this.changefun(e),
                  this.$refs.gamescene.setliondata(i, t, o);
              },
              faqbtnfun(e) {
                N.audioplay(),
                  (this.faqbool = e),
                  e ? this.settingbtnfun(!1) : this.settingbtnfun(!0),
                  this.$refs.faqpage.showbox("faq");
              },
              backfaqfun() {
                N.audioplay(),
                  (this.$refs.settingpage.settingshow = !0),
                  (this.servicenprivacybool = !1);
              },
              toser_pr(e) {
                N.audioplay(),
                  (this.servicenprivacybool = !0),
                  (this.$refs.sernpripage.type = e),
                  (this.$refs.settingpage.settingshow = !1);
              },
              infofun(e) {
                N.audioplay(),
                  (this.infobool = e),
                  e
                    ? (this.settingbtnfun(!1),
                      (this.faqbool = !1),
                      this.friendfun(!1),
                      (this.servicenprivacybool = !1),
                      this.giftfun(!1),
                      this.$refs.informpage.refreshView())
                    : (this.$refs.informpage.itembool = !1);
              },
              friendfun(e) {
                N.audioplay(),
                  (this.friendshipbool = e),
                  e &&
                    (this.settingbtnfun(!1),
                    this.infofun(!1),
                    (this.faqbool = !1),
                    (this.servicenprivacybool = !1),
                    this.giftfun(!1),
                    this.$refs.friendshippage.refreshView(),
                    (this.$refs.friendshippage.list_rankbool = !0),
                    (this.$refs.friendshippage.searchbool = !1),
                    (this.$refs.friendshippage.$refs.searchinput.value = ""));
              },
              giftfun(e) {
                N.audioplay(),
                  (this.giftboxbool = e),
                  e &&
                    (this.$refs.giftboxpage.refreshView(),
                    this.settingbtnfun(!1),
                    this.infofun(!1),
                    (this.faqbool = !1),
                    (this.servicenprivacybool = !1),
                    this.friendfun(!1));
              },
              sharefun(e) {
                N.audioplay(),
                  (this.sharebool = e),
                  e &&
                    (this.settingbtnfun(!1),
                    this.infofun(!1),
                    (this.faqbool = !1),
                    (this.servicenprivacybool = !1),
                    this.friendfun(!1),
                    this.giftfun(!1));
              },
              generatorImage(e) {
                if (this.gamescenebool) {
                  (this.$refs.gamescene.boxbool = !1),
                    (this.$refs.gamescene.lionflex = 5);
                  var i = this;
                  i.saveimg = setInterval(() => {
                    Nb()(i.$refs.capture).then((o) => {
                      var s = o.getContext("2d"),
                        n = new Image(),
                        l = window.innerHeight,
                        a = window.innerWidth,
                        c = i.$refs.gamescene.liontype,
                        r = i.$refs.gamescene.lionclass,
                        d = "",
                        h = i.$refs.gamescene.name,
                        x = new Date(),
                        b = x.getFullYear(),
                        p = x.getMonth() + 1,
                        f = x.getDate(),
                        u = x.getHours(),
                        _ = x.getMinutes(),
                        w = x.getSeconds();
                      switch (i.$refs.gamescene.male) {
                        case "boy":
                          d = "male";
                          break;
                        case "girl":
                          d = "female";
                          break;
                      }
                      s.drawImage(o, 0, 0, a, l),
                        (n.src = t(5012)(`./${c}_${r}_${d}-01.png`)),
                        console.log(n.src),
                        (n.width = a),
                        (n.height = l),
                        (n.onload = function () {
                          if (
                            (s.drawImage(n, 0, 0, a, l),
                            s.save(),
                            o.setAttribute("id", "canvassetimg"),
                            document.getElementById("addImage").append(o),
                            e)
                          ) {
                            let e = o.toDataURL("image/jpeg");
                            console.log(e);
                            let i = document.createElement("a");
                            (i.href = e),
                              i.setAttribute("id", "downloadimglink"),
                              i.setAttribute(
                                "download",
                                `download_${h}_${b}${p}${f}_${u}_${_}_${w}.jpg`
                              ),
                              (i.style.display = "none"),
                              document.body.appendChild(i),
                              i.click(),
                              document
                                .getElementById("downloadimglink")
                                .remove();
                          } else {
                            var i =
                                "https://www.twmakers.com.tw/web/game/game_mex.jsp#gameInId",
                              t = o.toDataURL("image/jpeg"),
                              c = encodeURIComponent(i);
                            encodeURIComponent(t),
                              encodeURIComponent("大家一起來培養梅克獅吧!");
                            window.open(
                              "https://www.facebook.com/sharer/sharer.php?u=" +
                                c,
                              "_blank"
                            );
                          }
                          document.getElementById("canvassetimg").remove();
                        }),
                        clearInterval(i.saveimg);
                    });
                  }, 1e3);
                } else alert("請先創立角色!");
              },
              share() {},
            },
          };
        const Yb = (0, b.Z)(Pb, [["render", a]]);
        var Vb = Yb,
          Kb = t(6265),
          Jb = t.n(Kb),
          Zb = t(6423);
        const Ab = (0, o.ri)(Vb);
        Ab.use(Zb.Z, Jb()), Ab.mount("#app");
      },
      5012: function (e, i, t) {
        var o = {
          "./engineer_craftman_female-01.png": 9182,
          "./engineer_craftman_male-01.png": 7408,
          "./engineer_master_female-01.png": 5163,
          "./engineer_master_male-01.png": 5308,
          "./engineer_original_female-01.png": 3433,
          "./engineer_original_male-01.png": 2926,
          "./engineer_rookie_female-01.png": 5161,
          "./engineer_rookie_male-01.png": 4977,
          "./engineer_shokunin_female-01.png": 9758,
          "./engineer_shokunin_male-01.png": 1666,
          "./engineer_student_female-01.png": 3577,
          "./engineer_student_male-01.png": 2989,
          "./farmer_craftman_female-01.png": 6480,
          "./farmer_craftman_male-01.png": 7188,
          "./farmer_master_female-01.png": 3558,
          "./farmer_master_male-01.png": 8645,
          "./farmer_original_female-01.png": 7575,
          "./farmer_original_male-01.png": 8516,
          "./farmer_rookie_female-01.png": 9094,
          "./farmer_rookie_male-01.png": 2177,
          "./farmer_shokunin_female-01.png": 4760,
          "./farmer_shokunin_male-01.png": 475,
          "./farmer_student_female-01.png": 2634,
          "./farmer_student_male-01.png": 1389,
          "./fisher_craftman_female-01.png": 3201,
          "./fisher_craftman_male-01.png": 3343,
          "./fisher_master_female-01.png": 5385,
          "./fisher_master_male-01.png": 3402,
          "./fisher_original_female-01.png": 4327,
          "./fisher_original_male-01.png": 667,
          "./fisher_rookie_female-01.png": 9013,
          "./fisher_rookie_male-01.png": 370,
          "./fisher_shokunin_female-01.png": 5883,
          "./fisher_shokunin_male-01.png": 2017,
          "./fisher_student_female-01.png": 6594,
          "./fisher_student_male-01.png": 2303,
        };
        function s(e) {
          var i = n(e);
          return t(i);
        }
        function n(e) {
          if (!t.o(o, e)) {
            var i = new Error("Cannot find module '" + e + "'");
            throw ((i.code = "MODULE_NOT_FOUND"), i);
          }
          return o[e];
        }
        (s.keys = function () {
          return Object.keys(o);
        }),
          (s.resolve = n),
          (e.exports = s),
          (s.id = 5012);
      },
      3602: function (e, i, t) {
        var o = {
          "./stamp_no_1.svg": 6471,
          "./stamp_no_2.svg": 1269,
          "./stamp_no_3.svg": 8922,
        };
        function s(e) {
          var i = n(e);
          return t(i);
        }
        function n(e) {
          if (!t.o(o, e)) {
            var i = new Error("Cannot find module '" + e + "'");
            throw ((i.code = "MODULE_NOT_FOUND"), i);
          }
          return o[e];
        }
        (s.keys = function () {
          return Object.keys(o);
        }),
          (s.resolve = n),
          (e.exports = s),
          (s.id = 3602);
      },
      9086: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/boy_hand-01.68e4b4f8.svg";
      },
      1561: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/adult_female_lion_nocolor-01.19a6bbcf.svg";
      },
      1525: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/adult_male_lion_nocolor-01.72dcf4ac.svg";
      },
      2653: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/child_female_lion_nocolor-01.1d7e4329.svg";
      },
      347: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/child_male_lion_nocolor-01.c9cd6ef2.svg";
      },
      6471: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/stamp_no_1.bb0a54d1.svg";
      },
      1269: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/stamp_no_2.038ea88e.svg";
      },
      8922: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/stamp_no_3.c9ca3862.svg";
      },
      3852: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/girl_hand-01.b70decb3.svg";
      },
      4665: function (e, i, t) {
        "use strict";
        e.exports = t.p + "media/button.17a8466b.wav";
      },
      9182: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/engineer_craftman_female-01.73116a61.png";
      },
      7408: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/engineer_craftman_male-01.b5778519.png";
      },
      5163: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/engineer_master_female-01.ef90c089.png";
      },
      5308: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/engineer_master_male-01.7afafd8c.png";
      },
      3433: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/engineer_original_female-01.64b3b602.png";
      },
      2926: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/engineer_original_male-01.aff6aff2.png";
      },
      5161: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/engineer_rookie_female-01.37524b5e.png";
      },
      4977: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/engineer_rookie_male-01.749a76d9.png";
      },
      9758: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/engineer_shokunin_female-01.acf946cc.png";
      },
      1666: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/engineer_shokunin_male-01.df36d1ef.png";
      },
      3577: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/engineer_student_female-01.1f6ccfdd.png";
      },
      2989: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/engineer_student_male-01.12e094aa.png";
      },
      6480: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/farmer_craftman_female-01.cffa6079.png";
      },
      7188: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/farmer_craftman_male-01.d61e9e38.png";
      },
      3558: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/farmer_master_female-01.1a64f681.png";
      },
      8645: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/farmer_master_male-01.965e3dbe.png";
      },
      7575: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/farmer_original_female-01.56b79a96.png";
      },
      8516: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/farmer_original_male-01.c59f473b.png";
      },
      9094: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/farmer_rookie_female-01.8c8a5ac0.png";
      },
      2177: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/farmer_rookie_male-01.a4a4bf30.png";
      },
      4760: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/farmer_shokunin_female-01.f887a3a9.png";
      },
      475: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/farmer_shokunin_male-01.1a02eb0b.png";
      },
      2634: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/farmer_student_female-01.3e96e515.png";
      },
      1389: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/farmer_student_male-01.3b59030f.png";
      },
      3201: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/fisher_craftman_female-01.6352e5cb.png";
      },
      3343: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/fisher_craftman_male-01.4e9710e0.png";
      },
      5385: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/fisher_master_female-01.aa105088.png";
      },
      3402: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/fisher_master_male-01.6b74b07d.png";
      },
      4327: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/fisher_original_female-01.da2be889.png";
      },
      667: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/fisher_original_male-01.fba2c710.png";
      },
      9013: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/fisher_rookie_female-01.7a99fc5c.png";
      },
      370: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/fisher_rookie_male-01.b5b743a7.png";
      },
      5883: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/fisher_shokunin_female-01.a8ed8627.png";
      },
      2017: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/fisher_shokunin_male-01.d3b13aa9.png";
      },
      6594: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/fisher_student_female-01.09a016da.png";
      },
      2303: function (e, i, t) {
        "use strict";
        e.exports = t.p + "img/fisher_student_male-01.94a5a5eb.png";
      },
      7067: function (e, i, t) {
        "use strict";
        e.exports = t.p + "media/music.32844fa1.mp3";
      },
    },
    i = {};
  function t(o) {
    var s = i[o];
    if (void 0 !== s) return s.exports;
    var n = (i[o] = { id: o, loaded: !1, exports: {} });
    return e[o].call(n.exports, n, n.exports, t), (n.loaded = !0), n.exports;
  }
  (t.m = e),
    (function () {
      t.amdO = {};
    })(),
    (function () {
      var e = [];
      t.O = function (i, o, s, n) {
        if (!o) {
          var l = 1 / 0;
          for (d = 0; d < e.length; d++) {
            (o = e[d][0]), (s = e[d][1]), (n = e[d][2]);
            for (var a = !0, c = 0; c < o.length; c++)
              (!1 & n || l >= n) &&
              Object.keys(t.O).every(function (e) {
                return t.O[e](o[c]);
              })
                ? o.splice(c--, 1)
                : ((a = !1), n < l && (l = n));
            if (a) {
              e.splice(d--, 1);
              var r = s();
              void 0 !== r && (i = r);
            }
          }
          return i;
        }
        n = n || 0;
        for (var d = e.length; d > 0 && e[d - 1][2] > n; d--) e[d] = e[d - 1];
        e[d] = [o, s, n];
      };
    })(),
    (function () {
      t.n = function (e) {
        var i =
          e && e.__esModule
            ? function () {
                return e["default"];
              }
            : function () {
                return e;
              };
        return t.d(i, { a: i }), i;
      };
    })(),
    (function () {
      t.d = function (e, i) {
        for (var o in i)
          t.o(i, o) &&
            !t.o(e, o) &&
            Object.defineProperty(e, o, { enumerable: !0, get: i[o] });
      };
    })(),
    (function () {
      t.g = (function () {
        if ("object" === typeof globalThis) return globalThis;
        try {
          return this || new Function("return this")();
        } catch (e) {
          if ("object" === typeof window) return window;
        }
      })();
    })(),
    (function () {
      t.hmd = function (e) {
        return (
          (e = Object.create(e)),
          e.children || (e.children = []),
          Object.defineProperty(e, "exports", {
            enumerable: !0,
            set: function () {
              throw new Error(
                "ES Modules may not assign module.exports or exports.*, Use ESM export syntax, instead: " +
                  e.id
              );
            },
          }),
          e
        );
      };
    })(),
    (function () {
      t.o = function (e, i) {
        return Object.prototype.hasOwnProperty.call(e, i);
      };
    })(),
    (function () {
      t.p = "";
    })(),
    (function () {
      var e = { 143: 0 };
      t.O.j = function (i) {
        return 0 === e[i];
      };
      var i = function (i, o) {
          var s,
            n,
            l = o[0],
            a = o[1],
            c = o[2],
            r = 0;
          if (
            l.some(function (i) {
              return 0 !== e[i];
            })
          ) {
            for (s in a) t.o(a, s) && (t.m[s] = a[s]);
            if (c) var d = c(t);
          }
          for (i && i(o); r < l.length; r++)
            (n = l[r]), t.o(e, n) && e[n] && e[n][0](), (e[n] = 0);
          return t.O(d);
        },
        o = (self["webpackChunkmakerlion"] =
          self["webpackChunkmakerlion"] || []);
      o.forEach(i.bind(null, 0)), (o.push = i.bind(null, o.push.bind(o)));
    })();
  var o = t.O(void 0, [998], function () {
    return t(4635);
  });
  o = t.O(o);
})();
//# sourceMappingURL=app.7cfc485e.js.map
