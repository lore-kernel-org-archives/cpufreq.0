From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: 2.6.2: P4 ClockMod speed
Date: Mon, 16 Feb 2004 22:57:56 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040216215756.GU13262@poupinou.org>
References: <20040216213435.GA9680@dominikbrodowski.de>
	<40313AA9.1060906@arenanetwork.com.br>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <40313AA9.1060906@arenanetwork.com.br>
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
To: dual_bereta_r0x <dual_bereta_r0x@arenanetwork.com.br>
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

On Mon, Feb 16, 2004 at 09:48:25PM +0000, dual_bereta_r0x wrote:
> Dominik Brodowski wrote:
> >Hi,
> >
> >
> >>I have a P4 2.4 running @ 3.12GHz.
> >
> >
> >So you overclock your CPU but then throttle it down... strange, but well...
> 
> Actually it isn't throttled down, only sysfs is showing it with low 
> speed. It *is* running @ 3.12 (or /proc/cpuinfo and boot messages are 
> lying to me) when in full power.

/proc/cpuinfo is lying.

Use something like bogomips, and look if that's actually make a difference.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
