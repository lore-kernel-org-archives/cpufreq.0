From: "Saru Addep" <saru.dpm@gmail.com>
Subject: Re: Overall picture of cpufreq..
Date: Sun, 13 Jan 2008 21:12:06 -0500
Message-ID: <9f79f7f50801131812x6a68c202tb4c25fa2116b32e4@mail.gmail.com>
References: <9f79f7f50801111415w354dc91fwfeec98b16a00fb74@mail.gmail.com>
	<1200264884.4157.16.camel@queen>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1200264884.4157.16.camel@queen>
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
To: trenn@suse.de
Cc: cpufreq@lists.linux.org.uk

Hi Thomas,

So that means if we have an ondemand governor properly instrumented, there
is no need to have userspace governor. In the case of ondemand governor, the
only work that will be left to userspace would be to set the min, and max
freq. The complete intelligence of DVFS algoritm is present inside the
ondemand governor. Is my understanding correct.

Thanks
Saringni.

On Jan 13, 2008 5:54 PM, Thomas Renninger <trenn@suse.de> wrote:

>
> On Fri, 2008-01-11 at 14:15 -0800, Saru Addep wrote:
> > Hi All,
> ...
> > 2) What is the purpose of userspace governor.
>
> You can set the frequency from userspace:
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> (or similar) pops up when you switch to userspace governor.
>
> The first dynamic cpufreq approaches were done in userspace. You have a
> daemon checking every some 100 ms for the CPU load (/proc/stats) and
> then decide whether to increase or decrease the freq.
>
> The ondemand governor is doing that in kernel, but has the sideeffect of
> not supporting HW (IIRC speedstep-lib, possibly longhaul, powernow-k7
> (not sure) and other older ones) that takes too long for switching
> frequencies. Then you would still need the userspace governor for
> switching.
>
>   Thomas
>
>
