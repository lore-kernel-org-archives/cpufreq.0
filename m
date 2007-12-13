From: Scott Tester <scott@smbc.com.au>
Subject: unsupported Speed Step cpu.
Date: Fri, 14 Dec 2007 09:26:08 +1100
Message-ID: <4761B180.7090502@smbc.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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

speedstep-centrino: found unsupported CPU with Enhanced SpeedStep: send
/proc/cpuinfo to cpufreq@lists.linux.org.uk

*coota ~ # cat /proc/cpuinfo*
processor    : 0
vendor_id    : GenuineIntel
cpu family    : 6
model        : 13
model name    : Intel(R) Pentium(R) M processor 2.00GHz
stepping    : 8
cpu MHz        : 1995.024
cache size    : 2048 KB
fdiv_bug    : no
hlt_bug        : no
f00f_bug    : no
coma_bug    : no
fpu        : yes
fpu_exception    : yes
cpuid level    : 2
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx bts est tm2
bogomips    : 3992.39
clflush size    : 64


SpeedStep was working on this cpu prior to kernel 2.6.22

Much Thanks,
Scott.



-- 

Scott Tester

IT Department

SMBC  www.smbc.com.au <http://www.smbc.com.au>

Sydney Missionary and Bible College

43 Badminton Road, Croydon NSW 2132

Phone: 02 9747 4780  ext 147

Mobile: 0411 145 584
