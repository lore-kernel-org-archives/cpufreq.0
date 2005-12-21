From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: returning from .target before sending CPUFREQ_POSTCHANGE
Date: Wed, 21 Dec 2005 19:04:57 +0100
Message-ID: <20051221180457.GB19080@isilmar.linta.de>
References: <84EA05E2CA77634C82730353CBE3A84303218A3E@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84303218A3E@SAUSEXMB1.amd.com>
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
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@www.linux.org.uk

Hi,

On Tue, Dec 20, 2005 at 12:26:33PM -0600, Langsdorf, Mark wrote:
> Is it legal to return from a .target 
> call without sending out a the 
> CPUFREQ_POSTCHANGE event?  
> 
> I'm thinking about restructuring the 
> powernow-k8 driver so that instead of 
> busywaiting while polling the pending 
> bit, the driver sets up a periodic timer 
> poll mechanism to check the pending bit
> and signals the CPUFREQ_POSTCHANGE
> when the bit clears.
> 
> This would return control of execution
> to other programs a little faster, but
> I'm not sure if it's legal.

That sounds like a good idea, also for the acpi-cpufreq driver. However, I
don't really like .target returning, as then the instance calling .target
(userspace or governor) may call target yet again -- and we do not want to
have an old transition hanging between PRE- and POSTCHANGE when the next one
starts. So, what about putting the thread in ->target() to sleep until the
poll mechanism wakes it up?

	Dominik
