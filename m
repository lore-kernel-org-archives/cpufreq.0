From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: problem in sysfs_set_policy
Date: Thu, 10 Jul 2008 22:03:39 +0200
Message-ID: <20080710200339.GA29755@isilmar.linta.de>
References: <bc342bf90806221938k34788a57v991396c371bf4943@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <bc342bf90806221938k34788a57v991396c371bf4943@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Joseph Xu <josephzxu@gmail.com>
Cc: cpufreq@lists.linux.org.uk

Hi Joseph,

On Sun, Jun 22, 2008 at 10:38:09PM -0400, Joseph Xu wrote:
> I ran into a bug using cpufreqd, which utilizes cpufrequtils to set
> the CPU frequency. In particular, if you switch from an old policy
> whose minimum frequency is greater than the new policy's max
> frequency, writing the new max value to cpufreq/scaling_max_freq in
> sysfs_set_policy will fail on my computer because it doesn't allow max
> values that are lower than min values at any time. I don't know if
> other people have run into this problem before, but I don't see any
> fixes in the new release, so I've made a small patch that reads the
> minimum value from file first and checks if the new max is less than
> the old min. If it is, the patched version will write the new min
> value before the new max value, and this solves the problem.

Hm, this is indeed a bug, thanks for tracking it down. However, with regard
to how to solve it I'm still a bit unsure. Either the way you propose (which
is to do one read and two writes) or by doing three writes -- max, min, max.
Any opinions (from anyone on this list) on which approach is more suitable?

Also, regarding your patch -- could you properly align the code by one or
two tabs, and add a Signed-off-by: line (as per kernel patch committing
rules, which I also try to use for cpufrequtils).

Thanks and best wishes,

	Dominik
