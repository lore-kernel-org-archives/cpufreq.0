From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: scaling_available_frequenies support for pmac_cpufreq
Date: Thu, 29 Jul 2004 08:58:34 +1000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1091055513.9879.28.camel@gaston>
References: <Pine.LNX.4.58.0407241508110.24401@pianoman.cluster.toy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <Pine.LNX.4.58.0407241508110.24401@pianoman.cluster.toy>
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
To: clemej@alum.rpi.edu
Cc: cpufreq@www.linux.org.uk

On Sun, 2004-07-25 at 05:19, John Clemens wrote:
> Hi Ben and list..
> 
> apologies if this has already been done, i haven't been following for a
> while.  Here's a little patch to add scaling_available_frequencies to
> pmac_cpufreq, seems to work well on my iBook G3...
> 
> ~# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
> 900000 400000
> 
> but some double checking would be welcome.
> 
> I also cleaned up the use of PMAC_CPU_*_SPEED and standardized on
> CPUFREQ_*, etc.., which point to the same thing.  Apply part or all at
> your whim..

Looks good, I'll test as soon as I have some time...

Ben.
