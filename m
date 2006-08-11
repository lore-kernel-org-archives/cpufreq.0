From: Andrew Morton <akpm@osdl.org>
Subject: Re: cpufreq stops working after a while
Date: Fri, 11 Aug 2006 12:18:06 -0700
Message-ID: <20060811121806.51a73fe5.akpm@osdl.org>
References: <44DCCB96.5080801@rtr.ca> <20060811114631.4a699667.akpm@osdl.org>
	<44DCD618.2040700@rtr.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <44DCD618.2040700@rtr.ca>
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
To: Mark Lord <lkml@rtr.ca>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, cpufreq@www.linux.org.uk

On Fri, 11 Aug 2006 15:10:16 -0400
Mark Lord <lkml@rtr.ca> wrote:

> >> WHY?
> > 
> > cpufreq seems to have relatively frequent problems.
> > 
> >>  And how can I fix it?
> > 
> > You could start by telling us which kernel versions are affected ;)
> 
> 
> Mmm.. since it appears to be related, kbuild dumps this out when building the kernel:
> 
> WARNING: drivers/acpi/processor.o - Section mismatch: reference to .init.data: from .text between 'acpi_processor_power_init' (at offset 0xf29) and 'acpi_processor_cst_has_changed'
> 
> A possible source for the bug, or total red herring ?

An RH.  acpi_processor_power_init() is actually non-buggy, due to its
interesting games with `first_run'.

A section error would usually trigger a wild oops if you're affected by it.
