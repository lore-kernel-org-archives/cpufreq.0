From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Problem powernow an Athlon 2600+ XP[solved]
Date: Thu, 27 May 2004 11:39:42 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040527093942.GA8235@dominikbrodowski.de>
References: <6db520449336f134fa4831d9de3965b7@82.49.140.94>
	<20040527092838.GQ4933@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040527092838.GQ4933@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: Forcarlo <forcarlo@email.it>, cpufreq@www.linux.org.uk

On Thu, May 27, 2004 at 11:28:38AM +0200, Bruno Ducrot wrote:
> On Wed, May 26, 2004 at 11:42:38PM +0200, Forcarlo wrote:
> > "powernow_k7.powernow_acpi_force=1", "powernow_k7.acpi_force=1" don't work.

BTW, how about avoiding the double "powernow" in the module parameter? The
description
MODULE_PARM_DESC(acpi_force, "Force ACPI to be used");

also only mentions "acpi_force" instead of "powernow_acpi_force".

	Dominik
