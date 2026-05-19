
-------------
--- INPUT ---
-------------

-- kanata
hl.device {
    name = 'kanata',
    kb_layout = 'us_intl',
}
hl.device {
    name = 'kanata-2',
    kb_layout = 'br',
}

-- meu teclado externo
hl.device {
    name = 'casue-usb-kb',
    kb_layout = 'br'
}

-- dell keyboard
hl.device {
    name = 'dell-computer-corp-dell-universal-receiver',
    kb_layout = 'br'
}
hl.device {
    name = 'dell-computer-corp-dell-universal-receiver-system-control',
    kb_layout = 'br',
}
hl.device {
    name = 'dell-computer-corp-dell-universal-receiver-consumer-control',
    kb_layout = 'br'
}

-- trackpoint
hl.device {
    name = 'tpps/2-ibm-trackpoint',
    sensitivity = '+1.0'
}

-- gestures
hl.gesture({ fingers = 3, direction = 'horizontal', action = 'workspace'})
hl.gesture({ fingers = 3, direction = 'up', action = 'float', scale = '1.5'})
-- gesture(4, left, dispatcher, movefocus, r)
-- gesture(4, right, dispatcher, movefocus, l)
hl.gesture({ fingers = 4, direction = 'swipe', action = 'move'})
-- gesture = 2, pinchin, cursorZoom
