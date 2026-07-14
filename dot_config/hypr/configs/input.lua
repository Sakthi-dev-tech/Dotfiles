---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout    = "us",
    kb_variant   = "",
    kb_model     = "",
    kb_options   = "",
    kb_rules     = "",

    follow_mouse = 1,

    sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad     = {
      natural_scroll = true,
      disable_while_typing = true
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

hl.gesture({
  fingers = 4,
  direction = "down",
  action = function()
    hl.exec_cmd("playerctl play-pause")
  end
})

hl.gesture({
  fingers = 4,
  direction = "right",
  action = function()
    hl.exec_cmd("playerctl next")
  end
})

hl.gesture({
  fingers = 4,
  direction = "left",
  action = function()
    hl.exec_cmd("playerctl previous")
  end
})
-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more

-- Lenovo Trackpad
hl.device {
  name = "syna2ba6:00-06cb:cfd8-touchpad",
  sensitivity = 0.68
}
