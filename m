From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH 1/1] Speedfreq-SMI call clobbers ECX
Date: Mon, 10 Mar 2008 22:51:45 +0100
Message-ID: <20080310215145.GB9246@one.firstfloor.org>
References: <200803051559.09962.langer_mann@web.de>
	<200803101605.42251.langer_mann@web.de>
	<87iqzu8r2q.fsf@basil.nowhere.org>
	<200803102226.39044.langer_mann@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200803102226.39044.langer_mann@web.de>
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
To: Stephan Diestelhorst <langer_mann@web.de>
Cc: davej@codemonkey.org.uk, Ingo Molnar <mingo@elte.hu>, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

> Please also note that these are not clobbers in the strict inline asm
> syntax, but rather dummy output values that correspond to actual

Outputs/Inputs are as bad as clobbers in triggering gcc reload ICEs.

> input parameters. I'd consider this a serious compiler flaw, if not
> bug, if these would not work. But let's not get into GCC vs.

It is, and it's (mostly) fixed in newer versions, but we're stuck with 
supporting the older compiler versions unfortunately.

> > For asms with so many clobbers explicit push/pop is usually safer.
> 
> Yes, but it is unneccessary overhead as the compiler can (should!)
> find more elegant ways to get those registers back if needed.

This code is not performance critical at all. Safer beats faster
any time in such cases.

-Andi
