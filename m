From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k7: wrong FSB frequency detection
Date: Thu, 1 Jul 2004 17:28:03 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040701152803.GF5614@poupinou.org>
References: <20040701122555.GC24153@master.mivlgu.local>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040701122555.GC24153@master.mivlgu.local>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergey Vlasov <vsu@altlinux.ru>
Cc: cpufreq@www.linux.org.uk

On Thu, Jul 01, 2004 at 04:25:55PM +0400, Sergey Vlasov wrote:
> Hello!
> 
> On the MaxSelect A7W notebook the powernow-k7 driver in kernel 2.6.7
> basically works, but shows completely wrong frequency values:
> 
> # cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies 
> 4355876 3266907 2800206 2489072 2177938 1555670
> 
> The CPU is Mobile AMD Athlon(tm) XP 2500+ - 1867 MHz max.
> 
> powernow-k7 is built as module; it gives these messages when loading:
> 
> powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
> powernow: FSB: 311.134 MHz
> powernow: Found PSB header at c00f1960
> powernow: Table version: 0x12
> powernow: Flags: 0x0 (Mobile voltage regulator)
> powernow: Settling Time: 100 microseconds.
> powernow: Has 1 PST tables. (Only dumping ones relevant to this CPU).
> powernow: No PST tables match this cpuid (0x7a0)
> powernow: This is indicative of a broken BIOS.
> powernow: Trying ACPI perflib
> powernow: acpi:  P0: 1867 MHz 24000 mW 125 uS control 009c4176 SGTC 10000
> powernow:    FID: 0x16 (14.0x [4355MHz])        VID: 0xb (1.450V)
> powernow: acpi:  P1: 1400 MHz 14486 mW 125 uS control 009c41cf SGTC 10000
> powernow:    FID: 0xf (10.5x [3266MHz]) VID: 0xe (1.300V)
> powernow: acpi:  P2: 1200 MHz 14486 mW 125 uS control 009c41cc SGTC 10000
> powernow:    FID: 0xc (9.0x [2800MHz])  VID: 0xe (1.300V)
> powernow: acpi:  P3: 1067 MHz 14486 mW 125 uS control 009c426a SGTC 10000
> powernow:    FID: 0xa (8.0x [2489MHz])  VID: 0x13 (1.200V)
> powernow: acpi:  P4: 933 MHz 14486 mW 125 uS control 009c4268 SGTC 10000
> powernow:    FID: 0x8 (7.0x [2177MHz])  VID: 0x13 (1.200V)
> powernow: acpi:  P5: 668 MHz 14486 mW 125 uS control 009c42e4 SGTC 10000
> powernow:    FID: 0x4 (5.0x [1555MHz])  VID: 0x17 (1.100V)
> powernow: Minimum speed 1555 MHz. Maximum speed 4355 MHz.
> 
> The ACPI frequency values are correct, but powernow-k7 calculates its own
> values based on the frequency multiplier and FSB, and the FSB value is
> obviously wrong.
> 
> /proc/cpuinfo before loading powernow-k7:
> 
> processor       : 0
> vendor_id       : AuthenticAMD
> cpu family      : 6
> model           : 10
> model name      : Mobile AMD Athlon(tm) XP 2500+
> stepping        : 0
> cpu MHz         : 1866.808
> cache size      : 512 KB
> fdiv_bug        : no
> hlt_bug         : no
> f00f_bug        : no
> coma_bug        : no
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 1
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 mmx fxsr sse syscall mp mmxext 3dnowext 3dnow
> bogomips        : 3710.97
> 
> However, I tried to run this simple program to find the actual CPU speed:
> 
> #include <stdio.h>
> #include <unistd.h>
> #include <asm/msr.h>
> 
> int main(void)
> {
> 	unsigned long long tsc1, tsc2;
> 	rdtscll(tsc1);
> 	sleep(1);
> 	rdtscll(tsc2);
> 	printf("TSC frequency: %llu Hz\n", tsc2 - tsc1);
> 	return 0;
> }
> 
> And I got TSC frequency: 800811489 Hz (this was _before_ loading
> powernow-k8).  This explains the calculated FSB value: the CPU actually
> has 133 MHz FSB and multiplier of 6.0x (which gives approx. 800 Mhz), but
> at some time before (during the cpu_khz initialization) the CPU frequency
> multiplier was set to 14.0x (which gave 1866.808 MHz).  powernow-k7 does
> not know about this change and happily uses wrong cpu_khz for its
> calculations.
> 
> Another strange thing is that 6.0x does not appear in the ACPI powernow
> table at all.
> 
> Just in case, here is the PSB dump from this machine:
> 
> PSB version: 12 flags: 0 settling time 100us res1 0 num pst 1
>   PST 1  cpuid 780 fsb 133 mfid 3 svid a numberstates 8
>     0   798000kHz  FID 06 ( 6.0)  VID 0a (1500mV)
>     1   931000kHz  FID 08 ( 7.0)  VID 0a (1500mV)
>     2  1064000kHz  FID 0a ( 8.0)  VID 0a (1500mV)
>     3  1197000kHz  FID 0c ( 9.0)  VID 0a (1500mV)
>     4  1330000kHz  FID 0e (10.0)  VID 0a (1500mV)
>     5  1463000kHz  FID 00 (11.0)  VID 0a (1500mV)
>     6  1596000kHz  FID 02 (12.0)  VID 0a (1500mV)
>     7  1662500kHz  FID 03 (12.5)  VID 0a (1500mV)
> 

Could you please try this little debug stuff ?  That will not help for
now, but I want to be sure.

(I think the real problem is at:
linux-2.6/drivers/acpi/hardware/hwacpi.c in function acpi_hw_set_mode()
when we tell the bios that we go to ACPI mode, though I'm not sure at
100% yet, just this is the only possibility I see for now).


--- powernow-k7.c	2004/07/01 15:01:46	1.1
+++ powernow-k7.c	2004/07/01 15:14:16
@@ -566,6 +566,8 @@ static int __init powernow_cpu_init (str
 
 	/* A K7 with powernow technology is set to max frequency by BIOS */
 	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.CFID];
+	dprintk(KERN_INFO PFX "cpu_khz %d    fid current %x\n", cpu_khz,
+			fidvidstatus.bits.CFID);
 	if (!fsb) {
 		printk(KERN_WARNING PFX "can not determine bus frequency\n");
 		return -EINVAL;


-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
