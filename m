From: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Subject: Re: [PATCH] cpu freq groups (policy->cpus) in ondemand governor
Date: Tue, 2 Nov 2004 10:34:27 +0100
Message-ID: <20041102093427.GA14727@message-id.gmane0305.slipkontur.de>
References: <20041026113949.A20518@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041026113949.A20518@unix-os.sc.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Tue, Oct 26, 2004 at 11:39:49AM -0700, Venkatesh Pallipadi wrote:
 
> Now ondemand governor looks at all cpus in policy->cpus and takes its 
> frequency increase/decrease decisions based on most lightly loaded cpu in 
> the group.

Is this a good idea? Assume the pathetic case:
 - 2 cpus, both in one group
 - 1 process running at 100% CPU
   -> only 1 cpu loaded
      -> the 2nd cpu is idle
         -> no speed increase.

Or didn't i understand this correctly?

> This patch will not affect systems where policy->cpus contain
> only one cpu.

That's why it doesn't affect me and why i cannot test it :-))
-- 
Stefan Seyfried
