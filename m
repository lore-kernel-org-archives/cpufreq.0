From: Mattia Dongili <dongili@supereva.it>
Subject: Re: CPU Frequency Scaling
Date: Thu, 2 Sep 2004 12:53:48 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040902105348.GA2447@inferi.kami.home>
References: <20040901230103.GB4175@ncrfgs3.ncrfgs>
	<20040902094839.GW29560@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040902094839.GW29560@poupinou.org>
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
To: cpufreq@www.linux.org.uk

On Thu, Sep 02, 2004 at 11:48:39AM +0200, Bruno Ducrot wrote:
> On Thu, Sep 02, 2004 at 01:01:03AM +0200, ncrfgs wrote:
[...]
> > "Because the battery life increase by 1 hour with cpufreqd. And Battery
> > load derivative decrease (absolute value increase) when I use some cpu
> > intensive programs. Less formally, the more cpu I use the faster my
> > battery load decrease."
> > 
> > Is it just an impression of his?
> 
> He just forgot to check that the scaling_max_freq will change ;)
> 
> PS: I don't know why this deamon use the performance governor instead of the
> userspace, or better why they don't use performance/powersave and tweak
> the (logical) min/max.  This will ihmo make longrun owners happy...  But
> since I don't use this deamon, perhaps it's already the case?

Uhmmm... :) maybe I didn't understand your objection to cpufreqd, but
let me spend a couple of words about it.

Cpufreqd defines working Profiles as:
    [Profile]
    name=hi_boost
    minfreq=907060
    maxfreq=997500
    policy=performance

where 'policy' can be any of the available kernel cpufreq governors.
Anyway setting policy=userspace won't work as expected (I need to write
it in the manpages...) because cpufreqd doesn't write to
scaling_setspeed. The rationale behind that is that you can achive the
same result as using the userspace governor by setting minfreq and
maxfreq to the same value and use powersave or performance to round that
value to the lower or higher value respectively. Or you can also achive
the same by setting minfreq to the desired frequency and use the
powersave governor with the same rounding capabilities (the same applies
maxfreq/performance).

The rationale behind the minfreq and maxfreq values is that I expect
(one day) to find an 'on_demand' or similar governor that relies on
scaling_min_freq and scaling_max_freq, not on values obtained by
different sysfs entries. I'm trying to go in-depth enough to be able to
write such a governor, but I need more time :)

This simply follows the old Linus discussion on implementing policies
in-kernel and give the user an higher level interface [1].

Does this (at least partially) answer your question? :)

[1]: http://www.linux.org.uk/mailman/private/cpufreq/2002-August/000865.html
-- 
mattia
:wq!
