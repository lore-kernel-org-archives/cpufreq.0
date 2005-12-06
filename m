From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH 2.6.14] cpufreq: don't suggest speedstep-centrino for
	Dothan-based Celeron-M processors
Date: Tue, 6 Dec 2005 11:03:24 +0100
Message-ID: <20051206100324.GA14886@poupinou.org>
References: <88056F38E9E48644A0F562A38C64FB60067F424F@scsmsx403.amr.corp.intel.com>
	<20051204164620.GA8422@isilmar.linta.de>
	<20051205110012.GA12747@poupinou.org>
	<20051206060149.GA4722@isilmar.linta.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20051206060149.GA4722@isilmar.linta.de>
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
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, CPUFreq@lists.linux.org.uk, davej@redhat.com

On Tue, Dec 06, 2005 at 07:01:49AM +0100, Dominik Brodowski wrote:
> Hi,
> 
> On Mon, Dec 05, 2005 at 12:00:12PM +0100, Bruno Ducrot wrote:
> > > Yes, exactly. In my TODO list for cpufreq, I still have this entry:
> > > - [core] evaluate use of > 1 drivers at one time (CPUFREQ_THROTTLING, 
> > >         CPUFREQ_SCALING)
> > 
> > Yes, that's what I had in mind.  But maybe we could at first make the
> > distinction before being able to load more than one driver?
> 
> Yes, sure. However, only on the x86 I'm quite confident that the throttling
> state is equivalent to the idle state, and therefore doesn't offer
> _additional_ power savings (besides the effect discussed by Dave yesterday)
> if the CPU load is lower than (1 - throttling_rate), IMO.
> 
> CPUFREQ_SCALING:
> 	acpi-cpufreq
> 	elanfreq
> 	powernow-k{6,7,8}
> 	speedstep-{smi,ich,centrino}
> 	longrun
> 	longhaul
> 
> CPUFREQ_THROTTLING:
> 	p4-clockmod
> 	gx-suspmod

Well, there is the cpufreq-nvidia2 driver.  I'm pretty sure that one does not
fit there.  I don't know what are exactly the benefits so far.

> The other architectures I'm not so familiar with, so this list is x86 only
> at the moment.

Erm yes.  Can't help here.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
