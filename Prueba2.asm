.data
vocales:    .asciiz     "aeiou"
palabra:    .asciiz     "Palabra: "
countVocales:    .asciiz     "Vocales totales: "
str:        .space      80
    .text
    .globl  main
main:
    
    li      $v0,4
    la      $a0,palabra
    syscall

    li      $v0,8
    la      $a0,str
    li      $a1,80
    syscall

    li      $s2,0                  
    la      $s0,str                

string:
    lb      $t0,0($s0)             
    addiu   $s0,$s0,1               
    beqz    $t0,final   
    la      $s1,vocales           

vocal:
    lb      $t1,0($s1)            
    beqz    $t1,string         
    addiu   $s1,$s1,1               
    bne     $t0,$t1,vocal      
    addi    $s2,$s2,1               
    j       string           

final:
    li      $v0,4
    la      $a0,countVocales
    syscall

    li      $v0,1
    move    $a0,$s2
    syscall

    li      $v0,10
    syscall