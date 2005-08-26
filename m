From: Jose Miguel Goncalves <jose.goncalves@inov.pt>
Subject: Problem with cpufreq on Geode GX1
Date: Fri, 26 Aug 2005 20:26:40 +0100
Message-ID: <430F6CF0.2010509@inov.pt>
Mime-Version: 1.0
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hi all,

I'm trying to use cpufreq on my Geode GX1 board with linux-2.6.12.5, but,
while everything seems OK, i.e., I can change from performance to powersave
governor and back and /proc/cpuinfo reports me frequency changes, I can
get no effective frequency/CPU power change because I check it with
the Whetstone benchmark and it allways give me the same value (~100 MWIPS).
Any ideas from were could be the problem?

Some additional info follows:

$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

performance

$ cat /proc/cpuinfo

processor	: 0
vendor_id	: CyrixInstead
cpu family	: 5
model		: 9
model name	: Geode(TM) Integrated Processor by National Semi
stepping	: 2
cpu MHz		: 300.672
cache size	: 16 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 2
wp		: yes
flags		: fpu tsc msr cx8 cmov mmx cxmmx
bogomips	: 591.87

$ echo powersave > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

$ cat /proc/cpuinfo

processor	: 0
vendor_id	: CyrixInstead
cpu family	: 5
model		: 9
model name	: Geode(TM) Integrated Processor by National Semi
stepping	: 2
cpu MHz		: 37.095
cache size	: 16 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 2
wp		: yes
flags		: fpu tsc msr cx8 cmov mmx cxmmx
bogomips	: 73.02

Best regards,
Jose Goncalves
