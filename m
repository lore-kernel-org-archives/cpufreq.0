From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: k8-powernow failing targ
Date: Wed, 30 Mar 2005 15:02:31 +0200
Message-ID: <20050330130231.GI2298@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A843023ADBFE@SAUSEXMB1.amd.com>
	<8e1d9f11050329214076144b01@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <8e1d9f11050329214076144b01@mail.gmail.com>
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
To: Jonathan Roes <jonathan.roes@gmail.com>
Cc: cpufreq@ZenII.linux.org.uk

On Wed, Mar 30, 2005 at 12:40:55AM -0500, Jonathan Roes wrote:
> > I'm sorry to bother you, but I have a (probably quick for you)
> > question concerning k8-powernow in Linux kernel 2.6.10.  I've enabled
> > the CPU Cool 'n' Quiet setting in my BIOS on my Athlon 64 2800
> > processor.  I get the message "k8-powernow: failing targ, change
> > pending bit set" approximately 4 or 5 times.  In case the timing
> > matters - I normally get the message when setting up X using my
> > distribution's console-based X setup routines, and also recently I saw
> > it when X just died on me for a little while.  I just bought the
> > processor, and haven't used it in Windows for more than a couple of
> > hours at a time, and I haven't run the box in straight console mode,
> > but would be happy to if you want me to assist in further testing.
> >
> > I'm not sure if this is a bug in the kernel I'm using, or whether my
> > processor has issues (good thing I recently bought it and I have that
> > good ol' 3-year retail box warranty :)).
> >
> > Anyways, hopefully you can help me out.  I wouldn't email you and bug
> > you about this because I know you're busy, but the only google search
> > result was the source code for k8-powernow support, and I spent a
> > couple of days hunting around on IRC for help, including a few kernel
> > hacking channels.
> >

It seems ->target() is called two times.  Are you using a cpufreq
daemon, or the ondemand governor?

For enabling debug stuff, you have to compile your kernel with
CONFIG_FREQ_DEBUG and to pass a kernel argument.  See help for
"Enable CPUfreq debugging" in the cpufreq sub-menu when configuring
the kernel for more details.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
