# Dedendências

```bash
$ sudo apt-get install gcc-avr binutils-avr avr-libc avrdude
```

# Compilar para PC
## Compilando
```bash
$ make PLATFORM=pc
```

## Executando
```bash
$ cd build/bin
$ ./blink_pc 
```

# Compilar para Arduino
## Compilando
```bash
$ make PLATFORM=arduino
$ cd build
$ make 
```
## Gravando 
```bash
$ make upload
```