From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: CPU Frequency Scaling
Date: Thu, 2 Sep 2004 11:48:39 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040902094839.GW29560@poupinou.org>
References: <20040901230103.GB4175@ncrfgs3.ncrfgs>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040901230103.GB4175@ncrfgs3.ncrfgs>
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
To: ncrfgs <ncrfgs@tin.it>
Cc: cpufreq@www.linux.org.uk

On Thu, Sep 02, 2004 at 01:01:03AM +0200, ncrfgs wrote:
> Hi,
> 
> I'm running a vanilla 2.6.8.1 Linux kernel on an iBook 2.2 G3
> 900 MHz and I'd like to try the CPU frequency scaling.
> 
> Is it required to enable "/proc/sys/cpu/ interface (2.4. / OLD)"
> in order to be able to use CPU frequency scaling efectively?

No.  It's old, somehow ugly, and will be removed in the future.

> The kernel I'm running doesn't include it, I'm using powernowd
> as userspace governor and the CPU frequency scaling seems to
> work as far as I know from what I read in /proc/cpu* and
> /sys/devices/system/cpu/cpu0/cpufreq/* files.
> 
> Unfortunately even when /proc/cpuinfo reports a clock of 900MHz
> and /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq is set
> to 900000 the system looks quite slow to me, for example during
> compilation processes, as if the current frequency was 400 MHz.
> 
> Do I have to enable "Support for Apple PowerBooks", too?

Yes, but for other reasons ;) (LCD brightness, suspend to ram, etc.)
(I think the G3 don't use the pmu, though I guess benh know more than
me for this..)

> Some days ago I argued about this issue with a guy from the
> debian-powerpc mailing list, too and I faced a strange situation
> I didn't understand. According to his kernel config he is using
> 'performance' as Default CPUFreq governor but as far as I can see
> from the 'performance' governor Help it shouldn't allow CPU
> Frequency scaling:
> 
>   CONFIG_CPU_FREQ_GOV_PERFORMANCE:
> 
>   This cpufreq governors set the frequency statically to the
>   highest available CPU frequency.

No.  For two reason:
first: the iBook set on boot the processor in the lowest available
frequency, and the firmware will not change this.
If the kernel is compiled with the performance governor as default, one
frequency change will be done in order to set the processor at the
highest frequency available.
Second, the performance governor could be used to change the frequency
by setting the maximal frequency allowed for it (look at the
scaling_max_freq, which is writable, the 'real' max being in the
cpuinfo_max_freq).  By changing this value, you will set a new
frequency (if the cpufreq driver associated is of course of type
'fixed', not like the longrun, for example).

> He said that's strange indeed. Nevertheless, He's sure that his frequency is
> changing...

Nope, nothing strange ;)

> "Because the battery life increase by 1 hour with cpufreqd. And Battery
> load derivative decrease (absolute value increase) when I use some cpu
> intensive programs. Less formally, the more cpu I use the faster my
> battery load decrease."
> 
> Is it just an impression of his?

He just forgot to check that the scaling_max_freq will change ;)

PS: I don't know why this deamon use the performance governor instead of the
userspace, or better why they don't use performance/powersave and tweak
the (logical) min/max.  This will ihmo make longrun owners happy...  But
since I don't use this deamon, perhaps it's already the case?

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
