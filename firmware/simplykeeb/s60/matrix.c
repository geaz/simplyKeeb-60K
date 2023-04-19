#include QMK_KEYBOARD_H
#include "matrix.h"
#include "pca9555.h"
#include "i2c_master.h"

static uint8_t matrix_row_pins_mcu[MATRIX_ROWS_PER_SIDE] = MATRIX_ROW_PINS_L;
static uint8_t matrix_col_pins_mcu[MATRIX_COLS_PER_SIDE] = MATRIX_COL_PINS_L;
static uint8_t matrix_row_pins_pca[MATRIX_ROWS_PER_SIDE] = MATRIX_ROW_PINS_R;
static uint8_t matrix_col_pins_pca[MATRIX_COLS_PER_SIDE] = MATRIX_COL_PINS_R;

matrix_row_t read_row_left(matrix_row_t last_row_value, matrix_row_t current_row_value, uint8_t current_row) {
    pin_t current_row_pin = matrix_row_pins_mcu[current_row];
    writePinLow(current_row_pin);
    matrix_io_delay(); // wait for pin stabilization

    for (uint8_t current_col = 0; current_col < MATRIX_COLS_PER_SIDE; current_col++) {
        uint8_t pin_state = readPin(matrix_col_pins_mcu[current_col]);
        if(!pin_state) { // If LOW is read, the key for the current column and row combination was pressed
            current_row_value = current_row_value | (MATRIX_ROW_SHIFTER << current_col);
        }
    }

    writePinHigh(current_row_pin);
    return current_row_value;
}

matrix_row_t read_row_right(matrix_row_t last_row_value, matrix_row_t current_row_value, uint8_t current_row) {
    pin_t current_row_pin = matrix_row_pins_pca[current_row];
    pca9555_set_output(RIGHT_HALF, PCA9555_PORT1, ALL_HIGH & (~current_row_pin));

    for (uint8_t current_col = 0; current_col < MATRIX_COLS_PER_SIDE; current_col++) {
        uint8_t pin_state = 0;
        pca9555_readPins(RIGHT_HALF, PCA9555_PORT0, &pin_state);
        
        if(!(pin_state & matrix_col_pins_pca[current_col])) { // If LOW is read, the key for the current column and row combination was pressed
            current_row_value = current_row_value | (MATRIX_ROW_SHIFTER << (current_col + MATRIX_COLS_PER_SIDE)); // offset by the number of left side cols (MATRIX_COLS_PER_SIDE)
        }
    }

    return current_row_value;
}

void matrix_init(void) {
    pca9555_init(RIGHT_HALF);

    // Init PCA9555 Pins
    pca9555_set_config(RIGHT_HALF, PCA9555_PORT0, ALL_INPUT); // Set all Port 0 Pins to input (columns)
    pca9555_set_config(RIGHT_HALF, PCA9555_PORT1, ALL_OUTPUT); // Set all Port 1 pins to output (rows + leds)    
    pca9555_set_output(RIGHT_HALF, PCA9555_PORT1, ALL_HIGH); // All HIGH per  default

    // Init MCU Pins
    uint8_t matrix_row_pins_mcu[MATRIX_ROWS_PER_SIDE] = MATRIX_ROW_PINS_L;
    uint8_t matrix_col_pins_mcu[MATRIX_COLS_PER_SIDE] = MATRIX_COL_PINS_L;

    for (int current_col = 0; current_col < MATRIX_COLS_PER_SIDE; current_col++) {
        pin_t pin = matrix_col_pins_mcu[current_col];
        setPinInputHigh(pin); // column pins are HIGH per default. If a column pin is LOW during the read_row, the key on this column and row was pressed.
    }

    for (int current_row = 0; current_row < MATRIX_ROWS_PER_SIDE; current_row++) {
        pin_t pin = matrix_row_pins_mcu[current_row];
        setPinOutput(pin);
        writePinHigh(pin);
    }
}

bool matrix_scan_custom(matrix_row_t current_matrix[]) {
    bool changed = false;

    for (uint8_t current_row = 0; current_row < MATRIX_ROWS; current_row++) {
        matrix_row_t last_row_value = current_matrix[current_row];
        matrix_row_t current_row_value = 0;

        current_row_value = read_row_left(last_row_value, current_row_value, current_row);
        current_row_value = read_row_right(last_row_value, current_row_value, current_row);

        current_matrix[current_row] = current_row_value;
        changed = changed || current_row_value != last_row_value;
    }

    return changed;
}
