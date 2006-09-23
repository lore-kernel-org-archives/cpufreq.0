From: Johny the Ripper <my_publicyty@yahoo.com>
Subject: Re: Can't get it working on Mobile Coppermine 1Ghz - i440BX -
	please help...
Date: Sat, 23 Sep 2006 03:20:09 -0700 (PDT)
Message-ID: <20060923102009.32968.qmail@web30805.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk
Cc: Bruno Ducrot <ducrot@poupinou.org>

--- Bruno Ducrot <ducrot@poupinou.org> wrote:

> Yes.  The problem with speedstep smi is that we
> don't
> know exactly how much time at transition will take.
> I've see some mail about adding such information for
> that driver, but nothing reach mainstream AFAIK.
> 
> More precisely, you have to modify that line:
> 
> 	policy->cpuinfo.transition_latency =
> CPUFREQ_ETERNAL;
> 
> with something like that:
> 
> 	policy->cpuinfo.transition_latency = 100000;
> 
> Actually I *really* don't know if that's correct,
> but it should be
> close enough to the real one, hopefully, even though
> I don't count
> the bus stuff, memory cache invalidation and so on..

Hi Bruno, thanks again :) But I'm a bit in the dark
here: which file should I change? I searched
/usr/src/linux/drivers/cpufreq/cpufreq_ondemand.c but
I didn't find the line you specified...
Anyway, I'm glad there's a way to make this governor
work, even though maybe it will not be perfect...


Greetz!
Johny

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
