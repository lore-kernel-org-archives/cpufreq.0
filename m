From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Problem with ondemand on Athlon
Date: Tue, 4 Nov 2003 19:12:27 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031104181227.GA4326@brodo.de>
References: <200310310434.01311.thierry.lathuille2@libertysurf.fr>
	<20031031122758.GA2617@inferi.kami.home>
	<200310310434.01311.thierry.lathuille2@libertysurf.fr>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031031122758.GA2617@inferi.kami.home>
	<200310310434.01311.thierry.lathuille2@libertysurf.fr>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Lathuille <thierry.lathuille2@libertysurf.fr>, cpufreq@www.linux.org.uk, dongili@supereva.it

Unfortunately, I can't reproduce the problem locally on my p4.
Can both of you try out the following, please:

pass "clock=pit" as a command line argument

The p4-clockmod driver [currently] needs to be built as a module then, 
and you need to pass stock_freq as an argument then. AFAIK, no such
requirement exists for powernow-k7.

Thanks,
	Dominik


On Fri, Oct 31, 2003 at 02:14:32PM +0100, Thierry Lathuille wrote:
> Hi,
> 
> I just tried Venkatesh's ondemand patches for kernel 2.6.0-test8 on my Acer 
> laptop with Athlon XP1600+.
> 
> Everything works fine with performance, powersave and userspace governors, I 
> can switch between frequencies without problem. 
> 
> But echoing "ondemand" to 
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor has unexpected effects:
> - the keyboard stops working - but the mouse still works, I can use apps in 
> KDE without problem - as long as I don't need to type anything...
> - I can't kill any xterm anymore. But the other applications work and can be 
> killed normally.
> - trying to reboot hangs the system.
> 
> I tried to figure out how far ondemand was executed, and added some debug 
> messages to yours ; So I got :
> 
> ONDEMAND START: cpu0, max 1400000, min500000, cur <the last one>
> (  then dbs_check_cpu is executed once)
> ONDEMAND LIMIT: <idem>
> And then, I don't get anything logged after the call to 
> down(&dbs_sem);
> 
> 
> I can reproduce the problem every time, whatever the frequency was before.
> Please tell me what infos you need to help solve the problem !
> 
> (BTW : I installed cpufreqd-1.1-rc1 since then : this works perfectly !)
> 
> 
> 
> Thierry Lathuille
> 
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
> 

On Fri, Oct 31, 2003 at 01:27:59PM +0100, Mattia Dongili wrote:
> On Fri, Oct 31, 2003 at 02:14:32PM +0100, Thierry Lathuille wrote:
> > Hi,
> [...]
> > But echoing "ondemand" to 
> > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor has unexpected effects:
> > - the keyboard stops working - but the mouse still works, I can use apps in 
> 
> happens the same here on a P4 1.8GHz with 2.6.0-test9
> 
> > - I can't kill any xterm anymore. But the other applications work and can be 
> > killed normally.
> > - trying to reboot hangs the system.
> 
> I tried from console (no X running). 
> echoing ondemand > /sys/.../scaling_governor never returns, all the
> consoles are freezed, keyboard too. I can ssh in and can cat
> /sys/.../scaling_governor obtaining *ondemand* correctly. The *ondemand*
> directory is also created. I forgot to check dmesg, I'll check it this
> evening or tomorrow
> 
> I'll add more info when I'll go back home :)
> -- 
> mattia
> :wq!
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
