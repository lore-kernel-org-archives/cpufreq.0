From: Mattia Dongili <dongili@supereva.it>
Subject: Re: cpufreqd not working help?
Date: Thu, 19 Aug 2004 12:55:16 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040819105516.GA2439@inferi.kami.home>
References: <1092840467.30637.202577436@webmail.messagingengine.com>
	<20040819084538.GG29560@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040819084538.GG29560@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Thu, Aug 19, 2004 at 10:45:38AM +0200, Bruno Ducrot wrote:
> Hi,
> 
> On Wed, Aug 18, 2004 at 07:47:47AM -0700, Joshua Lowell wrote:
> > Hi, I have a new laptop an hp ze4805, with an amd athlon xp-m 2800+
> > I installed and started:  powernow-k7 module, processor module is
> > loaded, and 
> > cpufreqd is also running. oh ac battery and fan are also running.
> > But when I check /proc/cpuinfo after unplugging the laptop, the bogoimp
> > and 
> > cpu mHz stay the same... no chages are displayed at all.
> > any help would be more than appreciated.
> 
> It's a problem with userspace space, not kernel space.  Please report

We'd probably need a bit more info to determine that :)

> this trouble to the cpufreqd maintainer instead (even though I think
> he is subscribed to this ml).

Joshua, anyway if you think it's merely a cpufreqd problem (eg: manually
changing frequency values works and /proc/cpuinfo reports the cprrect
values), please let's continue the discussion in private or through
cpufreqd mailing list[1].

And yes, I'm subscribed to this ml :) I've just returned from my
vacation :)

[1]: http://sourceforge.net/mail/?group_id=58904
-- 
mattia
:wq!
