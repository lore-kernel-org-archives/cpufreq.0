From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Make overclock possible with cpufreq
Date: Mon, 29 May 2006 16:42:47 +0200
Message-ID: <20060529144247.GA6727@poupinou.org>
References: <6d24915a0605281326j597faae7u49daaf78c962e2db@mail.gmail.com>
	<20060528212239.GB5741@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060528212239.GB5741@redhat.com>
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
To: Matteo Giordano <ilmalteo@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Sun, May 28, 2006 at 05:22:39PM -0400, Dave Jones wrote:
> On Sun, May 28, 2006 at 10:26:56PM +0200, Matteo Giordano wrote:
> 
>  > I just subscribed to the list to address this issue (I think it's an 
>  > *issue*).
>  > I'm not a kernel hacker so I'm just guessing here, even if I searched
>  > and tried all the afternoon.
>  > It's not possible to use cpufreq with an overclocked CPU because the
>  > processor's frequencies are "hardcoded" somewhere (the BIOS or a PSB
>  > table?).
>  > So if I push my Athlon 64 3200+ to 2.4GHz the "performance" governor
>  > will always put it to 2GHz max, causing the overclock to be useless.
>  > 
>  > Isn't really possible to take the _actual_ frequencies into cpufreq?
> 
> It's reliant upon the BIOS tables describing valid frequency/voltage pairs.
> Obviously, your BIOS has no knowledge of overclocked values.
> 
> There's nothing sane we can do here. The only possible way this could
> work would be by having a mechanism to feed such pairs to the driver,
> overriding the BIOS.
> 
> Patches to do this have been posted to the list in the past, but I'm
> not enthusiastic about applying them to the mainline kernel, as the
> potential for getting something wrong if you don't know what you're
> doing is huge, and this has the possibility of exposing hard-to-track
> down bugs.
> 

Unless the processor is "unlocked", it's not possible to put an higher
multiplier than the max one anyway.  And if the system clock is
modified, then it is possible you got instability issues since powernow
use an internal counter to the processor clocked by the system clock,
and the processor may be awaken before PLL lock on the new frequency.
In other word, unless powernow-k8 is changed, you won't be able to
set a system clock higher than 240MHz (YMMV).

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
