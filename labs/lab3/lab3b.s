@ lab3a.s calculator - float only

.global main
.func main



.text
main:
    push {r4-r12, lr}       @ Saving the Registers
    mov r12, #1


loop:
    cmp r12, #0
    beq done

    ldr r0, =calculator
    bl printf

    @ saving user input
    sub sp, sp, #4        @ Making space in the stack
    ldr r0, =inputFormat  @ Loading the address of the format in R0
    mov r1, sp            @ Moving the address of the new space into R1
    bl scanf              @ Calling scanf
    ldr r1, [sp]          @ Get the value captured by scanf into r1
    mov r12, r1           @ save the option to r12
    add sp, sp, #4        @ Restoring the SP to its original state

    @use switch statement to check the proper calculator function
    switch:
        cmp r12, #1
        beq case1
        cmp r12, #2
        beq case2
        cmp r12, #3
        beq case3
        b default


        case1:      @add
            ldr r0, =addStr
            bl printf

            ldr r0, =entryOne
            bl printf
            @ saving user input
            sub sp, sp, #4        @ Making space in the stack
            ldr r0, =inputFormat  @ Loading the address of the format in R0
            mov r1, sp            @ Moving the address of the new space into R1
            bl scanf              @ Calling scanf
            ldr r1, [sp]          @ Get the value captured by scanf into r1
            mov r2, r1            @ saving first number
            add sp, sp, #4        @ Restoring the SP to its original state


            ldr r0, =entryTwo
            bl printf
            @ saving user input
            sub sp, sp, #4        @ Making space in the stack
            ldr r0, =inputFormat  @ Loading the address of the format in R0
            mov r1, sp            @ Moving the address of the new space into R1
            bl scanf              @ Calling scanf
            ldr r1, [sp]          @ Get the value captured by scanf into r1
            mov r3, r1            @ saving second number
            add sp, sp, #4        @ Restoring the SP to its original state


            @ computing the result
            add r4, r2, r3
            ldr r0, =result
            mov r1, r4
            bl printf

            bal break

        case2:      @sub
            ldr r0, =subStr
            bl printf

            ldr r0, =entryOne
            bl printf
            @ saving user input
            sub sp, sp, #4        @ Making space in the stack
            ldr r0, =inputFormat  @ Loading the address of the format in R0
            mov r1, sp            @ Moving the address of the new space into R1
            bl scanf              @ Calling scanf
            ldr r1, [sp]          @ Get the value captured by scanf into r1
            mov r2, r1            @ saving first number
            add sp, sp, #4        @ Restoring the SP to its original state


            ldr r0, =entryTwo
            bl printf
            @ saving user input
            sub sp, sp, #4        @ Making space in the stack
            ldr r0, =inputFormat  @ Loading the address of the format in R0
            mov r1, sp            @ Moving the address of the new space into R1
            bl scanf              @ Calling scanf
            ldr r1, [sp]          @ Get the value captured by scanf into r1
            mov r3, r1            @ saving second number
            add sp, sp, #4        @ Restoring the SP to its original state


            @ computing the result
            sub r4, r2, r3
            ldr r0, =result
            mov r1, r4
            bl printf

            bal break

        case3:      @multiply
            ldr r0, =mulStr
            bl printf

            ldr r0, =entryOne
            bl printf
            @ saving user input
            sub sp, sp, #4        @ Making space in the stack
            ldr r0, =inputFormat  @ Loading the address of the format in R0
            mov r1, sp            @ Moving the address of the new space into R1
            bl scanf              @ Calling scanf
            ldr r1, [sp]          @ Get the value captured by scanf into r1
            mov r2, r1            @ saving first number
            add sp, sp, #4        @ Restoring the SP to its original state


            ldr r0, =entryTwo
            bl printf
            @ saving user input
            sub sp, sp, #4        @ Making space in the stack
            ldr r0, =inputFormat  @ Loading the address of the format in R0
            mov r1, sp            @ Moving the address of the new space into R1
            bl scanf              @ Calling scanf
            ldr r1, [sp]          @ Get the value captured by scanf into r1
            mov r3, r1            @ saving second number
            add sp, sp, #4        @ Restoring the SP to its original state


            @ computing the result
            mul r4, r2, r3
            ldr r0, =result
            mov r1, r4
            bl printf

            bal break

        default:    @exit
            bal break

        break:
            bal loop

done:
    pop {r4-r12, pc}        @ Restoring registers

_exit:
    mov pc, lr


.data

addStr:         .asciz "--- Add ---\n"
subStr:         .asciz "--- Subtract ---\n"
mulStr:         .asciz "--- Multiply ---\n"
entryOne:       .asciz "Enter the first number: "
inputFormat:    .ascii "%d"
entryTwo:       .asciz "Enter the second number: "
result:         .asciz "The result is: %d.\n\n"
calculator:
    .asciz "Calculator\n\t1) Add\n\t2) Subtract\n\t3) Multiply\n\t0) Exit\n\nChoose your option:"


