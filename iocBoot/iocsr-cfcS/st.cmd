#!../../bin/linux-x86_64/sr-cfcS

#- You may have to change sr-cfcS to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES", "33554434")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST","NO")
epicsEnvSet("EPICS_CA_ADDR_LIST","10.0.153.255")
epicsEnvSet("EPICS_CAS_AUTO_BEACON_ADDR_LIST","NO")
epicsEnvSet("EPICS_CAS_BEACON_ADDR_LIST","10.0.153.255")
epicsEnvSet("EPICS_TZ", "EST5EDT,M3.2.0/2,M11.1.0/2")

## Register all support components
dbLoadDatabase "dbd/sr-cfcS.dbd"
sr_cfcS_registerRecordDeviceDriver pdbbase

pwd
#system("export LD_LIBRARY_PATH=$(EPICS_BASE)/lib/linux-x86_64:$(TOP)/lib/linux-x86_64:$LD_LIBRARY_PATH;$(TOP)/bin/linux-x86_64/okLoad_bitfile 13130005RX Roger.bit")

system("export LD_LIBRARY_PATH=$(EPICS_BASE)/lib/linux-x86_64:$(TOP)/lib/linux-x86_64:$LD_LIBRARY_PATH;$(TOP)/bin/linux-x86_64/okLoad_bitfile 13130005RX llrf_xem_SRC_Rev19.bit")

okls()

createOKPort("rfport","13130005RX")

## Load record instances
# Obs! $(S2) = LRF until GRF installation! Then it must be changed to GRF!
#
dbLoadRecords("db/scaleF.db", "PORT=rfport, S1=CG-RF, S2=RF, D1=CFC:S, SD0=Ref, SD2=Cav")
dbLoadRecords("db/okllrf.db", "PORT=rfport, S1=CG-RF, S2=RF, D1=CFC:S, SD0=Ref, SD2=Cav, SD6=RAM, D3=Osc:1, TBL1=FF, TBL2=FB, BFN=$(TOP)/BITFLD.TXT")
dbLoadRecords("db/okSNo.db","S1=CG-RF,D1=CFC:S")
dbLoadRecords("db/okWireIn.db", "PORT=rfport, S1=CG-RF, D1=CFC:S,  D9=NA, DA=PG, TBL2=FB")
dbLoadRecords("db/okWireInRB.db", "PORT=rfport, S1=CG-RF, S2=LRF, D1=CFC:S, SD1=Tnr, D3=Osc:Mstr, TBL1=FF, TBL2=FB")
dbLoadRecords("db/okWireOut.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, SD0=Ref, SD1=Tnr, SD2=Cav, SD3=Fwd, SD4=Rfl, SD5=Drv, SD6=RAM, SD7=TS, SD8=EQ, TBL1=FF, TBL2=FB, RD=Xmtr:D")
dbLoadRecords("db/okTbl.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, D2=Cav, TBL=FF, SD0=Ref")
dbLoadRecords("db/okTrigIn.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, D9=NA, DA=PG, Sc=CFC:S, SD7=TS")
dbLoadRecords("db/okTuner.db", "P=CG-RF{CFC:S}, PORT=rfport")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, SD0=Ref, SD1=Ref, ADDR=0")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, SD0=Ref, SD1=Cav, ADDR=1")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, SD0=Ref, SD1=Fwd, ADDR=2")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, SD0=Ref, SD1=Rfl, ADDR=3")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, SD0=Ref, SD1=Drv, ADDR=4")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, SD0=Ref, SD1=s1b, ADDR=5")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, SD0=Ref, SD1=s2b, ADDR=6")
dbLoadRecords("db/okadc.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, SD0=Ref, SD1=s3b, ADDR=7")

dbLoadRecords("db/vectsum.db", "S1=CG-RF, D1=CFC:S, D2=CFC:S, SD1=Cav")

#
dbLoadRecords("db/okmeasure.db", "S1=CG-RF, D1=CFC:S, D2=Cav, SD2=Cav, SD5=Drv, TBL1=FF, TBL2=FB")
dbLoadRecords("db/okCircBuf.db", "PORT=rfport, S1=CG-RF, S2=LRF, D1=CFC:S, D3=Osc:Mstr, SD6=RAM, TD1=Chan, ADDR=9, NELM1=0x1000000, NELM2=0x1A0000, NELM3=832, L=D")
dbLoadRecords("db/okCircBufCh.db", "S1=CG-RF, D1=CFC:S, SD6=RAM, TD1=Chan, NELM2=0x1A0000, NELM3=832")
dbLoadRecords("db/okTS.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, SD7=TS")
dbLoadRecords("db/okTSEvent.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, SD7=TS")
dbLoadRecords("db/okCloseLoop.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, Sc=CFC:S, D2=Cav, SD6=RAM, TBL1=FF, TBL2=FB")
dbLoadRecords("db/okEQ.db", "PORT=rfport, S1=CG-RF, S2=RF, D1=CFC:S, SD8=EQ")

#dbLoadRecords("db/BeamSimu.db", "PORT=rfport, S1=CG-RF, D1=CFC:S, SD2=Cav")

dbLoadRecords("db/iocAdminSoft.db", "IOC=RF-CT{${IOC}}")
dbLoadRecords("db/asynRecord.db", "P=CG-RF{CFC:S},R=port, PORT=rfport, ADDR=0, OMAX=40, IMAX=40")
dbLoadRecords("db/reccaster.db", "P=CG-RF{CFC:S-RC}")

# Auto save/restore
dbLoadRecords("db/save_restoreStatus.db", "P=RF-CT{$(IOC)}")
save_restoreSet_status_prefix("RF-CT{$(IOC)}")

# ensure directories exist
system("install -d ${TOP}/as")
system("install -d ${TOP}/as/req")
system("install -d ${TOP}/as/save")

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")

set_pass0_restoreFile("cfc_settings.sav")
set_pass0_restoreFile("cfc_values.sav")
set_pass1_restoreFile("cfc_values.sav")
set_pass1_restoreFile("cfc_waveforms.sav")

#asynSetTraceMask("rfport", -1, 0xff)
#asynSetTraceIOMask("rfport", -1, 0xff)

cd "${TOP}/iocBoot/${IOC}"
callbackSetQueueSize(20000)
iocInit

dbl > records.dbl

#system "cp records.dbl /cf-update/$HOSTNAME.$IOCNAME.dbl"

makeAutosaveFileFromDbInfo("${TOP}/as/req/cfc_settings.req", "autosaveFields_pass0")
makeAutosaveFileFromDbInfo("${TOP}/as/req/cfc_values.req", "autosaveFields")
makeAutosaveFileFromDbInfo("${TOP}/as/req/cfc_waveforms.req", "autosaveFields_pass1")

create_monitor_set("cfc_settings.req", 5 , "")
create_monitor_set("cfc_values.req", 5 , "")
create_monitor_set("cfc_waveforms.req", 5 , "")

#caPutLogInit("10.0.152.133:7004",1)

