From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Pentium-M minimum clock-freq
Date: Fri, 2 Apr 2004 21:20:25 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040402192025.GR19001@poupinou.org>
References: <200404021824.10912.steffen-hein@gmx.de>
	<20040402164459.GB7034@dominikbrodowski.de>
	<200404021926.28812.steffen-hein@gmx.de>
	<20040402173916.GA7499@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040402173916.GA7499@dominikbrodowski.de>
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
To: Steffen Hein <steffen-hein@gmx.de>, cpufreq@www.linux.org.uk

On Fri, Apr 02, 2004 at 07:39:16PM +0200, Dominik Brodowski wrote:
> On Fri, Apr 02, 2004 at 07:26:28PM +0200, Steffen Hein wrote:
> > On Friday 02 April 2004 18:44, Dominik Brodowski wrote:
> > > 'cause the other OS's behaviour is broken, IMHO. It (also) "sells" you
> > > throttling as "speedstep": Throttling means the processor is stopped for
> > > short times.
> > 
> > Is that compareable with the good-old "hlt" instruction?
> 
> Yes -- ACPI C1 actually does call hlt, C2 and higher do save more power than
> "hlt"; but it takes a bit more time for the processor to wake up from these
> "deeper sleep" states.
> 
> > > Actual speedstep states for the 1.5ghz
> > > Pentium-M are 600, 800, 1000, 1200, 1400 and 1500 MHz.
> > 
> > OK, good to know. I just was confused by the mhz Numbers "the other OS[tm]" 
> > gave me.
> Many are, unfortunately...

Google for kv8-max3.pdf (it's a manual for a known amd64 motherboard),
then look page 3-17, there is an option called "CPU THRM-Throttling"
that is used for, I quote:

"This item controls the CPU speed by cutting down its regular power to a
percentage during the STR (Suspend To RAM) state."

So far, Steffen, you are not the only one that make that kind of
error unfortunately.

> > BTW: I'm not familiar with the current ACPI-style power-management-stuff, but 
> > would it make sense to use the HLT instruction together with Speedstep? How 
> > can it be enabled on ACPI-systems? ("do cpu idle calls when idle" is 
> > connected to apm in the kernel) Or isn't it useful anymore with ACPI?
> 
> Oh yes, it's very useful if you use ACPI. It's part of the ACPI processor
> module, so if you say CONFIG_ACPI_PROCESSOR="y" it should already work. Grep
> for "ACPI" and you'll find the number of C-States your processor supports.
> Note that this number might change as soon as _CST support is merged (search
> for it on bugzilla.kernel.org if you want to test patches, but chose Bruno's
> as they're better than mine, I guess :-)

Don't know if there are better, but I care to get reports.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
