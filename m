From: Pete Popov <ppopov@embeddedalley.com>
Subject: Re: CPU frequency scaling on MIPS (au1000/common/power.c)
Date: Fri, 24 Sep 2004 11:33:52 -0700 (PDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040924183352.31414.qmail@web81407.mail.yahoo.com>
References: <20040923201916.38891.qmail@web81408.mail.yahoo.com>
Reply-To: ppopov@embeddedalley.com
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040923201916.38891.qmail@web81408.mail.yahoo.com>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>, ralf@linux-mips.org, linux-mips@linux-mips.org
Cc: cpufreq@www.linux.org.uk


AMD notified me that the frequency scaling will not be
supported moving forward and will not be guaranteed to
work. Therefore, I'll have to remove that code from
the kernel so that it's not misleading.

Pete

--- Pete Popov <ppopov@embeddedalley.com> wrote:

> 
> <snip>
> 
> > Therefore, I'd suggest that we update
> > arch/mips/au1000/common/power.c to
> > use the cpufreq infrastructure. 
> 
> 
> The current interface was written a few years ago
> for
> 2.4, when I couldn't find a general PM interface to
> start with.
> 
> 
> > Nonetheless I'd be willing to write
> > a "suggestion" on how to update
> > arch/mips/au1000/common/power.c, and
> > somebody with compiler and hardware could test it
> > then.
> 
> That would help, though I'm not sure when I would
> get
> to it personally. I'm working on 2.6 updates at the
> moment with some other developers, but PM is not on
> our list for now. If you're dying to work on it and
> hardware is the only issue, I might be able to help
> :)
> 
> > Are there other MIPS CPUs which support CPU
> > frequency scaling? 
> 
> Not that I know of, and not the way the Au1x
> supports
> it.
> 
> 
> Pete
> 
> 
