From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] pmac_cpufreq scaling_available_frequencies support..
Date: Mon, 07 Feb 2005 09:17:19 +1100
Message-ID: <1107728239.30303.63.camel@gaston>
References: <Pine.LNX.4.61.0502060129030.15763@pianoman.cluster.toy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.61.0502060129030.15763@pianoman.cluster.toy>
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
To: John Clemens <john@deater.net>
Cc: cpufreq@ZenII.linux.org.uk

On Sun, 2005-02-06 at 01:37 -0500, John Clemens wrote:
> Hi, just a ping about this patch I sent back in ... err.. 2.6.8 days. 
> I've updated it to 2.6.10 and wonder if there's any interest in it at all. 
> (I certainly use it all the time, but hey..).  The define cleanups may be 
> unnecessary and can easily be dropped....looking at them now I'm not sure 
> why i made them, actually.  If there's interest I'll update to bk and drop 
> the define stuff.  If not, well, it's archived in the list if anyone wants 
> it in the future.

That's fine, I've been away for a while and kept busy with other things
and forgot about those. Just ping me regulary.

At the moment, I'm fighting a more important problem with cpufreq
related to the CPU caches which can cause some machines to corrupt
memory.

Ben.
