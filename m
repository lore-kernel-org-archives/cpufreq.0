From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] support for CPUFREQ_ETERNAL drivers by the ondemand
	governor
Date: Wed, 9 Feb 2005 20:15:15 +0100
Message-ID: <20050209191515.GA21319@dominikbrodowski.de>
References: <42069B4D.6090505@tremplin-utc.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42069B4D.6090505@tremplin-utc.net>
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
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: cpufreq@lists.linux.org.uk, Jun Nakajima <jun.nakajima@intel.com>

On Sun, Feb 06, 2005 at 11:33:49PM +0100, Eric Piel wrote:
> Hello,
> 
> For now the ondemand governor doesn't support the drivers which reports 
> a transition latency of CPUFREQ_ETERNAL. That's really a problem because 
> most of the drivers declare such a latency (simply because it's not 
> known, not really because the transition will take an eternal time). 
> All userspace daemons suport those drivers, they just don't pay 
> attention to the transition latency.
> 
> This patch proposes to consider a CPUFREQ_ETERNAL latency as the maximum 
> possible latency of the governor (10 ms). I think this should be 
> conservative enough to be safe with any driver.

No. CPUFREQ_ETERNAL is there to assert no dynamic frequency governor runs
with this driver. If a driver is safe to run on dynamic frequency governors
like ondemand, fix the latency value instead.

	Dominik
