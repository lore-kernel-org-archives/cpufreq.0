From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Can't get it working on Mobile Coppermine 1Ghz - i440BX -
	please help...
Date: Thu, 14 Sep 2006 16:13:16 +0200
Message-ID: <20060914141316.GL4945@poupinou.org>
References: <200609140048.53984.Rudolf.Lohner@rz.uni-karlsruhe.de>
	<20060914122803.72390.qmail@web30805.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060914122803.72390.qmail@web30805.mail.mud.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: Johny the Ripper <my_publicyty@yahoo.com>
Cc: cpufreq@lists.linux.org.uk

On Thu, Sep 14, 2006 at 05:28:03AM -0700, Johny the Ripper wrote:
> Hi,
> 
> 
> Thank you Bruno, with the module params you specified
> I have it running now :)
> However, it still doesn't do everything I wanted, but
> I suspect this has to do with hardware limitations...
> My goal was to use the "ondemand" governor, but I
> cannot start it. I can set the frequency manually and
> load the powersave, performance and userspace
> governors -- but not the ondemand governor :( Is this
> normal?

Yes.  The problem with speedstep smi is that we don't
know exactly how much time at transition will take.
I've see some mail about adding such information for
that driver, but nothing reach mainstream AFAIK.

More precisely, you have to modify that line:

	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;

with something like that:

	policy->cpuinfo.transition_latency = 100000;

Actually I *really* don't know if that's correct, but it should be
close enough to the real one, hopefully, even though I don't count
the bus stuff, memory cache invalidation and so on..


> For Rudolf: I have seen this error too. With me it
> occurs when you have set the speedstep setting in your
> bios to "disabled". I have 4 options in my bios for
> speedstep (max performance, battery optimized, auto
> and disabled) and selected "auto". The module should
> then load fine.

Ah yes.  I always forget that issue :)

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
