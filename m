From: Bernhard Bauch <bernikuh@aon.at>
Subject: 2.4.23 + mobile athlon
Date: Wed, 17 Dec 2003 15:01:09 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3FE061A5.2090206@aon.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

hi!
i just patched kernel-2.4.23 with cpufreq and it worked :)
########################
/var/log/dmes:
....
powernow: AMD K7 CPU detected.
powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: Found PSB header at c00faf80
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 86 PST tables. (Only dumping ones relevant to this CPU).
powernow: PST:33 (@c00fb200)
powernow:  cpuid: 0x780 fsb: 100        maxFID: 0x2     startvid: 0xb
powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0xe (1.300V)
powernow:    FID: 0x6 (6.0x [600MHz])   VID: 0xe (1.300V)
powernow:    FID: 0x8 (7.0x [700MHz])   VID: 0xe (1.300V)
powernow:    FID: 0xa (8.0x [800MHz])   VID: 0xe (1.300V)
powernow:    FID: 0xc (9.0x [900MHz])   VID: 0xe (1.300V)
powernow:    FID: 0xe (10.0x [1000MHz]) VID: 0xd (1.350V)
powernow:    FID: 0x0 (11.0x [1100MHz]) VID: 0xc (1.400V)
powernow:    FID: 0x2 (12.0x [1200MHz]) VID: 0xb (1.450V)

powernow: Minimum speed 500 MHz. Maximum speed 1200 MHz.
##############################################
beatle:/home/berni# more /proc/cpufreq
          minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0       500000 kHz ( 41 %)  -    1200000 kHz (100 %)  -  performance
beatle:/home/berni#
########################################

everything seems to be OK, but:
################################
beatle:/proc/sys/cpu/0# more speed*
::::::::::::::
speed
::::::::::::::
0
::::::::::::::
speed-max
::::::::::::::
0
::::::::::::::
speed-min
::::::::::::::
0
#####################

mhh why are all of these parameters zero ??
-----------------------------------------------------------------------
/proc/acpi/processor/CPU1/info:
processor id:            0
acpi id:                 1
bus mastering control:   no
power management:        yes
throttling control:      no
performance management:  no
limit interface:         no

/proc/acpi/processor/CPU1/throttling
<not supported>

whats going on here ???
why is throtteling not supported ??


-----------------------
other question:
is there a way to run cpufreqd with libc 2.2.5-11.5 (debian woody - 
stable) ??


thank you .
bye,berni
