From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] replace for_each_cpu with for_each_cpu_mask (was Re:
	[PATCH] 2.6.5 speedstep on P4Ms)
Date: Thu, 10 Jun 2004 22:38:14 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610213813.GT7964@redhat.com>
References: <40C5F42D.1050107@cern.ch> <20040608153023.GS13782@poupinou.org>
	<40C6517E.1090708@cern.ch>
	<20040609154710.GA9482@dominikbrodowski.de>
	<40C7AF6C.1080408@cern.ch> <20040610153711.GZ13782@poupinou.org>
	<20040610164434.GA14158@dominikbrodowski.de>
	<20040610200427.GE13782@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040610200427.GE13782@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

On Thu, Jun 10, 2004 at 10:04:27PM +0200, Bruno Ducrot wrote:

 > - --- linux-2.6.7-rc3-mm1/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004/06/10 19:54:23	1.1
 > +++ linux-2.6.7-rc3-mm1/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004/06/10 19:57:00
 > @@ -132,34 +132,28 @@ static int cpufreq_p4_target(struct cpuf
 >  #endif
 >  
 >  	/* notifiers */
 > - -	for_each_cpu(i) {
 > - -		if (cpu_isset(i, affected_cpu_map)) {
 > - -			freqs.cpu = i;
 > - -			cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 > - -		}
 > +	for_each_cpu_mask(i, affected_cpu_map) {
 > +		freqs.cpu = i;
 > +		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 >  	}

That's a really funky looking patch. Care to rediff ? 8-)

		Dave
