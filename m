From: "Alasdair Thomson" <gzunkal@googlemail.com>
Subject: Intel C2Q Q6600 reporting 600 and 900MHz
Date: Mon, 1 Oct 2007 12:40:38 +0100
Message-ID: <ccfead790710010440x7f241f46r42517fa8ea3017dc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

I recently upgraded the BIOS on my motherboard (Asus Striker Extreme) from
1102 to 1305. The 1102 BIOS had no problems with cpu scaling and it scaled
from 1.6GHz to 2.4GHz. After the upgrade, while everything feels the same as
before, the speed is being reported as being between 600 and 900 MHz.
Windows XP on the same box reports the CPU speed as 2.4 GHz (and does not
have scaling enabled). I do not believe the CPU is actually running at 600
or 900MHz, I think something is being mis-reported.

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 15
model name      : Intel(R) Core(TM)2 Quad CPU           @ 2.40GHz
stepping        : 7
cpu MHz         : 900.000
cache size      : 4096 KB
physical id     : 0
siblings        : 4
core id         : 0
cpu cores       : 4
fpu             : yes
fpu_exception   : yes
cpuid level     : 10
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall nx lm
constant_tsc pni monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr lahf_lm
bogomips        : 4803.03
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual

barney ~ # cpufreq-info
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which need to switch frequency at the same time: 0
  hardware limits: 600 MHz - 900 MHz
  available frequency steps: 900 MHz, 600 MHz
  available cpufreq governors: conservative, ondemand, powersave, userspace,
performance
  current policy: frequency should be within 600 MHz and 900 MHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 600 MHz (asserted by call to hardware).
analyzing CPU 1:
  driver: acpi-cpufreq
  CPUs which need to switch frequency at the same time: 1
  hardware limits: 600 MHz - 900 MHz
  available frequency steps: 900 MHz, 600 MHz
  available cpufreq governors: conservative, ondemand, powersave, userspace,
performance
  current policy: frequency should be within 600 MHz and 900 MHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 600 MHz (asserted by call to hardware).
analyzing CPU 2:
  driver: acpi-cpufreq
  CPUs which need to switch frequency at the same time: 2
  hardware limits: 600 MHz - 900 MHz
  available frequency steps: 900 MHz, 600 MHz
  available cpufreq governors: conservative, ondemand, powersave, userspace,
performance
  current policy: frequency should be within 600 MHz and 900 MHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 600 MHz (asserted by call to hardware).
analyzing CPU 3:
  driver: acpi-cpufreq
  CPUs which need to switch frequency at the same time: 3
  hardware limits: 600 MHz - 900 MHz
  available frequency steps: 900 MHz, 600 MHz
  available cpufreq governors: conservative, ondemand, powersave, userspace,
performance
  current policy: frequency should be within 600 MHz and 900 MHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 600 MHz (asserted by call to hardware).


Any clues?
