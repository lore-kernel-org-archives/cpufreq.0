From: Dave Jones <davej@redhat.com>
Subject: Re: oops on resume
Date: Thu, 5 Aug 2004 20:52:48 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040805195248.GA32045@redhat.com>
References: <pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
	<20040805192613.GA9008@dominikbrodowski.de>
	<1091734482.10552.20.camel@pc>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1091734482.10552.20.camel@pc>
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
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq@www.linux.org.uk

On Thu, Aug 05, 2004 at 03:34:42PM -0400, Brian J. Murrell wrote:
 > On Thu, 2004-08-05 at 21:26 +0200, Dominik Brodowski wrote:
 > > cat /sys/devices/system/cpu/cpu0/cpufreq/*
 > 
 > Just to be sure you knew which values where for which nodes I did a
 > 
 > grep ".*" /sys/devices/system/cpu/cpu0/cpufreq/*
 > 
 > and got:
 > 
 > /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1200000
 > /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq:2200000
 > /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq:1200000
 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies:2200000 1200000
 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors:userspace performance
 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1200000
 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver:speedstep-ich
 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor:userspace
 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq:2200000
 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq:1200000
 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed:1200000


My guess is that speedstep_get_processor_frequency() is returning null

What does /proc/cpuinfo say ?

		Dave
