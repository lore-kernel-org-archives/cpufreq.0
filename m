From: Claudio Scordino <cloud.of.andor@gmail.com>
Subject: Help: Using cpufreq from kernel level
Date: Sat, 17 Dec 2005 13:10:33 -0500
Message-ID: <200512171310.34014.cloud.of.andor@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932638AbVLQSKq@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk
Cc: kernelnewbies@nl.linux.org, linux-kernel@vger.kernel.org

Hi all,

   I'm writing a kernel module that needs to get info about the available 
frequencies on the current processor and to periodically change the current 
frequency.

At user level it can be done through

/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed

but I have no idea how to implement it at kernel level. 

I tried to declare

extern struct cpufreq_driver    *cpufreq_driver;
extern struct cpufreq_policy    *cpufreq_cpu_data[NR_CPUS];
extern spinlock_t cpufreq_driver_lock;
extern ssize_t show_available_freqs (struct cpufreq_policy *policy, char 
*buf);

and to do

char buffer [100000] = "\n";
spin_lock_irqsave(&cpufreq_driver_lock, flags);
show_available_freqs(cpufreq_cpu_data[0], buffer);
spin_unlock_irqrestore(&cpufreq_driver_lock, flags);

but it crashes the system.

Please, can somebody tell me how this can be done ?

Many thanks,

        Claudio Scordino
