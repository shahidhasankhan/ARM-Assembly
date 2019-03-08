.data
string1: .asciz"Enter a number:"
string2: .asciz"Enter a number to search:"
string3: .asciz"Number is found at index:%d\n"
string4: .asciz"Number not found\n"
newline: .asciz"\n"
string_data: .asciz"%d"
input_array: .word 0,0,0,0,0,0,0,0,0,0
number_to_search: .word 0
.text
.global main
.extern printf
.extern scanf
main:
push {ip,lr}
mov r4,#0
phase1:
cmp r4,#10
beq phase2
ldr r0,=string1
bl printf

ldr r2,input_array_addr
mov r5,#4
mul r3,r4,r5
add r1,r2,r3
ldr r0,=string_data
bl scanf
add r4,r4,#1
b phase1

phase2:

ldr r0,=string2
bl printf
ldr r1,number_to_search_addr
ldr r0,=string_data
bl scanf

phase3:
ldr r2,input_array_addr
mov r5,#4
ldr r7,number_to_search_addr
ldr r7,[r7]
mov r4,#0
search:
cmp r4,#10
beq not_found_end
mul r3,r4,r5
add r1,r2,r3
ldr r1,[r1]
cmp r1,r7
beq found_end
add r4,r4,#1
b search

not_found_end:
ldr r0,=string4
bl printf
b end

found_end:
mov r1,r4
add r1,r1,#1
ldr r0,=string3
bl printf
b end

end:
ldmfd sp!, {fp,pc}
pop {ip,pc}

input_array_addr: .word input_array
number_to_search_addr: .word number_to_search
