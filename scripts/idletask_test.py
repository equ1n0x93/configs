# from impacket.dcerpc.v5 import tsch, transport
# from impacket.dcerpc.v5.dtypes import NULL

import string
import sys
import argparse
import time
import random
import logging

from impacket.examples import logger
from impacket import version
from impacket.dcerpc.v5 import tsch, transport
from impacket.dcerpc.v5.ndr import NDRCALL
from impacket.dcerpc.v5.dtypes import NULL
from impacket.uuid import uuidtup_to_bin


FULL_XML="""<?xml version="1.0" encoding="UTF-16"?>
<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">
  <Triggers>
    <CalendarTrigger>
      <StartBoundary>2015-07-15T20:35:13.2757294</StartBoundary>
      <Enabled>true</Enabled>
      <ScheduleByDay>
        <DaysInterval>1</DaysInterval>
      </ScheduleByDay>
    </CalendarTrigger>
  </Triggers>
  <Principals>
    <Principal id="LocalSystem">
      <UserId>S-1-5-18</UserId>
      <RunLevel>HighestAvailable</RunLevel>
    </Principal>
  </Principals>
  <Settings>
    <MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>
    <DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>
    <StopIfGoingOnBatteries>false</StopIfGoingOnBatteries>
    <AllowHardTerminate>true</AllowHardTerminate>
    <RunOnlyIfNetworkAvailable>false</RunOnlyIfNetworkAvailable>
    <IdleSettings>
      <StopOnIdleEnd>true</StopOnIdleEnd>
      <RestartOnIdle>false</RestartOnIdle>
    </IdleSettings>
    <AllowStartOnDemand>true</AllowStartOnDemand>
    <Enabled>true</Enabled>
    <Hidden>true</Hidden>
    <RunOnlyIfIdle>false</RunOnlyIfIdle>
    <WakeToRun>false</WakeToRun>
    <ExecutionTimeLimit>P3D</ExecutionTimeLimit>
    <Priority>7</Priority>
  </Settings>
  <Actions Context="LocalSystem">
    <Exec>
      <Command>cmd.exe</Command>
      <Arguments>/C %s &gt; %%windir%%\\Temp\\%s 2&gt;&amp;1</Arguments>
    </Exec>
  </Actions>
</Task>"""


IDLE_TASK_UUID = uuidtup_to_bin(('0A74EF1C-41A4-4E06-83AE-DC74FB1CDD53', '1.0'))


class ItSrvRegisterIdleTask(NDRCALL):
    opnum = 0
    structure = (
    )


class ItSrvUnregisterIdleTask(NDRCALL):
    opnum = 1
    structure = (
    )


class ItSrvProcessIdleTasks(NDRCALL):
    opnum = 2
    structure = (
    )


class ItSrvSetDetectionParameters(NDRCALL):
    opnum = 3
    structure = (
    )


def hItSrvRegisterIdleTask(dce):
    request = ItSrvRegisterIdleTask()
    return dce.request(request)


def hItSrvUnregisterIdleTask(dce):
    request = ItSrvUnregisterIdleTask()
    return dce.request(request)


def hItSrvProcessIdleTasks(dce):
    request = ItSrvProcessIdleTasks()
    return dce.request(request)


def hItSrvSetDetectionParameters(dce):
    request = ItSrvSetDetectionParameters()
    return dce.request(request)


class IDLETASK_EXEC:
    def __init__(self, username='', password='', domain='', hashes=None, aesKey=None, doKerberos=False, kdcHost=None,
                 command=None):
        self.__username = username
        self.__password = password
        self.__domain = domain
        self.__lmhash = ''
        self.__nthash = ''
        self.__aesKey = aesKey
        self.__doKerberos = doKerberos
        self.__kdcHost = kdcHost
        self.__command = command
        if hashes is not None:
            self.__lmhash, self.__nthash = hashes.split(':')

    def play(self, addr):
        stringbinding = r'ncacn_np:%s[\pipe\idletask]' % addr
        rpctransport = transport.DCERPCTransportFactory(stringbinding)

        if hasattr(rpctransport, 'set_credentials'):
            # This method exists only for selected protocol sequences.
            rpctransport.set_credentials(self.__username, self.__password, self.__domain, self.__lmhash, self.__nthash,
                                         self.__aesKey)
            rpctransport.set_kerberos(self.__doKerberos, self.__kdcHost)
        try:
            self.doStuff(rpctransport)
        except Exception, e:
            # import traceback
            # traceback.print_exc()
            logging.error(e)
            if str(e).find('STATUS_OBJECT_NAME_NOT_FOUND') >= 0:
                logging.info('When STATUS_OBJECT_NAME_NOT_FOUND is received, try running again. It might work')

    def doStuff(self, rpctransport):
        def output_callback(data):
            print data

        dce = rpctransport.get_dce_rpc()

        dce.set_credentials(*rpctransport.get_credentials())
        dce.connect()
        # dce.set_auth_level(ntlm.NTLM_AUTH_PKT_PRIVACY)
        ##dce.bind(tsch.MSRPC_UUID_TSCHS)
        dce.bind(IDLE_TASK_UUID)
        tmpName = ''.join([random.choice(string.letters) for _ in range(8)])
        tmpFileName = tmpName + '.tmp'

        xml = FULL_XML % (self.__command, tmpFileName)
        taskCreated = False
        try:
            logging.info('Creating task \\%s' % tmpName)
            hItSrvRegisterIdleTask(dce)
            hItSrvUnregisterIdleTask(dce)
            ## tsch.hSchRpcRegisterTask(dce, '\\%s' % tmpName, xml, tsch.TASK_CREATE, NULL, tsch.TASK_LOGON_NONE)
            ## taskCreated = True
            ##
            ## logging.info('Running task \\%s' % tmpName)
            ## tsch.hSchRpcRun(dce, '\\%s' % tmpName)
            ##
            ## done = False
            ## while not done:
            ##     logging.debug('Calling SchRpcGetLastRunInfo for \\%s' % tmpName)
            ##     resp = tsch.hSchRpcGetLastRunInfo(dce, '\\%s' % tmpName)
            ##     if resp['pLastRuntime']['wYear'] != 0:
            ##         done = True
            ##     else:
            ##         time.sleep(2)
            ##
            ## logging.info('Deleting task \\%s' % tmpName)
            ## tsch.hSchRpcDelete(dce, '\\%s' % tmpName)
            ## taskCreated = False
        except tsch.DCERPCSessionError, e:
            logging.error(e)
            e.get_packet().dump()
        finally:
            if taskCreated is True:
                print 1
                #tsch.hSchRpcDelete(dce, '\\%s' % tmpName)

        smbConnection = rpctransport.get_smb_connection()
        waitOnce = True
        while True:
            try:
                logging.info('Attempting to read ADMIN$\\Temp\\%s' % tmpFileName)
                smbConnection.getFile('ADMIN$', 'Temp\\%s' % tmpFileName, output_callback)
                break
            except Exception, e:
                if str(e).find('SHARING') > 0:
                    time.sleep(3)
                elif str(e).find('STATUS_OBJECT_NAME_NOT_FOUND') >= 0:
                    if waitOnce is True:
                        # We're giving it the chance to flush the file before giving up
                        time.sleep(3)
                        waitOnce = False
                    else:
                        raise
                else:
                    raise
        logging.debug('Deleting file ADMIN$\\Temp\\%s' % tmpFileName)
        smbConnection.deleteFile('ADMIN$', 'Temp\\%s' % tmpFileName)

        dce.disconnect()

