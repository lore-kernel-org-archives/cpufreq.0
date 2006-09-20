From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: No life from acpi-cpufreq, Pentium D 930, x86_64
Date: Wed, 20 Sep 2006 09:40:50 -0700
Message-ID: <45116F12.3030103@goop.org>
References: <1158728112.19359.18.camel@pelerin.serpentine.com>	<20060920050228.GA29548@redhat.com>	<1158729075.19359.25.camel@pelerin.serpentine.com>	<20060920051327.GB29548@redhat.com>
	<1158729844.19359.32.camel@pelerin.serpentine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1158729844.19359.32.camel@pelerin.serpentine.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bryan O'Sullivan <bos@serpentine.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

Bryan O'Sullivan wrote:
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
> mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall
> nx lm constant_tsc pni monitor ds_cpl vmx est cid cx16 xtpr lahf_lm
>   

EIST is listed as "est" here, so it is present.  speedstep-centrino 
should be able to do something with this.

    J
