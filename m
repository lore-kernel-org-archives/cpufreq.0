From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8 problem
Date: Thu, 10 Mar 2005 17:51:02 +0100
Message-ID: <20050310165102.GA2298@poupinou.org>
References: <007d01c520b1$bce2d650$0d010a0a@RED>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <007d01c520b1$bce2d650$0d010a0a@RED>
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
To: red@you.sk, paul.devriendt@amd.com
Cc: cpufreq@ZenII.linux.org.uk

On Fri, Mar 04, 2005 at 01:00:19PM +0100, red@you.sk wrote:
> Hello list, 
> i would like to ask if it`s workaround for powernow-k8 to be fuctional on AMD64 system with FSB >254Mhz. Any value bigger than 254 causing powernow-k8 module to refuse load with message "No such device". Changing only value FSB in bios to any value <=254 make powernow-k8 work fine again.
> My board is abit av8 and CPU is AMD64 3000+.
> 

I don't know if such workaround exist but I know for sure you should
change the PLL_LOCK_CONVERSION in the powernow_k8.h for stability
reason if you try to make one, because the processor use a speical
counter clocked by the system bus in order to prevent snoop when the
PLL lock and therefore you should give it a good one since the current
powernow_k8 driver is written with a fsb at 200MHz in mind.
With a FSB to (say) 254 MHz, I would put something like that:

#define PLL_LOCK_CONVERSION 254

I guess a proper fix should be to do so by computing the system bus
and then pass this value instead of using PLL_LOCK_CONVERSION since
it seems there are more and more people that want to run their
system with a custom fsb.

Paul, could you please give us some coments?

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
