From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] (1/1) cpufreq_conservative -
	cpufreq_conservative-2.6.11-rc3-mm2.diff
Date: Mon, 21 Feb 2005 18:23:18 +0100
Message-ID: <20050221172318.GA18581@isilmar.linta.de>
References: <20050220132201.GE4495@inskipp>
	<20050221153343.GC12182@poupinou.org>
	<20050221155219.GA16665@isilmar.linta.de>
	<20050221164049.GD12182@poupinou.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050221164049.GD12182@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: davej@redhat.com, alex-kernel@digriz.org.uk, Alexander Clouter <alex@digriz.org.uk>, cpufreq@lists.linux.org.uk

On Mon, Feb 21, 2005 at 05:40:49PM +0100, Bruno Ducrot wrote:
> > _L means CPU frequency is _larger_ than (or equal to) requested_freq[cpu] but 
> > as _low_ as possible.
> 
> There were the if() statement in my previous mail to distinguish the
> two calls for __cpufreq_driver_target() but it was not enough clear.

Yes, you're right.

> Sorry for confusion.

I should have looked more closely at the code at question... thanks for
clarifying this.

	Dominik
