From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: [ACPI] _PDC method in DSDT
Date: 23 Jun 2003 19:16:20 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1056420980.5977.27.camel@sherkaner.pao.digeo.com>
References: <F760B14C9561B941B89469F59BA3A84725A303@orsmsx401.jf.intel.com>
	 <20030623133834.GA2330@brodo.de> <20030623161136.GG19556@poupinou.org>
	 <1056388336.15250.62.camel@ixodes.goop.org>
	 <1056398545.10322.111.camel@aldebaran.caltech.edu>
	 <20030623213726.GA1317@brodo.de>
	 <1056417280.10323.148.camel@aldebaran.caltech.edu>
	 <1056418635.5977.20.camel@sherkaner.pao.digeo.com>
	 <1056420149.10322.160.camel@aldebaran.caltech.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <1056420149.10322.160.camel@aldebaran.caltech.edu>
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
To: David Moore <dcm@acm.org>
Cc: Dominik Brodowski <linux@brodo.de>, Ducrot Bruno <ducrot@poupinou.org>, Andrew Grover <andrew.grover@intel.com>, "Adachi, Kenichi" <adachi@rd.scei.sony.co.jp>, acpi-devel@lists.sourceforge.net, cpufreq list <cpufreq@www.linux.org.uk>

On Mon, 2003-06-23 at 19:02, David Moore wrote:
> On Mon, 2003-06-23 at 18:37, Jeremy Fitzhardinge wrote:
> > Hardly any of the code in speedstep-centrino has to do with actually
> > setting the speed; nor is much of it to do with identifying the CPU and
> > selecting the right table.  Most of it is to do with being a
> > well-behaved cpufreq driver.  You would need to move more code than just
> > the "wrmsr" into acpi.c.
> > 
> 
> My understanding was that i386/kernel/cpu/cpufreq/acpi.c in 2.5.x was
> already a well-behaved cpufreq driver.  Am I wrong about that?

I had misunderstood - I had thought you were talking about acpi core
code rather than cpufreq/acpi.c.  Hm, I see what you mean.

	J
