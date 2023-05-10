#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-pic24fj128ga010_pim.mk)" "nbproject/Makefile-local-pic24fj128ga010_pim.mk"
include nbproject/Makefile-local-pic24fj128ga010_pim.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=pic24fj128ga010_pim
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/lab3_dz.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/lab3_dz.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=bsp/exp16/pic24fj128ga010_pim/adc.c bsp/exp16/pic24fj128ga010_pim/buttons.c bsp/exp16/pic24fj128ga010_pim/lcd.c bsp/exp16/pic24fj128ga010_pim/leds.c system_config/exp16/pic24fj128ga010_pim/system.c bsp/exp16/pic24fj128ga010_pim/timer_1ms.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/adc.o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/buttons.o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/lcd.o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/leds.o ${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim/system.o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/timer_1ms.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/adc.o.d ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/buttons.o.d ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/lcd.o.d ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/leds.o.d ${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim/system.o.d ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/timer_1ms.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/adc.o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/buttons.o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/lcd.o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/leds.o ${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim/system.o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/timer_1ms.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=bsp/exp16/pic24fj128ga010_pim/adc.c bsp/exp16/pic24fj128ga010_pim/buttons.c bsp/exp16/pic24fj128ga010_pim/lcd.c bsp/exp16/pic24fj128ga010_pim/leds.c system_config/exp16/pic24fj128ga010_pim/system.c bsp/exp16/pic24fj128ga010_pim/timer_1ms.c main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-pic24fj128ga010_pim.mk ${DISTDIR}/lab3_dz.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ128GA010
MP_LINKER_FILE_OPTION=,--script=p24FJ128GA010.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/adc.o: bsp/exp16/pic24fj128ga010_pim/adc.c  .generated_files/flags/pic24fj128ga010_pim/eaafb87d70850818497dbd74bf0ea1c862961f69 .generated_files/flags/pic24fj128ga010_pim/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim" 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/adc.o.d 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/exp16/pic24fj128ga010_pim/adc.c  -o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/adc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp/exp16/pic24fj128ga010_pim" -I"system_config/exp16/pic24fj128ga010_pim" -I"." -I".." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/buttons.o: bsp/exp16/pic24fj128ga010_pim/buttons.c  .generated_files/flags/pic24fj128ga010_pim/e94820cd8474ca5fcbdc033f47a0db6520521cf5 .generated_files/flags/pic24fj128ga010_pim/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim" 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/buttons.o.d 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/buttons.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/exp16/pic24fj128ga010_pim/buttons.c  -o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/buttons.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/buttons.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp/exp16/pic24fj128ga010_pim" -I"system_config/exp16/pic24fj128ga010_pim" -I"." -I".." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/lcd.o: bsp/exp16/pic24fj128ga010_pim/lcd.c  .generated_files/flags/pic24fj128ga010_pim/fb4216d4494ee9217900914acf398b1303a75f05 .generated_files/flags/pic24fj128ga010_pim/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim" 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/lcd.o.d 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/exp16/pic24fj128ga010_pim/lcd.c  -o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/lcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/lcd.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp/exp16/pic24fj128ga010_pim" -I"system_config/exp16/pic24fj128ga010_pim" -I"." -I".." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/leds.o: bsp/exp16/pic24fj128ga010_pim/leds.c  .generated_files/flags/pic24fj128ga010_pim/6eb7dee448a462b96361ab9fbf44e5e4bb4a35ba .generated_files/flags/pic24fj128ga010_pim/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim" 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/leds.o.d 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/exp16/pic24fj128ga010_pim/leds.c  -o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/leds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/leds.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp/exp16/pic24fj128ga010_pim" -I"system_config/exp16/pic24fj128ga010_pim" -I"." -I".." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim/system.o: system_config/exp16/pic24fj128ga010_pim/system.c  .generated_files/flags/pic24fj128ga010_pim/de36a1a56a3ed2e0cda3272cd69353046a67d5da .generated_files/flags/pic24fj128ga010_pim/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim" 
	@${RM} ${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim/system.o.d 
	@${RM} ${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system_config/exp16/pic24fj128ga010_pim/system.c  -o ${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp/exp16/pic24fj128ga010_pim" -I"system_config/exp16/pic24fj128ga010_pim" -I"." -I".." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/timer_1ms.o: bsp/exp16/pic24fj128ga010_pim/timer_1ms.c  .generated_files/flags/pic24fj128ga010_pim/aa6a2b44a21b467af31fbaba3dda83a6ed9cff5c .generated_files/flags/pic24fj128ga010_pim/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim" 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/timer_1ms.o.d 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/timer_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/exp16/pic24fj128ga010_pim/timer_1ms.c  -o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/timer_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/timer_1ms.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp/exp16/pic24fj128ga010_pim" -I"system_config/exp16/pic24fj128ga010_pim" -I"." -I".." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/pic24fj128ga010_pim/31536f1900c11a7488c3451178a5536a476dd4dd .generated_files/flags/pic24fj128ga010_pim/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp/exp16/pic24fj128ga010_pim" -I"system_config/exp16/pic24fj128ga010_pim" -I"." -I".." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/adc.o: bsp/exp16/pic24fj128ga010_pim/adc.c  .generated_files/flags/pic24fj128ga010_pim/2c3aba2ee4c03e372d241b6b650ceef9bebcc3f5 .generated_files/flags/pic24fj128ga010_pim/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim" 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/adc.o.d 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/exp16/pic24fj128ga010_pim/adc.c  -o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/adc.o.d"        -g -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp/exp16/pic24fj128ga010_pim" -I"system_config/exp16/pic24fj128ga010_pim" -I"." -I".." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/buttons.o: bsp/exp16/pic24fj128ga010_pim/buttons.c  .generated_files/flags/pic24fj128ga010_pim/11a44d57e25d9c741e31141e03070144ca9b8a36 .generated_files/flags/pic24fj128ga010_pim/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim" 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/buttons.o.d 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/buttons.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/exp16/pic24fj128ga010_pim/buttons.c  -o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/buttons.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/buttons.o.d"        -g -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp/exp16/pic24fj128ga010_pim" -I"system_config/exp16/pic24fj128ga010_pim" -I"." -I".." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/lcd.o: bsp/exp16/pic24fj128ga010_pim/lcd.c  .generated_files/flags/pic24fj128ga010_pim/a7e9696f37f3f3fac4dbe2079dcb84a5a48ed1b8 .generated_files/flags/pic24fj128ga010_pim/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim" 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/lcd.o.d 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/exp16/pic24fj128ga010_pim/lcd.c  -o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/lcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/lcd.o.d"        -g -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp/exp16/pic24fj128ga010_pim" -I"system_config/exp16/pic24fj128ga010_pim" -I"." -I".." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/leds.o: bsp/exp16/pic24fj128ga010_pim/leds.c  .generated_files/flags/pic24fj128ga010_pim/d5b17f9b473d3c3a7185fd07c695befa0e66ba5e .generated_files/flags/pic24fj128ga010_pim/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim" 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/leds.o.d 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/exp16/pic24fj128ga010_pim/leds.c  -o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/leds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/leds.o.d"        -g -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp/exp16/pic24fj128ga010_pim" -I"system_config/exp16/pic24fj128ga010_pim" -I"." -I".." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim/system.o: system_config/exp16/pic24fj128ga010_pim/system.c  .generated_files/flags/pic24fj128ga010_pim/1684b8694451340c33ac8dc3ff197ff7a00d87b3 .generated_files/flags/pic24fj128ga010_pim/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim" 
	@${RM} ${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim/system.o.d 
	@${RM} ${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system_config/exp16/pic24fj128ga010_pim/system.c  -o ${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system_config/exp16/pic24fj128ga010_pim/system.o.d"        -g -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp/exp16/pic24fj128ga010_pim" -I"system_config/exp16/pic24fj128ga010_pim" -I"." -I".." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/timer_1ms.o: bsp/exp16/pic24fj128ga010_pim/timer_1ms.c  .generated_files/flags/pic24fj128ga010_pim/23320aa9abaa54f12d36db1fed631ee17592af76 .generated_files/flags/pic24fj128ga010_pim/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim" 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/timer_1ms.o.d 
	@${RM} ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/timer_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/exp16/pic24fj128ga010_pim/timer_1ms.c  -o ${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/timer_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/exp16/pic24fj128ga010_pim/timer_1ms.o.d"        -g -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp/exp16/pic24fj128ga010_pim" -I"system_config/exp16/pic24fj128ga010_pim" -I"." -I".." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/pic24fj128ga010_pim/d4b34a5d1009256954779b6558965b7ec01016d5 .generated_files/flags/pic24fj128ga010_pim/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"bsp/exp16/pic24fj128ga010_pim" -I"system_config/exp16/pic24fj128ga010_pim" -I"." -I".." -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/lab3_dz.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/lab3_dz.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--no-isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/lab3_dz.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/lab3_dz.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_pic24fj128ga010_pim=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--no-isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/lab3_dz.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
