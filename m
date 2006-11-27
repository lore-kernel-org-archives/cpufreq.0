From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] If a CPU gets onlined set the governor to the one that
	is run on other CPUs
Date: Mon, 27 Nov 2006 12:33:21 -0500
Message-ID: <20061127173321.GA25763@redhat.com>
References: <1164296237.3721.395.camel@queen.suse.de>
	<20061126222120.GB26600@redhat.com>
	<1164620871.4656.110.camel@queen.suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1164620871.4656.110.camel@queen.suse.de>
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
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@lists.linux.org.uk, Stefan Seyfried <seife@suse.de>

On Mon, Nov 27, 2006 at 10:47:51AM +0100, Thomas Renninger wrote:

 > Thinking about x86 may get 16/32/64 CPU sockets the next years, it may
 > be convenient for very specific guys to run some nodes at highest
 > performance to even avoid some 2% performance regression on database
 > nodes while others are run with ondemand.

For the HPC folks I've spoken with, this doesn't seem likely.
If they care at all about that 2% (which they do), they'll want that
out of every CPU, and not leave anything idle.
(Typically I hear from the HPC folks "how do I turn this cpufreq thing off?")

I'd rather we looked into merging conservative & ondemand, and have
ondemand be tunable to not scale so frequently for such users.

		Dave

-- 
http://www.codemonkey.org.uk
