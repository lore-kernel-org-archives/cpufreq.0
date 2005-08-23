From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8: missing p-state
Date: Tue, 23 Aug 2005 10:42:39 +0200
Message-ID: <20050823084239.GA28353@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A84301CFC36F@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84301CFC36F@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk, Brendt Wohlberg <bw4@wohlberg.net>

On Thu, Aug 18, 2005 at 12:24:31PM -0500, Langsdorf, Mark wrote:
> > > The kernel was built with general ACPI support (CONFIG_ACPI=y), as 
> > > well as with the ACPI option for powernow-k8 
> > > (CONFIG_X86_POWERNOW_K8_ACPI=y).
> > >  
> > > > Could you send me the output of acpidmp, please ?
> > > 
> > > With pleasure - it's attached.
> > 
> > As expected, there is only 3 p-states on that one, namely 
> > 2200, 2000 and 1800 kHz.
> > 
> > Maybe the legacy tables are not so broken.  Could you please 
> > try that little tool I'm attaching (compile with -O at least)?
> > 
> > NB: it has been written for powernow-k7 originaly.  So it 
> > will certainly give false values.  What I want to see in fact 
> > is the number of frequencies available.
> 
> Bruno -
> 
> Thank you for the support, but my experience has been that
> the PSB/PST tables are much less likely to exist or be
> correct than the ACPI tables.  I'm not sure what your tool
> is going to demonstrate.
> 

I want to demonstrate nothing.  But if for *one* guy it's better
to use PSB/PST tables instead of those provided by ACPI, then
a kernel boot parameter in order to force the use of those
tables should be written IMHO.

It's not the case here, therefore I won't bother to write
such a patch.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
