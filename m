From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: ACPI P-State platform limit [Was: Re: Cpufreq for opteron]
Date: Wed, 27 Aug 2003 11:16:10 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030827091610.GG10585@poupinou.org>
References: <99F2150714F93F448942F9A9F112634C080EF034@txexmtae.amd.com>
	<20030827053300.GB4037@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030827053300.GB4037@brodo.de>
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
To: Dominik Brodowski <linux@brodo.de>
Cc: pavel@suse.cz, richard.brunner@AMD.com, aj@suse.de, cpufreq@www.linux.org.uk, davej@redhat.com, paul.devriendt@AMD.com, mark.langsdorf@AMD.com

On Wed, Aug 27, 2003 at 07:33:00AM +0200, Dominik Brodowski wrote:
> [removed CC:linux-kernel]
> 
> > > I dislike this interaction between ACPI and cpufreq -- it 
> > > should be done
> > > more generally. Let's discuss that seperately, though. And if 
> > > the code is
> > > dead code at the moment.
> > 
> > The dead code has been removed in 1.00.07 of the driver. I am
> > happy to receive suggestions as to better ways of detecting battery
> > versus mains power transitions.
> 
> Currently, the ACPI P-States cpufreq driver does implement the "platform
> limit". However, I'm not really excited about how it works -- and especially
> that it only works with the ACPI P-States cpufreq driver and not with all
> drivers.
> 
> [ A preliminary questions to the AMD people out here: Is the information in 
> the _PSS of any usage for the powernow-k{7,8} driver? ]

It is documented somewhere.  I was thinking adding some for the 'asus'
problem as a fallback, but unfortunately it gave bad infos as well
as the legacy way.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
