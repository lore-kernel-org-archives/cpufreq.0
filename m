From: Dave Jones <davej@codemonkey.org.uk>
Subject: Re: [PATCH] Remove deprecated speedstep-centrino driver
Date: Sun, 11 May 2008 12:18:45 -0400
Message-ID: <20080511161845.GH15445@codemonkey.org.uk>
References: <1209844401.13290.9.camel@linux-2bdv.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1209844401.13290.9.camel@linux-2bdv.site>
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
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq <cpufreq@lists.linux.org.uk>, jeremy@goop.org

On Sat, May 03, 2008 at 09:53:21PM +0200, Thomas Renninger wrote:
 > Remove deprecated speedstep-centrino driver
 >
 > Not 100% sure whether there are machines out there that still need the
 > static Banias tables, Venkatesh?

Hmm, if we decide to remove this for 2.6.27, I think we should
get a printk into .26 on module load to say that it's going away.
This likely has more valid use cases than the clockmod driver, so I
think a heads-up to any potential users of it who still haven't seen
the warning in the Kconfig might be a good idea.

        Dave

--
http://www.codemonkey.org.uk
