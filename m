From: Len Brown <lenb@kernel.org>
Subject: Re: voltage tables
Date: Mon, 30 Jul 2007 22:41:29 -0400
Message-ID: <200707302241.29635.lenb@kernel.org>
References: <20070730230439.GB6949@tatooine.rebelbase.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20070730230439.GB6949@tatooine.rebelbase.local>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

On Monday 30 July 2007 19:04, markus reichelt wrote:
> Hi,
> 
> just a thought.... with more and more people wondering why cpufreq
> doesn't work on their over/underclocked systems, what about offering
> the possibility to use static (and thus easily tweakable) voltage
> tables instead of/parallel to the ACPI-approach? 
> 
> I don't know about the effort this would take to implement / the
> stress it would put on maintenance, but it would be my choice. 
> 
> I'm thinking along the lines of using the ACPI values by default but
> providing the means to use custom tables instead, for "experts".
> 
> Given the slim chances (yes, I'm brainstorming) of success, what
> about documentation -- if one would like to look into the matter and
> try to implement the above? Anything apart from reading the source
> code?

Trying to speak for Intel parts only here, since I don't know
what AMD does...

In the past, there were model specific encoding for the bit pattern
that got written to PERF_CTL.  That is how speedstep-centrino was born.
But these tables were a PITA to maintain, since they were not
necessarily documented, and every stepping might have different encodings.

Intel then documented the model-specific _PDC bits, which allowed
open source to do this the way Windows does -- by asking ACPI.
Thus acpi-cpufreq became the driver of choice, and speedstep-centrino
was deprecated.

Going forward, I believe that the hardware guys have no plans to
maintain any sort of reasonable compatibility or even straightforward
decoding of the bit pattern that gets written to PERF_CTL --
so the reason that speedstep-centrino and its hard-coded tables
became deprecated will be even more true in the future.

Further, I've not played with this, but my understanding is that
on the Extreme parts, the way to over-clock them is to have
a really good cooling solution, and then just enter the BIOS SETUP
and select a higher maximum bus/core ratio.  In theory, this should
be reflected in the ACPI BIOS P-state tables, the tables should
have accurate encodings for the necessary voltage, and assuming
the cooling works, everybody is happy.  Maybe somebody on the
list can comment on if this last part works for them.  I don't
know b/c I never over-clock the parts -- I just use next year's
parts:-)

cheers,
-Len
