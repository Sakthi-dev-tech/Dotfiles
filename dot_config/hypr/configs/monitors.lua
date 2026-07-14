------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = "auto",
})

-- MacBook Air Monitor
hl.monitor({
  output   = "eDP-1",
  mode     = "preferred",
  position = "auto",
  scale    = "1.6",
})

-- Lenovo Monitor
hl.monitor({
  output   = "desc:China Star Optoelectronics Technology Co. Ltd 0x1512 0x00005301",
  mode = "preferred",
  position = "auto",
  scale    = 1.6,
})
