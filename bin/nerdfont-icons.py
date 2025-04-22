#! /usr/bin/python3

print('# Nerd - Pomicons:')
for c in range(0xe000, 0xe00b):
    print(f'{hex(c)} - {chr(c)}')

print('# Nerd - Powerline + extra:')
for c in range(0xe0a0, 0xe0a4):
    print(f'{hex(c)} - {chr(c)}')
for c in range(0xe0b0, 0xe0c9):
    print(f'{hex(c)} - {chr(c)}')

print('# Nerd - Symbols:')
for c in range(0xe5fa, 0xe62b):
    print(f'{hex(c)} - {chr(c)}')

print('# Nerd - Devicons:')
for c in range(0xe700, 0xe7c6):
    print(f'{hex(c)} - {chr(c)}')

print('# Nerd - Font Awesome:')
for c in range(0xf000, 0xf296):
    print(f'{hex(c)} - {chr(c)}')

print('# Nerd - Octicons:')
for c in range(0xf400, 0xf4aa):
    print(f'{hex(c)} - {chr(c)}')

print('# Nerd - Font Linux:')
for c in range(0xf300, 0xf316):
    print(f'{hex(c)} - {chr(c)}')
