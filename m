From: Ashley Pittman <ashley@pittman.co.uk>
Subject: Re: [PATCH] If a CPU gets onlined set the governor to the one that
	is run on other CPUs
Date: Tue, 28 Nov 2006 10:40:56 +0000
Message-ID: <1164710457.22971.49.camel@localhost.localdomain>
References: <1164296237.3721.395.camel@queen.suse.de>
	<20061126222120.GB26600@redhat.com>
	<1164620871.4656.110.camel@queen.suse.de>
	<20061127173321.GA25763@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20061127173321.GA25763@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk, Stefan Seyfried <seife@suse.de>

On Mon, 2006-11-27 at 12:33 -0500, Dave Jones wrote:
> On Mon, Nov 27, 2006 at 10:47:51AM +0100, Thomas Renninger wrote:
> 
>  > Thinking about x86 may get 16/32/64 CPU sockets the next years, it may
>  > be convenient for very specific guys to run some nodes at highest
>  > performance to even avoid some 2% performance regression on database
>  > nodes while others are run with ondemand.
> 
> For the HPC folks I've spoken with, this doesn't seem likely.
> If they care at all about that 2% (which they do), they'll want that
> out of every CPU, and not leave anything idle.

With the onset of cpusets this assertion possibly won't hold true for
much longer however, we would be willing to only get 100% out of the
cpu's which have HPC jobs assigned to then.

Ashley,
