From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] (1/1) cpufreq_conservative -
	cpufreq_conservative-2.6.11-rc3-mm2.diff
Date: Mon, 21 Feb 2005 16:52:19 +0100
Message-ID: <20050221155219.GA16665@isilmar.linta.de>
References: <20050220132201.GE4495@inskipp>
	<20050221153343.GC12182@poupinou.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050221153343.GC12182@poupinou.org>
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
Cc: davej@redhat.com, cpufreq@ZenII.linux.org.uk, alex-kernel@digriz.org.uk, Alexander Clouter <alex@digriz.org.uk>

On Mon, Feb 21, 2005 at 04:33:43PM +0100, Bruno Ducrot wrote:
> > +		__cpufreq_driver_target(policy,
> > +			requested_freq[cpu],
> > +			CPUFREQ_RELATION_H);
>                         ^^^^^^^^^^^^^^^^^^
>                       Please use CPUFREQ_RELATION_L

_L means CPU frequency is _larger_ than (or equal to) requested_freq[cpu] but 
as _low_ as possible.

_H means CPU frequency is _lower_ than (or equal to) requested_freq[cpu] but 
as _high_ as possible.

So, AFAICS, _H is correct here.

	Dominik
