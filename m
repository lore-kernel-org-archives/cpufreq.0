From: Wes Felter <wesley@felter.org>
Subject: Re: 3.2GHz cpus with cpufreq become 2.8GHz
Date: Thu, 19 Oct 2006 17:48:33 -0500
Message-ID: <453800C1.8050409@felter.org>
References: <Pine.LNX.4.64.0610182133130.29935@bizon.gios.gov.pl>
	<4537A582.4020406@felter.org>
	<Pine.LNX.4.64.0610200022320.30089@bizon.gios.gov.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <Pine.LNX.4.64.0610200022320.30089@bizon.gios.gov.pl>
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
To: cpufreq@lists.linux.org.uk

Krzysztof Oledzki wrote:

> Hm... speedstep-centrino on Xeon? AFAIK speedstep-centrino requires 
> "est" and /proc/cpuinfo does not mention this flag:
>  fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 
> clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm constant_tsc pni 
> monitor ds_cpl cid cx16 xtpr

Odd; I have a similar processor and it has est and uses the 
speedstep-centrino driver. But I am using an old kernel (2.6.5) and the 
flag detection has changed since then.

> BTW: what wrong is with p4-clockmod? I was 
> not able to find any information that it is broken and should not be used?

It makes the processor slower but only reduces power consumption 
slightly, making the processor less power-efficient. You probably don't 
want your processor to be less efficient.

Wes Felter - wesley@felter.org
