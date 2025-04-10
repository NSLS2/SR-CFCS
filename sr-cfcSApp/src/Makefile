TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = sr-cfcS
# sr-cfcS.dbd will be created and installed
DBD += sr-cfcS.dbd

# sr-cfcS.dbd will be made up from these files:
sr-cfcS_DBD += base.dbd

# Include dbd files from all support applications:
sr-cfcS_DBD += menuScan.dbd
sr-cfcS_DBD += system.dbd
sr-cfcS_DBD += asyn.dbd
sr-cfcS_DBD += calcSupport.dbd
sr-cfcS_DBD += okSupport.dbd
sr-cfcS_DBD += asSupport.dbd
sr-cfcS_DBD += stdSupport.dbd
sr-cfcS_DBD += devFileWaveform.dbd
sr-cfcS_DBD += devIocStats.dbd
sr-cfcS_DBD += okSNoASub.dbd
sr-cfcS_DBD += caPutLog.dbd
sr-cfcS_DBD += reccaster.dbd

USR_CPPFLAGS += -I$(OK)  -D_X86_64_ -DUNIX -DLINUX

# Add all the support libraries needed by this IOC
sr-cfcS_LIBS += llrfapp asyn autosave devIocStats calc sscan std caPutLog seq pv reccaster pvDatabase qsrv pvaClient pvAccessIOC pvAccess pvAccessCA nt pvData

sr-cfcS_SYS_LIBS += okFrontPanel

USR_LDFLAGS += -L$(OK)

# sr-cfcS_registerRecordDeviceDriver.cpp derives from sr-cfcS.dbd
sr-cfcS_SRCS += sr-cfcS_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
sr-cfcS_SRCS_DEFAULT += sr-cfcSMain.cpp
sr-cfcS_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#sr-cfcS_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

LIBRARY_IOC += llrfapp

llrfapp_SRCS += okiface.cpp
llrfapp_SRCS += llrfPort.cpp
llrfapp_SRCS += calc.c
llrfapp_SRCS += devFileWaveform.c
llrfapp_SRCS += devFileWaveform0.c
llrfapp_SRCS += okSNoASub.c

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    sr-cfcS_LIBS += qsrv
    sr-cfcS_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    sr-cfcS_DBD  += PVAServerRegister.dbd
    sr-cfcS_DBD  += qsrv.dbd
endif

# Finally link to the EPICS Base libraries
sr-cfcS_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

