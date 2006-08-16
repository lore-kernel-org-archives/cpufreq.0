From: Len Brown <len.brown@intel.com>
Subject: Re: cpufreq stops working after a while
Date: Wed, 16 Aug 2006 15:28:24 -0400
Message-ID: <200608161528.25238.len.brown@intel.com>
References: <EB12A50964762B4D8111D55B764A84546F986C@scsmsx413.amr.corp.intel.com>
Reply-To: Len Brown <lenb@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A84546F986C@scsmsx413.amr.corp.intel.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk


> >I have the same problem. My laptop is Dell Latitude D600 (Intel(R)
> >Pentium(R) M processor 1.60GHz). If I'm compiling something, for
> >example, that takes a long time, scaling_max_freq is set to 600000 (the
> >lowest). If I try to echo 1600000 to scaling_max_freq it do nothing.
> >Only after some time if the cpu load is not high I can echoing 1600000
> >again and it works without need to reboot. 
> >
> 
> Looks like you have the same problem that Mark had in this original thread. Thermal.
> It is not a bug in cpufreq. Just that due to cpu load, system is getting heated up and platform decides to reduce the temperature using passive cooling and as a result reduces the frequency. Does your system have active cooling (fans) or does it allow only passive cooling? You can monitor the temperature by looking at stuff under /proc/acpi/termal_zone/*/*.

I've got a D600 and have noticed thermal throttling also.
The way I noticed it is because bltk showed poor performance
compared to other similar laptops when measuring battery life:

http://sourceforge.net/projects/bltk
 
I found that this was independent of cpufreq, and would still happen even if the performance governor was used.
Sometimes I noticed that the T-state in /proc/acpi/processor/*/throttling was not 0, which was unexpected.

I blamed SuSE's stupid powersavd at the time (IIR, it was SL10.1) , but maybe that wasn't the root cause.

-Len
