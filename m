From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8 manual voltage selection ?
Date: Mon, 20 Dec 2004 17:45:04 +0100
Message-ID: <20041220164504.GP2140@poupinou.org>
References: <E1CfpfX-000ID6-00.trx-inbox-ru@f17.mail.ru>
	<20041220141203.GO2140@poupinou.org> <41C6F43F.4000306@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <41C6F43F.4000306@gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nebojsa Trpkovic <trxman@gmail.com>
Cc: cpufreq@www.linux.org.uk

On Mon, Dec 20, 2004 at 04:48:15PM +0100, Nebojsa Trpkovic wrote:
> Bruno Ducrot wrote:
> 
> >How you have done this?  By powernow-k8 or via BIOS setting?  If the
> >latter, I will not trust this input yet. You can verify this is OK via
> >cpufrequtils at
> >http://www.kernel.org/pub/linux/utils/kernel/cpufreq/cpufrequtils-0.1.tar.bz2
> >then go to cpufrequtils-0.1/debug/x86_64 and issue a make, then 
> >./powernow-k8-decode
> >as root.  You must have the msr kernel driver loaded to get it working.
> > 
> >
> I've done that by some software tool in window$ (I just didn't want to 
> lock up system several times in my Gentoo :) ). By that tool (can't 
> remember name) I was able to change multiplicators and voltages. I was 
> monitoring voltages by other 2 tools and I could saw that my mobo 
> overvolts CPU a little bit under heavy load, but it's about ~0.000V 
> @0.800V, ~0.025V @1.100V and ~0.050V @1.5V
> I've tried to undervolt in BIOS and it worked, too. But, my BIOS allows 
> only 0.9V and by software I was able to go under that voltage. Here you 
> can see results (all of them passed few hours in prime):
> 
> http://www.aaen.edu.yu/~tnt/graf.png
> 
> Now, I'm running at 2.385MHz at 1.425V and under full load my lm_sensors 
> show VCore = 1.46V

Could you please ./powernow-k8-decode in this case (nb:
powernow-k8-decode do not need powernow-k8).

> I'll try to play a little bit more when I get 1 x 512MB module, as my 
> mobo would lock up every time I try to change something on the fly with 
> 2 modules. It's comon issue with Socket 754 boards.
> 
> >Such patch will never reach mainline (but may be posted to this list for
> >reference purpose only).
> > 
> >
> Yes... I guess so... I'm a little bit sad because linux becomes such 
> conservative...

linux have been always conservative in mainline if running hardware
out-of-spec AFAIK.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
