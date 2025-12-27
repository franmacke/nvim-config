local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- ======================
-- BASE UML SNIPPETS
-- ======================

ls.add_snippets("plantuml", {

  -- basic uml
  s("uml", {
    t({ "@startuml", "" }),
    i(1),
    t({ "", "@enduml" }),
  }),

  -- ======================
  -- SEQUENCE DIAGRAM
  -- ======================

  s("seq", {
    t({ "@startuml", "" }),
    i(1),
    t({ "", "@enduml" }),
  }),

  -- participants
  s("actor", {
    t("actor "),
    i(1, "User"),
  }),

  s("participant", {
    t("participant "),
    i(1, "Service"),
  }),

  s("boundary", {
    t("boundary "),
    i(1, "API"),
  }),

  s("control", {
    t("control "),
    i(1, "Controller"),
  }),

  s("entity", {
    t("entity "),
    i(1, "Entity"),
  }),

  s("database", {
    t("database "),
    i(1, "DB"),
  }),

  -- ======================
  -- MESSAGES / ARROWS
  -- ======================

  s("msg", {
    i(1, "A"),
    t(" -> "),
    i(2, "B"),
    t(": "),
    i(3, "request"),
  }),

  s("async", {
    i(1, "A"),
    t(" ->> "),
    i(2, "B"),
    t(": "),
    i(3, "async call"),
  }),

  s("return", {
    i(1, "B"),
    t(" --> "),
    i(2, "A"),
    t(": "),
    i(3, "response"),
  }),

  -- ======================
  -- ACTIVATION
  -- ======================

  s("activate", {
    t("activate "),
    i(1),
  }),

  s("deactivate", {
    t("deactivate "),
    i(1),
  }),

  -- ======================
  -- BLOCKS
  -- ======================

  s("alt", {
    t({ "alt " }),
    i(1, "condition"),
    t({ "", "" }),
    i(2),
    t({ "", "else", "" }),
    i(3),
    t({ "", "end" }),
  }),

  s("opt", {
    t({ "opt " }),
    i(1, "optional"),
    t({ "", "" }),
    i(2),
    t({ "", "end" }),
  }),

  s("loop", {
    t({ "loop " }),
    i(1, "repeat"),
    t({ "", "" }),
    i(2),
    t({ "", "end" }),
  }),

  s("par", {
    t({ "par " }),
    i(1, "parallel"),
    t({ "", "" }),
    i(2),
    t({ "", "end" }),
  }),

  -- ======================
  -- NOTES
  -- ======================

  s("noteover", {
    t({ "note over " }),
    i(1, "A,B"),
    t({ "", "" }),
    i(2),
    t({ "", "end note" }),
  }),

  s("noteleft", {
    t({ "note left of " }),
    i(1),
    t({ "", "" }),
    i(2),
    t({ "", "end note" }),
  }),

  s("noteright", {
    t({ "note right of " }),
    i(1),
    t({ "", "" }),
    i(2),
    t({ "", "end note" }),
  }),

  -- ======================
  -- MISC
  -- ======================

  s("autonumber", {
    t("autonumber"),
  }),

})
