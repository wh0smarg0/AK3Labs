.global lab1
.syntax unified

// Задаємо тестові константи
#define A #3
#define B #4
#define C #2

lab1:
    push {lr}

    // Завантажуємо змінні a, b, c у регістри r0, r1, r2
    mov r0, A
    mov r1, B
    mov r2, C

    bl calc_var4    // Перехід до обчислення

    pop {pc}

calc_var4:
    push {r3, r4, lr}   // Зберігаємо регістри в стек

    // Попередні обчислення
    mul r3, r0, r1      // r3 = a * b
    orr r4, r0, r1      // r4 = a | b

    // Перевірка умови
    cmp r3, #10         // Порівнюємо (a * b) з 10

    ITE GE              
    mulGE r5, r4, r2    // THEN: if (a*b) >= 10 do r5 = (a | b) * c
    mulLT r5, r3, r2    // ELSE: if (a*b) < 10 do r5 = (a * b) * c

    pop {r3, r4, pc}
