From: Andrew Morton <akpm@osdl.org>
Subject: Re: add lowpower_idle sysctl
Date: Thu, 18 Mar 2004 16:09:13 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040318160913.5915281d.akpm@osdl.org>
References: <20040317170436.430acfbe.akpm@osdl.org>
	<200403180318.i2I3IDF03166@unix-os.sc.intel.com>
	<20040317192821.1fe90f24.akpm@osdl.org>
	<Pine.LNX.4.58.0403172237470.28447@montezuma.fsmlabs.com>
	<405A29EA.6000400@mvista.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <405A29EA.6000400@mvista.com>
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
To: Todd Poynor <tpoynor@mvista.com>
Cc: cpufreq@www.linux.org.uk, zwane@linuxpower.ca, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, kenneth.w.chen@intel.com

Todd Poynor <tpoynor@mvista.com> wrote:
>
> Zwane Mwaikambo wrote:
> 
> >>Set some system-wide integer via a sysctl and let the particular
> >>architecture decide how best to implement the currently-selected idle mode?
> > 
> > I'm wondering whether the setting of these magic numbers can't be done
> > using cpufreq infrastructure.
> 
> I'd vote for using Patrick Mochel's PM subsystem and use a standard set 
> of identifiers that are mapped to a platform-specific idle behavior, in 
> much the same way as platform suspend modes are handled today.  For 
> example, strings echoed to /sys/power/idle could be an interface.  If 
> folks are amenable to this I'd be happy to supply a (generic) patch for it.

That sounds suitable, thanks.
