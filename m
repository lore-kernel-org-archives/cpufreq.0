From: Hilbert Mostert <hilbert.mostert@tadis.nl>
Subject: Processor speed way above specs
Date: Fri, 10 Dec 2004 23:42:57 +0100
Message-ID: <200412102342.58060.hilbert.mostert@tadis.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
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
To: cpufreq list <cpufreq@www.linux.org.uk>

Hello list,

this is my first post i have red the list but couldn't find an answer.

I am the happy owner of a ACER Travelmate 4001WLMI which comes equipped with 
an Intel Pentium M 1,5GHz, it is the new dothan core. I am running kernel 
version 2.6.10-rc3 and after some fideling around i have managed to get the 
speedstep-centrino driver working.

The problems is that when i put the system under load the file /proc/cpuinfo 
file shows that the current speed is over 1,7GHz. Due to the fact i have an 
1.5GHz processor i thought it would be a little high for this processor.

When i look at /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq is at 
1600000 and /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq is 600000

When i put 1600000 in the scaling_setspeed file the file /proc/cpuinfo shows 
1,7GHz

I dont think this whould be normal and i would like to know if there is a 
solution.

Sincerely,

Hilbert Mostert
