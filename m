From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: [RFC] cpufreq_get()
Date: Fri, 23 Jan 2004 11:03:34 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040123100334.GD25416@poupinou.org>
References: <20040122190649.GC25416@poupinou.org>
	<20040122205620.GA8012@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040122205620.GA8012@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

On Thu, Jan 22, 2004 at 09:56:20PM +0100, Dominik Brodowski wrote:
> On Thu, Jan 22, 2004 at 08:06:49PM +0100, Ducrot Bruno wrote:
> > I'm planing to add the cpufreq_get() in struct cpufreq_driver,
> > but in a hardware fashion, eventually replacing the name by
> > something more appropriate.
> 
> I appreciate this suggestion.

Fine.

> 
> >   Even for longrun, we
> >   can verify that the frequency is between min and max.
> 
> For ->range() drivers [I intend to rename ->setpolicy() to ->range()], we
> should leave the ->get() function optional in case the speed isn't
> detectable.

Anyway, this must be optional because the ACPI performance driver can't
detect speed...

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
