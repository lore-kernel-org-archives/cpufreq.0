From: Ari Pollak <ajp@aripollak.com>
Subject: Re: powernow-k8 won't load on Athlon64
Date: Wed, 25 Aug 2004 10:54:44 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <412CA834.9090500@aripollak.com>
References: <84EA05E2CA77634C82730353CBE3A8439913D5@SAUSEXMB1.amd.com>
	<20040825093156.GM29560@poupinou.org> <cgi57v$pga$1@sea.gmane.org>
	<20040825145054.GN29560@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040825145054.GN29560@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

Yes, it is definitely running slower.
% bogomips
Calibrating delay loop.. ok - 976.00 BogoMips
% cat /proc/cpuinfo
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 12
model name      : AMD Athlon(tm) 64 Processor 3000+
stepping        : 0
cpu MHz         : 1000.513
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx mmxext lm 
3dnowext 3dnow
bogomips        : 1970.17



Bruno Ducrot wrote:
> Could you please run 'bogomips' in order to check that at least the cpu
> is slower?  (on debian, it's just apt-get install sysutils, for other
> systems, I must admit I don't know).
> 
