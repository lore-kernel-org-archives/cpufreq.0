From: Michael Frank <mflt1@micrologica.com.hk>
Subject: Re: Cpufreq: powernow-k7 weirdness
Date: Mon, 7 Jul 2003 23:06:10 +0800
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200307072306.13290.mflt1@micrologica.com.hk>
References: <tpisqgv58s.fsf@lanthane.pps.jussieu.fr> <200307071129.46683.mflt1@micrologica.com.hk> <20030707131252.GC7796@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030707131252.GC7796@poupinou.org>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: Luigi Belli <lbelli@crema.unimi.it>, cpufreq@www.linux.org.uk

On Monday 07 July 2003 21:12, Ducrot Bruno wrote:
> > The actual minimum time between steps depends on systems design and can
> > only be established by watching the (core) voltage on an oscilloscope
> > while modulating cpufreq/ACPI settings. The time used should be double
> > or triple the minimum for longterm stability. It would be better if
> > Mainboard manufacturers would specify this minimum time.
>
> That is suposed to be done via a BIOS table (with signature
> AMDK7PNOW!) for the powernow-k7 driver, but is used for the
> CPU only (I believe), and I guess that anyway this occur
> only when a valid core voltage is applied to the CPU (well,
> I hope).
> But perhaps this table do not give appropriate values on some system?
>
> Actually, I was wondering why the _PSS method (from ACPI) give
> a settling time of 125us, instead of 100us for some systems.

100us vs 125us won't matter unless the margin is too small already.

I don't know anything about the big CPU chip requirements as I have 
never read a datasheet  on on those big beasts.

My comments were related to the (analog side of the) power supply
limitations. 

IMHO mainboard Vcore switchers could do a step in 100us or so, or full scale 
over 10 steps or so, (weaker) main power supplies would likely have trouble 
as their switching frequency is much lower. Perhaps a mainboard designer
could comment?

Regards
Michael


-- 
Powered by linux-2.5.74-mm1. Compiled with gcc-2.95-3 - mature and rock solid

My current linux related activities:
- 2.5 yenta_socket testing
- Test development and testing of swsusp and ACPI S3
- Everyday usage of 2.5 kernel

More info on 2.5 kernel: http://www.codemonkey.org.uk/post-halloween-2.5.txt
