From: Thomas Renninger <trenn@suse.de>
Subject: Re: Overall picture of cpufreq..
Date: Sun, 13 Jan 2008 23:54:34 +0100
Message-ID: <1200264884.4157.16.camel@queen>
References: <9f79f7f50801111415w354dc91fwfeec98b16a00fb74@mail.gmail.com>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <9f79f7f50801111415w354dc91fwfeec98b16a00fb74@mail.gmail.com>
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
To: Saru Addep <saru.dpm@gmail.com>
Cc: cpufreq@lists.linux.org.uk


On Fri, 2008-01-11 at 14:15 -0800, Saru Addep wrote:
> Hi All,
...
> 2) What is the purpose of userspace governor.

You can set the frequency from userspace:
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
(or similar) pops up when you switch to userspace governor.

The first dynamic cpufreq approaches were done in userspace. You have a
daemon checking every some 100 ms for the CPU load (/proc/stats) and
then decide whether to increase or decrease the freq.

The ondemand governor is doing that in kernel, but has the sideeffect of
not supporting HW (IIRC speedstep-lib, possibly longhaul, powernow-k7
(not sure) and other older ones) that takes too long for switching
frequencies. Then you would still need the userspace governor for
switching.

   Thomas
