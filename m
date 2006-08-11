From: Andrew Morton <akpm@osdl.org>
Subject: Re: cpufreq stops working after a while
Date: Fri, 11 Aug 2006 11:46:31 -0700
Message-ID: <20060811114631.4a699667.akpm@osdl.org>
References: <44DCCB96.5080801@rtr.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <44DCCB96.5080801@rtr.ca>
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
To: Mark Lord <lkml@rtr.ca>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, cpufreq@www.linux.org.uk

On Fri, 11 Aug 2006 14:25:26 -0400
Mark Lord <lkml@rtr.ca> wrote:

> One of my notebooks (Dell Latitude X1) has a 1.1GHz Pentium-M ULV processor.
> This chip can change CPU speeds from 600 -> 800 -> 1100 Mhz.
> 
> I use speedstep-centrino with it, and after boot all is usually okay.
> But after a few hours of operation, it stops shifting to the highest frequency
> even under continuous 100% load (or not).  Eventually it gets stuck at 600Mhz
> and stays there until I reboot.
> 
> Sometimes rebooting doesn't even restore it.
> 
> /sys/devices/system/cpu/cpu0/cpufreq is all very normal looking,
> showing the available frequencies and other info.  All of the attribs
> there look fine, except for "scaling_max_freq", which is what seems
> to gradually get set smaller.  For instance, right now it is set to 800000,
> and it won't let me change it (echo 11000000 > scaling_max_freq has no effect.
> 
> WHY?

cpufreq seems to have relatively frequent problems.

>  And how can I fix it?

You could start by telling us which kernel versions are affected ;)
