From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: acpi-cpufreq.c for 2.4.22?
Date: Mon, 13 Dec 2004 21:39:34 +0100
Message-ID: <20041213203934.GB8195@dominikbrodowski.de>
References: <Pine.LNX.4.58.0412131106260.5882@antonia.sgowdy.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0412131106260.5882@antonia.sgowdy.org>
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
To: "Stephen J. Gowdy" <gowdy@slac.stanford.edu>
Cc: cpufreq@www.linux.org.uk

On Mon, Dec 13, 2004 at 11:08:15AM -0800, Stephen J. Gowdy wrote:
> Is there a backport of this to the 2.4.22 kernel? I'm currently using the
> 2.4.22-1.2199.nptl FC1 kernel. The speedstep-centrino in that kernel
> doesn't support the 2GB Pentium M.

IIRC you can use the non-cpufreq way by echoing the "P-State" into
/proc/acpi/processor/*/performance, i.e.
"echo -n 0 > /proc/acpi/processor/*/performance" for the highest frequency
value. Please note that this access to frequency states is highly
deprecated for 2.6. kernels.

	Dominik
