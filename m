From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: found unsupported CPU with Enhanced SpeedStep
Date: Thu, 30 Dec 2004 14:38:14 -0800
Message-ID: <1104446294.24179.1.camel@localhost>
References: <20041230014005.GA16358@bittwiddlers.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-+sJ8y/qhLT6renUWIzK+"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041230014005.GA16358@bittwiddlers.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Matthew Harrell <mharrell-dated-1104802810.0deb6f@bittwiddlers.com>
Cc: cpufreq list <cpufreq@www.linux.org.uk>


--=-+sJ8y/qhLT6renUWIzK+
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2004-12-29 at 20:40 -0500, Matthew Harrell wrote:
> Hi.  I get the following message so I figured I would send you an email
> 
>   speedstep-centrino: invalid ACPI data
>   speedstep-centrino: found unsupported CPU with Enhanced SpeedStep: send /proc/cpuinfo to Jeremy Fitzhardinge <jeremy@goop.org>
> 
> The cpu info file is attached.  Is there a simple change I can do to get this
> to work on this laptop?

The "invalid ACPI data" suggests that a BIOS update might help.
Unfortunately the driver can't do anything for an EST-enabled mobile P4
without the ACPI data.

I don't know too much about ACPI, so I've cc:'d this to the cpufreq
mailing list.

	J

--=-+sJ8y/qhLT6renUWIzK+
Content-Disposition: attachment; filename=cpuinfo.txt
Content-Type: text/plain; name=cpuinfo.txt; charset=UTF-8
Content-Transfer-Encoding: 7bit

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 15
model		: 4
model name	: Mobile Intel(R) Pentium(R) 4 CPU 3.06GHz
stepping	: 1
cpu MHz		: 3057.351
cache size	: 1024 KB
physical id	: 0
siblings	: 2
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 5
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe pni monitor ds_cpl est tm2 cid xtpr
bogomips	: 3710.16

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 15
model		: 4
model name	: Mobile Intel(R) Pentium(R) 4 CPU 3.06GHz
stepping	: 1
cpu MHz		: 3057.351
cache size	: 1024 KB
physical id	: 0
siblings	: 2
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 5
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe pni monitor ds_cpl est tm2 cid xtpr
bogomips	: 3710.16


--=-+sJ8y/qhLT6renUWIzK+
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--=-+sJ8y/qhLT6renUWIzK+--


