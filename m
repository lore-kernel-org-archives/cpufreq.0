From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [RFC] yet more file moves
Date: Wed, 27 Aug 2003 14:41:49 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030827124149.GC4057@brodo.de>
References: <20030827060229.GA4315@brodo.de> <3F4C7560.2080409@basmevissen.nl>
	<20030827110230.GJ10585@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030827110230.GJ10585@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: Bas Mevissen <ml@basmevissen.nl>, cpufreq@www.linux.org.uk

On Wed, Aug 27, 2003 at 01:02:30PM +0200, Ducrot Bruno wrote:
> On Wed, Aug 27, 2003 at 11:09:52AM +0200, Bas Mevissen wrote:
> > Dominik Brodowski wrote:
> > 
> > >I hereby suggest that 
> > >a) for 2.4. and 2.6. drivers/cpufreq/userspace.c is moved to 
> > >   drivers/cpufreq/cpufreq-userspace.c,
> > >b) for 2.4, the x86 cpufreq drivers are moved to arch/i386/kernel/cpufreq/
> 
> Dominik: I agreed for b), especially for acpi.c if we want it in 2.4.
> (BTW, I may commit soon a new version for it, have you done some stuff
> related to that one?)

oh yes, I have - but only in my head, but not on my harddisk... So if you
have done something wrt acpi already, commit it; I'll post my changes for
comments and/or inclusion when they're ready. Might take a week or two,
though.

	Dominik
