From: Javi <javi@gsmlandia.com>
Subject: Is it possible to modify "Frequency Table Helpers" to let Overclock?
Date: Thu, 20 Jan 2005 02:34:51 +0000
Message-ID: <200501200234.51382.javi@gsmlandia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@zenII.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

First of all, hi everybody, it's my first mail to the list :)

I use to have my CPU overclocked and I would like to use dynamic CPU frequency scaling.
I have an AMD64 3400+ (754) which default's  frequency  is 2400Mhz, but I always run it at 2800Mhz.

The problem is that I can't use dynamic CPU frequency scaling because the max abiable speed I can set is 2400Mhz, so I can't overclock :(

# for i in $( ls /sys/devices/system/cpu/cpu0/cpufreq ); do  echo -n $i;  echo -n ": ";  cat $i; done ;
cpuinfo_cur_freq: 2000000
cpuinfo_max_freq: 2400000 
cpuinfo_min_freq: 1000000
scaling_available_frequencies: 2400000 2200000 2000000 1800000 1000000
scaling_available_governors: ondemand userspace
scaling_cur_freq: 2000000
scaling_driver: powernow-k8
scaling_governor: ondemand 
scaling_max_freq: 2400000 
scaling_min_freq: 1000000
scaling_setspeed: 2000000

Is there a way to change "Frequency Table Helpers" to let me overclock?

Thanks in advance.

Javi.
