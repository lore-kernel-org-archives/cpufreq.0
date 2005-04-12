From: Nigel Cunningham <ncunningham@cyclades.com>
Subject: Re: [PATCH] Add suspend routine to core
Date: Tue, 12 Apr 2005 15:05:01 +1000
Message-ID: <1113282301.3645.1137.camel@desktop.cunningham.myip.net.au>
References: <1112143705.5353.74.camel@gaston>
	<1112310463.31847.178.camel@gaston>
Reply-To: ncunningham@cyclades.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1112310463.31847.178.camel@gaston>
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
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: cpufreq@lists.linux.org.uk

Hi.

On Fri, 2005-04-01 at 09:07, Benjamin Herrenschmidt wrote:
> On Wed, 2005-03-30 at 10:48 +1000, Benjamin Herrenschmidt wrote:
> > Hi !
> > 
> > In order to properly fix some issues with cpufreq vs. sleep on
> > PowerBooks, I had to add a suspend callback to the pmac_cpufreq driver.
> > I must force a switch to full speed before sleep and I switch back to
> > previous speed on resume.
> > 
> > I also added a driver flag to disable the warnings in suspend/resume
> > since it is expected in this case to have different speed (and I want it
> > to fixup the jiffies properly).
> >
> > .../...
> 
> No feedback at all ? Without any feedback next week, I'll submit myself
> to andrew ;)

My feedback: Yay! (Not looking at or knowing about the details, just
liking the concept).

Regards,

Nigel
-- 
Nigel Cunningham
Software Engineer, Canberra, Australia
http://www.cyclades.com
Bus: +61 (2) 6291 9554; Hme: +61 (2) 6292 8028;  Mob: +61 (417) 100 574

Maintainer of Suspend2 Kernel Patches http://suspend2.net
