.data
guess_num: .word 0
data_format: .asciz"%d"
newline: .asciz"\n"
guess: .asciz"Guess the number:"
too_high: .asciz"Too high. Guess again. "
too_low: .asciz"Too low. Guess again. "
found: .asciz"You guessed correctly in %d tries!\n"
.text
.global main
.extern printf
main:
push {ip,lr}

mov r0,#0
bl time
bl srand
bl rand
mov r1,#10
bl __aeabi_idivmod
add r1,r1,#1
mov r5,r1

mov r6,#1
ldr r0,=guess
bl printf
search:
ldr r1,guess_num_addr
ldr r0,=data_format
bl scanf
ldr r1,guess_num_addr
ldr r1,[r1]
cmp r1,r5
beq print_found
add r6,r6,#1
cmp r1,r5
bge print_greater
b print_lesser

print_found:
mov r1,r6
ldr r0,=found
bl printf
b end

print_greater:
ldr r0,=too_high
bl printf
b search

print_lesser:
ldr r0,=too_low
bl printf
b search

end:
pop {ip,pc}

guess_num_addr: .word guess_num
