From: Ducrot Bruno <ducrot@poupinou.org>
Subject: speedstep-smi, a start for an howto.
Date: Tue, 4 Nov 2003 18:01:43 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031104170143.GR21970@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk


It seems that some BIOS vendor provide false information
from the int15 values, or even worst do not implement
at all the int15 stuff.

Unfortunately, some vendor seems to like to actually
write to the registry instead of the int15, and
therefore breaking other OS (even Windows XP).

Of course, as any real man, you have
completely wipped out bad OS, but then you don't have
anymore that damned registry.  All is lost?  No, of
course.

A quick way to get it is to go to the driver download
page of your vendor, take the speedstep applet, then
unzip it.  There is then good luck that there is a file
for updating the registry.

That file will give you the correct values
to pass to the speedstep-smi driver.

An example: for the toshiba 3000-100, there is a
ssap-tosh3000-win2k.zip
then:
unzip ssap-s3000-win2k
give a me a ''Intel Speed Step Applet' directory.

ls -R under 'Intel Speed Step Applet' gave me:

Intel Speed Step Applet$ ls -R
.:
disk1  disk2

./disk1:
DATA.TAG      Registry.ini  SETUP.INI     _ISDEL.EXE  _sys1.cab   data1.cab  layout.bin  setup.ins  setup.lid
ISTUnDLL.dll  SETUP.EXE     _INST32I.EX_  _SETUP.DLL  _user1.cab  lang.dat   os.dat      setup.iss

./disk2:
data2.cab


the directory disk1 have a Registry.ini:
cat disk1/Registry.ini 
[PRPC]
Port=0x000000B2
Command=0x00000082
Flags=0x10000232
UserPrefs=0x0000000d
SystemPrefs=0x00000010
EventRegister=0x00000000
SetStateRetry=0x00000400
AppletTimeout=0x00000078
PollPeriod=0x000007d0ducrot@neptune:~/t/t$ 

The correct parameter to pass are:

modprobe speedstep_smi smi_port=0xb2 smi_cmd=0x82
(smi_port is the Port registry, and smi_cmd is the Command).

Hope that help,
-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
