From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] [RFC] [0/2] powernow-k7.  Recalibrate cpu_khz
Date: Mon, 22 Nov 2004 13:52:57 +0100
Message-ID: <20041122125257.GH31422@poupinou.org>
References: <20041118161034.GA31422@poupinou.org>
	<20041121095920.GA14594@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041121095920.GA14594@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

On Sun, Nov 21, 2004 at 10:59:20AM +0100, Dominik Brodowski wrote:
> On Thu, Nov 18, 2004 at 05:10:34PM +0100, Bruno Ducrot wrote:
> > Hi,
> > 
> > Here come two patches in order to fix some issues with powernow-k7.
> > 
> > The main trouble is that we can't rely on cpu_khz when that one is
> > computed at boot time.  AMD will require that the CPU will be at max
> > frequencies, but some BIOS do not respect this.  More, the BIOS is only
> > required to change the frequency of the processor, but only at POST
> > time.  Some BIOS also do not follow this rule, so that even if the
> > processor is at full speed at POST, it may decide (probably after
> > switching to ACPI or APM mode?) to switch to another frequency.
> > 
> > The only workaround for this two kind of bugs I see is to recalibrate
> > cpu_khz, but this require discussions with other people, I guess.  The
> > second patch will be the powernow-k7 portion.
> 
> Very interesting approach -- and something which might be useful for the
> ACPI cpufreq driver as well: by doing the cpu_khz re-calculation we can
> check whether the speed changed --> finally a ->get() function [and one
> which clearly shows that it may only be accessible to root] can be
> implemented for this driver... Also, on "lost ticks" we might fall back to
> try a cpu_khz re-calculation first...

Well, there may be some issues though since some processors do have well
known broken TSC support.  And the p4-clockmod driver can't recalibrate
cpu_khz just because TSC frequency do not change.

> However, I'd like to have John Stultz input on this

I will ask him.

> -- especially as he
> maintains the timing subsystem. And one problem I see is that we'd need to
> update "loops_per_jiffy" accordingly...

I forgot indeed loops_per_jiffy.  I feel sometimes stupid.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
