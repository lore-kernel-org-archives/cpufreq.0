From: Nebojsa Trpkovic <trx.lists@gmail.com>
Subject: Re: voltage tables
Date: Thu, 11 Oct 2007 17:43:32 +0200
Message-ID: <470E44A4.5060207@gmail.com>
References: <20070730230439.GB6949@tatooine.rebelbase.local>	<200707302241.29635.lenb@kernel.org>
	<f8o4nh$u2o$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <f8o4nh$u2o$1@sea.gmane.org>
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

Wes Felter wrote:
> Len Brown wrote:
>> On Monday 30 July 2007 19:04, markus reichelt wrote:
>>> Hi,
>>>
>>> just a thought.... with more and more people wondering why cpufreq
>>> doesn't work on their over/underclocked systems, what about offering
>>> the possibility to use static (and thus easily tweakable) voltage
>>> tables instead of/parallel to the ACPI-approach? 
> 
> [snip]
> 
>> Going forward, I believe that the hardware guys have no plans to
>> maintain any sort of reasonable compatibility or even straightforward
>> decoding of the bit pattern that gets written to PERF_CTL --
>> so the reason that speedstep-centrino and its hard-coded tables
>> became deprecated will be even more true in the future.
> 
> User-provided tables != hard-coded tables. What if acpi-cpufreq dumped
> the ACPI table in some semi-human-readable format and then allowed the
> user to tweak it (by guessing, since the hardware is undocumented) and
> then push the tweaked table back into the driver at runtime? The driver
> would still not contain any tables and thus the old speedstep-centrino
> maintenance problem would not exist.
> 
> There is a patch for speedstep-centrino that adds an op_points_table
> file in sysfs; it could be ported to acpi-cpufreq.
> 
> http://gentoo-wiki.com/HOWTO_Undervolt_a_Pentium_M_CPU#Getting_the_current_voltage_settings
> 

any info about eventual acpi-cpufreq port?

I've found this:
http://gentoo-wiki.com/HOWTO_Fix_Common_ACPI_Problems
but was unable to find any FID/VID table in DSDT... :(
