From: Ken Hughes <khughes@pacific.edu>
Subject: Re: ACPI / cpufreq on Presario R3120
Date: Thu, 03 Jun 2004 14:58:23 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40BF9EFF.4090101@pacific.edu>
References: <99F2150714F93F448942F9A9F112634C1431B6EA@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <99F2150714F93F448942F9A9F112634C1431B6EA@txexmtae.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: paul.devriendt@amd.com
Cc: davej@redhat.com, ducrot@poupinou.org, Cpufreq@www.linux.org.uk

paul.devriendt@amd.com wrote:

> I'm willing to put it in the driver. It is easy to ignore certain
> table entries (thanks Dominik!), and I already have to do so for
> the case where BIOSs are filling out unused entries with -1 instead
> of accurately reporting how many entries actually exist.

I can vouch that it would be worth it; I just commented out the test
for multiple lo table entries and the modules loaded fine:

powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.08b)
powernow-k8: Too many lo freq table entries
powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x6 (1400 mV)
powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x18 (950 mV)
powernow-k8:    2 : fid 0x0 (800 MHz), vid 0x18 (950 mV)
powernow-k8: cpu_init done, current fid 0x8, vid 0x6

I then can do this:

root@budgie:~# echo powersave 
 >/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor  ; cat /proc/cpuinfo
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 4
model name      : AMD Athlon(tm) XP Processor 3000+
stepping        : 8
cpu MHz         : 797.863
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall mmxext 3dnowext 3dnow
bogomips        : 1581.05
root@budgie:~# echo performance 
 >/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ; cat /proc/cpuinfo
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 4
model name      : AMD Athlon(tm) XP Processor 3000+
stepping        : 8
cpu MHz         : 1595.727
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall mmxext 3dnowext 3dnow
bogomips        : 3162.11

I didn't even realize I'd been stuck in "low gear" this whole time.

Ken
