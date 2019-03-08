.data
newline: .asciz"\n"
mystringdata: .asciz"%d"
mydata: .word 0
string: .asciz"Enter a number:"
.text
.global main
.extern printf
main:
push {ip,lr}
ldr r0,=string
bl printf
ldr r1,addr_of_mydata
ldr r0,=mystringdata
bl scanf

ldr r1,addr_of_mydata
ldr r1,[r1]
mov r4,r1
mov r5,#1
second:
mov r6,#1
first:
ldr r0,=mystringdata
mov r1,r6
bl printf

add r6,r6,#1
cmp r5,r6
bge first
add r5,r5,#1
cmp r4,r5
bge add_new_line

ldr r0,=newline
bl printf
pop {ip,pc}

b end

addr_of_mydata: .word mydata
add_new_line:
ldr r0,=newline
bl printf
b second

end:
