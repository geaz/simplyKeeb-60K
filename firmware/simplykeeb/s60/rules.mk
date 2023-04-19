CUSTOM_MATRIX = lite

VPATH += drivers/gpio
SRC += matrix.c pca9555.c
QUANTUM_LIB_SRC += i2c_master.c