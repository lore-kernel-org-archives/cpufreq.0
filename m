From: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Subject: Re: Mobile Celeron with Speedstep ? - speedstep-centrino freezes
	machine
Date: Thu, 23 Sep 2004 01:50:31 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040922235030.GA7166@message-id.gmane0305.slipkontur.de>
References: <414EDDF1.90506@renninger.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <414EDDF1.90506@renninger.de>
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
To: cpufreq@www.linux.org.uk

On Mon, Sep 20, 2004 at 03:41:05PM +0200, Thomas Renninger wrote:
> Hi,
> 
> I also have a Mobile Celeron (IBM R40e) problem here:
> 
> I thought Celeron CPUs are not speedstep capable, seems as if I was 
> wrong (ss flag indicates speedstep, right?)...
> 
> On this machine speedstep-centrino freezes machine (shouldn't it already 
> go out at the model name check, or has this been changed?):

this is a P4 celeron, isn't it?
 
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 15
> model           : 2

15 2 is a Pentium 4 Northwood if i read the code correctly

> model name      : Mobile Intel(R) Celeron(R) CPU 2.40GHz


> flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca 
> cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid

the ht flag also indicates a p4.

> I am just compiling kernel -> centrino debug enabled. Hints and 
> suggestions very welcome.

P4 is not centrino, it is crap :-)
-- 
Stefan Seyfried
