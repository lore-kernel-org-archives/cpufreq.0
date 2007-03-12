From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: cpufreq on Debian, problems
Date: Mon, 12 Mar 2007 10:58:55 +0100
Message-ID: <20070312095855.GL12197@poupinou.org>
References: <553837380703111304m4aea8cbcufdc5da4261e41895@mail.gmail.com>
	<45F47282.4020209@chrestomanci.org>
	<200703112045.12149.lenb@kernel.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200703112045.12149.lenb@kernel.org>
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
To: Len Brown <lenb@kernel.org>
Cc: cpufreq@lists.linux.org.uk, Joshua Justice <joshj777@gmail.com>

On Sun, Mar 11, 2007 at 07:45:12PM -0500, Len Brown wrote:
> On Sunday 11 March 2007 17:20, David Pottage wrote:
> > Joshua Justice wrote:
> > > I'm running a Pentium 4, 3.40 gigahertz, on Debian Etch 2.6.18-4-686, 
> > > and I have issues with overheating because cpu throttling isn't working.
> 
> Check that your fan is properly installed, including thermal compound.
> 
> You should not need throttling to cool a P4.
> Indeed, most of them don't support any P-states at all.
> 
> -Len
> 
> > Is your clock frequency scaling back when your system is not under load?
> > 
> > If it is not, and you want it to, then you need to run the ondemand or 
> > conservative govenor. Take a look in 
> > /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors that 
> > they are there, then echo a govenor name into 
> > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
> > 
> > If the clock frequency is changing acording to your system load, but it 
> > is still overheading, you probably need to improve your cooling hardware.
> > 
> > If it is not practical to improve your CPU cooling, or if your peak 
> > loads are ocasional, then you can prevent overheating by limiting the 
> > CPU temperature. I have written a userland perl script that does this 
> > automaticaly, by monitoring the CPU temperature, and lowering the 
> > maximum CPU frequency if the temperature gets to high. You can have a 
> > copy if you like.

There is also that kernel option:
"Processor type and features" -->
    "Check for non-fatal errors on AMD Athlon/Duron / Intel Pentium 4"
        --> "check for P4 thermal throttling interrupt."

preventing processor overheating if fan is not working ok. That
option doesn't require cpufreq.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
