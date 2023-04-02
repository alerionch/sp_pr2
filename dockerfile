FROM ubuntu

RUN apt-get update && apt-get install -y nasm && apt -y install build-essential

COPY program_asm.asm .

RUN nasm -g -F dwarf -f elf64 program_asm.asm && gcc -m64 -o output program_asm.o -no-pie

CMD ./output
