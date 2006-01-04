From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: cpufreq: powernow-k8 frequency transitions question
Date: Wed, 4 Jan 2006 11:45:40 +0100
Message-ID: <20060104104540.GI13887@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A84303D430BD@SAUSEXMB1.amd.com>
	<20060103162946.GF13887@poupinou.org>
	<dpf5ue$4a0$1@sea.gmane.org> <43BB29FF.2000401@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <43BB29FF.2000401@gmail.com>
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
Content-Transfer-Encoding: 7bit
To: Nebojsa Trpkovic <trxman@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Wed, Jan 04, 2006 at 02:50:55AM +0100, Nebojsa Trpkovic wrote:
> The most usefull powersaving is achieved by lowering the voltage and not 
> the further lowering of frequency.

Of course.

> Power consumption (and heat dissipation) rise almost exactly with the 
> square of core voltage, so one could save a lot of power by lowering 
> voltage even just a little bit.

I think I can understand your point.

> I've found that almost all Athlon64 CPUs can work at a lot lower 
> voltage then in AMD specs.

You are right.  But I am not sure however if running out-of-spec a
processor will have a consequence for it's whole life time though.

> Newcastle 3000+   p-states: 1.0GHz @1.1V, 1.8GHz @1.4V, 2.0GHz @1.5V
> http://www.aaen.edu.yu/~tnt/newcastle.png
> 
> Winchester 3000+   p-states: 1.0GHz @1.1V, 1.8GHz @1.4V
> http://www.aaen.edu.yu/~tnt/winchester.png
> 
> So, I've modified powernow-k8.c to lower the voltages read from BIOS for 
> every p-state. Although I've made graphs of stable voltages by running 
> prime95 for at least 12 hours in every state,  I've left 0.1V over the 
> minimum stable voltage just to be 110% sure it will work stable:
> Winchester runs with 1.0GHz @1.0V and 1.8GHz @1.275V
> 
> Winchester is turned on 24/7 for last 6 months as it serves one LAN and 
> one wifi network (DNS, Proxy, firewall, web, teamspeak2, gentoo rsync, 
> ftp, 1TB samba...) and it has NO problems at all!
> 
> Newcastle was my desktop CPU and now there's Palermo Sempron 2800+.
> 

My though was more towards what Gunter Ohrner stated, that is if it's
interresting to add some intermediate low p-state between the already
given one and the first high p-state given the actual status of
the algorithms used (as the on-demand and maybe other I'm working ATM).

> 
> 
> Gunter Ohrner wrote:
> 
> >Bruno Ducrot wrote:
> > 
> >
> >>I'm wondering if this would have some more power saving if there are more
> >>low p-states.  I should some day look at this more seriously.
> >>   
> >>
> >
> >I own a Winchester 3000+ (max. 1,8GHz) which I tried to operate at 800 MHz
> >(instead of 1,0GHz) but it locked hard. It can be forced to intermediate
> >out-of-spec speeds (1,2GHz, 1,4GHz and 1,6GHz, although 1,4 should not be
> >reachable according to AMDs frequency transition spec).
> >
> >Though I'm not sure if there's any win from these unsupported P-states as
> >1,0GHz should suffice for most tasks and for everything else the system can
> >quickly toggle to 1,8 GHz. I currently can't think of any task which would
> >require more processing power than provided by 1,0GHz but less than
> >provided by 1,8GHz over a longer period of time, so that the intermediate
> >P-states would actually be used by the ondemand governor for longer than a
> >fraction of a second... Though it could be interesting for faster CPUs than
> >mine that are decoding HD video or similar.
> >
> >Greetings,
> >
> > Gunter
> >
> > 
> >
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
