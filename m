From: Mattia Dongili <dongili@supereva.it>
Subject: Re: [PATCH] 2.6.5 speedstep on P4Ms
Date: Wed, 9 Jun 2004 20:32:52 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040609183252.GB1981@inferi.kami.home>
References: <40C5F42D.1050107@cern.ch> <20040608153023.GS13782@poupinou.org>
	<40C6517E.1090708@cern.ch>
	<20040609154710.GA9482@dominikbrodowski.de>
	<1086798540.31338.6.camel@delerium.codemonkey.org.uk>
	<20040609165304.GA10981@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040609165304.GA10981@dominikbrodowski.de>
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
Cc: Bruno Ducrot <ducrot@poupinou.org>, Dave Jones <davej@redhat.com>, holbling@cpt.univ-mrs.fr

On Wed, Jun 09, 2004 at 06:53:04PM +0200, Dominik Brodowski wrote:
> On Wed, Jun 09, 2004 at 05:29:00PM +0100, Dave Jones wrote:
> > On Wed, 2004-06-09 at 16:47, Dominik Brodowski wrote:
[...]
> > I'm actually inclined to kill off p4-clockmod one day.
> > It doesn't seem to do anything useful whatsoever.
> > It certainly doesn't lower the temperature on my xeon.
> 
> No surprise on that. It only helps if a) idling is broken, or b) you want to
> limit the CPU power to avoid overheating. So, I won't oppose removing
> p4-clockmod, even though I see some _very_ _limitied_ usefulness of it...

Please don't remove it!
I use it for (b). It seems my BIOS (or me?) is not too smart and
sometimes fans run too slow too cool down the processor:

Jun  5 16:53:16 inferi-2 kernel: CPU#0: Temperature above threshold
Jun  5 16:53:16 inferi-2 kernel: CPU#0: Running in modulated clock mode
Jun  5 16:53:16 inferi-2 kernel: CPU#0: Temperature/speed normal
Jun  5 16:53:18 inferi-2 kernel: CPU#0: Temperature above threshold
Jun  5 16:53:18 inferi-2 kernel: CPU#0: Running in modulated clock mode
...

the only solution is to be to decrease processor speed through cpufreq.
Maybe my workaround hides some misconfiguration but it works for now.

-- 
mattia
:wq!
