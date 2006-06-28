From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: ondemand vs suspend.
Date: Wed, 28 Jun 2006 15:20:36 -0700
Message-ID: <44A300B4.8050202@goop.org>
References: <EB12A50964762B4D8111D55B764A84541D4F8C@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A84541D4F8C@scsmsx413.amr.corp.intel.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@redhat.com>, pjones@redhat.com, cpufreq@lists.linux.org.uk

Pallipadi, Venkatesh wrote:
> Strange. I guess only scaling_max_freq is changing and not
> cpuinfo_max_freq. Right?
> Can you try stopping the applet and see whether anything changes?
> Is the system idle while these changes happen or the load is varying
> causing some frequency changes by conservative on CPU 0?
>
> I am not able to reproduce this with periodic reading of
> scaling_cur_freq. May be soemthing else is happening from userlevel that
> is causing this..
>   
Sorry, I haven't got around to looking at this closely again.  However, 
the behaviour with 2.6.17-mm3 has changed a bit.  Now on resume, the 
cpufreq applets exit for some reason, and both CPUs end up with a max 
speed of 1GHz.

> Can you enable cpufreq.debug and capture the log. 
>   

Will do.

    J
