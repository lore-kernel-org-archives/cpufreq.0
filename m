From: Len Brown <lenb@kernel.org>
Subject: Re: ondemand as default governor
Date: Wed, 7 Mar 2007 01:24:28 -0500
Message-ID: <200703070124.29058.lenb@kernel.org>
References: <1172770914.10619.587.camel@d36.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1172770914.10619.587.camel@d36.suse.de>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk, trenn@suse.de

On Thursday 01 March 2007 12:41, Thomas Renninger wrote:
> I just read in drivers/cpufreq/Kconfig:
> 
> # Note that it is not currently possible to set the other governors
> (such as ondemand)
> # as the default, since if they fail to initialise, cpufreq will be
> # left in an undefined state.
> 
> Is this a bigger problem to solve?
> Is there already someone working/thinking on/about a solution?
> 
> Allowing this would be convenient...

Yes, it would, then we could delete the other governors,
and then delete the concept of multiple governors alltogether.

-Len
