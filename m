From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8: Power state transitions not supported
Date: Tue, 29 Mar 2005 17:49:59 +0200
Message-ID: <20050329154959.GF2298@poupinou.org>
References: <1112085824.3156.13.camel@localhost.localdomain>
	<200503291059.16320.pytasz@lodz.home.pl>
	<20050329121251.GD2298@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050329121251.GD2298@poupinou.org>
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
To: Micha? Pytasz <pytasz@lodz.home.pl>
Cc: cpufreq@ZenII.linux.org.uk

On Tue, Mar 29, 2005 at 02:12:51PM +0200, Bruno Ducrot wrote:
> On Tue, Mar 29, 2005 at 10:59:16AM +0000, Micha? Pytasz wrote:
> > On Tuesday 29 of March 2005 08:43, Michael Pophal wrote:
> > > Hi,
> > > I tried the last 3 days to convince cpufreq to work with my new Semperon
> > > 2600+ (Socket 754).
> > > I also bought a new mainboard 'MSI K8T Neo-V'. It is a desktop (not
> > > mobile) processor!
> > > I compiled the kernel with the recommended settings. The result during
> > > startup:
> > > powernow-k8: Power state transitions not supported
> > Do You have cpuid in Your kernel?
> 
> That check from cpuid wont work.
> 
> The message above (Power state transitions not supported) indicate that cpuid,
> function 0x80000007 return a value so that the processor do not support
> frequency and voltage scaling.
> 
> > > It seems to me, that this processor is not supported by cpufreq, isn't
> > > it?
> > 
> > I guess it is, however I might be wrong ;)
> 
> You are wrong, I'm afraid.
> 
> > 
> > > I want to have a cheap processor, which is able to save power, because
> > > it is running the whole day. Do you have any recommendation which
> > > processor I should use. I'm going to change the Semperon 2600+ to try
> > > another combination (cpu + mainboard). Any hint is hightly apprecitated!
> > >
> > > Do you have a Semperon xx00+ (Socket 754) running on this 'Cool'n Quiet'
> > > mode? Which one works?
> 
> AFAIK, the only choice is amd64.  Maybe ebay would be your friend, who
> knows?

Actually I'm wrong.  The Sempron 3100+ (it seems to be the only one btw)
support powernow.

See:

AMD Athlon 64 Processor Power and Thermal Data Sheet, order number #30430
rev. 3.43, page 23, at:
http://www.amd.com/us-en/Processors/TechnicalResources/0,,30_182_739_7203,00.html

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
