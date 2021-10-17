upload:
	${OBJCPY} -O ihex -R .eeprom ${TARGET} ${BUILD_DIR}/${INSTALL_DIR}/${PLATFORM}/${BINARY_NAME}
	avr-size --format=avr --mcu=${DEVICE} ${TARGET}
	avrdude -F -V -p ${DEVICE} -c ${PROGRAMMER} -P ${PORT} -b ${BAUD} -U flash:w:${BUILD_DIR}/${INSTALL_DIR}/${PLATFORM}/${BINARY_NAME}:i