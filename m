From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] 2.6.5 speedstep on P4Ms
Date: Wed, 09 Jun 2004 17:29:00 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1086798540.31338.6.camel@delerium.codemonkey.org.uk>
References: <40C5F42D.1050107@cern.ch> <20040608153023.GS13782@poupinou.org>
	<40C6517E.1090708@cern.ch> <20040609154710.GA9482@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: Bruno Ducrot <ducrot@poupinou.org>, holbling@cpt.univ-mrs.fr, cpufreq@www.linux.org.uk

On Wed, 2004-06-09 at 16:47, Dominik Brodowski wrote:
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

I'm actually inclined to kill off p4-clockmod one day.
It doesn't seem to do anything useful whatsoever.
It certainly doesn't lower the temperature on my xeon.

	Dave
