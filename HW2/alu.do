do wave.do

#undefined opcode
force in_a     16#00
force in_b     16#00
force opcode 16#XX
run 20

# add opcode
force in_a     16#00
force in_b     16#00
force opcode 16#00
run 20

# add opcode
force in_a     16#10
force in_b     16#10
force opcode 16#01
run 20

# add opcode
#should cause a carry
force in_a     16#F0
force in_b     16#F0
force opcode 16#01
run 20

# sub opcode
force in_a     16#00
force in_b     16#00
force opcode 16#02
run 20

# sub opcode
force in_a     16#10
force in_b     16#05
force opcode 16#02
run 20

# sub add opcode
#should cause a carry
force in_a     16#05
force in_b     16#10
force opcode 16#02
run 20

# inc opcode
force in_a     16#05
force in_b     16#XX
force opcode 16#03
run 20

# dec opcode
force in_a     16#05
force in_b     16#XX
force opcode 16#04
run 20

# or opcode
#should cause output of FF
force in_a     16#a5
force in_b     16#5a
force opcode 16#05
run 20

# and opcode
#should cause output of 00
#should assert zero
force in_a     16#F0
force in_b     16#0F
force opcode 16#06
run 20

# xor opcode
#should cause output of F0
force in_a     16#aF
force in_b     16#5F
force opcode 16#07
run 20

# shr opcode
#should cause output of 1E
force in_a     16#3C
force in_b     16#XX
force opcode 16#08
run 20

# shl opcode
#should cause output of 68
force in_a     16#5A
force in_b     16#XX
force opcode 16#09
run 20

# onescomp  opcode
#should cause output of AF
force in_a     16#50
force in_b     16#XX
force opcode 16#0A
run 20

# twoscomp  opcode
#should cause output of FB
force in_a     16#05
force in_b     16#XX
force opcode 16#0B
run 20
