From: Dave Jones <davej@redhat.com>
Subject: Re: unsupported Speed Step cpu.
Date: Thu, 13 Dec 2007 18:06:08 -0500
Message-ID: <20071213230608.GB20510@redhat.com>
References: <4761B180.7090502@smbc.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4761B180.7090502@smbc.com.au>
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
To: Scott Tester <scott@smbc.com.au>
Cc: cpufreq@lists.linux.org.uk

On Fri, Dec 14, 2007 at 09:26:08AM +1100, Scott Tester wrote:
 > speedstep-centrino: found unsupported CPU with Enhanced SpeedStep: send
 > /proc/cpuinfo to cpufreq@lists.linux.org.uk
 > 
 > *coota ~ # cat /proc/cpuinfo*
 > processor    : 0
 > vendor_id    : GenuineIntel
 > cpu family    : 6
 > model        : 13
 > model name    : Intel(R) Pentium(R) M processor 2.00GHz
 > stepping    : 8
 > cpu MHz        : 1995.024
 > cache size    : 2048 KB
 > fdiv_bug    : no
 > hlt_bug        : no
 > f00f_bug    : no
 > coma_bug    : no
 > fpu        : yes
 > fpu_exception    : yes
 > cpuid level    : 2
 > wp        : yes
 > flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
 > cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx bts est tm2
 > bogomips    : 3992.39
 > clflush size    : 64
 > 
 > 
 > SpeedStep was working on this cpu prior to kernel 2.6.22

Use acpi-cpufreq instead.  speedstep-centrino has been deprecated
for some time now.

	Dave

-- 
http://www.codemonkey.org.uk
