From: Thomas Renninger <mail@renninger.de>
Subject: Mobile Celeron with Speedstep ? - speedstep-centrino freezes machine
Date: Mon, 20 Sep 2004 15:41:05 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <414EDDF1.90506@renninger.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hi,

I also have a Mobile Celeron (IBM R40e) problem here:

I thought Celeron CPUs are not speedstep capable, seems as if I was 
wrong (ss flag indicates speedstep, right?)...

On this machine speedstep-centrino freezes machine (shouldn't it already 
go out at the model name check, or has this been changed?):

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Mobile Intel(R) Celeron(R) CPU 2.40GHz
stepping        : 9
cpu MHz         : 2392.030
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid
bogomips        : 4751.36

I am just compiling kernel -> centrino debug enabled. Hints and 
suggestions very welcome.

     Thomas

P.S.: uname -r
2.6.8-7-default -> SUSE kernel (no modifications concerning speedstep)
