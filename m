From: paul.devriendt@amd.com
Subject: powernow-k8 pending bit check
Date: Thu, 13 May 2004 13:06:58 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C1365AE32@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

> -	if (query_current_values_with_pending_wait(data)) {
> -		kfree(powernow_table);
> -		return -EIO;
> -	}

This check is nothing to do with whether the pstate data
is correct or not. This check is for broken hardware. There
is a pending bit that tells us when the hardware has 
completed a change. If a change fails for some reason, the
pending bit will clear, and we can figure out that the
change failed as the values in the status register do
not reflect the change. If the hardware is broken and
never manages to complete or fail an operation, the pending
bit will never clear. The processor is still alive and running
and functioning correctly, but no further changes should
be attempted, as the previous change never completed.

I have seen this failure on prototype hardware internally
at AMD (which is why the check is there), but I have never
seen a customer report of a failure.

Paul.
