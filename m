From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: ACPI / cpufreq on Presario R3120
Date: Sat, 5 Jun 2004 15:52:13 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040605135213.GD9126@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C1431B9CA@txexmtae.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <99F2150714F93F448942F9A9F112634C1431B9CA@txexmtae.amd.com>
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
Content-Transfer-Encoding: 7bit
To: paul.devriendt@amd.com
Cc: davej@redhat.com, ducrot@poupinou.org, Cpufreq@www.linux.org.uk

On Fri, Jun 04, 2004 at 01:01:40PM -0500, paul.devriendt@amd.com wrote:
> This patch looks good, thanks Dominik. So, ignoring the AMD specific
> case where there can only be 1 low freq entry, what happens in the
> generic case where BIOS provides 2 (or more) identical pstates ?

It will happily tell the driver sometimes to use the one entry, sometimes
the other entry (later one if ->target() is called with CPUFREQ_RELATION_H, 
earlier one if it is called with CPUFREQ_RELATION_L).

> Does the helper code just accept this happily, or should I also
> add a check in powernow-k8 for this ? Paul.

My patch was for powernow-k8 :-)

	Dominik
