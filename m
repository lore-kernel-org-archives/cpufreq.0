From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] 2.6.5 speedstep on P4Ms
Date: Thu, 10 Jun 2004 11:10:22 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610091022.GY13782@poupinou.org>
References: <40C5F42D.1050107@cern.ch> <20040608153023.GS13782@poupinou.org>
	<40C6517E.1090708@cern.ch>
	<20040609154710.GA9482@dominikbrodowski.de>
	<40C7AF6C.1080408@cern.ch>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <40C7AF6C.1080408@cern.ch>
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
To: holbling@cpt.univ-mrs.fr
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq@www.linux.org.uk

On Thu, Jun 10, 2004 at 12:46:36AM +0000, Christian Hoelbling wrote:
> hi dominik,
> 
> thanks alot for your detailed reply and patience with a newbie. i have 
> attached 2 patches w.r.t. 2.6.7-rc3 that should adress your suggestions.
> 
> i also wonder about one thing, maybe you can help me on that. with the 
> old speedstep driver, i would have occational hard freezups of my 
> machine. this seems to be gone (just experimental evidence, since i 
> didn't have one in a few days now where before they occured about 
> hourly). so my guess is that something in this patch must have corrected 
> it. since my machine just has one physical cpu, i really don't 
> understand what went wrong before.  do you have any idea on that?
> 

IMHO the lockup is due to the fact we use local_irq_disable() but it
should be done more globally.  I believe you may still have some lockup
still.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
