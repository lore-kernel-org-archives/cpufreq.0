From: Ian McConnell <ian@emit.demon.co.uk>
Subject: longhaul gives /proc/sys/cpu/0/speed-m{in,max} = 0
Date: Tue, 30 Dec 2003 13:38:25 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <87n09aa0j2.fsf@emit.demon.co.uk>
Reply-To: Ian McConnell <ian@emit.demon.co.uk>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

I'm trying to set up cpu speed control with my VIA EPIA C3 800Mhz.

> x86info
Family: 6 Model: 7 Stepping: 8
CPU Model : VIA C3 (Samuel 2) [C5B]

I downloaded and installed vanilla linux-2.4.23 with
cpufreq-LINUX_2_4-20031230.tar.gz and setting

CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_TABLE=y
CONFIG_CPU_FREQ_PROC_INTF=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_24_API=y
# CONFIG_X86_POWERNOW_K6 is not set
# CONFIG_X86_POWERNOW_K7 is not set
# CONFIG_X86_POWERNOW_K8 is not set
CONFIG_X86_LONGHAUL=m
# CONFIG_X86_SPEEDSTEP_PIIX4 is not set
# CONFIG_X86_SPEEDSTEP_SMI is not set
# CONFIG_X86_SPEEDSTEP_ICH is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
# CONFIG_X86_P4_CLOCKMOD is not set
# CONFIG_X86_LONGRUN is not set
# CONFIG_X86_GX_SUSPMOD is not set


This seems to work correctly as I get 

longhaul: VIA C3 'Ezra' [C5C] CPU detected. Longhaul v1 supported.
longhaul: MinMult=3.0x MaxMult=6.0x
longhaul: FSB: 133MHz Lowestspeed=399MHz Highestspeed=798MHz

> cat /proc/cpufreq 
          minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0          399 kHz ( 50 %)  -        798 kHz (100 %)  -  performance

however I also have

> more /proc/sys/cpu/0/speed*
::::::::::::::
/proc/sys/cpu/0/speed
::::::::::::::
0
::::::::::::::
/proc/sys/cpu/0/speed-max
::::::::::::::
0
::::::::::::::
/proc/sys/cpu/0/speed-min
::::::::::::::
0

Is this right? speed-min and speed-max are both zero so I can't use any
of the userspace speed throttling programs such as cpuspeed-1.1.
Also if /proc/sys/cpu/0/speed = 0, how do I tell what speed my machine is
running at?


Recompiling the kernel with longhaul built in (ie not a module) didn't make
any difference.


I also tried a stock binary kernel 2.6.0, but when I load longhaul.o, the
machine hangs after printing out:

longhaul: VIA C3 'Ezra' [C5C] CPU detected. Longhaul v1 supported.
longhaul: MinMult=3.0x MaxMult=6.0x
longhaul: FSB: 0MHz Lowestspeed=0MHz Highestspeed=0MHz
longhaul: FSB:0 Mult:10.0x


I did have some success with the longhaul and governor modules from
    http://www3.sympatico.ca/howlettfamily/epia/longhaul-1.2.tar.gz
The longhaul module worked ok with vanilla 2.4.23, but the governor module
hangs my machine after a few hours.


Unfortunately, I'm a bit stuck as what to try next as both
   http://blade5.bvu.edu/wiki
   http://www.codemonkey.org.uk/
seem to be down now.
