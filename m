From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] cpufreq_ondemand
Date: Mon, 18 Oct 2004 10:54:50 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041018085450.GA26364@dominikbrodowski.de>
References: <88056F38E9E48644A0F562A38C64FB60031DA073@scsmsx403.amr.corp.intel.com>
	<20041018083905.GC3311@inskipp.digriz.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041018083905.GC3311@inskipp.digriz.org.uk>
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
To: Alexander Clouter <alex-kernel@digriz.org.uk>
Cc: cpufreq@www.linux.org.uk, Con Kolivas <kernel@kolivas.org>

On Mon, Oct 18, 2004 at 09:39:05AM +0100, Alexander Clouter wrote:
> On Oct 17, Pallipadi, Venkatesh wrote:
> > 
> > [snipped]
> > 
> > We can never accurately predict freq for some future load. 
> > Say a CPU capable of 600, 800, 1000, 1200 and 1400 KHz, is 
> > running at 600 and we have sudden 100% CPU utilization, then 
> > we cannot precisely say which should be the next freq. It 
> > can be any of the higher possible freqs. And we felt performance 
> > should get a higher priority whenever there is some 
> > tradeoffs like this.
> > 
> it took me a while to work out why speed decreasing was 'working' whilst 
> speed increasing was not with my method; a good hour finding out that the 
> cpufreq (correctly) goes to the lowest match.

Do you mean CPUFREQ_RELATION_L? If so, you can change the behaviour by using
CPUFREQ_RELATION_H. See include/linux/cpufreq.h

#define CPUFREQ_RELATION_L 0  /* lowest frequency at or above target */
#define CPUFREQ_RELATION_H 1  /* highest frequency below or at target */

	Dominik
