From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] 2.6.5 speedstep on P4Ms
Date: Wed, 9 Jun 2004 18:09:15 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040609160915.GW13782@poupinou.org>
References: <40C5F42D.1050107@cern.ch> <20040608153023.GS13782@poupinou.org>
	<40C6517E.1090708@cern.ch>
	<20040609154710.GA9482@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040609154710.GA9482@dominikbrodowski.de>
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

On Wed, Jun 09, 2004 at 05:47:10PM +0200, Dominik Brodowski wrote:
> Hi Chris,
> 
> > for 3): what you say sounds much better than my brutal hack, so i won't 
> > post it again. i'd definitely want to try to implement 2 cpufreq 
> > drivers, but i fear this is way beyond me at the moment and probably 
> > involves design choices i can't make.
> 
> well, somebody _does_ have to do design choices... However, I'm not yet
> convinced of the necessity of supporting throttling and frequency scaling on
> the same system. Even more, under normal circumstances [i.e. idling works,
> which it does on most systems], I see no _technical_ reason to do
> throttling, or even non-temperature related _dynamic throttling_ like other
> OSes do it. For those new to this list, there's some maths in the archives
> which proves that you need more energy == battery power if you do
> throttling for any given task... So it's something we need to discuss 
> during 2.7.

In fact, I was more thinking about the FSB stuff which generate some noise
recently I believe (and that have to be done during 2.7), though
I'm pretty sure changing FSB is more helpfull for overclocker.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
