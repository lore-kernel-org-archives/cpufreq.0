From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Mon, 21 Feb 2005 12:41:46 +0100
Message-ID: <20050221114146.GA12182@poupinou.org>
References: <20050220131518.GB4495@inskipp>
	<20050220145350.GD20702@isilmar.linta.de>
	<20050220181448.GA5277@inskipp>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050220181448.GA5277@inskipp>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Clouter <alex@digriz.org.uk>
Cc: davej@redhat.com, cpufreq@ZenII.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>

On Sun, Feb 20, 2005 at 06:14:48PM +0000, Alexander Clouter wrote:
> Morning,
> 
> On Feb 20, Dominik Brodowski wrote:
> > On Sun, Feb 20, 2005 at 01:15:18PM +0000, Alexander Clouter wrote:
> > > +			( !dbs_tuners_ins.ignore_nice
> > > +			  ? kstat_cpu(j).cpustat.nice : NULL );
> > NULL is a pointer, 0 is a number. You most probably want "0" here.
> > 
> > > +				( !dbs_tuners_ins.ignore_nice
> > > +				  ? kstat_cpu(j).cpustat.nice : NULL );
> > dito.
> > 
> NULL comes out as a nothing, there is no problem in adding NULL to a
> variable; the c-compiler, I have been assured, drops this out (or rather it
> should) as a NOOP.  Of course this is what I have been told, by my flatmate
> whom works with a large number of different compilers for different
> architectures from different software houses, and lives/breathes C
> (concerningly :)

Please don't assume anything about NULL in kernelspace.  It's
defined in a header (stddef.h for C99) and standard headers can't be
included in kernel space.  NULL is defined elsewhere for kernel, but that's
another story.

Anyway, you are mixing pointers and integers types.  These lead *always*
to bugs, especially if you must change to another HW architecture
(and sometimes another software environment like DOS).

> Along similar lines, I was told that initialising statics to zero *must* be
> done and not assumed; friends have told me its a 'gcc specific extension'.  
> Last time I was told this was not necessary...

I don't get it.  I assume statics variables being always initialized as said by
a previous answer even on pre-ansi C compilers.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
