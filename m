From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] cpufreq_ondemand
Date: Mon, 18 Oct 2004 09:20:45 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041018072045.GA17164@dominikbrodowski.de>
References: <20041017222916.GA30841@inskipp.digriz.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041017222916.GA30841@inskipp.digriz.org.uk>
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
Cc: linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

Hi,

On Sun, Oct 17, 2004 at 11:29:16PM +0100, Alexander Clouter wrote:
> After playing with the cpufreq_ondemand governor (many thanks to those whom 
> made it) I made a number of alterations which suit me at least.  Really 
> looking for feedback and of course once people have fixed any bugs they find 
> and made the code look neater, possible inclusion?

Or possibly a "fork" -- different dynamic cpufreq governors aren't a bad
thing to have. Else the whole modular approach would be wrong... So, even
if it doesn't get merged into cpufreq_ondemand, you can maintain it as a
differently named cpufreq governor.


> 2. controllable through 
> 	/sys/.../ondemand/ignore_nice, you can tell it to consider 'nice' 
> 	time as also idle cpu cycles.  Set it to '1' to treat 'nice' as cpu 
> 	in an active state.

Interesting bit, IIRC some userspace tool also does that.

> 4. (minor) I changed DEF_SAMPLING_RATE_LATENCY_MULTIPLIER to 50000 and
> 	DEF_SAMPLING_DOWN_FACTOR to 5 as I found the defaults a bit annoying 
> 	on my system and resulted in the cpufreq constantly jumping.
> 
> 	For my patch it works far better if the sampling rate is much lower 
> 	anyway, which can only be good for cpu efficiency in the long run

However, this means it takes much longer for the system to react to changes
in load... it's a tricky issue.

> 6. debugging (with 'watch -n1 cat /sys/.../ondemand/requested_freq') and 
> 	backwards 'compatibility' to act like the 'userspace' governor is 
> 	avaliable with /sys/.../ondemand/requested_freq if 
> 	'freq_step_percent' is set to zero

Please don't do that. Userspace is the governor for userspace frequency
setting; if you want it, switch to userspace, if you want dynamic frequency
selection, use the original ondemand or your governor.

	Dominik
