From: Mattia Dongili <malattia@linux.it>
Subject: Re: [RFC] cpufrequtils-0.5-rc1
Date: Thu, 19 Jan 2006 22:07:23 +0100
Message-ID: <20060119210723.GB7763@inferi.kami.home>
References: <20060117203643.GB16217@isilmar.linta.de>
	<20060118203528.GA3628@inferi.kami.home>
	<20060119140041.GF2154@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060119140041.GF2154@poupinou.org>
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
To: cpufreq@lists.linux.org.uk

On Thu, Jan 19, 2006 at 03:00:41PM +0100, Bruno Ducrot wrote:
> On Wed, Jan 18, 2006 at 09:35:28PM +0100, Mattia Dongili wrote:
> > On Tue, Jan 17, 2006 at 09:36:43PM +0100, Dominik Brodowski wrote:
> > > Hi,
> > > 
> > > At
> > > http://kernel.org/pub/linux/kernel/people/brodo/cpufrequtils-0.5-pre1.tar.bz2
> > > you can find a new prerelease version of cpufrequtils. Most important is
> > > that the package size was reduzed by a factor of 11, only caused by a switch
> > > away from autotools to a customized Makefile based on the one to be found in
> > > udev. Also, compilation speed is down by a factor of 10 or so... I'm
> > > interested in your feedback on this, especially from package maintainers
> > > whether this complicates their life much, or if they have any (different)
> > > suggestions.
> > 
> > It seems Debian doesn't distribute the /usr/bin/gmsgfmt link in gettext
> > packages. Changing the Makefile to use /usr/bin/msgfmt doesn't give any
> > problem here.
> > Is there any problem in such a change?
> 
> Same problem under Slackware.  For now, I have added a MSGFMT set to
> Dominik's /usr/bin/gmgfmt per default.
> 
> Also I'm wondering if that will help if
> there is a 'prefix'.  I don't like DESTDIR being set to /usr.  I much
> prefer:

Ah! yes, this is useful also here for packaging purposes.

-- 
mattia
:wq!
