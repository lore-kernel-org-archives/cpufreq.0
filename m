From: Stephan Diestelhorst <langer_mann@web.de>
Subject: Re: [PATCH 1/1] Speedfreq-SMI call clobbers ECX
Date: Tue, 11 Mar 2008 00:14:39 +0100
Message-ID: <200803110014.40246.langer_mann@web.de>
References: <200803051559.09962.langer_mann@web.de>
	<87iqzu8r2q.fsf@basil.nowhere.org>
	<200803102226.39044.langer_mann@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200803102226.39044.langer_mann@web.de>
Content-Disposition: inline
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
To: Andi Kleen <andi@firstfloor.org>
Cc: davej@codemonkey.org.uk, Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

Stephan Diestelhorst wrote:
> Andi Kleen wrote:
> > Stephan Diestelhorst <langer_mann@web.de> writes:
> > > 
> > > New attempt with full clobbers, note that I deliberatly did not change
> > > the order of the output registers. Real output operands still preceede
> > > outputs used for potential clobbering.
> > > 
> > > I'm not too sure about the EBP push/pop frame, but as folks pointed
> > > out already, we should not trust the SMI code too much.
> > 
> > Be careful -- older gcc versions tend to abort for inline asm
> > that clobbers too many registers. Especially when the register
> > is already used (like ebp in a frame pointer enabled kernel) 
> 
> > Make sure it at least works on the oldest supported gcc version 
> > (gcc 3.2) and with frame pointer on.
> 
> As I've said, I do not expect this to be problematic, but will test,
> just to be sure! 

I've tried it on the following GCCs: 3.3, 3.4, 4.0, 4.1, all with and
without frame-pointer ommission.
Result: As expected. Worked w/o problems, warnings anything.

Apologies for not testing gcc-3.2, but compiling it from source did
not work with libtool complaining about tags in libmath. I'd be
grateful if someone with working gcc-3.2 could try this out.

Cheers,
  Stephan
