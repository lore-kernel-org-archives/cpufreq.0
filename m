From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] (1/1) cpufreq_conservative -
	cpufreq_conservative-2.6.11-rc3-mm2.diff
Date: Mon, 21 Feb 2005 16:33:43 +0100
Message-ID: <20050221153343.GC12182@poupinou.org>
References: <20050220132201.GE4495@inskipp>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050220132201.GE4495@inskipp>
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
To: Alexander Clouter <alex@digriz.org.uk>
Cc: davej@redhat.com, cpufreq@ZenII.linux.org.uk, alex-kernel@digriz.org.uk, linux@dominikbrodowski.de

On Sun, Feb 20, 2005 at 01:22:01PM +0000, Alexander Clouter wrote:
> A new cpufreq module, based on the ondemand one with my additional patches 
> just posted.  This one is more suitable for battery environments where its 
> probably more appealing to have the cpu freq gracefully increase and decrease 
> rather than flip between the min and max freq's.
> 
> N.B. Bruno Ducrot pointed out that the amd64's "do have unacceptable latency
> between min and max freq transition, due to the step-by-step requirements
> (200MHz IIRC)"; so AMD64 users would probably benefit from this too.
> 

Ah, I see now why you want to tweak percentage.

> +	if (idle_ticks > down_idle_ticks ) {
...
...

> +		__cpufreq_driver_target(policy,
> +			requested_freq[cpu],
> +			CPUFREQ_RELATION_H);
                        ^^^^^^^^^^^^^^^^^^
                      Please use CPUFREQ_RELATION_L
                      here, so that when going down
                      the governor will go to the next
                      lower frequency (even if requested_freq[cpu]
		      is current_freq -1 ;)

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
