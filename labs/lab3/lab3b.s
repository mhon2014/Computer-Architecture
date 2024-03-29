@ lab3a.s calculator - float only

.global main
.func main



.text
main:
    PUSH {R0, LR}     @ Saving the Registers
    mov r8, #1


loop:
    cmp r8, #0
    beq done

    ldr r0, =calculator
    bl printf

    @ saving user input
    sub sp, sp, #4        @ Making space in the stack
    ldr r0, =inputFormat  @ Loading the address of the format in R0
    mov r1, sp            @ Moving the address of the new space into R1
    bl scanf              @ Calling scanf
    ldr r8, [sp]          @ Get the value captured by scanf into r8
    @ mov r8, r1           @ save the option to r8
    add sp, sp, #4        @ Restoring the SP to its original state

    @use switch statement to check the proper calculator function
    switch:
        cmp r8, #1
        beq case1
        cmp r8, #2
        beq case2
        cmp r8, #3
        beq case3
        cmp r8, #4
        beq case4
        b default


        case1:      @add
            ldr r0, =addStr
            bl printf

            ldr r0, =entryOne
            bl printf
            @ saving user input
            sub sp, sp, #8              @ Making space in the stack
            ldr r0, =inputFormatFloat   @ Loading the address of the format in R0
            mov r1, sp                  @ Moving the address of the new space into R1
            bl scanf                    @ Calling scanf
            vldr s2, [sp]                @ Get the value captured by scanf into r1
            @ vmov s2, s1                  @ saving first number
            @ add sp, sp, #8              @ Restoring the SP to its original state
            vcvt.f64.f32 d2, s2


            ldr r0, =entryTwo
            bl printf
            @ saving user input
            sub sp, sp, #8             @ Making space in the stack
            ldr r0, =inputFormatFloat   @ Loading the address of the format in R0
            mov r1, sp                  @ Moving the address of the new space into R1
            bl scanf                    @ Calling scanf
            vldr s3, [sp]                @ Get the value captured by scanf into r1
            @ vmov s3, s1                  @ saving second number
            @ add sp, sp, #8              @ Restoring the SP to its original state
            vcvt.f64.f32 d3, s3


            @ computing the result
            vadd.f64 d0, d2, d3
            vmov r2, r3, d0
            ldr r0, =result
            bl printf
            add sp, sp, #16       @ restoring sp to its original position
            bal break

        case2:      @sub
            ldr r0, =subStr
            bl printf

            ldr r0, =entryOne
            bl printf
            @ saving user input
            sub sp, sp, #8              @ Making space in the stack
            ldr r0, =inputFormatFloat   @ Loading the address of the format in R0
            mov r1, sp                  @ Moving the address of the new space into R1
            bl scanf                    @ Calling scanf
            vldr s2, [sp]                @ Get the value captured by scanf into r1
            @ vmov s2, s1                  @ saving first number
            @ add sp, sp, #8              @ Restoring the SP to its original state
            vcvt.f64.f32 d2, s2


            ldr r0, =entryTwo
            bl printf
            @ saving user input
            sub sp, sp, #8              @ Making space in the stack
            ldr r0, =inputFormatFloat   @ Loading the address of the format in R0
            mov r1, sp                  @ Moving the address of the new space into R1
            bl scanf                    @ Calling scanf
            vldr s3, [sp]                @ Get the value captured by scanf into r1
            @ vmov s3, s1                  @ saving second number
            @ add sp, sp, #8              @ Restoring the SP to its original state
            vcvt.f64.f32 d3, s3


            @ computing the result
            vsub.f64 d0, d2, d3
            vmov r2, r3, d0
            ldr r0, =result
            bl printf
            add sp, sp, #16       @ restoring sp to its original position
            bal break

        case3:      @multiply
            ldr r0, =mulStr
            bl printf

            ldr r0, =entryOne
            bl printf
            @ saving user input
            sub sp, sp, #8              @ Making space in the stack
            ldr r0, =inputFormatFloat   @ Loading the address of the format in R0
            mov r1, sp                  @ Moving the address of the new space into R1
            bl scanf                    @ Calling scanf
            vldr s2, [sp]                @ Get the value captured by scanf into r1
            @ vmov s2, s1                  @ saving first number
            @ add sp, sp, #8              @ Restoring the SP to its original state
            vcvt.f64.f32 d2, s2


            ldr r0, =entryTwo
            bl printf
            @ saving user input
            sub sp, sp, #8              @ Making space in the stack
            ldr r0, =inputFormatFloat   @ Loading the address of the format in R0
            mov r1, sp                  @ Moving the address of the new space into R1
            bl scanf                    @ Calling scanf
            vldr s3, [sp]                @ Get the value captured by scanf into r1
            @ vmov s3, s1                  @ saving second number
            @ add sp, sp, #8              @ Restoring the SP to its original state
            vcvt.f64.f32 d3, s3


            @ computing the result
            vmul.f64 d0, d2, d3
            vmov r2, r3, d0
            ldr r0, =result
            bl printf
            add sp, sp, #16       @ restoring sp to its original position
            bal break
        
        case4:      @add
            ldr r0, =divStr
            bl printf

            ldr r0, =entryOne
            bl printf
            @ saving user input
            sub sp, sp, #8              @ Making space in the stack
            ldr r0, =inputFormatFloat   @ Loading the address of the format in R0
            mov r1, sp                  @ Moving the address of the new space into R1
            bl scanf                    @ Calling scanf
            vldr s2, [sp]                @ Get the value captured by scanf into r1
            @ vmov s2, s1                  @ saving first number
            @ add sp, sp, #8              @ Restoring the SP to its original state
            vcvt.f64.f32 d2, s2


            ldr r0, =entryTwo
            bl printf
            @ saving user input
            sub sp, sp, #8              @ Making space in the stack
            ldr r0, =inputFormatFloat   @ Loading the address of the format in R0
            mov r1, sp                  @ Moving the address of the new space into R1
            bl scanf                    @ Calling scanf
            vldr s3, [sp]                @ Get the value captured by scanf into r1
            @ vmov s3, s1                  @ saving second number
            @ add sp, sp, #8              @ Restoring the SP to its original state
            vcvt.f64.f32 d3, s3


            @ computing the result
            vdiv.f64 d0, d2, d3
            vmov r2, r3, d0
            ldr r0, =result
            bl printf
            add sp, sp, #16       @ restoring sp to its original position

            bal break

        default:    @exit
            bal break

        break:
            
            bal loop

done:
    POP {R0, PC}      @ Restoring the Registers

_exit:
    mov pc, lr


.data

addStr:             .asciz "--- Add ---\n"
subStr:             .asciz "--- Subtract ---\n"
mulStr:             .asciz "--- Multiply ---\n"
divStr:             .asciz "--- Division ---\n"
entryOne:           .asciz "Enter the first number: "
inputFormat:        .asciz "%d"
inputFormatFloat:   .asciz "%f"
entryTwo:           .asciz "Enter the second number: "
result:             .asciz "The result is: %f.\n\n"
calculator:
    .asciz "Calculator\n\t1) Add\n\t2) Subtract\n\t3) Multiply\n\t4) Divide\n\t0) Exit\n\nChoose your option:"


