From: Mattia Dongili <malattia@linux.it>
Subject: Re: Help: Using cpufreq from kernel level
Date: Sat, 17 Dec 2005 19:27:45 +0100
Message-ID: <20051217182744.GB7339@inferi.kami.home>
References: <200512171310.34014.cloud.of.andor@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200512171310.34014.cloud.of.andor@gmail.com>
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
To: Claudio Scordino <cloud.of.andor@gmail.com>
Cc: kernelnewbies@nl.linux.org, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Sat, Dec 17, 2005 at 01:10:33PM -0500, Claudio Scordino wrote:
> Hi all,
> 
>    I'm writing a kernel module that needs to get info about the available 
> frequencies on the current processor and to periodically change the current 
> frequency.

So it seems you're writing a governor. See
Documentation/cpu-freq/governors.txt and
drivers/cpufreq/cpufreq_conservative.c
drivers/cpufreq/cpufreq_ondemand.c
drivers/cpufreq/cpufreq_performance.c
drivers/cpufreq/cpufreq_powersave.c
drivers/cpufreq/cpufreq_userspace.c

for a first reference.

> At user level it can be done through
> 
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
> /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> 
> but I have no idea how to implement it at kernel level. 
> 
> I tried to declare
> 
> extern struct cpufreq_driver    *cpufreq_driver;
> extern struct cpufreq_policy    *cpufreq_cpu_data[NR_CPUS];
> extern spinlock_t cpufreq_driver_lock;
> extern ssize_t show_available_freqs (struct cpufreq_policy *policy, char 
> *buf);
> 
> and to do
> 
> char buffer [100000] = "\n";
> spin_lock_irqsave(&cpufreq_driver_lock, flags);
> show_available_freqs(cpufreq_cpu_data[0], buffer);
> spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
> 
> but it crashes the system.

of course it does, this is just the sysfs -show function and you're
passing it a null pointer as first parameter. If you look at
show_available_freqs code you'll see that cpufreq_cpu_data is
dereferenced and this happening with interrupts disabled..

hth
-- 
mattia
:wq!
