From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Help! Cpufreq makes my laptop crash!
Date: Thu, 15 Jul 2004 11:57:10 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040715095710.GN6326@poupinou.org>
References: <40F549D5.8030100@fuckup.homelinux.com>
	<20040714115717.4gsocksks0s8o4wc@carlthompson.net>
	<40F58B6C.60606@fuckup.homelinux.com>
	<20040714140944.g0k8c40swcskss8g@carlthompson.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040714140944.g0k8c40swcskss8g@carlthompson.net>
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
To: Carl Thompson <cet@carlthompson.net>
Cc: olgaAr <olgaAr@fuckup.homelinux.com>, cpufreq@www.linux.org.uk

On Wed, Jul 14, 2004 at 02:09:44PM -0700, Carl Thompson wrote:
> 
> Try my CPUSpeed program and see if it works better for you:
> 
>    http://carlthompson.net/software/cpuspeed
> 
> Sometimes older mobile Athlons have problems.  Supposedly a workaround is
> in CPUFreq but maybe it doesn't work right in your case. CPUSpeed has a
> workaround that might work if this is the problem.
> 

Hi Carl,

I think powernow-k7 do not have trouble for the bug there were some times
ago.
I don't think really that your workaround is no more needed, as I said
you some times ago.
The problem was that the SGTC that have to be put was wrong (and so the
processor will resume, but the PLL haven't had enough time to stabilize).

I would buy more at that time on a wrong value for the MSR CLK_CTL,
though I can't be sure at 100% at that time (and I have no documentation
for that MSR unfortunately), which may introduce an hang when we enter
the ACPI idle loop.  Maybe if olgaAr can test without the ACPI processor
support to see what happens.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
