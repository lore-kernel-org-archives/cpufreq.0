From: bugme-daemon@osdl.org
Subject: [Bug 3144] modprobe speedstep-smi fails
Date: Sun, 1 Aug 2004 16:17:45 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408012317.i71NHjdE021734@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3144





------- Additional Comments From paparoot666@yahoo.fr  2004-08-01 16:17 -------
I have a t22 and use acpi too with the speedstep-smi driver, and it works . 
I haven't got a mobile version on the cpu (i think), to make speedstep available,
i activated the relax acpi check in acpi section of my kernel configuration,
and to don't need to pass it as an argument on boot prompt, i have modified the
value
        static int relaxed_check = 0;
to
        static int relaxed_check = 1;
in this file : 
        /usr/src/linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
before compiling .

it works ;)

my /proc/cpuinfo :

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 8
model name      : Pentium III (Coppermine)
stepping        : 10
cpu MHz         : 896.283
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat
pse36 mmx fxsr sse
bogomips        : 1777.66


Actually i got many messages like this in my dmesg :
        Warning: CPU frequency out of sync: cpufreq and timing core thinks of
900000, is 700000 kHz.
but i don't care .

oh, an other thing, if you have problems with mouse under X, just activate ISA
support


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
