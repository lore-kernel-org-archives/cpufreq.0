From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] [RFC] [0/2] powernow-k7.  Recalibrate cpu_khz
Date: Mon, 22 Nov 2004 14:20:34 +0100
Message-ID: <20041122132034.GA14347@dominikbrodowski.de>
References: <20041118161034.GA31422@poupinou.org>
	<20041121095920.GA14594@dominikbrodowski.de>
	<20041122125257.GH31422@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041122125257.GH31422@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

On Mon, Nov 22, 2004 at 01:52:57PM +0100, Bruno Ducrot wrote:
> > Very interesting approach -- and something which might be useful for the
> > ACPI cpufreq driver as well: by doing the cpu_khz re-calculation we can
> > check whether the speed changed --> finally a ->get() function [and one
> > which clearly shows that it may only be accessible to root] can be
> > implemented for this driver... Also, on "lost ticks" we might fall back to
> > try a cpu_khz re-calculation first...
> 
> Well, there may be some issues though since some processors do have well
> known broken TSC support.  And the p4-clockmod driver can't recalibrate
> cpu_khz just because TSC frequency do not change.

However, if the TSC is fixed we also don't see "lost ticks" :-)

> > However, I'd like to have John Stultz input on this
> 
> I will ask him.

Excellent.

> > -- especially as he
> > maintains the timing subsystem. And one problem I see is that we'd need to
> > update "loops_per_jiffy" accordingly...
> 
> I forgot indeed loops_per_jiffy.  I feel sometimes stupid.

Then let me tell you that you're definitely _not_ stupid.

Thanks,
	Dominik
